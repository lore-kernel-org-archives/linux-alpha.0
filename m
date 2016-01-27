From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH v2 resend 4/6] x86/extable: use generic search and sort
 routines
Date: Wed, 27 Jan 2016 11:55:21 +0100
Message-ID: <1453892123-17973-5-git-send-email-ard.biesheuvel@linaro.org>
References: <1453892123-17973-1-git-send-email-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4ciguHX7w81hoRFuOdk9mBU3h5/Zf6w4q9oT6TWAGWc=;
 b=XNjn627Ouiv5StEMkVuYmyi+QK724JgHez1+fWSsjDVoRD3ZlzJnyz054Vu08J+aNL
 BSW87DoR/H2WyMRC/yhrAtzGLqNFhYmaGa4TiwnG8MTStKv7/NCb1op45F+wKHFE0Kno
 Jifdbvyj9n2BlZn5xE6zABFye6Wrpbchy63TY=
In-Reply-To: <1453892123-17973-1-git-send-email-ard.biesheuvel@linaro.org>
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
To: akpm@linux-foundation.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, hpa@zytor.com, heiko.carstens@de.ibm.com, rth@twiddle.net, tony.luck@intel.com, will.deacon@arm.com
Cc: deller@gmx.de, Ard Biesheuvel <ard.biesheuvel@linaro.org>

Replace the arch specific versions of search_extable() and sort_extable()
with calls to the generic ones, which now support relative exception
tables as well.

Acked-by: H. Peter Anvin <hpa@linux.intel.com>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 arch/x86/include/asm/uaccess.h |   5 +-
 arch/x86/mm/extable.c          | 106 +-------------------
 2 files changed, 4 insertions(+), 107 deletions(-)

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index a4a30e4b2d34..5664bf927264 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -106,9 +106,8 @@ static inline bool __chk_range_not_ok(unsigned long addr, unsigned long size, un
 struct exception_table_entry {
 	int insn, fixup;
 };
-/* This is not the generic standard exception_table_entry format */
-#define ARCH_HAS_SORT_EXTABLE
-#define ARCH_HAS_SEARCH_EXTABLE
+
+#define ARCH_HAS_RELATIVE_EXTABLE
 
 extern int fixup_exception(struct pt_regs *regs);
 extern int early_fixup_exception(unsigned long *ip);
diff --git a/arch/x86/mm/extable.c b/arch/x86/mm/extable.c
index 903ec1e9c326..0b172b656f43 100644
--- a/arch/x86/mm/extable.c
+++ b/arch/x86/mm/extable.c
@@ -1,14 +1,9 @@
+
 #include <linux/module.h>
-#include <linux/spinlock.h>
-#include <linux/sort.h>
+
 #include <asm/uaccess.h>
 
 static inline unsigned long
-ex_insn_addr(const struct exception_table_entry *x)
-{
-	return (unsigned long)&x->insn + x->insn;
-}
-static inline unsigned long
 ex_fixup_addr(const struct exception_table_entry *x)
 {
 	return (unsigned long)&x->fixup + x->fixup;
@@ -70,100 +65,3 @@ int __init early_fixup_exception(unsigned long *ip)
 
 	return 0;
 }
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
-	while (first <= last) {
-		const struct exception_table_entry *mid;
-		unsigned long addr;
-
-		mid = ((last - first) >> 1) + first;
-		addr = ex_insn_addr(mid);
-		if (addr < value)
-			first = mid + 1;
-		else if (addr > value)
-			last = mid - 1;
-		else
-			return mid;
-        }
-        return NULL;
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
-	/*
-	 * This value will always end up fittin in an int, because on
-	 * both i386 and x86-64 the kernel symbol-reachable address
-	 * space is < 2 GiB.
-	 *
-	 * This compare is only valid after normalization.
-	 */
-	return x->insn - y->insn;
-}
-
-void sort_extable(struct exception_table_entry *start,
-		  struct exception_table_entry *finish)
-{
-	struct exception_table_entry *p;
-	int i;
-
-	/* Convert all entries to being relative to the start of the section */
-	i = 0;
-	for (p = start; p < finish; p++) {
-		p->insn += i;
-		i += 4;
-		p->fixup += i;
-		i += 4;
-	}
-
-	sort(start, finish - start, sizeof(struct exception_table_entry),
-	     cmp_ex, NULL);
-
-	/* Denormalize all entries */
-	i = 0;
-	for (p = start; p < finish; p++) {
-		p->insn -= i;
-		i += 4;
-		p->fixup -= i;
-		i += 4;
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
-	/*trim the beginning*/
-	while (m->num_exentries &&
-	       within_module_init(ex_insn_addr(&m->extable[0]), m)) {
-		m->extable++;
-		m->num_exentries--;
-	}
-	/*trim the end*/
-	while (m->num_exentries &&
-	       within_module_init(ex_insn_addr(&m->extable[m->num_exentries-1]), m))
-		m->num_exentries--;
-}
-#endif /* CONFIG_MODULES */
-- 
2.5.0
