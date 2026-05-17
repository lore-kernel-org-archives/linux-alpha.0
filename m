Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1037431F9B9
	for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 21:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779054017; cv=none; b=srUcf+W2uyh3c9++sfD1Y+0b3zSWfck33yWT1xpWzE7IjWRTzaEraq3A8pCC6f4Qa1D526xNxlt+qumTf4mhPW3kkIvUw00EFWvqUmd/BMNbUdMlpkRa6Wh0L6RpAgQkgC7nptLqxNkWdg2NQgoRhkr9Cx+j6nFwgRRa0f9pvXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779054017; c=relaxed/simple;
	bh=O7Nk242wfJvUMANlyoLgOJwfBJS19DyjSTx4F/KPg5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QM41vInggiklzxYkO3x+3YR72oKbbHXmiwHKAACbMUfR5TnOL80iTN4uvEqp++ykbqqazcKD2tvvlsnl5l0WyEwrntRdvfq72TlBVq8xlS4W1uYpWz3vE0efP1Cu/1yO4GWMIjAXYXZphbJU1l87XzXiGvrwfrJhkV2/L7zE5y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NK5RHgBU; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NK5RHgBU"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a8891f0c51so1821954e87.1
        for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 14:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779054010; x=1779658810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJ7apvZurRpDxdpwSwzeY93JfiJrHnAvGkGE8cGrA74=;
        b=NK5RHgBUKIr1+f+ROYqDJag8FjNxZT79Arli4piiY7TZ+cCUPwZreUR/S/osZiK6Z+
         vyGqVzVVa9u/pf5qVdomfO2fj27+8Ucg6grTshCQC/l+7PeCa/2w2ci1fUsMQ3rMW05q
         BfOpA70fnBNSAhqG8me5cmDvpCBgAuqbOX4QcTMeysHDfDg7BLGxU6eCTih+r4d8NDcp
         BssVu/wVIQjB8DzTEUohyu8RfWumP39NG1BrwvCtmOlav7HLpSL/2iQgNqsKh0ZQbmvX
         pbeF4DHX74NGp1F3zYLpWEg2EQBHSzSLn4TFis4RiQbd34F5hS/5oMp/d/m41Y3jR21F
         I5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779054010; x=1779658810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IJ7apvZurRpDxdpwSwzeY93JfiJrHnAvGkGE8cGrA74=;
        b=O0V+juVxzHzdV2aTJ6F40yXSjinD46Typ+5GLFCVNjE09tN9lsBA1VthuigKhBqlp2
         L436kviMa2XKrrmcLYck8pSFyV+aPvTwJt6K1l1Nl7CU+HNleN5TVdVQrrVVcmaufrKh
         8mGzEmG4dAVhdYpumffji9auYGmanu4LUobMj2hq/YEUkffV5V7MGX2scLXdhLhHkH7R
         X/mPK6BX51VFAxOSy1Zm8iwDr1WaxL02R+iexBaYLgLv5jcGE8BoKMH63Ig5zxK/sQ9Q
         cb1O5XJtZQahE2U9a/Xn30YtZLO5k4Ql44r0lWseA2NCfRXZNb7IqNRWlXhDnkwRSeYa
         2Yjw==
X-Forwarded-Encrypted: i=1; AFNElJ/Lz9wmGKQmo4atDDBWc2s/kyAbzae6rqN9KT2ZWjYHK2fYgWHP2pBu71GjLLsje2NEklq6k8XkqiMZuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXhYorbNQlOWuLzJfeiLk6CuNaQPmMKII0mPslymAeyG4/mt8n
	wvGyCPxL76ZAseowC3AI6k36rZ43xVjHWZPJ8JsUuBhNIcrUzTkC7LrO
X-Gm-Gg: Acq92OFqt/wLLI1dopYndtMGK8gtF1fC38Yaz1Tx8b9TsfoeNBCZv6UNH4Ml6eMisiV
	7FTAw7thD8F2p20lzd6EZdUClQWMmQdjn2GyS4DaMtc14ynKUQeENgeRzqOMR3Nsl7wdORRx4n/
	V/sHdBi1QSfCENu4Kl2pkuFVbBLwWiHLG1VyKX/UDEf4Pznmc4D1ggGKTWzxitfaDQNsKs5WIMD
	VDH5Xr7U7xKw23XcfztrLs1MPOiQrx+Cnwizw9nFQ5zDXWExGZbc1SCqLdKNNLdUBJ2vxPHJGtW
	2+RCBuGfWs4+e/hNEiyeKyTcp0MT4LR7OeS/JKUofHSbzuUZ3IQJ9fTGluOw2xxE1vqWamldEG8
	7pRyGA3uw5hIkExmNJ2EeVaKFHUhH/EOqXbqp4uVd2R+esfkUY/yp4vhuAXzql9WH1X5TDomMbM
	gLKDicgBzPoPW8EnPplRcb/chky40dexE5ZbgXMk1HsDrO+UMJU3mSmv6Jq+BmEmrwUZs99hNRe
	0S+BzT9tLYpRCEnJ1i6sHkwjAqQzPOqQMw=
X-Received: by 2002:a05:6512:32c7:b0:5a8:886a:1164 with SMTP id 2adb3069b0e04-5aa0e73c0e3mr4124123e87.28.1779054009848;
        Sun, 17 May 2026 14:40:09 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91c1558f3sm2890076e87.77.2026.05.17.14.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 14:40:08 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	macro@orcam.me.uk,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 8/8] alpha: enable GENERIC_ENTRY and GENERIC_IRQ_ENTRY
Date: Sun, 17 May 2026 23:36:17 +0200
Message-ID: <20260517213919.347523-9-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260517213919.347523-1-linmag7@gmail.com>
References: <20260517213919.347523-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wire Alpha into the generic entry code for syscall entry/exit and
return-to-user handling, while keeping the low-level PALcode return paths
Alpha-specific.

Move most of the syscall entry/exit logic out of entSys and into C helpers
built around the generic entry API. Syscall entry now uses
syscall_enter_from_user_mode(), records Alpha-local syscall metadata in
thread_info, handles the ptrace/seccomp skip decision, and selects the
syscall table target in C.  The final target call remains in entry.S so
Alpha can preserve its existing syscall ABI and assembly syscall-table
wrappers.

On return from syscalls, finish Alpha's r0/r19 result encoding and
skipped-syscall restart handling in C before calling
syscall_exit_to_user_mode(). Non-syscall returns to user mode use a
separate alpha_exit_to_user_mode() helper, which disables interrupts,
runs irqentry_exit_to_user_mode_prepare(), and then enters the common
exit_to_user_mode() path.

Keep the remaining PALcode restore handling in assembly. In particular,
kernel-mode returns still need Alpha-specific lockdep IRQ-state annotation
based on the saved processor status, while user-mode returns are handed to
the generic exit-to-user code.

Add the generic-entry support bits needed by common code, including
thread_info.syscall_work, syscall trace support, ptrace sysemu request
numbers, and arch_syscall_is_vdso_sigreturn().

This has been tested by booting Alpha with GENERIC_ENTRY enabled, checking
lockdep IRQ-state accounting, running fork/clone-heavy package builds, and
running the seccomp as well as strace test suites.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig                    |   3 +
 arch/alpha/include/asm/entry-common.h |  14 ++
 arch/alpha/include/asm/ptrace.h       |  14 +-
 arch/alpha/include/asm/stacktrace.h   |  20 ++
 arch/alpha/include/asm/syscall.h      |  11 +-
 arch/alpha/include/asm/thread_info.h  |  30 +--
 arch/alpha/kernel/asm-offsets.c       |   5 +
 arch/alpha/kernel/entry.S             | 322 +++++++-------------------
 arch/alpha/kernel/irq_alpha.c         |  14 +-
 arch/alpha/kernel/proto.h             |   9 +-
 arch/alpha/kernel/ptrace.c            | 135 ++++++-----
 arch/alpha/kernel/signal.c            | 152 +++++++++---
 12 files changed, 364 insertions(+), 365 deletions(-)
 create mode 100644 arch/alpha/include/asm/entry-common.h
 create mode 100644 arch/alpha/include/asm/stacktrace.h

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index e53ef2d88463..74795e22aafa 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -2,6 +2,9 @@
 config ALPHA
 	bool
 	default y
+	select GENERIC_IRQ_ENTRY
+	select GENERIC_ENTRY
+	select HAVE_SYSCALL_TRACEPOINTS
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_OPS if PCI
diff --git a/arch/alpha/include/asm/entry-common.h b/arch/alpha/include/asm/entry-common.h
new file mode 100644
index 000000000000..a811c73454d2
--- /dev/null
+++ b/arch/alpha/include/asm/entry-common.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef ARCH_ALPHA_ENTRY_COMMON_H
+#define ARCH_ALPHA_ENTRY_COMMON_H
+
+#include <asm/stacktrace.h> /* For on_thread_stack() */
+#include <asm/syscall.h>
+
+#define arch_exit_to_user_mode_work arch_exit_to_user_mode_work
+
+static __always_inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
+				unsigned long ti_work)
+{
+}
+#endif
diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index 8e0a589e2d15..430e8dc27ff7 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -3,7 +3,7 @@
 #define _ASMAXP_PTRACE_H
 
 #include <uapi/asm/ptrace.h>
-
+#include <asm/irqflags.h>
 
 #define arch_has_single_step()		(1)
 #define user_mode(regs) (((regs)->ps & 8) != 0)
@@ -17,7 +17,9 @@
 #define current_pt_regs() \
   ((struct pt_regs *) ((char *)current_thread_info() + 2*PAGE_SIZE) - 1)
 
-#define force_successful_syscall_return() (current_pt_regs()->r0 = 0)
+#define force_successful_syscall_return() \
+	(current_thread_info()->syscall_meta \
+	|= ALPHA_SYSCALL_META_FORCE_SUCCESS)
 
 static inline unsigned long regs_return_value(struct pt_regs *regs)
 {
@@ -31,4 +33,12 @@ static inline unsigned long user_stack_pointer(struct pt_regs *regs)
 	return regs->usp;
 }
 
+static __always_inline bool regs_irqs_disabled(struct pt_regs *regs)
+{
+	return arch_irqs_disabled_flags(regs->ps);
+}
+
+/* Syscall emulation defines */
+#define PTRACE_SYSEMU			0x1d
+#define PTRACE_SYSEMU_SINGLESTEP	0x1e
 #endif
diff --git a/arch/alpha/include/asm/stacktrace.h b/arch/alpha/include/asm/stacktrace.h
new file mode 100644
index 000000000000..f006d6f00fd0
--- /dev/null
+++ b/arch/alpha/include/asm/stacktrace.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ALPHA_STACKTRACE_H
+#define _ASM_ALPHA_STACKTRACE_H
+
+#include <linux/compiler_attributes.h>
+#include <linux/types.h>
+
+#include <asm/current.h>
+#include <asm/processor.h>
+#include <asm/thread_info.h>
+
+static __always_inline bool on_thread_stack(void)
+{
+	unsigned long base = (unsigned long)current->stack;
+	unsigned long sp = (unsigned long)current_stack_pointer;
+
+	return !((base ^ sp) & ~(THREAD_SIZE - 1));
+}
+
+#endif /* _ASM_ALPHA_STACKTRACE_H */
diff --git a/arch/alpha/include/asm/syscall.h b/arch/alpha/include/asm/syscall.h
index 1e78cbd46faf..c1394910f584 100644
--- a/arch/alpha/include/asm/syscall.h
+++ b/arch/alpha/include/asm/syscall.h
@@ -8,6 +8,8 @@
 #include <linux/types.h>
 #include <asm/ptrace.h>
 
+extern void *sys_call_table[];
+
 static inline int syscall_get_arch(struct task_struct *task)
 {
 	return AUDIT_ARCH_ALPHA;
@@ -104,10 +106,17 @@ static inline void syscall_set_return_value(struct task_struct *task,
 }
 
 /* Restore the original syscall nr after seccomp/ptrace modified regs->r1. */
+
 static inline void syscall_rollback(struct task_struct *task,
 					struct pt_regs *regs)
 {
-	regs->r1 = regs->r2;
+	unsigned long nr = task_thread_info(task)->syscall_saved_nr;
+
+	regs->r1 = nr;
 }
 
+static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
+{
+	return false;
+}
 #endif	/* _ASM_ALPHA_SYSCALL_H */
diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index 1552ecca8520..d781ac79106d 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -12,16 +12,21 @@
 #endif
 
 #ifndef __ASSEMBLER__
+
 struct thread_info {
 	struct pcb_struct	pcb;		/* palcode state */
 
 	struct task_struct	*task;		/* main task structure */
-	unsigned int		flags;		/* low level flags */
+	unsigned long		flags;		/* low level flags */
+	unsigned long		syscall_work;	/* SYSCALL_WORK_* flags */
 	unsigned int		ieee_state;	/* see fpu.h */
 
 	unsigned		cpu;		/* current CPU */
-	int			preempt_count; /* 0 => preemptable, <0 => BUG */
+	int			preempt_count;	/* 0 => preemptable, <0 => BUG */
 	unsigned int		status;		/* thread-synchronous flags */
+	unsigned long		syscall_saved_r19;
+	unsigned long		syscall_meta;
+	unsigned long		syscall_saved_nr;
 
 	int bpt_nsaved;
 	unsigned long bpt_addr[2];		/* breakpoint handling  */
@@ -50,6 +55,9 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
 #define THREAD_SIZE_ORDER 1
 #define THREAD_SIZE (2*PAGE_SIZE)
 
+#define ALPHA_SYSCALL_META_SKIP			0x2
+#define ALPHA_SYSCALL_META_FORCE_SUCCESS	0x4
+
 /*
  * Thread information flags:
  * - these are process state flags and used from assembly
@@ -68,6 +76,7 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
 #define TIF_SECCOMP		6	/* seccomp syscall filtering active */
 #define	TIF_SYSCALL_TRACEPOINT	7	/* syscall tracepoint instrumentation */
 #define TIF_DIE_IF_KERNEL	9	/* dik recursion lock */
+#define TIF_UPROBE		10	/* uprobe breakpoint or singlestep */
 #define TIF_MEMDIE		13	/* is terminating due to OOM killer */
 #define TIF_POLLING_NRFLAG	14	/* idle is polling for TIF_NEED_RESCHED */
 
@@ -80,22 +89,7 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
 #define _TIF_SECCOMP		(1<<TIF_SECCOMP)
 #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
 #define _TIF_SYSCALL_TRACEPOINT	(1<<TIF_SYSCALL_TRACEPOINT)
-
-/*
- * Work to do on syscall entry (in entry.S).
- * If you want this to exactly mirror what entry.S checks, keep it aligned
- * with the mask used before branching to syscall_trace_enter().
- */
-#ifdef CONFIG_AUDITSYSCALL
-# define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | _TIF_SECCOMP \
-				| _TIF_SYSCALL_TRACEPOINT)
-#else
-# define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SECCOMP | _TIF_SYSCALL_TRACEPOINT)
-#endif
-
-/* Work to do on interrupt/exception return.  */
-#define _TIF_WORK_MASK		(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
-				 _TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL)
+#define _TIF_UPROBE		(1 << TIF_UPROBE)
 
 #define TS_UAC_NOPRINT		0x0001	/* ! Preserve the following three */
 #define TS_UAC_NOFIX		0x0002	/* ! flags as they match          */
diff --git a/arch/alpha/kernel/asm-offsets.c b/arch/alpha/kernel/asm-offsets.c
index 1d3bfca319ae..c89792c86044 100644
--- a/arch/alpha/kernel/asm-offsets.c
+++ b/arch/alpha/kernel/asm-offsets.c
@@ -22,6 +22,7 @@ static void __used foo(void)
 
 	DEFINE(SP_OFF, offsetof(struct pt_regs, ps));
 	DEFINE(SIZEOF_PT_REGS, sizeof(struct pt_regs));
+	DEFINE(TI_SYSCALL_META, offsetof(struct thread_info, syscall_meta));
 	BLANK();
 
 	DEFINE(SWITCH_STACK_SIZE, sizeof(struct switch_stack));
@@ -30,4 +31,8 @@ static void __used foo(void)
 	DEFINE(HAE_CACHE, offsetof(struct alpha_machine_vector, hae_cache));
 	DEFINE(HAE_REG, offsetof(struct alpha_machine_vector, hae_register));
 	DEFINE(PT_REGS_USP, offsetof(struct pt_regs, usp));
+
+	DEFINE(TI_FLAGS,        offsetof(struct thread_info, flags));
+	DEFINE(TI_SYSCALL_WORK, offsetof(struct thread_info, syscall_work));
+	DEFINE(TI_STATUS,       offsetof(struct thread_info, status));
 }
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 9f2608de2544..bfa116d455fb 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -36,67 +36,10 @@
 	.size	\func, . - \func
 .endm
 
-/*
- * SYSCALL_SKIP_RETURN_RESTART_GATE
- *
- * Used when syscall dispatch is skipped (seccomp/ptrace injected nr=-1).
- *  - Ensure we never return r0==-1 with a3==0 (success); convert to ENOSYS.
- *  - Gate whether syscall restart is allowed by preserving restart context
- *    only for ERESTART* returns. Result:
- *        $26 = 0  => restart allowed
- *        $26 = 1  => restart NOT allowed
- *        $18 = preserved syscall nr (regs->r2) if restart allowed, else 0
- */
-.macro  SYSCALL_SKIP_RETURN_RESTART_GATE
-	/* Fix up invalid "-1 success" return state. */
-	ldq	$19, 72($sp)		/* a3 */
-	bne	$19, 1f			/* already error => skip fixup */
-
-	ldq	$20, 0($sp)		/* r0 */
-	lda	$21, -1($31)
-	cmpeq	$20, $21, $22
-	beq	$22, 1f			/* r0 != -1 => skip fixup */
-
-
-	lda	$20, ENOSYS($31)
-	stq	$20, 0($sp)		/* r0 = ENOSYS */
-	lda	$19, 1($31)
-	stq	$19, 72($sp)		/* a3 = 1 */
-1:
-	/* Restart gating: success is never restartable here. */
-	ldq	$19, 72($sp)		/* a3 */
-	beq	$19, 3f			/* success => not restartable */
-
-	ldq	$20, 0($sp)		/* r0 (positive errno if a3==1) */
-	lda	$21, ERESTARTSYS($31)
-	cmpeq	$20, $21, $22
-	bne	$22, 2f
-	lda	$21, ERESTARTNOINTR($31)
-	cmpeq	$20, $21, $22
-	bne	$22, 2f
-	lda	$21, ERESTARTNOHAND($31)
-	cmpeq	$20, $21, $22
-	bne	$22, 2f
-	lda	$21, ERESTART_RESTARTBLOCK($31)
-	cmpeq	$20, $21, $22
-	bne	$22, 2f
-
-3:	/* Not a restart code (or success) => restart NOT allowed. */
-	addq	$31, 1, $26		/* $26=1 => restart NOT allowed */
-	mov	0, $18
-	br	4f
-
-2:	/* Restart allowed. */
-	ldq	$18, 16($sp)		/* preserved syscall nr (regs->r2) */
-	mov	$31, $26		/* $26=0 => restart allowed */
-	br	4f
-4:
-.endm
-
-.macro LOCKDEP_HARDIRQS_ON_RESTORE
+.macro LOCKDEP_HARDIRQS_ON_RESTORE psreg
 #ifdef CONFIG_PROVE_LOCKING
 	/* a0 = saved PS */
-	ldq	$16, SP_OFF($sp)
+	ldq	$16, \psreg
 
 	/* a1 = callsite IP for lockdep */
 	lda	$17, 1f
@@ -248,7 +191,7 @@
 CFI_START_OSF_FRAME entInt
 	SAVE_ALL
 	lda	$8, 0x3fff
-	lda	$26, ret_from_sys_call
+	lda	$26, ret_from_exception
 	bic	$sp, $8, $8
 	mov	$sp, $19
 	jsr	$31, do_entInt
@@ -257,7 +200,7 @@ CFI_END_OSF_FRAME entInt
 CFI_START_OSF_FRAME entArith
 	SAVE_ALL
 	lda	$8, 0x3fff
-	lda	$26, ret_from_sys_call
+	lda	$26, ret_from_exception
 	bic	$sp, $8, $8
 	mov	$sp, $18
 	jsr	$31, do_entArith
@@ -305,13 +248,13 @@ CFI_START_OSF_FRAME entMM
 	.cfi_restore	$15
 	.cfi_adjust_cfa_offset	-64
 /* finish up the syscall as normal.  */
-	br	ret_from_sys_call
+	br	ret_from_exception
 CFI_END_OSF_FRAME entMM
 
 CFI_START_OSF_FRAME entIF
 	SAVE_ALL
 	lda	$8, 0x3fff
-	lda	$26, ret_from_sys_call
+	lda	$26, ret_from_exception
 	bic	$sp, $8, $8
 	mov	$sp, $17
 	jsr	$31, do_entIF
@@ -440,7 +383,7 @@ CFI_START_OSF_FRAME entUna
 	.cfi_restore	$28
 	.cfi_restore	$29
 	.cfi_adjust_cfa_offset	-256
-	LOCKDEP_HARDIRQS_ON_RESTORE
+	LOCKDEP_HARDIRQS_ON_RESTORE SP_OFF($sp)
 	call_pal PAL_rti
 
 	.align	4
@@ -487,18 +430,19 @@ entUnaUser:
 	.cfi_restore	$14
 	.cfi_restore	$15
 	.cfi_adjust_cfa_offset	-64
-	br	ret_from_sys_call
+	br	ret_from_exception
 CFI_END_OSF_FRAME entUna
 
 CFI_START_OSF_FRAME entDbg
 	SAVE_ALL
 	lda	$8, 0x3fff
-	lda	$26, ret_from_sys_call
+	lda	$26, ret_from_exception
 	bic	$sp, $8, $8
 	mov	$sp, $16
 	jsr	$31, do_entDbg
 CFI_END_OSF_FRAME entDbg
 
+
 /*
  * The system call entry point is special.  Most importantly, it looks
  * like a function call to userspace as far as clobbered registers.  We
@@ -516,9 +460,7 @@ CFI_END_OSF_FRAME entDbg
  * For seccomp/ptrace/generic syscall helpers we track the syscall
  * number separately:
  *   - regs->r1: current (mutable) syscall number (may be changed or set to -1)
- *   - regs->r2: original syscall number for restart/rollback
  *
- * On entry PAL provides the syscall number in r0; copy it into r1/r2.
  */
 
 	.align	4
@@ -531,203 +473,117 @@ CFI_END_OSF_FRAME entDbg
 	.cfi_rel_offset	$gp, 16
 entSys:
 	SAVE_ALL
-        ldq     $1, 0($sp)          /* syscall nr from saved r0 */
-        stq     $1, 8($sp)          /* regs->r1 = shadow syscall nr */
-        stq     $1, 16($sp)         /* regs->r2 = restart syscall nr */
-	/* Syscalls always enter from user mode: snapshot USP into pt_regs->usp */
+	ldq	$1, 0($sp)	/* syscall nr from saved r0 */
+	stq	$1, 8($sp)	/* regs->r1 = shadow syscall nr */
+
 	mov	$0, $8
 	call_pal PAL_rdusp
-	stq      $0, PT_REGS_USP($sp)
+	stq	$0, PT_REGS_USP($sp)
 	mov	$8, $0
 
-
 	lda	$8, 0x3fff
 	bic	$sp, $8, $8
-	lda	$4, NR_syscalls($31)
+
 	stq	$16, SP_OFF+24($sp)
-	lda	$5, sys_call_table
-	lda	$27, sys_ni_syscall
-	cmpult	$0, $4, $4
-	ldl	$3, TI_FLAGS($8)
 	stq	$17, SP_OFF+32($sp)
-	s8addq	$0, $5, $5
 	stq	$18, SP_OFF+40($sp)
-	.cfi_rel_offset	$16, SP_OFF+24
-	.cfi_rel_offset	$17, SP_OFF+32
-	.cfi_rel_offset	$18, SP_OFF+40
-	lda     $6, _TIF_SYSCALL_WORK
-	and     $3, $6, $3
-	bne     $3, strace
 
-	beq	$4, 1f
-	ldq	$27, 0($5)
-1:	ldq	$0, 8($sp)		/* syscall nr shadow (regs->r1) */
+	mov	$0, $1
+	lda	$16, 7
+	call_pal PAL_swpipl
+	mov	$1, $0
+	mov	$sp, $16
+	mov	$0, $17	 /* pv = selected syscall function */
+
+	DO_SWITCH_STACK
+	jsr	$26, alpha_syscall_enter_select
+	ldgp	$gp, 0($26)
+	UNDO_SWITCH_STACK
+
+	/*
+	 * C returned syscall function pointer in $0.
+	 * It also stored SKIP in TI_SYSCALL_META if dispatch is skipped.
+	 */
+	lda	$8, 0x3fff
+	bic	$sp, $8, $8
+	ldq	$3, TI_SYSCALL_META($8)
+	lda	$6, ALPHA_SYSCALL_META_SKIP
+	and	$3, $6, $6
+	bne	$6, skip_dispatch
+
+
+	mov	$0, $27
+	ldq	$16, SP_OFF+24($sp)
+	ldq	$17, SP_OFF+32($sp)
+	ldq	$18, SP_OFF+40($sp)
+	ldq	$19, 72($sp)
+	ldq	$20, 80($sp)
+	ldq	$21, 88($sp)
 
 	jsr	$26, ($27), sys_ni_syscall
 	ldgp	$gp, 0($26)
-	blt	$0, $syscall_error	/* the call failed */
-$ret_success:
-	stq	$0, 0($sp)
-	stq	$31, 72($sp)		/* a3=0 => no error */
 
-	.align	4
-	.globl	ret_from_sys_call
-ret_from_sys_call:
-	cmovne	$26, 0, $18		/* $18 = 0 => non-restartable */
-	ldq	$0, SP_OFF($sp)
-	and	$0, 8, $0
-	beq	$0, ret_to_kernel
-ret_to_user:
-	/* Make sure need_resched and sigpending don't change between
-		sampling and the rti.  */
-	lda	$16, 7
-	call_pal PAL_swpipl
-	ldl	$17, TI_FLAGS($8)
-	and	$17, _TIF_WORK_MASK, $2
-	bne	$2, work_pending
+skip_dispatch:
+	mov	$0, $17		/* raw ret; ignored if SKIP is set */
+	mov	$sp, $16	/* regs */
+
+	DO_SWITCH_STACK
+	jsr	$26, alpha_finish_syscall_to_user_mode
+	ldgp	$gp, 0($26)
+	UNDO_SWITCH_STACK
+
 restore_all:
+	lda	$8, 0x3fff
+	bic	$sp, $8, $8
 	ldl	$2, TI_STATUS($8)
 	and	$2, TS_SAVED_FP | TS_RESTORE_FP, $3
 	bne	$3, restore_fpu
 restore_other:
 	.cfi_remember_state
-	LOCKDEP_HARDIRQS_ON_RESTORE
 	RESTORE_ALL
 	call_pal PAL_rti
 
-ret_to_kernel:
-	.cfi_restore_state
-	lda	$16, 7
-	call_pal PAL_swpipl
-	br restore_other
-
-	.align 3
-$syscall_error:
-        /* Restart syscall nr comes from saved r2 (preserved even if r0 overwritten). */
-	ldq	$18, 16($sp)	/* old syscall nr for restart */
-
-	ldq	$19, 72($sp)	/* .. and this a3 */
-	subq	$31, $0, $0	/* with error in v0 */
-	addq	$31, 1, $1	/* set a3 for errno return */
-	stq	$0, 0($sp)
-	mov	$31, $26	/* tell "ret_from_sys_call" we can restart */
-	stq	$1, 72($sp)	/* a3 for return */
-	br	ret_from_sys_call
-
-/*
- * Do all cleanup when returning from all interrupts and system calls.
- *
- * Arguments:
- *       $8: current.
- *      $17: TI_FLAGS.
- *      $18: The old syscall number, or zero if this is not a return
- *           from a syscall that errored and is possibly restartable.
- *      $19: The old a3 value
- */
-
-	.align	4
-	.type	work_pending, @function
-work_pending:
-	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL, $2
-	bne	$2, $work_notifysig
-
-$work_resched:
-	/*
-	 * We can get here only if we returned from syscall without SIGPENDING
-	 * or got through work_notifysig already.  Either case means no syscall
-	 * restarts for us, so let $18 and $19 burn.
-	 */
-	jsr	$26, alpha_schedule_user_work
-	mov	0, $18
-	br	ret_to_user
+ret_to_user_from_syscall:
+	lda	$8, 0x3fff
+	bic	$sp, $8, $8
 
-$work_notifysig:
 	mov	$sp, $16
 	DO_SWITCH_STACK
-	jsr	$26, do_work_pending
+	jsr	$26, alpha_syscall_exit_to_user_mode
+	ldgp	$gp, 0($26)
 	UNDO_SWITCH_STACK
 	br	restore_all
 
-/*
- * PTRACE syscall handler
- */
-
 	.align	4
-	.type	strace, @function
-strace:
-	/* set up signal stack, call syscall_trace */
-	// NB: if anyone adds preemption, this block will need to be protected
-	ldl	$1, TI_STATUS($8)
-	and	$1, TS_SAVED_FP, $3
-	or	$1, TS_SAVED_FP, $2
-	bne	$3, 1f
-	stl	$2, TI_STATUS($8)
-	bsr	$26, __save_fpu
-1:
-	DO_SWITCH_STACK
-	jsr	$26, syscall_trace_enter /* returns the syscall number */
-	UNDO_SWITCH_STACK
-
-	stq     $0, 8($sp)		/* regs->r1 = shadow syscall nr */
-
-	/* get the arguments back.. */
-	ldq	$16, SP_OFF+24($sp)
-	ldq	$17, SP_OFF+32($sp)
-	ldq	$18, SP_OFF+40($sp)
-	ldq	$19, 72($sp)
-	ldq	$20, 80($sp)
-	ldq	$21, 88($sp)
+	.globl	ret_from_sys_call
+ret_from_sys_call:
+	ldq	$0, SP_OFF($sp)
+	and	$0, 8, $0
+	beq	$0, ret_to_kernel
+	br	ret_to_user_from_syscall
 
-	/* nr == -1: internal skip-dispatch or userspace syscall(-1)? */
-        lda     $6, -1($31)
-        cmpeq   $0, $6, $6
-	bne	$6, $strace_skip_call	/* nr == -1 => dispatch */
-
-	/* get the system call pointer.. */
-	lda	$1, NR_syscalls($31)
-	lda	$2, sys_call_table
-	lda	$27, sys_ni_syscall
-	cmpult	$0, $1, $1
-	s8addq	$0, $2, $2
-	beq	$1, 1f
-	ldq	$27, 0($2)
-1:	jsr	$26, ($27), sys_gettimeofday
-ret_from_straced:
-	ldgp	$gp, 0($26)
+ret_from_exception:
+	ldq	$0, SP_OFF($sp)
+	and	$0, 8, $0
+	beq	$0, ret_to_kernel
+	br	ret_to_user_from_exception
 
-	/* check return.. */
-	blt	$0, $strace_error	/* the call failed */
-$strace_success:
-	stq	$31, 72($sp)		/* a3=0 => no error */
-	stq	$0, 0($sp)		/* save return value */
+ret_to_user_from_exception:
 
-$strace_skip_call:
-	SYSCALL_SKIP_RETURN_RESTART_GATE
+	mov	$sp, $16
 	DO_SWITCH_STACK
-	jsr	$26, syscall_trace_leave
+	jsr	$26, alpha_exit_to_user_mode
+	ldgp	$gp, 0($26)
 	UNDO_SWITCH_STACK
-	br	$31, ret_from_sys_call
-
-	.align	3
-$strace_error:
-	ldq	$18, 16($sp)	/* restart syscall nr */
-	ldq	$19, 72($sp)	/* .. and this a3 */
-
-	subq	$31, $0, $0	/* with error in v0 */
-	addq	$31, 1, $1	/* set a3 for errno return */
-	stq	$0, 0($sp)
-	stq	$1, 72($sp)	/* a3 for return */
+	br	restore_all
 
-	DO_SWITCH_STACK
-	mov	$18, $9		/* save old syscall number */
-	mov	$19, $10	/* save old a3 */
-	jsr	$26, syscall_trace_leave
-	mov	$9, $18
-	mov	$10, $19
-	UNDO_SWITCH_STACK
+ret_to_kernel:
+	.cfi_restore_state
+	lda	$16, 7
+	call_pal PAL_swpipl
+	LOCKDEP_HARDIRQS_ON_RESTORE SP_OFF($sp)
+	br restore_other
 
-	mov	$31, $26	/* tell "ret_from_sys_call" we can restart */
-	br	ret_from_sys_call
 CFI_END_OSF_FRAME entSys
 
 /*
@@ -815,7 +671,6 @@ restore_fpu:
 	br restore_other
 #undef V
 
-
 /*
  * The meat of the context switch code.
  */
@@ -851,7 +706,7 @@ alpha_switch_to:
 	.align	4
 	.ent	ret_from_fork
 ret_from_fork:
-	lda	$26, ret_to_user
+	lda	$26, ret_to_user_from_exception
 	mov	$17, $16
 	jmp	$31, schedule_tail
 .end ret_from_fork
@@ -868,7 +723,7 @@ ret_from_kernel_thread:
 	mov	$9, $27
 	mov	$10, $16
 	jsr	$26, ($9)
-	br	$31, ret_to_user
+	br	$31, ret_to_user_from_exception
 .end ret_from_kernel_thread
 
 
@@ -910,12 +765,9 @@ fork_like clone3
 	.ent	sys_\name
 sys_\name:
 	.prologue 0
-	lda	$9, ret_from_straced
-	cmpult	$26, $9, $9
+	mov	$sp, $10
 	lda	$sp, -SWITCH_STACK_SIZE($sp)
 	jsr	$26, do_\name
-	bne	$9, 1f
-	jsr	$26, syscall_trace_leave
 1:	br	$1, undo_switch_stack
 	br	ret_from_sys_call
 .end sys_\name
diff --git a/arch/alpha/kernel/irq_alpha.c b/arch/alpha/kernel/irq_alpha.c
index 736294d3dd51..ac941172ae66 100644
--- a/arch/alpha/kernel/irq_alpha.c
+++ b/arch/alpha/kernel/irq_alpha.c
@@ -105,20 +105,24 @@ void notrace lockdep_on_restore(unsigned long ps,
 				unsigned long ip)
 {
 #ifdef CONFIG_PROVE_LOCKING
-	/* Restoring IPL==7 means interrupts remain disabled. */
+	/*
+	 * If PAL_rti will restore IPL == 7, IRQs remain disabled.
+	 * There is no hardirqs-on transition to annotate.
+	 */
 	if ((ps & 7) == 7)
 		return;
 
 	/*
-	 * If hardware IRQs are already enabled here, then emitting a
-	 * hardirqs-on transition is redundant.
+	 * This helper is meant to run before PAL_rti, after entry.S has
+	 * forced IPL to 7.  If IRQs are already enabled, do not emit a
+	 * fake transition.
 	 */
 	if (!irqs_disabled())
 		return;
 
 	/*
-	 * Only emit the transition if lockdep currently believes
-	 * hardirqs are off.
+	 * Only emit an ON transition if lockdep currently tracks hardirqs
+	 * as off.
 	 */
 	if (lockdep_hardirqs_enabled())
 		return;
diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index 9b262ef09a3a..f138bd494628 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -2,6 +2,7 @@
 #include <linux/interrupt.h>
 #include <linux/screen_info.h>
 #include <linux/io.h>
+#include <asm/ptrace.h>
 
 /* Prototypes of functions used across modules here in this directory.  */
 
@@ -164,16 +165,18 @@ extern void pcibios_claim_one_bus(struct pci_bus *);
 /* ptrace.c */
 extern int ptrace_set_bpt (struct task_struct *child);
 extern int ptrace_cancel_bpt (struct task_struct *child);
-extern void syscall_trace_leave(void);
-extern unsigned long syscall_trace_enter(void);
 
 /* signal.c */
 struct sigcontext;
 extern void do_sigreturn(struct sigcontext __user *);
 struct rt_sigframe;
 extern void do_rt_sigreturn(struct rt_sigframe __user *);
-extern void do_work_pending(struct pt_regs *, unsigned long, unsigned long, unsigned long);
 extern void alpha_schedule_user_work(void);
+extern void do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19);
+extern void alpha_syscall_exit_to_user_mode(struct pt_regs *regs);
+extern void alpha_exit_to_user_mode(struct pt_regs *regs);
+extern void alpha_finish_syscall_to_user_mode(struct pt_regs *regs, long ret);
+extern unsigned long alpha_syscall_enter_select(struct pt_regs *regs, long syscall);
 
 /* traps.c */
 extern void dik_show_regs(struct pt_regs *regs, unsigned long *r9_15);
diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index 69eb337347df..d4a8937985be 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -134,18 +134,51 @@ get_reg_addr(struct task_struct * task, unsigned long regno)
 /*
  * Get contents of register REGNO in task TASK.
  */
-static unsigned long
-get_reg(struct task_struct * task, unsigned long regno)
+
+static bool
+valid_regno(unsigned long regno)
 {
-	/* Special hack for fpcr -- combine hardware and software bits.  */
+	switch (regno) {
+	case 0 ... 31:
+	case 63:
+	case 65:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static long
+get_reg(struct task_struct *task, unsigned long regno)
+{
+	unsigned long *addr;
+
+	if (!valid_regno(regno))
+		return -EIO;
+
+	/*
+	 * Special hack for fpcr -- combine hardware and software bits.
+	 */
 	if (regno == 63) {
-		unsigned long fpcr = *get_reg_addr(task, regno);
-		unsigned long swcr
-		  = task_thread_info(task)->ieee_state & IEEE_SW_MASK;
+		unsigned long fpcr;
+		unsigned long swcr;
+
+		addr = get_reg_addr(task, regno);
+		if (!addr)
+			return -EIO;
+
+		fpcr = *addr;
+		swcr = task_thread_info(task)->ieee_state & IEEE_SW_MASK;
 		swcr = swcr_update_status(swcr, fpcr);
+
 		return fpcr | swcr;
 	}
-	return *get_reg_addr(task, regno);
+
+	addr = get_reg_addr(task, regno);
+	if (!addr)
+		return -EIO;
+
+	return *addr;
 }
 
 static void alpha_elf_fpregs_get(struct task_struct *target,
@@ -271,14 +304,15 @@ static void alpha_elf_gregs_set(struct task_struct *child,
 		pt->r19 = 1;
 }
 
-
-/*
- * Write contents of register REGNO in task TASK.
- */
 static int
 put_reg(struct task_struct *task, unsigned long regno, unsigned long data)
 {
 	struct pt_regs *regs = task_pt_regs(task);
+	unsigned long *addr;
+	unsigned long old_r0 = regs->r0;
+
+	if (regno == 31)
+		return 0;
 
 	if (regno == 63) {
 		task_thread_info(task)->ieee_state
@@ -287,24 +321,30 @@ put_reg(struct task_struct *task, unsigned long regno, unsigned long data)
 		data = (data & FPCR_DYN_MASK) | ieee_swcr_to_fpcr(data);
 	}
 
-	*get_reg_addr(task, regno) = data;
+	addr = get_reg_addr(task, regno);
+	if (!addr)
+		return -EIO;
+
+	*addr = data;
 
 	/*
 	 * Alpha historically exposes r0/v0 as the syscall number at a
 	 * syscall-entry stop.  The generic-entry conversion keeps the
-	 * mutable syscall number in regs->r1, so old ptrace users such
-	 * as strace that skip a syscall by poking r0 to -1 must also
-	 * update the internal shadow syscall number.
-	 *
-	 * Do not mirror other r0 writes.  strace later pokes r0 to the
-	 * injected return value, e.g. 42, while r1 must remain -1.
+	 * mutable syscall number in regs->r1.
 	 */
 
-	if (regno == 0 && data == (unsigned long)-1) {
+	if (regno == 0 && regs->r1 == old_r0 &&
+		(data == (unsigned long)-1 ||
+		(regs->r19 == 0 && data < NR_syscalls))) {
 		regs->r1 = data;
-		regs->r19 = 0;
-	}
 
+	/*
+	 * Keep the skip path looking like a clean entry-side syscall
+	 * rewrite.  Do not touch r19 for ordinary syscall substitution.
+	 */
+		if (data == (unsigned long)-1)
+			regs->r19 = 0;
+	}
 	return 0;
 }
 
@@ -435,25 +475,24 @@ long arch_ptrace(struct task_struct *child, long request,
 
 	switch (request) {
 	/* When I and D space are separate, these will need to be fixed.  */
-	case PTRACE_PEEKTEXT: /* read word at location addr. */
+	case PTRACE_PEEKTEXT:
 	case PTRACE_PEEKDATA:
 		copied = ptrace_access_vm(child, addr, &tmp, sizeof(tmp),
 				FOLL_FORCE);
 		ret = -EIO;
 		if (copied != sizeof(tmp))
 			break;
-		
 		force_successful_syscall_return();
 		ret = tmp;
 		break;
 
-	/* Read register number ADDR. */
 	case PTRACE_PEEKUSR:
-		force_successful_syscall_return();
 		ret = get_reg(child, addr);
-		DBG(DBG_MEM, ("peek $%lu->%#lx\n", addr, ret));
-		break;
+		if (ret == -EIO)
+			break;
 
+		force_successful_syscall_return();
+		break;
 	/* When I and D space are separate, this will have to be fixed.  */
 	case PTRACE_POKETEXT: /* write the word at location addr. */
 	case PTRACE_POKEDATA:
@@ -471,47 +510,6 @@ long arch_ptrace(struct task_struct *child, long request,
 	return ret;
 }
 
-asmlinkage unsigned long syscall_trace_enter(void)
-{
-	struct pt_regs *regs = current_pt_regs();
-
-	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
-		ptrace_report_syscall_entry(regs)) {
-		syscall_set_nr(current, regs, -1);
-		if (regs->r19 == 0 && regs->r0 == (unsigned long)-1)
-			syscall_set_return_value(current, regs, -ENOSYS, 0);
-		return -1UL;
-	}
-
-	/*
-	 * Do the secure computing after ptrace; failures should be fast.
-	 * If this fails, seccomp may already have set up the return value
-	 * (e.g. SECCOMP_RET_ERRNO / TRACE).
-	 */
-	if (secure_computing() == -1) {
-		if (regs->r19 == 0 && regs->r0 == (unsigned long)-1)
-			syscall_set_return_value(current, regs, -ENOSYS, 0);
-		syscall_set_nr(current, regs, -1);
-		return -1UL;
-	}
-
-#ifdef CONFIG_AUDITSYSCALL
-	audit_syscall_entry(syscall_get_nr(current, regs),
-		regs->r16, regs->r17, regs->r18, regs->r19);
-#endif
-	return syscall_get_nr(current, regs);
-}
-
-
-
-asmlinkage void
-syscall_trace_leave(void)
-{
-	audit_syscall_exit(current_pt_regs());
-	if (test_thread_flag(TIF_SYSCALL_TRACE))
-		ptrace_report_syscall_exit(current_pt_regs(), 0);
-}
-
 /*
  * Minimal regset support for Alpha.
  *
@@ -522,7 +520,6 @@ syscall_trace_leave(void)
  *    regset_get should return 0 on success. So call dump_elf_thread()
  *    directly and return membuf_write()'s result.
  */
-
 static int alpha_regset_set(struct task_struct *target,
 			    const struct user_regset *regset,
 			    unsigned int pos, unsigned int count,
diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index ce40a49b8496..3362f2b45d54 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -27,10 +27,9 @@
 #include <linux/uaccess.h>
 #include <asm/sigcontext.h>
 #include <asm/ucontext.h>
-
+#include <linux/entry-common.h>
 #include "proto.h"
 
-
 #define DEBUG_SIG 0
 
 #define _BLOCKABLE (~(sigmask(SIGKILL) | sigmask(SIGSTOP)))
@@ -41,14 +40,6 @@ asmlinkage void ret_from_sys_call(void);
  * The OSF/1 sigprocmask calling sequence is different from the
  * C sigprocmask() sequence..
  */
-
-asmlinkage void alpha_schedule_user_work(void)
-{
-	local_irq_enable();
-	schedule();
-	local_irq_disable();
-}
-
 SYSCALL_DEFINE2(osf_sigprocmask, int, how, unsigned long, newmask)
 {
 	sigset_t oldmask;
@@ -465,6 +456,7 @@ syscall_restart(unsigned long r0, unsigned long r19,
 		fallthrough;
 	case ERESTARTNOINTR:
 		regs->r0 = r0;	/* reset v0 and a3 and replay syscall */
+		regs->r1 = r0;
 		regs->r19 = r19;
 		regs->pc -= 4;
 		break;
@@ -488,7 +480,7 @@ syscall_restart(unsigned long r0, unsigned long r19,
  * restart. "r0" is also used as an indicator whether we can restart at
  * all (if we get here from anything but a syscall return, it will be 0)
  */
-static void
+void
 do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19)
 {
 	unsigned long single_stepping = ptrace_cancel_bpt(current);
@@ -511,12 +503,14 @@ do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19)
 			case ERESTARTNOINTR:
 				/* Reset v0 and a3 and replay syscall.  */
 				regs->r0 = r0;
+				regs->r1 = r0;
 				regs->r19 = r19;
 				regs->pc -= 4;
 				break;
 			case ERESTART_RESTARTBLOCK:
 				/* Set v0 to the restart_syscall and replay */
 				regs->r0 = __NR_restart_syscall;
+				regs->r1 = __NR_restart_syscall;
 				regs->pc -= 4;
 				break;
 			}
@@ -527,27 +521,121 @@ do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19)
 		ptrace_set_bpt(current);	/* re-set breakpoint */
 }
 
-void
-do_work_pending(struct pt_regs *regs, unsigned long thread_flags,
-		 unsigned long r0, unsigned long r19)
+asmlinkage void alpha_exit_to_user_mode(struct pt_regs *regs)
 {
-	do {
-		if (thread_flags & _TIF_NEED_RESCHED) {
-			local_irq_enable();
-			schedule();
-		} else {
-			local_irq_enable();
-			if (thread_flags & (_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)) {
-				preempt_disable();
-				save_fpu();
-				preempt_enable();
-				do_signal(regs, r0, r19);
-				r0 = 0;
-			} else {
-				resume_user_mode_work(regs);
-			}
+	local_irq_disable();
+	irqentry_exit_to_user_mode_prepare(regs);
+	exit_to_user_mode();
+}
+
+/*
+ * Syscall return reaches here after Alpha-specific r0/a3 result encoding.
+ * Delegate syscall-exit work and final exit-to-user handling to generic
+ * entry code; low-level PAL restore remains in assembly.
+ */
+asmlinkage void alpha_syscall_exit_to_user_mode(struct pt_regs *regs)
+{
+	syscall_exit_to_user_mode(regs);
+}
+
+void arch_do_signal_or_restart(struct pt_regs *regs)
+{
+	struct thread_info *ti = current_thread_info();
+
+	do_signal(regs, ti->syscall_saved_nr, ti->syscall_saved_r19);
+}
+
+asmlinkage unsigned long
+alpha_syscall_enter_select(struct pt_regs *regs, long syscall)
+{
+	struct thread_info *ti = current_thread_info();
+	unsigned long work;
+	unsigned long nr;
+	unsigned long fn = (unsigned long)sys_ni_syscall;
+
+	ti->syscall_meta = 0;
+	ti->syscall_saved_nr = syscall;
+
+	if (!(ti->status & TS_SAVED_FP)) {
+		ti->status |= TS_SAVED_FP;
+		__save_fpu();
+	}
+
+	work = READ_ONCE(ti->syscall_work) & SYSCALL_WORK_ENTER;
+
+	nr = syscall_enter_from_user_mode(regs, syscall);
+
+	syscall_set_nr(current, regs, nr);
+	/*
+	 * In the unified path, nr == -1 is ambiguous:
+	 *   - without syscall work: syscall(-1), dispatch to sys_ni_syscall
+	 *   - with syscall work: ptrace/seccomp skip marker
+	 */
+	if (work && (long)nr == -1L) {
+		ti->syscall_meta = ALPHA_SYSCALL_META_SKIP;
+		return fn; /* ignored by asm when SKIP is set */
+	}
+
+	instrumentation_begin();
+	if (likely(nr < (unsigned long)NR_syscalls)) {
+		nr = array_index_nospec(nr, NR_syscalls);
+		fn = (unsigned long)sys_call_table[nr];
+	}
+	instrumentation_end();
+
+	return fn;
+}
+
+asmlinkage noinstr void
+alpha_finish_syscall_to_user_mode(struct pt_regs *regs, long ret)
+{
+	struct thread_info *ti = current_thread_info();
+	unsigned long meta = ti->syscall_meta;
+
+	ti->syscall_meta = 0;
+	ti->syscall_saved_r19 = regs->r19;
+
+	instrumentation_begin();
+
+	if (meta & ALPHA_SYSCALL_META_SKIP) {
+		/*
+		 * Skip-dispatch path: ptrace/seccomp may already have
+		 * installed the return state in r0/r19. Preserve it unless
+		 * it still looks like untouched "-1 success", in which case
+		 * Alpha normalizes it to ENOSYS/a3=1.
+		 *
+		 * Do not run syscall_exit_work() here. That is handled by
+		 * syscall_exit_to_user_mode().
+		 */
+
+		if (regs->r0 == (unsigned long)-1) {
+			regs->r0 = ENOSYS;
+			regs->r19 = 1;
 		}
-		local_irq_disable();
-		thread_flags = read_thread_flags();
-	} while (thread_flags & _TIF_WORK_MASK);
+
+		instrumentation_end();
+
+		syscall_exit_to_user_mode(regs);
+		return;
+	}
+
+	/*
+	 * Some successful syscalls, notably legacy ptrace PEEK requests,
+	 * return arbitrary data in r0.  That data may have the bit pattern
+	 * of a negative errno, so do not infer failure from ret < 0 when
+	 * arch code explicitly requested a successful Alpha return.
+	 */
+	if (meta & ALPHA_SYSCALL_META_FORCE_SUCCESS) {
+		regs->r0 = ret;
+		regs->r19 = 0;
+	} else if (ret < 0) {
+		regs->r0 = -ret;
+		regs->r19 = 1;
+	} else {
+		regs->r0 = ret;
+		regs->r19 = 0;
+	}
+
+	instrumentation_end();
+	syscall_exit_to_user_mode(regs);
 }
-- 
2.53.0

