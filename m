From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH 3/6] s390/extable: use generic search and sort routines
Date: Sun,  3 Jan 2016 17:05:54 +0100
Message-ID: <1451837157-447-4-git-send-email-ard.biesheuvel@linaro.org>
References: <1451837157-447-1-git-send-email-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xKD9r9Wk09UdAF5wrHmxybydU1mlXcRjcQC8ma7+aJ8=;
 b=XI63UcnCnZ2qN6ay19yHfVm70HVr+3BwlD24rUHifF/hWIXdmQeE9FCA+R+UIIS6oO
 ABn6mAN9Xaf1/qTzixWC0gUi/GoES0lCb4bJy90GrA9LnC9WESo7CRbqOKNz5sInRJC4
 AW2lboXipokW9A1XlruCLx8hVyTvPxQH+f2ZI=
In-Reply-To: <1451837157-447-1-git-send-email-ard.biesheuvel@linaro.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, hpa@zytor.com, mingo@redhat.com, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, mattst88@gmail.com, ink@jurassic.park.msu.ru, rth@twiddle.net, tony.luck@intel.com, fenghua.yu@intel.com, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de, akpm@linux-foundation.org
Cc: mark.rutland@arm.com, marc.zyngier@arm.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>

Replace the arch specific versions of search_extable() and sort_extable()
with calls to the generic ones, which now support relative exception
tables as well.

Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 arch/s390/include/asm/uaccess.h |  8 +-
 arch/s390/mm/Makefile           |  2 +-
 arch/s390/mm/extable.c          | 85 --------------------
 3 files changed, 2 insertions(+), 93 deletions(-)

diff --git a/arch/s390/include/asm/uaccess.h b/arch/s390/include/asm/uaccess.h
index 9dd4cc47ddc7..e0900ddf91dd 100644
--- a/arch/s390/include/asm/uaccess.h
+++ b/arch/s390/include/asm/uaccess.h
@@ -79,18 +79,12 @@ struct exception_table_entry
 	int insn, fixup;
 };
 
-static inline unsigned long extable_insn(const struct exception_table_entry *x)
-{
-	return (unsigned long)&x->insn + x->insn;
-}
-
 static inline unsigned long extable_fixup(const struct exception_table_entry *x)
 {
 	return (unsigned long)&x->fixup + x->fixup;
 }
 
-#define ARCH_HAS_SORT_EXTABLE
-#define ARCH_HAS_SEARCH_EXTABLE
+#define ARCH_HAS_RELATIVE_EXTABLE
 
 /**
  * __copy_from_user: - Copy a block of data from user space, with less checking.
diff --git a/arch/s390/mm/Makefile b/arch/s390/mm/Makefile
index 839592ca265c..479550dae80e 100644
--- a/arch/s390/mm/Makefile
+++ b/arch/s390/mm/Makefile
@@ -3,7 +3,7 @@
 #
 
 obj-y		:= init.o fault.o extmem.o mmap.o vmem.o pgtable.o maccess.o
-obj-y		+= page-states.o gup.o extable.o pageattr.o mem_detect.o
+obj-y		+= page-states.o gup.o pageattr.o mem_detect.o
 
 obj-$(CONFIG_CMM)		+= cmm.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
diff --git a/arch/s390/mm/extable.c b/arch/s390/mm/extable.c
deleted file mode 100644
index 18c8b819b0aa..000000000000
--- a/arch/s390/mm/extable.c
+++ /dev/null
@@ -1,85 +0,0 @@
-#include <linux/module.h>
-#include <linux/sort.h>
-#include <asm/uaccess.h>
-
-/*
- * Search one exception table for an entry corresponding to the
- * given instruction address, and return the address of the entry,
- * or NULL if none is found.
- * We use a binary search, and thus we assume that the table is
- * already sorted.
- */
-const struct exception_table_entry *
-search_extable(const struct exception_table_entry *first,
-	       const struct exception_table_entry *last,
-	       unsigned long value)
-{
-	const struct exception_table_entry *mid;
-	unsigned long addr;
-
-	while (first <= last) {
-		mid = ((last - first) >> 1) + first;
-		addr = extable_insn(mid);
-		if (addr < value)
-			first = mid + 1;
-		else if (addr > value)
-			last = mid - 1;
-		else
-			return mid;
-	}
-	return NULL;
-}
-
-/*
- * The exception table needs to be sorted so that the binary
- * search that we use to find entries in it works properly.
- * This is used both for the kernel exception table and for
- * the exception tables of modules that get loaded.
- *
- */
-static int cmp_ex(const void *a, const void *b)
-{
-	const struct exception_table_entry *x = a, *y = b;
-
-	/* This compare is only valid after normalization. */
-	return x->insn - y->insn;
-}
-
-void sort_extable(struct exception_table_entry *start,
-		  struct exception_table_entry *finish)
-{
-	struct exception_table_entry *p;
-	int i;
-
-	/* Normalize entries to being relative to the start of the section */
-	for (p = start, i = 0; p < finish; p++, i += 8) {
-		p->insn += i;
-		p->fixup += i + 4;
-	}
-	sort(start, finish - start, sizeof(*start), cmp_ex, NULL);
-	/* Denormalize all entries */
-	for (p = start, i = 0; p < finish; p++, i += 8) {
-		p->insn -= i;
-		p->fixup -= i + 4;
-	}
-}
-
-#ifdef CONFIG_MODULES
-/*
- * If the exception table is sorted, any referring to the module init
- * will be at the beginning or the end.
- */
-void trim_init_extable(struct module *m)
-{
-	/* Trim the beginning */
-	while (m->num_exentries &&
-	       within_module_init(extable_insn(&m->extable[0]), m)) {
-		m->extable++;
-		m->num_exentries--;
-	}
-	/* Trim the end */
-	while (m->num_exentries &&
-	       within_module_init(extable_insn(&m->extable[m->num_exentries-1]), m))
-		m->num_exentries--;
-}
-#endif /* CONFIG_MODULES */
-- 
1.9.1
