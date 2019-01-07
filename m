From: "Dmitry V. Levin" <ldv@altlinux.org>
Subject: [PATCH v7 03/22] alpha: define remaining syscall_get_* functions
Date: Mon, 7 Jan 2019 05:52:57 +0300
Message-ID: <20190107025257.GC1207@altlinux.org>
References: <20190107025101.GA1182@altlinux.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: Elvira Khabirova <lineprinter@altlinux.org>, Eugene Syromyatnikov <esyr@redhat.com>, Oleg Nesterov <oleg@redhat.com>, Andy Lutomirski <luto@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

syscall_get_* functions are required to be implemented on all
architectures in order to extend the generic ptrace API with
PTRACE_GET_SYSCALL_INFO request.

This adds remaining 4 syscall_get_* functions as documented
in asm-generic/syscall.h: syscall_get_nr, syscall_get_arguments,
syscall_get_error, and syscall_get_return_value.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Elvira Khabirova <lineprinter@altlinux.org>
Cc: Eugene Syromyatnikov <esyr@redhat.com>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
---

Notes:
    v7: unchanged
    v6: use asm-generic/syscall.h
    v5: initial revision

 arch/alpha/include/asm/syscall.h | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/syscall.h b/arch/alpha/include/asm/syscall.h
index d73a6fcb519c..c67d6a69d7c8 100644
--- a/arch/alpha/include/asm/syscall.h
+++ b/arch/alpha/include/asm/syscall.h
@@ -2,9 +2,38 @@
 #ifndef _ASM_ALPHA_SYSCALL_H
 #define _ASM_ALPHA_SYSCALL_H
 
+#include <asm/ptrace.h>
+#include <asm-generic/syscall.h>
 #include <uapi/linux/audit.h>
 
-static inline int syscall_get_arch(void)
+static inline int
+syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
+{
+	return regs->r0;
+}
+
+static inline void
+__syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
+			unsigned int i, unsigned int n, unsigned long *args)
+{
+	BUILD_BUG_ON(sizeof(regs->r16) != sizeof(args[0]));
+	memcpy(args, &regs->r16 + i, n * sizeof(args[0]));
+}
+
+static inline long
+syscall_get_error(struct task_struct *task, struct pt_regs *regs)
+{
+	return regs->r19 ? -regs->r0 : 0;
+}
+
+static inline long
+syscall_get_return_value(struct task_struct *task, struct pt_regs *regs)
+{
+	return regs->r0;
+}
+
+static inline int
+syscall_get_arch(void)
 {
 	return AUDIT_ARCH_ALPHA;
 }
-- 
ldv
