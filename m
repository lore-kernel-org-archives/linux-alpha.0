Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B9C3E3D93
	for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064630; cv=none; b=Ccd3RwhQWz90zsi9bpAjJDACa+aR/UJ5VOgdv0zhtGeDeTVN0g2De++eCf40pjyDyD1onPaRiByOE+vhcdeuz55JlwuFJdL8i5xtY0vTfR5puwhUgjmPf4NGWv/38Ne569tfl9O57PLNAIQYbOyqX+IPpNDNvzM2kVZsdYjqBcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064630; c=relaxed/simple;
	bh=6pLEKfmltNBR/DJwcFKXTHaS/L9LNQsd8GiZjWVlYTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKSR3Nn5JzrUYxH1Lex50sHQOyxHlqv2lACNIXkjqvxx6qEu5EE69rqEVSDkcxzeveHyxVO0n5iHjN2lMjAxHBhX7Rd5g92nDPcqtvBby2a9KrlB8KG3QH6PPLSktes65sf0TdgcfLP+a//vd2Qq9uK9iOehFSvhaOsqG6n6BGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r8TC0aVO; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8TC0aVO"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a884815606so15191474e87.0
        for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 07:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780064624; x=1780669424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wU8/o+8ByJs4UG31DLc0+Y6CQtUPzghKqNvi0QyXzAY=;
        b=r8TC0aVO0t6HLWRgL9AtzRkvlYEOZTiDEUHIw+daxjBNVaJ9HILo0pMeqqoGU985X9
         giGkAmr6lNBJ1CyZzaJCsHkHkMOYtX7ukEjrWJBTE5CtVJrS6vw+LGoOTsJUrfZMDNsK
         AVRB8g6zgblFqbd/AZNF2vqOt5pupo5VMgLbyrDS/omSEuqNCWuDOmvkJWKXmrEtjH+w
         Lfw7HLFwk76zqCbrRjkG5U2kcqyCLdUWJ5P9+bGfNRwCB7C/eXeKNpqMrQHiXUTPd96U
         p6rgUK7nuthWYPNV7U11R5niQd7DxwT8/8rkU8RpKLDi0W2PrGtgEPMXq63DfNXASTRD
         2JpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064624; x=1780669424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wU8/o+8ByJs4UG31DLc0+Y6CQtUPzghKqNvi0QyXzAY=;
        b=RTyaH9h0+hfxSYFxiz53WIYHIjYqxTBxu6SMzMUhrqV6WTnhSezZPBrkJj54gTSkue
         sUb95u1OndmsUnMxD/OWpygupwaD8EKJDz6jLxdRUpA/wDMxDLD44sxG4VXYC0Kqlqpy
         HKJb9jfB/dhrxfPvT7C6wsVrC6VdT5v2av6Ay1ZgbV7JOLN/GmRPUHVnAHFs/Mr9Nckb
         pMp0abeRlJRN+jmXn4zczcUzpgo/xiwbbl6Ew2M9PoMUQejTQro1ZalOzrXiqOtz1dUL
         itIgtzlmc3tCXeHYs9FH0XtDK0j3p2+H0azm7HUj7GuIWnDykx1WqgoqTG07oEK2SWea
         9v7g==
X-Forwarded-Encrypted: i=1; AFNElJ8a8tWrZKija4XE0gLzdzKluSr+hAWvBl5wr8pEqjEpQFTf3P0NSEtdPYoSg1FLBa+Vf8pEGlcLm1SEbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm1aloBnH4VLxiwn8HgPpODzIo+DXDpwSt3cSXdGvnveEPYtg0
	41taj1xBZ3OXUVLbXStwTCFNpvo/aYsoLyhY2rM3kLIkMUKX3oWye5TT
X-Gm-Gg: Acq92OE6qjOU9EcvAyeM9ZxMZnJ84/sXr8LThGk0OJg1GSN/Mrmxt2asGvgFNz6WhcP
	mJ2txEmKQB985pobSLwLLtdoZ+QAVn/2/ShLdDXKivPcGlk7NnykRYBF/MKL2jYmUVpEyhKck5e
	vgaOWFBjcw8xY5f54xFxOok6QcAdZzP74CbM1z6IKKB0cBc2GoziC6ZLccqwtbKMZUfV1wTp48q
	Aastan+STg/8zWvcNk6zfVN/FH9padoFuLTs3a0HszUdKeZqqFN4hCnGsMip7GTIud5g3PwEVcx
	LDXvt5QnVuiO7Vx4aoFlqI3LqkhUXWlOUboFobH3IFVs/4oLz4vJBnj/jctuTeX6GbTmYB+CLvx
	2QnLoLu13/xs5i2hZkrKkR9tKHG5oEQMvpvn6+5eiJ8jPUnaYrC+0kTKne0I/Bp7v/rNIhIGcax
	JoP6YzizGPpJQIJNz/i3YAwYfYz8GJ05hJosHk3udSlAO7gN2wwD5CZXQhLIlhLzhqCgV9s16kh
	13et85MXJmKZtxq736fF9DW7g9JPBChhsIc3tQ9VkWkOQ==
X-Received: by 2002:a05:6512:2247:b0:5a8:6d98:df26 with SMTP id 2adb3069b0e04-5aa607a85f2mr19715e87.13.1780064623929;
        Fri, 29 May 2026 07:23:43 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b0687e2sm310433e87.6.2026.05.29.07.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:23:43 -0700 (PDT)
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
Subject: [PATCH v2 1/8] alpha: enable regset-based ptrace and core dumps
Date: Fri, 29 May 2026 16:21:57 +0200
Message-ID: <20260529142322.1362438-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142322.1362438-1-linmag7@gmail.com>
References: <20260529142322.1362438-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a user_regset_view for Alpha and switch ELF core dumping to
CORE_DUMP_USE_REGSET.  General-purpose registers are exported in
ELF gregs layout, including callee-saved registers and a correct
user stack pointer.

The user stack pointer is not preserved in pt_regs on Alpha, so expose
it from the PCB, or via rdusp() for the current task, when building the
ELF register image.  This makes the user stack pointer consistent for
core dumps, ptrace regsets, and PTRACE_GET_SYSCALL_INFO.

Implement regset get/set callbacks for both NT_PRSTATUS and NT_PRFPREG.
The callbacks translate between Alpha's pt_regs/thread state and the
ELF-visible register layouts, while the common ptrace regset code handles
PTRACE_GETREGSET and PTRACE_SETREGSET iovec semantics.  This avoids
duplicating subtle short-buffer and oversized-buffer behavior in
arch_ptrace().

With these changes Alpha satisfies the requirements for
HAVE_ARCH_TRACEHOOK and selects it, enabling generic tracehook and
ptrace syscall-info code paths without changing the existing syscall
entry ABI.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 .../features/core/tracehook/arch-support.txt  |   2 +-
 arch/alpha/Kconfig                            |   1 +
 arch/alpha/include/asm/elf.h                  |   1 +
 arch/alpha/include/asm/ptrace.h               |   7 +
 arch/alpha/include/asm/syscall.h              |   7 +
 arch/alpha/include/asm/thread_info.h          |   7 +-
 arch/alpha/include/uapi/asm/ptrace.h          |   2 +-
 arch/alpha/kernel/asm-offsets.c               |   1 +
 arch/alpha/kernel/entry.S                     |  15 +-
 arch/alpha/kernel/ptrace.c                    | 320 +++++++++++++++---
 arch/alpha/kernel/traps.c                     |   8 +
 11 files changed, 312 insertions(+), 59 deletions(-)

diff --git a/Documentation/features/core/tracehook/arch-support.txt b/Documentation/features/core/tracehook/arch-support.txt
index 4f36fcbfb6d5..654f38413d16 100644
--- a/Documentation/features/core/tracehook/arch-support.txt
+++ b/Documentation/features/core/tracehook/arch-support.txt
@@ -6,7 +6,7 @@
     -----------------------
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: |  ok  |
     |         arm: |  ok  |
     |       arm64: |  ok  |
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 7b7dafe7d9df..f3b882835617 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -33,6 +33,7 @@ config ALPHA
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_SECCOMP
 	select HAVE_ARCH_SECCOMP_FILTER
+	select HAVE_ARCH_TRACEHOOK
 	select HAVE_MOD_ARCH_SPECIFIC
 	select LOCK_MM_AND_FIND_VMA
 	select MODULES_USE_ELF_RELA
diff --git a/arch/alpha/include/asm/elf.h b/arch/alpha/include/asm/elf.h
index 50c82187e60e..b15946621d57 100644
--- a/arch/alpha/include/asm/elf.h
+++ b/arch/alpha/include/asm/elf.h
@@ -53,6 +53,7 @@
 
 #define EF_ALPHA_32BIT		1	/* All addresses are below 2GB */
 
+#define CORE_DUMP_USE_REGSET	1
 /*
  * ELF register definitions..
  */
diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index 3557ce64ed21..8e0a589e2d15 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -24,4 +24,11 @@ static inline unsigned long regs_return_value(struct pt_regs *regs)
 	return regs->r0;
 }
 
+/* Helpers for working with the user stack pointer */
+static inline unsigned long user_stack_pointer(struct pt_regs *regs)
+{
+	/* Valid for user-mode regs */
+	return regs->usp;
+}
+
 #endif
diff --git a/arch/alpha/include/asm/syscall.h b/arch/alpha/include/asm/syscall.h
index 584b1ab2e325..1e78cbd46faf 100644
--- a/arch/alpha/include/asm/syscall.h
+++ b/arch/alpha/include/asm/syscall.h
@@ -19,6 +19,13 @@ static inline long syscall_get_return_value(struct task_struct *task,
 	return regs->r19 ? -(long)regs->r0 : (long)regs->r0;
 }
 
+static inline long syscall_get_error(struct task_struct *task,
+				     struct pt_regs *regs)
+{
+	return regs->r19 ? -(long)regs->r0 : 0;
+}
+
+
 /*
  * Alpha syscall ABI / kernel conventions:
  *  - PAL provides syscall number in r0 on entry.
diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index 94ef9cfa30f5..1552ecca8520 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -66,6 +66,7 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
 #define TIF_SYSCALL_AUDIT	4	/* syscall audit active */
 #define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
 #define TIF_SECCOMP		6	/* seccomp syscall filtering active */
+#define	TIF_SYSCALL_TRACEPOINT	7	/* syscall tracepoint instrumentation */
 #define TIF_DIE_IF_KERNEL	9	/* dik recursion lock */
 #define TIF_MEMDIE		13	/* is terminating due to OOM killer */
 #define TIF_POLLING_NRFLAG	14	/* idle is polling for TIF_NEED_RESCHED */
@@ -78,6 +79,7 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
 #define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_SECCOMP		(1<<TIF_SECCOMP)
 #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
+#define _TIF_SYSCALL_TRACEPOINT	(1<<TIF_SYSCALL_TRACEPOINT)
 
 /*
  * Work to do on syscall entry (in entry.S).
@@ -85,9 +87,10 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
  * with the mask used before branching to syscall_trace_enter().
  */
 #ifdef CONFIG_AUDITSYSCALL
-# define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | _TIF_SECCOMP)
+# define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | _TIF_SECCOMP \
+				| _TIF_SYSCALL_TRACEPOINT)
 #else
-# define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SECCOMP)
+# define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SECCOMP | _TIF_SYSCALL_TRACEPOINT)
 #endif
 
 /* Work to do on interrupt/exception return.  */
diff --git a/arch/alpha/include/uapi/asm/ptrace.h b/arch/alpha/include/uapi/asm/ptrace.h
index 72ed913a910f..9d86b2a1526e 100644
--- a/arch/alpha/include/uapi/asm/ptrace.h
+++ b/arch/alpha/include/uapi/asm/ptrace.h
@@ -43,7 +43,7 @@ struct pt_regs {
 	unsigned long trap_a1;
 	unsigned long trap_a2;
 /* This makes the stack 16-byte aligned as GCC expects */
-	unsigned long __pad0;
+	unsigned long usp;
 /* These are saved by PAL-code: */
 	unsigned long ps;
 	unsigned long pc;
diff --git a/arch/alpha/kernel/asm-offsets.c b/arch/alpha/kernel/asm-offsets.c
index 1ebb05890499..1d3bfca319ae 100644
--- a/arch/alpha/kernel/asm-offsets.c
+++ b/arch/alpha/kernel/asm-offsets.c
@@ -29,4 +29,5 @@ static void __used foo(void)
 
 	DEFINE(HAE_CACHE, offsetof(struct alpha_machine_vector, hae_cache));
 	DEFINE(HAE_REG, offsetof(struct alpha_machine_vector, hae_register));
+	DEFINE(PT_REGS_USP, offsetof(struct pt_regs, usp));
 }
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index fcfd06529b12..449092a31eef 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -520,6 +520,12 @@ entSys:
         ldq     $1, 0($sp)          /* syscall nr from saved r0 */
         stq     $1, 8($sp)          /* regs->r1 = shadow syscall nr */
         stq     $1, 16($sp)         /* regs->r2 = restart syscall nr */
+	/* Syscalls always enter from user mode: snapshot USP into pt_regs->usp */
+	mov	$0, $8
+	call_pal PAL_rdusp
+	stq      $0, PT_REGS_USP($sp)
+	mov	$8, $0
+
 
 	lda	$8, 0x3fff
 	bic	$sp, $8, $8
@@ -535,15 +541,10 @@ entSys:
 	.cfi_rel_offset	$16, SP_OFF+24
 	.cfi_rel_offset	$17, SP_OFF+32
 	.cfi_rel_offset	$18, SP_OFF+40
-#ifdef CONFIG_AUDITSYSCALL
-	lda     $6, _TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | _TIF_SECCOMP
-	and     $3, $6, $3
-	bne     $3, strace
-#else
-	lda     $6, _TIF_SYSCALL_TRACE | _TIF_SECCOMP
+	lda     $6, _TIF_SYSCALL_WORK
 	and     $3, $6, $3
 	bne     $3, strace
-#endif
+
 	beq	$4, 1f
 	ldq	$27, 0($5)
 1:	ldq	$0, 8($sp)		/* syscall nr shadow (regs->r1) */
diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index 0687760ea466..69eb337347df 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -24,10 +24,15 @@
 
 #include "proto.h"
 #include <linux/uio.h>
+#include <linux/regset.h>
 
 #define DEBUG	DBG_MEM
 #undef DEBUG
 
+#ifndef NT_FPREGSET
+#define NT_FPREGSET NT_PRFPREG
+#endif
+
 #ifdef DEBUG
 enum {
 	DBG_MEM		= (1<<0),
@@ -143,19 +148,163 @@ get_reg(struct task_struct * task, unsigned long regno)
 	return *get_reg_addr(task, regno);
 }
 
+static void alpha_elf_fpregs_get(struct task_struct *target,
+			 elf_fpreg_t *fpregs)  /* points to ELF_NFPREG entries */
+{
+	memcpy(fpregs, task_thread_info(target)->fp, sizeof(elf_fpregset_t));
+}
+
+static void alpha_elf_fpregs_set(struct task_struct *target,
+			 const elf_fpreg_t *fpregs,
+			 size_t nwords)
+{
+	size_t n = min_t(size_t, nwords, ELF_NFPREG);
+
+	memcpy(task_thread_info(target)->fp, fpregs, n * sizeof(elf_fpreg_t));
+}
+
+static void alpha_elf_gregs_set(struct task_struct *child,
+			const elf_greg_t *src,
+			size_t nwords)
+{
+	struct pt_regs *pt = task_pt_regs(child);
+	struct thread_info *ti = task_thread_info(child);
+	struct switch_stack *sw = ((struct switch_stack *)pt) - 1;
+
+	/* GPRs r0..r8 live in pt_regs */
+	if (nwords > 0)
+		pt->r0 = src[0];
+	if (nwords > 1)
+		pt->r1 = src[1];
+	if (nwords > 2)
+		pt->r2 = src[2];
+	if (nwords > 3)
+		pt->r3 = src[3];
+	if (nwords > 4)
+		pt->r4 = src[4];
+	if (nwords > 5)
+		pt->r5 = src[5];
+	if (nwords > 6)
+		pt->r6 = src[6];
+	if (nwords > 7)
+		pt->r7 = src[7];
+	if (nwords > 8)
+		pt->r8 = src[8];
+
+	/* r9..r15 live in switch_stack */
+	if (nwords > 9)
+		sw->r9 = src[9];
+	if (nwords > 10)
+		sw->r10 = src[10];
+	if (nwords > 11)
+		sw->r11 = src[11];
+	if (nwords > 12)
+		sw->r12 = src[12];
+	if (nwords > 13)
+		sw->r13 = src[13];
+	if (nwords > 14)
+		sw->r14 = src[14];
+	if (nwords > 15)
+		sw->r15 = src[15];
+
+	/* r16..r28 live in pt_regs */
+	if (nwords > 16)
+		pt->r16 = src[16];
+	if (nwords > 17)
+		pt->r17 = src[17];
+	if (nwords > 18)
+		pt->r18 = src[18];
+	if (nwords > 19)
+		pt->r19 = src[19];
+	if (nwords > 20)
+		pt->r20 = src[20];
+	if (nwords > 21)
+		pt->r21 = src[21];
+	if (nwords > 22)
+		pt->r22 = src[22];
+	if (nwords > 23)
+		pt->r23 = src[23];
+	if (nwords > 24)
+		pt->r24 = src[24];
+	if (nwords > 25)
+		pt->r25 = src[25];
+	if (nwords > 26)
+		pt->r26 = src[26];
+	if (nwords > 27)
+		pt->r27 = src[27];
+	if (nwords > 28)
+		pt->r28 = src[28];
+
+	/* gp, usp, pc, unique */
+	if (nwords > 29)
+		pt->gp = src[29];
+
+	if (nwords > 30) {
+		ti->pcb.usp = src[30];
+		/*
+		 * If someone ever does this to current (rare), keep the
+		 * hardware usp consistent.
+		 */
+		if (child == current)
+			wrusp(src[30]);
+	}
+
+	if (nwords > 31)
+		pt->pc = src[31];
+
+	if (nwords > 32)
+		ti->pcb.unique = src[32];
+
+/*
+ * PTRACE_SETREGSET can be used at a syscall-entry stop to skip the
+ * syscall by setting the syscall number to -1.  The seccomp/ptrace
+ * selftests use this to synthesize errno returns.
+ *
+ * Alpha uses r19/a3 as the error flag, so a skipped syscall with a
+ * small positive r0 and a clear r19 must be normalized to an error
+ * return.
+ */
+	if (pt->r1 == (unsigned long)-1 &&
+	    pt->r19 == 0 &&
+	    pt->r0 > 0 &&
+	    pt->r0 < MAX_ERRNO)
+		pt->r19 = 1;
+}
+
+
 /*
  * Write contents of register REGNO in task TASK.
  */
 static int
 put_reg(struct task_struct *task, unsigned long regno, unsigned long data)
 {
+	struct pt_regs *regs = task_pt_regs(task);
+
 	if (regno == 63) {
 		task_thread_info(task)->ieee_state
 		  = ((task_thread_info(task)->ieee_state & ~IEEE_SW_MASK)
 		     | (data & IEEE_SW_MASK));
 		data = (data & FPCR_DYN_MASK) | ieee_swcr_to_fpcr(data);
 	}
+
 	*get_reg_addr(task, regno) = data;
+
+	/*
+	 * Alpha historically exposes r0/v0 as the syscall number at a
+	 * syscall-entry stop.  The generic-entry conversion keeps the
+	 * mutable syscall number in regs->r1, so old ptrace users such
+	 * as strace that skip a syscall by poking r0 to -1 must also
+	 * update the internal shadow syscall number.
+	 *
+	 * Do not mirror other r0 writes.  strace later pokes r0 to the
+	 * injected return value, e.g. 42, while r1 must remain -1.
+	 */
+
+	if (regno == 0 && data == (unsigned long)-1) {
+		regs->r1 = data;
+		regs->r19 = 0;
+	}
+
 	return 0;
 }
 
@@ -315,54 +464,6 @@ long arch_ptrace(struct task_struct *child, long request,
 		DBG(DBG_MEM, ("poke $%lu<-%#lx\n", addr, data));
 		ret = put_reg(child, addr, data);
 		break;
-	case PTRACE_GETREGSET:
-	case PTRACE_SETREGSET: {
-		struct iovec __user *uiov = (struct iovec __user *)data;
-		struct iovec iov;
-		struct pt_regs *regs;
-		size_t len;
-
-		/* Only support NT_PRSTATUS (general registers) for now. */
-		if (addr != NT_PRSTATUS) {
-			ret = -EIO;
-			break;
-		}
-
-		if (copy_from_user(&iov, uiov, sizeof(iov))) {
-			ret = -EFAULT;
-			break;
-		}
-
-		regs = task_pt_regs(child);
-		len = min_t(size_t, iov.iov_len, sizeof(*regs));
-
-		if (request == PTRACE_GETREGSET) {
-			if (copy_to_user(iov.iov_base, regs, len)) {
-				ret = -EFAULT;
-				break;
-			}
-		} else {
-		/*
-		 * Allow writing back regs. This is needed by the TRACE_syscall
-		 * tests (they change PC/syscall nr/retval).
-		 */
-			if (copy_from_user(regs, iov.iov_base, len)) {
-				ret = -EFAULT;
-				break;
-			}
-		}
-
-		/* Per API, update iov_len with amount transferred. */
-		iov.iov_len = len;
-		if (copy_to_user(uiov, &iov, sizeof(iov))) {
-			ret = -EFAULT;
-			break;
-		}
-
-		ret = 0;
-		break;
-	}
-
 	default:
 		ret = ptrace_request(child, request, addr, data);
 		break;
@@ -410,3 +511,126 @@ syscall_trace_leave(void)
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
 		ptrace_report_syscall_exit(current_pt_regs(), 0);
 }
+
+/*
+ * Minimal regset support for Alpha.
+ *
+ * Alpha-specific notes:
+ *  - Do NOT use ELF_CORE_COPY_REGS(): it uses current_thread_info(),
+ *    which is wrong for non-current tasks.
+ *  - dump_elf_task() returns 1 unconditionally in this tree, while
+ *    regset_get should return 0 on success. So call dump_elf_thread()
+ *    directly and return membuf_write()'s result.
+ */
+
+static int alpha_regset_set(struct task_struct *target,
+			    const struct user_regset *regset,
+			    unsigned int pos, unsigned int count,
+			    const void *kbuf,
+			    const void __user *ubuf)
+{
+	elf_gregset_t gregs;
+	unsigned int nwords;
+
+	if (pos + count > sizeof(gregs))
+		return -EIO;
+
+	/*
+	 * Preserve registers outside the written range.
+	 */
+	dump_elf_thread(gregs, task_pt_regs(target),
+			task_thread_info(target));
+
+	if (user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				gregs, 0, sizeof(gregs)))
+		return -EFAULT;
+
+	nwords = sizeof(gregs) / sizeof(elf_greg_t);
+	alpha_elf_gregs_set(target, gregs, nwords);
+
+	return 0;
+}
+
+static int alpha_fpregset_set(struct task_struct *target,
+			      const struct user_regset *regset,
+			      unsigned int pos, unsigned int count,
+			      const void *kbuf,
+			      const void __user *ubuf)
+{
+	elf_fpregset_t fpregs;
+	unsigned int nwords;
+
+	if (pos + count > sizeof(fpregs))
+		return -EIO;
+
+	alpha_elf_fpregs_get(target, fpregs);
+
+	if (user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				fpregs, 0, sizeof(fpregs)))
+		return -EFAULT;
+
+	nwords = sizeof(fpregs) / sizeof(elf_fpreg_t);
+	alpha_elf_fpregs_set(target, fpregs, nwords);
+
+	return 0;
+}
+
+static int alpha_regset_get(struct task_struct *target,
+			    const struct user_regset *regset,
+			    struct membuf to)
+{
+	struct pt_regs *pt = task_pt_regs(target);
+	struct thread_info *ti = task_thread_info(target);
+	elf_gregset_t gregs;
+
+	dump_elf_thread(gregs, pt, ti);
+	return membuf_write(&to, gregs, sizeof(gregs));
+}
+
+static int alpha_fpregset_get(struct task_struct *target,
+			      const struct user_regset *regset,
+			      struct membuf to)
+{
+	elf_fpregset_t fpregs;
+
+	alpha_elf_fpregs_get(target, fpregs);
+	return membuf_write(&to, fpregs, sizeof(fpregs));
+}
+
+enum alpha_regset {
+	REGSET_GPR,
+	REGSET_FPR,
+};
+
+static const struct user_regset alpha_user_regsets[] = {
+	[REGSET_GPR] = {
+		.core_note_type	= NT_PRSTATUS,
+		.n		= ELF_NGREG,
+		.size		= sizeof(elf_greg_t),
+		.align		= sizeof(elf_greg_t),
+		.regset_get	= alpha_regset_get,
+		.set		= alpha_regset_set,
+	},
+	[REGSET_FPR] = {
+		.core_note_type	= NT_PRFPREG,
+		.core_note_name	= "CORE",
+		.n		= ELF_NFPREG,
+		.size		= sizeof(elf_fpreg_t),
+		.align		= sizeof(elf_fpreg_t),
+		.regset_get	= alpha_fpregset_get,
+		.set		= alpha_fpregset_set,
+	},
+};
+
+static const struct user_regset_view user_alpha_view = {
+	.name		= "alpha",
+	.e_machine	= EM_ALPHA,
+	.ei_osabi	= ELF_OSABI,
+	.regsets	= alpha_user_regsets,
+	.n		= ARRAY_SIZE(alpha_user_regsets),
+};
+
+const struct user_regset_view *task_user_regset_view(struct task_struct *task)
+{
+	return &user_alpha_view;
+}
diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index 7004397937cf..7631129ac914 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -30,6 +30,12 @@
 
 #include "proto.h"
 
+static __always_inline void alpha_snapshot_usp(struct pt_regs *regs)
+{
+	if (user_mode(regs))
+		regs->usp = rdusp();
+}
+
 void
 dik_show_regs(struct pt_regs *regs, unsigned long *r9_15)
 {
@@ -180,6 +186,7 @@ do_entArith(unsigned long summary, unsigned long write_mask,
 {
 	long si_code = FPE_FLTINV;
 
+	alpha_snapshot_usp(regs);
 	if (summary & 1) {
 		/* Software-completion summary bit is set, so try to
 		   emulate the instruction.  If the processor supports
@@ -201,6 +208,7 @@ do_entIF(unsigned long type, struct pt_regs *regs)
 {
 	int signo, code;
 
+	alpha_snapshot_usp(regs);
 	if (type == 3) { /* FEN fault */
 		/* Irritating users can call PAL_clrfen to disable the
 		   FPU for the process.  The kernel will then trap in
-- 
2.53.0

