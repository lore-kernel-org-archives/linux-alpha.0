Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A6E1F9F7A
	for <linux-alpha@vger.kernel.org>; Thu,  5 Feb 2026 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298274; cv=none; b=p94A9WpXXTA/zWf0OU/nVn2DJW97j3k2RefxFuSEesSwYs/BNw67JYjE7fCq/SieoTiP7JySBeqhCEg3GdUQwLQrvQsu3Ef8heg1MVBQUMWl1Hb4hxwt5F4wXbU+aDMXNXrhSUjC+83FVjZozVQc7g4TJFeWeVbNB7Zi5KkMuBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298274; c=relaxed/simple;
	bh=hheIIb/StEidZChZmPsI0U1dg5yp4EFF6RrsmicTYqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvPwGrJRb7AE9Pl5TOV5GawjRiZ3RVmwSNgcsze86pOMSFPb1nzyalZAtKMxjag1X4B5U8QWSDOitEngXsBBSiqYMJdHnd34JiSWyZvUTpuQtOMgAdzatCP9oDXR5h42PUw3RrBV7ceRX6ca+Lciv1MWwlB1TdpfI2xqSDISCWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUn2m+m/; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUn2m+m/"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-385bc6910eeso7599971fa.2
        for <linux-alpha@vger.kernel.org>; Thu, 05 Feb 2026 05:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770298272; x=1770903072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqLSkt2CVLpFYau64GmWIBBVxXZAUvcsXUMeMb3NvH0=;
        b=RUn2m+m/hKpRyK8Y8eS6YnKmIh9scuEYJ4pdISTo57mGyYuP9sqMqTxbgLfvjyuqB9
         JLOBwc0xqk9cce4pPMTCCXL52CpqJjUuSz8qsMGWsu56mhLqVbz0YkdWtjptTXn6lYSQ
         tn47K/xFktrGg/EQqvywWEUQ8SOSbZaxL7/p7CO1+wLGyIWaelwoFLiGjesjcz/9FQDv
         YqXiu23YF+tEgQtBLmUFIxI0zv0RJOtjBtFrRCYvnuXssnR0llwCwHD5cuj44lsawjDy
         0V3vIwUOJPC6cargdpV0wC1DsnWXr7pDuSZKsk+3oykvEmPXCzLf200eC+oUTrfbKiT8
         RDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770298272; x=1770903072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SqLSkt2CVLpFYau64GmWIBBVxXZAUvcsXUMeMb3NvH0=;
        b=fN9JVeDM0E617OEAH/WT+kDDWN5ZcfDEB1hO/HyN0nvu+dkh1RVFKPEepIYhY+OGLC
         AFMcAw+4I8ToTfHfSNEr+PMp0g+Spfpgmv/N76Ge1OklQYNJN0cRvNixHbTgq6b2Ai+l
         6RXmvAt2/3g/1w7vu/6iGXg9FTfS1GxVI0rt3PsdimADr7FC5NFA2nzAngA9pOuDFBCn
         BtjuQ6Jj4Mx4jIf6McvFjexY1ZNjaPfQV1xiwzHdedoIF/l6dMvQ0WAilZnaUHh2ZWCd
         wCl4yMz9O3j88x7S45aBn5Ht442nohlv2OJQhf+MnPZoSabV/rdxvEbEErYxGqwaQuu0
         u8Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXAZ/XfwZZDcxQx4Kvbhq6ONj4QDnJI+NIxBdf58B26hBfnuB9XM20TeeQ9YJdfMEL30v0bUFYploTF0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOJpuL6g7QYMsPu5bpdugUWPROYXdd1AUJ6I9am0Hrzbz0UF32
	HXgbU4n4KjU99M8xTLgKolQGjhLoNzn8Brc/i9wPyQ6+fLMGHZm4vcpo
X-Gm-Gg: AZuq6aKvFDRuh5zP2gw3oi7mOMy91Hn4HT2HwZ+1levm4APFEKhZkSG6xAMABZyxLdY
	MA07q1BFT9+VaBqcFtyBWp7go2RIClqY+Zu3X6nxcSoUwS/DVFsVD90w2uc/MyWA51K4fIkpTlB
	7Onm0pUEiA9FJx7oBga5GPaNMBnkSIRX4RPbVhrXAsfp2Yk0VwPnLH636DfxO5lCs6lblVUQI/m
	U976saZz7EvZqw55Yyuvx1MuVHvdLp5iYbgJjbZuxsdh4uIQ/72l4aAkDOTiIrlWcljamhRuJBw
	0lS7xuYOJL+nk/v8OchBc0nyw7cO6QV04yMONG7+xEvvM/NoQV3nY6BtAd2OOWZm8vBWiBdEgfo
	OwYS8nszkllezZ/nmBp0aLxUgTLWNp14O1F/fitDWK8VfC8hk47wcFlfng7JE/62ODy+edM8bvo
	caKDShFN5EC01TPHD7Pt5qFTHBWvi+VcB9lzvJsfkFXRvbqOMX6CikC+3mTXw4VORVX9/vOvQ6f
	i74O1727cpnmjWZ87208XHQLWJdbrTptg==
X-Received: by 2002:a05:651c:c85:b0:383:1565:629b with SMTP id 38308e7fff4ca-38691c6b140mr18386871fa.1.1770298271782;
        Thu, 05 Feb 2026 05:31:11 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38691f6e2d6sm10151971fa.5.2026.02.05.05.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 05:31:11 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	glaubitz@physik.fu-berlin.de,
	macro@orcam.me.uk,
	macro@redhat.com,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	kees@kernel.org
Cc: Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 1/1] alpha: add support for SECCOMP and SECCOMP_FILTER
Date: Thu,  5 Feb 2026 14:29:15 +0100
Message-ID: <20260205133049.526-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205133049.526-1-linmag7@gmail.com>
References: <20260205133049.526-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SECCOMP and SECCOMP_FILTER support to the Alpha architecture and fix
syscall entry and ptrace issues uncovered by the seccomp-bpf selftests.

The syscall entry path is reworked to consistently track syscall state
using r0, r1 and r2:
  - r1 holds the active syscall number
  - r2 preserves the original syscall number for restart
  - r0 carries the return value, with r19 (a3) indicating success/error

This allows syscall restarts to be permitted only for valid ERESTART*
return codes and prevents kernel-internal restart values from leaking to
userspace. The syscall tracing error marker is corrected to use the saved
syscall number slot, matching the Alpha ABI.

Additionally, implement minimal PTRACE_GETREGSET and PTRACE_SETREGSET
support for NT_PRSTATUS, exporting struct pt_regs directly. This fixes
ptrace-based seccomp tests that previously failed with -EIO.

With these changes, seccomp-bpf and ptrace syscall tests pass reliably on
Alpha.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig                   |   2 +
 arch/alpha/include/asm/seccomp.h     |  13 +++
 arch/alpha/include/asm/syscall.h     |  90 +++++++++++++++++++-
 arch/alpha/include/asm/thread_info.h |  16 +++-
 arch/alpha/kernel/entry.S            | 123 +++++++++++++++++++++++----
 arch/alpha/kernel/ptrace.c           |  83 ++++++++++++++++--
 6 files changed, 304 insertions(+), 23 deletions(-)
 create mode 100644 arch/alpha/include/asm/seccomp.h

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 80367f2cf821..7f2d4e794d21 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -31,6 +31,8 @@ config ALPHA
 	select GENERIC_SMP_IDLE_THREAD
 	select HAS_IOPORT
 	select HAVE_ARCH_AUDITSYSCALL
+	select HAVE_ARCH_SECCOMP
+	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_MOD_ARCH_SPECIFIC
 	select LOCK_MM_AND_FIND_VMA
 	select MODULES_USE_ELF_RELA
diff --git a/arch/alpha/include/asm/seccomp.h b/arch/alpha/include/asm/seccomp.h
new file mode 100644
index 000000000000..311934d20340
--- /dev/null
+++ b/arch/alpha/include/asm/seccomp.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ALPHA_SECCOMP_H
+#define _ASM_ALPHA_SECCOMP_H
+
+#include <asm/unistd.h>
+#include <asm-generic/seccomp.h>
+#include <uapi/linux/audit.h>
+
+#define SECCOMP_ARCH_NATIVE            AUDIT_ARCH_ALPHA
+#define SECCOMP_ARCH_NATIVE_NR         NR_syscalls
+#define SECCOMP_ARCH_NATIVE_NAME       "alpha"
+
+#endif /* _ASM_ALPHA_SECCOMP_H */
diff --git a/arch/alpha/include/asm/syscall.h b/arch/alpha/include/asm/syscall.h
index f21babaeed85..584b1ab2e325 100644
--- a/arch/alpha/include/asm/syscall.h
+++ b/arch/alpha/include/asm/syscall.h
@@ -3,6 +3,10 @@
 #define _ASM_ALPHA_SYSCALL_H
 
 #include <uapi/linux/audit.h>
+#include <linux/audit.h>
+#include <linux/sched.h>
+#include <linux/types.h>
+#include <asm/ptrace.h>
 
 static inline int syscall_get_arch(struct task_struct *task)
 {
@@ -12,7 +16,91 @@ static inline int syscall_get_arch(struct task_struct *task)
 static inline long syscall_get_return_value(struct task_struct *task,
 					    struct pt_regs *regs)
 {
-	return regs->r0;
+	return regs->r19 ? -(long)regs->r0 : (long)regs->r0;
+}
+
+/*
+ * Alpha syscall ABI / kernel conventions:
+ *  - PAL provides syscall number in r0 on entry.
+ *  - The kernel tracks the active syscall number in regs->r1 (mutable) and
+ *    preserves the original syscall number in regs->r2 for rollback/restart.
+ *  - Return value is in regs->r0, with regs->r19 ("a3") as the error flag
+ *    (0=success, 1=error; on error regs->r0 holds positive errno).
+ */
+
+static inline long syscall_get_nr(struct task_struct *task,
+				struct pt_regs *regs)
+{
+	return (long)regs->r1;
+}
+
+static inline void syscall_set_nr(struct task_struct *task,
+				struct pt_regs *regs,
+				long nr)
+{
+	regs->r1 = (unsigned long)nr;
+}
+
+/*
+ * Syscall arguments:
+ *   regs->r16..regs->r21 carry up to 6 syscall arguments on entry.
+ *   Note: regs->r19 is also used as "a3" (error flag) on syscall return.
+ */
+
+static inline void syscall_get_arguments(struct task_struct *task,
+					struct pt_regs *regs,
+					unsigned long *args)
+{
+	args[0] = regs->r16;
+	args[1] = regs->r17;
+	args[2] = regs->r18;
+	args[3] = regs->r19;
+	args[4] = regs->r20;
+	args[5] = regs->r21;
+}
+
+static inline void syscall_set_arguments(struct task_struct *task,
+					struct pt_regs *regs,
+					const unsigned long *args)
+{
+	regs->r16 = args[0];
+	regs->r17 = args[1];
+	regs->r18 = args[2];
+	regs->r19 = args[3];
+	regs->r20 = args[4];
+	regs->r21 = args[5];
+}
+/*
+ * Set return value for a syscall.
+ * Alpha uses r0 for return value and r19 ("a3") as the error indicator:
+ *   a3 = 0 => success
+ *   a3 = 1 => error, and userspace interprets r0 as errno (positive).
+ *
+ * The kernel reports errors to userspace by setting a3=1 and placing a
+ * positive errno value in r0. Some syscall paths do this in entry.S,
+ * while others (e.g. seccomp/ptrace helpers) use syscall_set_return_value().
+ */
+
+static inline void syscall_set_return_value(struct task_struct *task,
+					struct pt_regs *regs,
+					int error, long val)
+{
+
+	if (error) {
+		/* error is negative errno in this tree */
+		regs->r0  = (unsigned long)(-error);  /* positive errno */
+		regs->r19 = 1;                        /* a3 = error */
+	} else {
+		regs->r0  = (unsigned long)val;
+		regs->r19 = 0;                        /* a3 = success */
+	}
+}
+
+/* Restore the original syscall nr after seccomp/ptrace modified regs->r1. */
+static inline void syscall_rollback(struct task_struct *task,
+					struct pt_regs *regs)
+{
+	regs->r1 = regs->r2;
 }
 
 #endif	/* _ASM_ALPHA_SYSCALL_H */
diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index 98ccbca64984..94ef9cfa30f5 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -56,7 +56,8 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
  * - pending work-to-be-done flags come first and must be assigned to be
  *   within bits 0 to 7 to fit in and immediate operand.
  *
- * TIF_SYSCALL_TRACE is known to be 0 via blbs.
+ * (Historically TIF_SYSCALL_TRACE was known to be 0 via blbs, but we may
+ *  also test multiple bits via masks now.)
  */
 #define TIF_SYSCALL_TRACE	0	/* syscall trace active */
 #define TIF_NOTIFY_RESUME	1	/* callback before returning to user */
@@ -64,6 +65,7 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
 #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
 #define TIF_SYSCALL_AUDIT	4	/* syscall audit active */
 #define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
+#define TIF_SECCOMP		6	/* seccomp syscall filtering active */
 #define TIF_DIE_IF_KERNEL	9	/* dik recursion lock */
 #define TIF_MEMDIE		13	/* is terminating due to OOM killer */
 #define TIF_POLLING_NRFLAG	14	/* idle is polling for TIF_NEED_RESCHED */
@@ -74,8 +76,20 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
 #define _TIF_NOTIFY_RESUME	(1<<TIF_NOTIFY_RESUME)
 #define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
 #define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
+#define _TIF_SECCOMP		(1<<TIF_SECCOMP)
 #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
 
+/*
+ * Work to do on syscall entry (in entry.S).
+ * If you want this to exactly mirror what entry.S checks, keep it aligned
+ * with the mask used before branching to syscall_trace_enter().
+ */
+#ifdef CONFIG_AUDITSYSCALL
+# define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | _TIF_SECCOMP)
+#else
+# define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SECCOMP)
+#endif
+
 /* Work to do on interrupt/exception return.  */
 #define _TIF_WORK_MASK		(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
 				 _TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL)
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index f4d41b4538c2..6e09115ad406 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -10,6 +10,7 @@
 #include <asm/pal.h>
 #include <asm/errno.h>
 #include <asm/unistd.h>
+#include <linux/errno.h>
 
 	.text
 	.set noat
@@ -35,6 +36,64 @@
 	.size	\func, . - \func
 .endm
 
+/*
+ * SYSCALL_SKIP_RETURN_RESTART_GATE
+ *
+ * Used when syscall dispatch is skipped (seccomp/ptrace injected nr=-1).
+ *  - Ensure we never return r0==-1 with a3==0 (success); convert to ENOSYS.
+ *  - Gate whether syscall restart is allowed by preserving restart context
+ *    only for ERESTART* returns. Result:
+ *        $26 = 0  => restart allowed
+ *        $26 = 1  => restart NOT allowed
+ *        $18 = preserved syscall nr (regs->r2) if restart allowed, else 0
+ */
+.macro  SYSCALL_SKIP_RETURN_RESTART_GATE
+	/* Fix up invalid "-1 success" return state. */
+	ldq	$19, 72($sp)		/* a3 */
+	bne	$19, 1f			/* already error => skip fixup */
+
+	ldq	$20, 0($sp)		/* r0 */
+	lda	$21, -1($31)
+	cmpeq	$20, $21, $22
+	beq	$22, 1f			/* r0 != -1 => skip fixup */
+
+
+	lda	$20, ENOSYS($31)
+	stq	$20, 0($sp)		/* r0 = ENOSYS */
+	lda	$19, 1($31)
+	stq	$19, 72($sp)		/* a3 = 1 */
+1:
+	/* Restart gating: success is never restartable here. */
+	ldq	$19, 72($sp)		/* a3 */
+	beq	$19, 3f			/* success => not restartable */
+
+	ldq	$20, 0($sp)		/* r0 (positive errno if a3==1) */
+	lda	$21, ERESTARTSYS($31)
+	cmpeq	$20, $21, $22
+	bne	$22, 2f
+	lda	$21, ERESTARTNOINTR($31)
+	cmpeq	$20, $21, $22
+	bne	$22, 2f
+	lda	$21, ERESTARTNOHAND($31)
+	cmpeq	$20, $21, $22
+	bne	$22, 2f
+	lda	$21, ERESTART_RESTARTBLOCK($31)
+	cmpeq	$20, $21, $22
+	bne	$22, 2f
+
+3:	/* Not a restart code (or success) => restart NOT allowed. */
+	addq	$31, 1, $26		/* $26=1 => restart NOT allowed */
+	mov	0, $18
+	br	4f
+
+2:	/* Restart allowed. */
+	ldq	$18, 16($sp)		/* preserved syscall nr (regs->r2) */
+	mov	$31, $26		/* $26=0 => restart allowed */
+	br	4f
+4:
+.endm
+
+
 /*
  * This defines the normal kernel pt-regs layout.
  *
@@ -425,7 +484,7 @@ CFI_START_OSF_FRAME entDbg
 	mov	$sp, $16
 	jsr	$31, do_entDbg
 CFI_END_OSF_FRAME entDbg
-
+
 /*
  * The system call entry point is special.  Most importantly, it looks
  * like a function call to userspace as far as clobbered registers.  We
@@ -435,6 +494,17 @@ CFI_END_OSF_FRAME entDbg
  * So much for theory.  We don't take advantage of this yet.
  *
  * Note that a0-a2 are not saved by PALcode as with the other entry points.
+ *
+ * Alpha syscall ABI uses:
+ *   - r0 for return value
+ *   - r19 ("a3") as error indicator (0=success, 1=error; r0 holds errno)
+ *
+ * For seccomp/ptrace/generic syscall helpers we track the syscall
+ * number separately:
+ *   - regs->r1: current (mutable) syscall number (may be changed or set to -1)
+ *   - regs->r2: original syscall number for restart/rollback
+ *
+ * On entry PAL provides the syscall number in r0; copy it into r1/r2.
  */
 
 	.align	4
@@ -447,6 +517,10 @@ CFI_END_OSF_FRAME entDbg
 	.cfi_rel_offset	$gp, 16
 entSys:
 	SAVE_ALL
+        ldq     $1, 0($sp)          /* syscall nr from saved r0 */
+        stq     $1, 8($sp)          /* regs->r1 = shadow syscall nr */
+        stq     $1, 16($sp)         /* regs->r2 = restart syscall nr */
+
 	lda	$8, 0x3fff
 	bic	$sp, $8, $8
 	lda	$4, NR_syscalls($31)
@@ -462,15 +536,19 @@ entSys:
 	.cfi_rel_offset	$17, SP_OFF+32
 	.cfi_rel_offset	$18, SP_OFF+40
 #ifdef CONFIG_AUDITSYSCALL
-	lda     $6, _TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT
+	lda     $6, _TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | _TIF_SECCOMP
 	and     $3, $6, $3
 	bne     $3, strace
 #else
-	blbs    $3, strace		/* check for SYSCALL_TRACE in disguise */
+	lda     $6, _TIF_SYSCALL_TRACE | _TIF_SECCOMP
+	and     $3, $6, $3
+	bne     $3, strace
 #endif
 	beq	$4, 1f
 	ldq	$27, 0($5)
-1:	jsr	$26, ($27), sys_ni_syscall
+1:	ldq	$0, 8($sp)		/* syscall nr shadow (regs->r1) */
+
+	jsr	$26, ($27), sys_ni_syscall
 	ldgp	$gp, 0($26)
 	blt	$0, $syscall_error	/* the call failed */
 $ret_success:
@@ -509,15 +587,17 @@ ret_to_kernel:
 
 	.align 3
 $syscall_error:
-	/*
-	 * Some system calls (e.g., ptrace) can return arbitrary
-	 * values which might normally be mistaken as error numbers.
-	 * Those functions must zero $0 (v0) directly in the stack
-	 * frame to indicate that a negative return value wasn't an
-	 * error number..
-	 */
-	ldq	$18, 0($sp)	/* old syscall nr (zero if success) */
-	beq	$18, $ret_success
+/*
+ * Some syscalls (e.g. ptrace) may return negative values that are not
+ * errno. Those syscalls clear the saved syscall number slot (regs->r1)
+ * as a marker; when it is zero, do not convert a negative r0 into errno.
+ */
+
+	ldq	$2, 8($sp)
+	beq	$2, $ret_success
+
+        /* Restart syscall nr comes from saved r2 (preserved even if r0 overwritten). */
+	ldq	$18, 16($sp)	/* old syscall nr for restart */
 
 	ldq	$19, 72($sp)	/* .. and this a3 */
 	subq	$31, $0, $0	/* with error in v0 */
@@ -581,6 +661,8 @@ strace:
 	jsr	$26, syscall_trace_enter /* returns the syscall number */
 	UNDO_SWITCH_STACK
 
+	stq     $0, 8($sp)		/* regs->r1 = shadow syscall nr */
+
 	/* get the arguments back.. */
 	ldq	$16, SP_OFF+24($sp)
 	ldq	$17, SP_OFF+32($sp)
@@ -589,6 +671,11 @@ strace:
 	ldq	$20, 80($sp)
 	ldq	$21, 88($sp)
 
+	/* nr == -1: internal skip-dispatch or userspace syscall(-1)? */
+        lda     $6, -1($31)
+        cmpeq   $0, $6, $6
+	bne	$6, $strace_skip_call	/* nr != -1 => dispatch */
+
 	/* get the system call pointer.. */
 	lda	$1, NR_syscalls($31)
 	lda	$2, sys_call_table
@@ -607,6 +694,8 @@ $strace_success:
 	stq	$31, 72($sp)		/* a3=0 => no error */
 	stq	$0, 0($sp)		/* save return value */
 
+$strace_skip_call:
+	SYSCALL_SKIP_RETURN_RESTART_GATE
 	DO_SWITCH_STACK
 	jsr	$26, syscall_trace_leave
 	UNDO_SWITCH_STACK
@@ -614,8 +703,10 @@ $strace_success:
 
 	.align	3
 $strace_error:
-	ldq	$18, 0($sp)	/* old syscall nr (zero if success) */
-	beq	$18, $strace_success
+	ldq	$2, 8($sp)	/* marker: zero means negative isn't errno */
+	beq	$2, $strace_success
+	ldq	$18, 16($sp)	/* restart syscall nr */
+
 	ldq	$19, 72($sp)	/* .. and this a3 */
 
 	subq	$31, $0, $0	/* with error in v0 */
@@ -634,7 +725,7 @@ $strace_error:
 	mov	$31, $26	/* tell "ret_from_sys_call" we can restart */
 	br	ret_from_sys_call
 CFI_END_OSF_FRAME entSys
-
+
 /*
  * Save and restore the switch stack -- aka the balance of the user context.
  */
diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index fde4c68e7a0b..0687760ea466 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -16,11 +16,14 @@
 #include <linux/security.h>
 #include <linux/signal.h>
 #include <linux/audit.h>
+#include <linux/seccomp.h>
+#include <asm/syscall.h>
 
 #include <linux/uaccess.h>
 #include <asm/fpu.h>
 
 #include "proto.h"
+#include <linux/uio.h>
 
 #define DEBUG	DBG_MEM
 #undef DEBUG
@@ -312,6 +315,54 @@ long arch_ptrace(struct task_struct *child, long request,
 		DBG(DBG_MEM, ("poke $%lu<-%#lx\n", addr, data));
 		ret = put_reg(child, addr, data);
 		break;
+	case PTRACE_GETREGSET:
+	case PTRACE_SETREGSET: {
+		struct iovec __user *uiov = (struct iovec __user *)data;
+		struct iovec iov;
+		struct pt_regs *regs;
+		size_t len;
+
+		/* Only support NT_PRSTATUS (general registers) for now. */
+		if (addr != NT_PRSTATUS) {
+			ret = -EIO;
+			break;
+		}
+
+		if (copy_from_user(&iov, uiov, sizeof(iov))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		regs = task_pt_regs(child);
+		len = min_t(size_t, iov.iov_len, sizeof(*regs));
+
+		if (request == PTRACE_GETREGSET) {
+			if (copy_to_user(iov.iov_base, regs, len)) {
+				ret = -EFAULT;
+				break;
+			}
+		} else {
+		/*
+		 * Allow writing back regs. This is needed by the TRACE_syscall
+		 * tests (they change PC/syscall nr/retval).
+		 */
+			if (copy_from_user(regs, iov.iov_base, len)) {
+				ret = -EFAULT;
+				break;
+			}
+		}
+
+		/* Per API, update iov_len with amount transferred. */
+		iov.iov_len = len;
+		if (copy_to_user(uiov, &iov, sizeof(iov))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		ret = 0;
+		break;
+	}
+
 	default:
 		ret = ptrace_request(child, request, addr, data);
 		break;
@@ -321,15 +372,37 @@ long arch_ptrace(struct task_struct *child, long request,
 
 asmlinkage unsigned long syscall_trace_enter(void)
 {
-	unsigned long ret = 0;
 	struct pt_regs *regs = current_pt_regs();
+
 	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
-	    ptrace_report_syscall_entry(current_pt_regs()))
-		ret = -1UL;
-	audit_syscall_entry(regs->r0, regs->r16, regs->r17, regs->r18, regs->r19);
-	return ret ?: current_pt_regs()->r0;
+		ptrace_report_syscall_entry(regs)) {
+		syscall_set_nr(current, regs, -1);
+		if (regs->r19 == 0 && regs->r0 == (unsigned long)-1)
+			syscall_set_return_value(current, regs, -ENOSYS, 0);
+		return -1UL;
+	}
+
+	/*
+	 * Do the secure computing after ptrace; failures should be fast.
+	 * If this fails, seccomp may already have set up the return value
+	 * (e.g. SECCOMP_RET_ERRNO / TRACE).
+	 */
+	if (secure_computing() == -1) {
+		if (regs->r19 == 0 && regs->r0 == (unsigned long)-1)
+			syscall_set_return_value(current, regs, -ENOSYS, 0);
+		syscall_set_nr(current, regs, -1);
+		return -1UL;
+	}
+
+#ifdef CONFIG_AUDITSYSCALL
+	audit_syscall_entry(syscall_get_nr(current, regs),
+		regs->r16, regs->r17, regs->r18, regs->r19);
+#endif
+	return syscall_get_nr(current, regs);
 }
 
+
+
 asmlinkage void
 syscall_trace_leave(void)
 {
-- 
2.52.0

