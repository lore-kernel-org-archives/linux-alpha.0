From: Mathieu Chouquet-Stringer <mchouque@free.fr>
Subject: Remove duplicate symbol exports on Alpha
Date: Sat, 13 May 2006 13:44:57 +0200
Message-ID: <20060513114457.GA32293@bigip.bigip.mine.nu>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

[Here's a copy of a message i sent to lkml, forgot the alpha ml...]

	Hello,

This patch fixes the following warnings seen on alpha using 2.6.17-rc4:
WARNING: vmlinux: 'enable_irq' exported twice. Previous export was in vmlinux
WARNING: vmlinux: 'disable_irq' exported twice. Previous export was in vmlinux
WARNING: vmlinux: 'disable_irq_nosync' exported twice. Previous export was in vmlinux
WARNING: vmlinux: 'probe_irq_mask' exported twice. Previous export was in vmlinux
WARNING: vmlinux: 'sys_open' exported twice. Previous export was in vmlinux
WARNING: vmlinux: 'sys_read' exported twice. Previous export was in vmlinux
WARNING: vmlinux: 'strstr' exported twice. Previous export was in vmlinux
WARNING: vmlinux: 'memscan' exported twice. Previous export was in vmlinux
WARNING: vmlinux: 'memcmp' exported twice. Previous export was in vmlinux
WARNING: vmlinux: 'strnlen' exported twice. Previous export was in vmlinux
WARNING: vmlinux: 'strncmp' exported twice. Previous export was in vmlinux
WARNING: vmlinux: 'strcmp' exported twice. Previous export was in vmlinux

Signed-off-by: Mathieu Chouquet-Stringer <mchouque@free.fr>

diff --git a/arch/alpha/kernel/alpha_ksyms.c b/arch/alpha/kernel/alpha_ksyms.c
index c645c5e..3f70154 100644
--- a/arch/alpha/kernel/alpha_ksyms.c
+++ b/arch/alpha/kernel/alpha_ksyms.c
@@ -53,10 +53,6 @@ extern void __divqu (void);
 extern void __remqu (void);
 
 EXPORT_SYMBOL(alpha_mv);
-EXPORT_SYMBOL(enable_irq);
-EXPORT_SYMBOL(disable_irq);
-EXPORT_SYMBOL(disable_irq_nosync);
-EXPORT_SYMBOL(probe_irq_mask);
 EXPORT_SYMBOL(screen_info);
 EXPORT_SYMBOL(perf_irq);
 EXPORT_SYMBOL(callback_getenv);
@@ -68,19 +64,13 @@ #endif /* CONFIG_ALPHA_GENERIC */
 
 /* platform dependent support */
 EXPORT_SYMBOL(strcat);
-EXPORT_SYMBOL(strcmp);
 EXPORT_SYMBOL(strcpy);
 EXPORT_SYMBOL(strlen);
-EXPORT_SYMBOL(strncmp);
 EXPORT_SYMBOL(strncpy);
-EXPORT_SYMBOL(strnlen);
 EXPORT_SYMBOL(strncat);
-EXPORT_SYMBOL(strstr);
 EXPORT_SYMBOL(strchr);
 EXPORT_SYMBOL(strrchr);
-EXPORT_SYMBOL(memcmp);
 EXPORT_SYMBOL(memmove);
-EXPORT_SYMBOL(memscan);
 EXPORT_SYMBOL(__memcpy);
 EXPORT_SYMBOL(__memset);
 EXPORT_SYMBOL(__memsetw);
@@ -122,11 +112,9 @@ EXPORT_SYMBOL(alpha_write_fp_reg_s);
 
 /* In-kernel system calls.  */
 EXPORT_SYMBOL(kernel_thread);
-EXPORT_SYMBOL(sys_open);
 EXPORT_SYMBOL(sys_dup);
 EXPORT_SYMBOL(sys_exit);
 EXPORT_SYMBOL(sys_write);
-EXPORT_SYMBOL(sys_read);
 EXPORT_SYMBOL(sys_lseek);
 EXPORT_SYMBOL(execve);
 EXPORT_SYMBOL(sys_setsid);

-- 
Mathieu Chouquet-Stringer                         mchouque@free.fr
