From: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH v4 04/11] sections: Move is_kernel_inittext() into sections.h
Date: Thu, 30 Sep 2021 15:11:36 +0800
Message-ID: <20210930071143.63410-5-wangkefeng.wang@huawei.com>
References: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: arnd@arndb.de, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, mingo@redhat.com, davem@davemloft.net, ast@kernel.org, ryabinin.a.a@gmail.com, akpm@linux-foundation.org
Cc: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, bpf@vger.kernel.org, linux-alpha@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Kefeng Wang <wangkefeng.wang@huawei.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org

The is_kernel_inittext() and init_kernel_text() are with same
functionality, let's just keep is_kernel_inittext() and move
it into sections.h, then update all the callers.

Cc: Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: x86@kernel.org
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/x86/kernel/unwind_orc.c   |  2 +-
 include/asm-generic/sections.h | 14 ++++++++++++++
 include/linux/kallsyms.h       |  8 --------
 include/linux/kernel.h         |  1 -
 kernel/extable.c               | 12 ++----------
 5 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index a1202536fc57..d92ec2ced059 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -175,7 +175,7 @@ static struct orc_entry *orc_find(unsigned long ip)
 	}
 
 	/* vmlinux .init slow lookup: */
-	if (init_kernel_text(ip))
+	if (is_kernel_inittext(ip))
 		return __orc_find(__start_orc_unwind_ip, __start_orc_unwind,
 				  __stop_orc_unwind_ip - __start_orc_unwind_ip, ip);
 
diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
index 24780c0f40b1..811583ca8bd0 100644
--- a/include/asm-generic/sections.h
+++ b/include/asm-generic/sections.h
@@ -172,4 +172,18 @@ static inline bool is_kernel_rodata(unsigned long addr)
 	       addr < (unsigned long)__end_rodata;
 }
 
+/**
+ * is_kernel_inittext - checks if the pointer address is located in the
+ *                      .init.text section
+ *
+ * @addr: address to check
+ *
+ * Returns: true if the address is located in .init.text, false otherwise.
+ */
+static inline bool is_kernel_inittext(unsigned long addr)
+{
+	return addr >= (unsigned long)_sinittext &&
+	       addr < (unsigned long)_einittext;
+}
+
 #endif /* _ASM_GENERIC_SECTIONS_H_ */
diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index b016c62f30a6..8a9d329c927c 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -24,14 +24,6 @@
 struct cred;
 struct module;
 
-static inline int is_kernel_inittext(unsigned long addr)
-{
-	if (addr >= (unsigned long)_sinittext
-	    && addr < (unsigned long)_einittext)
-		return 1;
-	return 0;
-}
-
 static inline int is_kernel_text(unsigned long addr)
 {
 	if ((addr >= (unsigned long)_stext && addr < (unsigned long)_etext))
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index e5a9af8a4e20..445d0dceefb8 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -229,7 +229,6 @@ extern bool parse_option_str(const char *str, const char *option);
 extern char *next_arg(char *args, char **param, char **val);
 
 extern int core_kernel_text(unsigned long addr);
-extern int init_kernel_text(unsigned long addr);
 extern int __kernel_text_address(unsigned long addr);
 extern int kernel_text_address(unsigned long addr);
 extern int func_ptr_is_kernel_text(void *ptr);
diff --git a/kernel/extable.c b/kernel/extable.c
index da26203841d4..98ca627ac5ef 100644
--- a/kernel/extable.c
+++ b/kernel/extable.c
@@ -62,14 +62,6 @@ const struct exception_table_entry *search_exception_tables(unsigned long addr)
 	return e;
 }
 
-int init_kernel_text(unsigned long addr)
-{
-	if (addr >= (unsigned long)_sinittext &&
-	    addr < (unsigned long)_einittext)
-		return 1;
-	return 0;
-}
-
 int notrace core_kernel_text(unsigned long addr)
 {
 	if (addr >= (unsigned long)_stext &&
@@ -77,7 +69,7 @@ int notrace core_kernel_text(unsigned long addr)
 		return 1;
 
 	if (system_state < SYSTEM_RUNNING &&
-	    init_kernel_text(addr))
+	    is_kernel_inittext(addr))
 		return 1;
 	return 0;
 }
@@ -94,7 +86,7 @@ int __kernel_text_address(unsigned long addr)
 	 * Since we are after the module-symbols check, there's
 	 * no danger of address overlap:
 	 */
-	if (init_kernel_text(addr))
+	if (is_kernel_inittext(addr))
 		return 1;
 	return 0;
 }
-- 
2.26.2

