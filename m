Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742201;
	b=A4dqQOGsp8G94UE0L0t09jgw+TKbZ8GmarL7nUIjQiA+qekW75+2Ax52TiNHBsb0hkdq
	 WOoZ8WpQWJkSNQFQRSqcgPATYOSRLRWrDF0MGO82VJ8z2Cfg2XqQOgDEzrJF+RaXDhyho
	 FQectE23tX0fPc+v06ZppsQjH0qEK3IpUzWdTrq9DYtm02HXe2cZWgDRX7cxxJ9I0wa0N
	 Ps2wagsE7H7t3prUJJU455Gd1uUndHmRQF0DjwwXvzyJF51l+8KaAGScRJVGKRTdOgONv
	 XxAJsa2htaBFLYH7+XznpLvb4alO46HVU4m+Oahu6Atv+SLhdicQxFG4xBUW5dj9HvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xM+WaVTmHBqKBXIJjvZl9PO0D3VSjOHW0F2gw2oqsQQ=;
	b=oXyWKMhPL15cip5qmyCHnbWGdI4UXvExcLBwJqd3hwT6WsrhS02HPCr9q04KhOvy+Gid
	 6ANCQbHsWKuwqlZUw3n0Cp5JtCipGRiW/CxElLcStvjdqAP3ibmGgm09a5HesQcGPT7Jn
	 l1hXCV2fWm7rNu/hnbqqRyq2R73Tq8JvwATjU/tHrmdfl3dgQ+fZol5a4OWg8RcnqrUjl
	 TYtGwyg4xV1DHYat7C9HunvPaNXz3UPn0MRFQc542wvPqHKqeMLutk/qonGbo6nKZD0hY
	 0CMDNxZdTkFvQ3r4SQauMMcrgD+Cn/CunwMEX485FVK3HOJEojVrO1JNvEoTVsrP1nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OdUfEg4S;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EAC606D835
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 21:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5EAC606D835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OdUfEg4S
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso6438870a12.3
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 13:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742199; x=1794346999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xM+WaVTmHBqKBXIJjvZl9PO0D3VSjOHW0F2gw2oqsQQ=;
        b=OdUfEg4SaHaCA4HjdS2fWCziMR1ACTbICxFjuosoyM01AKA6gZs3IsyDRYZUYXaX7u
         Ar6S9btfstS8EXCbTGDJx81GDMVsnKRK7iQIcXM5YfM3o6H+zSmWIGbbPBZEjR77RVLT
         ZGkCbpwGbtlg6BKIFweX1HRpEkXAM2MV7cmk6grr7S7fEllSgzYAx+GeweDSwMOv+GbU
         EXnDhUyB8TQQT/5Q+n1Z/9Cd2HAJEKy8adB+qEMx5C7obvLVN0VxXv64gUC+f3OQX9Au
         pxZMs3SKVwddwLI+laA+hGPDk4zfaPBS9D4++A78rtt7v2VD1fDBSYVXRdLJZNyw7V+Y
         VfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742199; x=1794346999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xM+WaVTmHBqKBXIJjvZl9PO0D3VSjOHW0F2gw2oqsQQ=;
        b=DdMfOh1R3dbPSjPRj1J09rJZOpEefu5qTW4opabxV1347tJnpUGemwY+2yO9gLcqPG
         7/b+KqX0oCLrMM+EEEgvVdSldss3xCjPc82dXA22fNHWaiRE5KbGU6UlR+5YOem4Zmnb
         Ipl5MpcUSFemryNHBpzpwVeDnIff7uQDiMTfGnWor/DXrLxVa9cbkc5wMdyWyJkoK6Fs
         zfHKZxB3V+Cq/cywVqm5W0I91ye5cfWZxMZ/9PDRJ89+XiqLbFj5sH1WAkNyOFUAes6M
         AELVdb6dGwN+eQaU8cWmOhljWn2E8nUkF+toYAoGZBSxitndD9dkZqAEjHbayZ6+jS85
         cDmg==
X-Forwarded-Encrypted: i=1; AKwUvByYWP37H7Tk9N4Tu9tZFlvzs/deBkcx4QkqyJVuJeEB1lm2X/4VcFX39IGAy1RG8R3+AK5NY90dU6k41A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VUC9cDctdPL1HXgY/N0S56laumsXFkSR/aVMSGTVRQcsD0x/n
	nokMC6aImOjS1Uaqo/6YFy5HVKtVFnabZpw8Iuuqx9HOsH6EK1ZEeoRkHh9Zi75775Q=
X-Gm-Gg: AYBFou3r49kfedpF55mohutjbQMMIfoULWe9+b35mLvcNkoHEBY05W5CiR2fnED5NhW
	1YjffVd5pobEy3q4fTpd9blAdrPVXiOi8ofmmNCplVI1cnW1Yj8cilWcMXBR0/J2Wa2IWf6LO20
	9qseyhvAdgsxfsnqn/ClXu8vb9J8ei2XWWR1VfVxXgdHTncKxbV/5Vz4se+t2Hieq6m1t2941WA
	U9HwzFU2ZEkGzaRJf0LbTpo/wLdQJrw3REeo5+ofPQua5edpgFbbxajGrrwkBRI0IueTqgbDoqt
	JSLjV+oNnUEF2ZuB9sAM7p5hD9xBE6quMmEV9HL6TJJfmeJGpPGlqU8BkUbIqL7G98lcUJHbl0p
	3VwHrfJXZWd8GKTboBrl/++9YiCnaYIX5yAFmbiQHdvHYKaKhMec1Hb0deMUOZg24k0xLnj9fxU
	ly2kB8HH5MIXKPu4E9X+MItd8rl3s6ZogJ8cPXlI8e03P/Gu8Zc/hbhxfXoeV7cAQeeFxNHOTAf
	6BseCWFWsFyJNyteBMeyoUI1IqbSIvuP4Bqh82DAaYyu0bW40IsU3GDWD91hVnsq7+Sm8EvYiF1
	tokwv19KGT17TQBGPZlu+WtSH565qOoAPA3g6J38gE+Llpcd0FPq8Px5AerVisczSgpvkhBeFTp
	pffm9Z0TyDGtqRv55aA==
X-Received: by 2002:a05:6402:3807:b0:6b5:4fa7:4f49 with SMTP id 4fb4d7f45d1cf-6b54fa75e10mr908370a12.6.1793742199038;
        Tue, 03 Nov 2026 13:43:19 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:18 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 06/14] alpha: dispatch system calls from C
Date: Tue,  3 Nov 2026 22:35:12 +0100
Message-ID: <20261103214120.1099893-7-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move syscall dispatch and result encoding into alpha_syscall(), keeping
the complete user switch_stack available throughout the C call. Use the
generic fork/clone handlers and remove the assembly dispatch and sigreturn
wrappers. Preserve Alpha's r0/a3 ABI, ptrace/seccomp overrides and restored
signal contexts.

The syscall table names also enable tracepoints for fork, vfork, clone,
clone3, sigreturn and rt_sigreturn.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/syscall.h       |  18 +----
 arch/alpha/include/asm/thread_info.h   |   1 +
 arch/alpha/kernel/Makefile             |   2 +-
 arch/alpha/kernel/asm-offsets.c        |   1 -
 arch/alpha/kernel/entry.S              | 132 +--------------------------------
 arch/alpha/kernel/proto.h              |  10 +--
 arch/alpha/kernel/signal.c             | 126 +++----------------------------
 arch/alpha/kernel/syscall.c            |  85 +++++++++++++++++++++
 arch/alpha/kernel/syscalls/syscall.tbl |  10 +--
 9 files changed, 113 insertions(+), 272 deletions(-)

diff --git a/arch/alpha/include/asm/syscall.h b/arch/alpha/include/asm/syscall.h
index 52fa96ea57caba5f04c2c0c3d9ea31b909eb9f60..740ac96cef55d28bcf45251fc722b35421a9f2d5 100644
--- a/arch/alpha/include/asm/syscall.h
+++ b/arch/alpha/include/asm/syscall.h
@@ -29,12 +29,8 @@ static inline long syscall_get_error(struct task_struct *task,
 
 
 /*
- * Alpha syscall ABI / kernel conventions:
- *  - PAL provides syscall number in r0 on entry.
- *  - The kernel tracks the active syscall number in regs->r1 (mutable) and
- *    preserves the original syscall number in regs->r2 for rollback/restart.
- *  - Return value is in regs->r0, with regs->r19 ("a3") as the error flag
- *    (0=success, 1=error; on error regs->r0 holds positive errno).
+ * The syscall number arrives in r0. Entry saves the original in thread_info
+ * for rollback and restart, while tracers can change the number in r1.
  */
 
 static inline long syscall_get_nr(struct task_struct *task,
@@ -80,14 +76,8 @@ static inline void syscall_set_arguments(struct task_struct *task,
 	regs->r21 = args[5];
 }
 /*
- * Set return value for a syscall.
- * Alpha uses r0 for return value and r19 ("a3") as the error indicator:
- *   a3 = 0 => success
- *   a3 = 1 => error, and userspace interprets r0 as errno (positive).
- *
- * The kernel reports errors to userspace by setting a3=1 and placing a
- * positive errno value in r0. Some syscall paths do this in entry.S,
- * while others (e.g. seccomp/ptrace helpers) use syscall_set_return_value().
+ * On error, r0 holds a positive errno and a3 is set.
+ * On success, r0 holds the result and a3 is clear.
  */
 
 static inline void syscall_set_return_value(struct task_struct *task,
diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index 78f9f60d4ad197c27cd05bfd6a5c20af22bee7a3..94bdf9016705cc6b0aea64c3f601de3ef555eb7b 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -57,6 +57,7 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
 
 #define ALPHA_SYSCALL_META_SKIP			0x2
 #define ALPHA_SYSCALL_META_FORCE_SUCCESS	0x4
+#define ALPHA_SYSCALL_META_RESTORED		0x8
 #define ALPHA_SYSCALL_META_ROLLBACK		0x10
 #define ALPHA_SYSCALL_META_RESULT			0x20
 
diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index 9d35715bd440518b327ad576b78ad35f61433bab..668556d8496c0c3ee03996cf5a4a0ee56b980891 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -8,7 +8,7 @@ asflags-y	:= $(KBUILD_CFLAGS)
 ccflags-y	:= -Wno-sign-compare
 
 obj-y    := head.o entry.o traps.o process.o osf_sys.o irq.o \
-	    irq_alpha.o signal.o setup.o ptrace.o time.o \
+	    irq_alpha.o signal.o syscall.o setup.o ptrace.o time.o \
 	    systbls.o err_common.o io.o bugs.o termios.o \
 	    stacktrace.o
 
diff --git a/arch/alpha/kernel/asm-offsets.c b/arch/alpha/kernel/asm-offsets.c
index 22ed3c975b1ceb014806fec5d2afc2140ac3e03a..b575dcf367bfde210fa19bd955f1163877b752d6 100644
--- a/arch/alpha/kernel/asm-offsets.c
+++ b/arch/alpha/kernel/asm-offsets.c
@@ -22,7 +22,6 @@ static void __used foo(void)
 
 	DEFINE(SP_OFF, offsetof(struct pt_regs, ps));
 	DEFINE(SIZEOF_PT_REGS, sizeof(struct pt_regs));
-	DEFINE(TI_SYSCALL_META, offsetof(struct thread_info, syscall_meta));
 	BLANK();
 
 	DEFINE(SWITCH_STACK_SIZE, sizeof(struct switch_stack));
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 790389a15c3ce15d5b8eeae5a67e88443e5430a0..d67ccfc8abac4b97ceb6fa8c7bad8024b9bf5660 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -8,9 +8,6 @@
 #include <asm/asm-offsets.h>
 #include <asm/thread_info.h>
 #include <asm/pal.h>
-#include <asm/errno.h>
-#include <asm/unistd.h>
-#include <linux/errno.h>
 
 	.text
 	.set noat
@@ -473,9 +470,6 @@ CFI_END_OSF_FRAME entDbg
 	.cfi_rel_offset	$gp, 16
 entSys:
 	SAVE_ALL
-	ldq	$1, 0($sp)	/* syscall nr from saved r0 */
-	stq	$1, 8($sp)	/* regs->r1 = shadow syscall nr */
-
 	lda	$8, 0x3fff
 	bic	$sp, $8, $8
 
@@ -483,47 +477,13 @@ entSys:
 	stq	$17, SP_OFF+32($sp)
 	stq	$18, SP_OFF+40($sp)
 
-	mov	$0, $1
 	lda	$16, 7
 	call_pal PAL_swpipl
-	mov	$1, $0
 	mov	$sp, $16
-	mov	$0, $17	 /* pv = selected syscall function */
-
-	DO_SWITCH_STACK
-	jsr	$26, alpha_syscall_enter_select
-	ldgp	$gp, 0($26)
-	UNDO_SWITCH_STACK
-
-	/*
-	 * C returned syscall function pointer in $0.
-	 * It also stored SKIP in TI_SYSCALL_META if dispatch is skipped.
-	 */
-	lda	$8, 0x3fff
-	bic	$sp, $8, $8
-	ldq	$3, TI_SYSCALL_META($8)
-	lda	$6, ALPHA_SYSCALL_META_SKIP
-	and	$3, $6, $6
-	bne	$6, skip_dispatch
-
-
-	mov	$0, $27
-	ldq	$16, SP_OFF+24($sp)
-	ldq	$17, SP_OFF+32($sp)
-	ldq	$18, SP_OFF+40($sp)
-	ldq	$19, 72($sp)
-	ldq	$20, 80($sp)
-	ldq	$21, 88($sp)
-
-	jsr	$26, ($27), sys_ni_syscall
-	ldgp	$gp, 0($26)
-
-skip_dispatch:
-	mov	$0, $17		/* raw ret; ignored if SKIP is set */
-	mov	$sp, $16	/* regs */
 
+	/* Keep the complete user context above all C call frames. */
 	DO_SWITCH_STACK
-	jsr	$26, alpha_finish_syscall_to_user_mode
+	jsr	$26, alpha_syscall
 	ldgp	$gp, 0($26)
 	UNDO_SWITCH_STACK
 
@@ -538,25 +498,6 @@ restore_other:
 	RESTORE_ALL
 	call_pal PAL_rti
 
-ret_to_user_from_syscall:
-	lda	$8, 0x3fff
-	bic	$sp, $8, $8
-
-	mov	$sp, $16
-	DO_SWITCH_STACK
-	jsr	$26, alpha_syscall_exit_to_user_mode
-	ldgp	$gp, 0($26)
-	UNDO_SWITCH_STACK
-	br	restore_all
-
-	.align	4
-	.globl	ret_from_sys_call
-ret_from_sys_call:
-	ldq	$0, SP_OFF($sp)
-	and	$0, 8, $0
-	beq	$0, ret_to_kernel
-	br	ret_to_user_from_syscall
-
 ret_from_exception:
 	ldq	$0, SP_OFF($sp)
 	and	$0, 8, $0
@@ -720,72 +661,3 @@ ret_from_kernel_thread:
 	jsr	$26, ($9)
 	br	$31, ret_to_user_from_exception
 .end ret_from_kernel_thread
-
-
-/*
- * Special system calls.  Most of these are special in that they either
- * have to play switch_stack games.
- */
-
-.macro	fork_like name
-	.align	4
-	.globl	alpha_\name
-	.ent	alpha_\name
-alpha_\name:
-	.prologue 0
-	bsr	$1, do_switch_stack
-	// NB: if anyone adds preemption, this block will need to be protected
-	ldl	$1, TI_STATUS($8)
-	and	$1, TS_SAVED_FP, $3
-	or	$1, TS_SAVED_FP, $2
-	bne	$3, 1f
-	stl	$2, TI_STATUS($8)
-	bsr	$26, __save_fpu
-1:
-	jsr	$26, sys_\name
-	ldq	$26, 56($sp)
-	lda	$sp, SWITCH_STACK_SIZE($sp)
-	ret
-.end	alpha_\name
-.endm
-
-fork_like fork
-fork_like vfork
-fork_like clone
-fork_like clone3
-
-.macro	sigreturn_like name
-	.align	4
-	.globl	sys_\name
-	.ent	sys_\name
-sys_\name:
-	.prologue 0
-	mov	$sp, $10
-	lda	$sp, -SWITCH_STACK_SIZE($sp)
-	jsr	$26, do_\name
-1:	br	$1, undo_switch_stack
-	br	ret_from_sys_call
-.end sys_\name
-.endm
-
-sigreturn_like sigreturn
-sigreturn_like rt_sigreturn
-
-	.align	4
-	.globl	alpha_syscall_zero
-	.ent	alpha_syscall_zero
-alpha_syscall_zero:
-	.prologue 0
-	/* Special because it needs to do something opposite to
-	   force_successful_syscall_return().  We use the saved
-	   syscall number for that, zero meaning "not an error".
-	   That works nicely, but for real syscall 0 we need to
-	   make sure that this logics doesn't get confused.
-	   Store a non-zero there - -ENOSYS we need in register
-	   for our return value will do just fine.
-	  */
-	lda	$0, -ENOSYS
-	unop
-	stq	$0, 0($sp)
-	ret
-.end alpha_syscall_zero
diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index 7ece3b635e27ca04fb8fa93d9118e8be9a225b66..90af335cd6798ad4039ecc2a3c67505eadbd32a2 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -169,16 +169,12 @@ extern int ptrace_set_bpt (struct task_struct *child);
 extern int ptrace_cancel_bpt (struct task_struct *child);
 
 /* signal.c */
-struct sigcontext;
-extern void do_sigreturn(struct sigcontext __user *);
-struct rt_sigframe;
-extern void do_rt_sigreturn(struct rt_sigframe __user *);
 extern void alpha_schedule_user_work(void);
 extern void do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19);
-extern void alpha_syscall_exit_to_user_mode(struct pt_regs *regs);
 extern void alpha_exit_to_user_mode(struct pt_regs *regs);
-extern void alpha_finish_syscall_to_user_mode(struct pt_regs *regs, long ret);
-extern unsigned long alpha_syscall_enter_select(struct pt_regs *regs, long syscall);
+
+/* syscall.c */
+extern void alpha_syscall(struct pt_regs *regs);
 
 /* traps.c */
 extern void dik_show_regs(struct pt_regs *regs, unsigned long *r9_15);
diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index f972f690eb678b9201e340624a60fe26ad7f23c8..c6dd0f2864ade320d59cf1531764640bc6713aa6 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -34,8 +34,6 @@
 
 #define _BLOCKABLE (~(sigmask(SIGKILL) | sigmask(SIGSTOP)))
 
-asmlinkage void ret_from_sys_call(void);
-
 /*
  * The OSF/1 sigprocmask calling sequence is different from the
  * C sigprocmask() sequence..
@@ -157,8 +155,6 @@ restore_sigcontext(struct sigcontext __user *sc, struct pt_regs *regs)
 	current_thread_info()->syscall_saved_nr = 0;
 	current_thread_info()->status |= TS_SAVED_FP | TS_RESTORE_FP;
 
-	sw->r26 = (unsigned long) ret_from_sys_call;
-
 	scoped_user_read_access(sc, Efault) {
 		unsafe_get_user(regs->pc, &sc->sc_pc, Efault);
 		unsafe_get_user(regs->r0, sc->sc_regs+0, Efault);
@@ -207,12 +203,14 @@ Efault:
    a given sigcontext.  This because it's impossible to set *all*
    registers and transfer control from userland.  */
 
-asmlinkage void
-do_sigreturn(struct sigcontext __user *sc)
+SYSCALL_DEFINE1(sigreturn, struct sigcontext __user *, sc)
 {
 	struct pt_regs *regs = current_pt_regs();
 	sigset_t set;
 
+	/* The restored r0/r19 are user state, not a syscall result. */
+	current_thread_info()->syscall_meta |= ALPHA_SYSCALL_META_RESTORED;
+
 	scoped_user_read_access(sc, give_sigsegv)
 		unsafe_get_user(set.sig[0], &sc->sc_mask, give_sigsegv);
 
@@ -226,18 +224,21 @@ do_sigreturn(struct sigcontext __user *sc)
 		send_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *) regs->pc,
 			       current);
 	}
-	return;
+	return 0;
 
 give_sigsegv:
 	force_sig(SIGSEGV);
+	return 0;
 }
 
-asmlinkage void
-do_rt_sigreturn(struct rt_sigframe __user *frame)
+SYSCALL_DEFINE1(rt_sigreturn, struct rt_sigframe __user *, frame)
 {
 	struct pt_regs *regs = current_pt_regs();
 	sigset_t set;
 
+	/* The restored r0/r19 are user state, not a syscall result. */
+	current_thread_info()->syscall_meta |= ALPHA_SYSCALL_META_RESTORED;
+
 	/* Verify that it's a good ucontext_t before using it */
 	if (!access_ok(&frame->uc, sizeof(frame->uc)))
 		goto give_sigsegv;
@@ -254,10 +255,11 @@ do_rt_sigreturn(struct rt_sigframe __user *frame)
 		send_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *) regs->pc,
 			       current);
 	}
-	return;
+	return 0;
 
 give_sigsegv:
 	force_sig(SIGSEGV);
+	return 0;
 }
 
 
@@ -543,16 +545,6 @@ asmlinkage void alpha_exit_to_user_mode(struct pt_regs *regs)
 	exit_to_user_mode();
 }
 
-/*
- * Syscall return reaches here after Alpha-specific r0/a3 result encoding.
- * Delegate syscall-exit work and final exit-to-user handling to generic
- * entry code; low-level PAL restore remains in assembly.
- */
-asmlinkage void alpha_syscall_exit_to_user_mode(struct pt_regs *regs)
-{
-	syscall_exit_to_user_mode(regs);
-}
-
 void arch_do_signal_or_restart(struct pt_regs *regs)
 {
 	struct thread_info *ti = current_thread_info();
@@ -562,97 +554,3 @@ void arch_do_signal_or_restart(struct pt_regs *regs)
 	preempt_enable();
 	do_signal(regs, ti->syscall_saved_nr, ti->syscall_saved_r19);
 }
-
-asmlinkage unsigned long
-alpha_syscall_enter_select(struct pt_regs *regs, long syscall)
-{
-	struct thread_info *ti = current_thread_info();
-	unsigned long saved_r19 = regs->r19;
-	unsigned long fn = (unsigned long)sys_ni_syscall;
-	long nr = syscall;
-	bool permit;
-
-	ti->syscall_meta = 0;
-	ti->syscall_saved_nr = syscall;
-	ti->syscall_saved_r19 = saved_r19;
-
-	if (!(ti->status & TS_SAVED_FP)) {
-		ti->status |= TS_SAVED_FP;
-		__save_fpu();
-	}
-
-	permit = syscall_enter_from_user_mode_randomize_stack(regs, &nr);
-
-	if (unlikely(!permit || nr == -1)) {
-		/* r19 is still argument 4 unless a hook supplied a result. */
-		if (!(ti->syscall_meta & (ALPHA_SYSCALL_META_RESULT |
-					 ALPHA_SYSCALL_META_ROLLBACK)))
-			syscall_set_return_value(current, regs, -ENOSYS, 0);
-
-		ti->syscall_meta |= ALPHA_SYSCALL_META_SKIP;
-		return fn;	/* ignored by asm when SKIP is set */
-	}
-
-	/* Invalid numbers other than -1 must invoke sys_ni_syscall(). */
-	if (unlikely((unsigned long)nr >= NR_syscalls))
-		return fn;
-
-	instrumentation_begin();
-	{
-		unsigned long index;
-
-		index = array_index_nospec((unsigned long)nr, NR_syscalls);
-		fn = (unsigned long)sys_call_table[index];
-	}
-	instrumentation_end();
-
-	return fn;
-}
-
-asmlinkage noinstr void
-alpha_finish_syscall_to_user_mode(struct pt_regs *regs, long ret)
-{
-	struct thread_info *ti = current_thread_info();
-	unsigned long meta = ti->syscall_meta;
-
-	ti->syscall_meta = 0;
-	/* Entry work may have replaced argument 4 with the a3 error flag. */
-	if (!(meta & ALPHA_SYSCALL_META_SKIP))
-		ti->syscall_saved_r19 = regs->r19;
-
-	instrumentation_begin();
-
-	if (meta & ALPHA_SYSCALL_META_ROLLBACK) {
-		ti->syscall_saved_nr = 0;
-		instrumentation_end();
-		syscall_exit_to_user_mode(regs);
-		return;
-	}
-
-	if (meta & ALPHA_SYSCALL_META_SKIP) {
-		instrumentation_end();
-
-		syscall_exit_to_user_mode(regs);
-		return;
-	}
-
-	/*
-	 * Some successful syscalls, notably legacy ptrace PEEK requests,
-	 * return arbitrary data in r0.  That data may have the bit pattern
-	 * of a negative errno, so do not infer failure from ret < 0 when
-	 * arch code explicitly requested a successful Alpha return.
-	 */
-	if (meta & ALPHA_SYSCALL_META_FORCE_SUCCESS) {
-		regs->r0 = ret;
-		regs->r19 = 0;
-	} else if (ret < 0) {
-		regs->r0 = -ret;
-		regs->r19 = 1;
-	} else {
-		regs->r0 = ret;
-		regs->r19 = 0;
-	}
-
-	instrumentation_end();
-	syscall_exit_to_user_mode(regs);
-}
diff --git a/arch/alpha/kernel/syscall.c b/arch/alpha/kernel/syscall.c
new file mode 100644
index 0000000000000000000000000000000000000000..652406905a249af743109e369cace97d39f676c9
--- /dev/null
+++ b/arch/alpha/kernel/syscall.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Alpha syscall entry and result encoding. */
+#include <linux/entry-common.h>
+#include <linux/nospec.h>
+#include <linux/syscalls.h>
+
+#include <asm/syscall.h>
+
+#include "proto.h"
+
+typedef long (*syscall_fn_t)(unsigned long, unsigned long, unsigned long,
+			   unsigned long, unsigned long, unsigned long);
+
+static void alpha_set_syscall_result(struct pt_regs *regs, long ret)
+{
+	struct thread_info *ti = current_thread_info();
+	unsigned long meta = ti->syscall_meta;
+
+	ti->syscall_meta = 0;
+	if (meta & (ALPHA_SYSCALL_META_RESTORED | ALPHA_SYSCALL_META_ROLLBACK)) {
+		ti->syscall_saved_nr = 0;
+		ti->syscall_saved_r19 = 0;
+		return;
+	}
+
+	/* Entry work may have replaced argument 4 with the a3 error flag. */
+	if (!(meta & ALPHA_SYSCALL_META_SKIP))
+		ti->syscall_saved_r19 = regs->r19;
+
+	if (meta & ALPHA_SYSCALL_META_SKIP)
+		return;
+
+	/* A successful ptrace PEEK can return data that looks like an errno. */
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
+}
+
+/* Called with interrupts disabled and a complete user switch_stack. */
+asmlinkage noinstr void alpha_syscall(struct pt_regs *regs)
+{
+	struct thread_info *ti = current_thread_info();
+	unsigned long saved_r19 = regs->r19;
+	long nr = regs->r0;
+	long ret = -ENOSYS;
+	bool permit;
+
+	regs->r1 = nr;
+	ti->syscall_meta = 0;
+	ti->syscall_saved_nr = nr;
+	ti->syscall_saved_r19 = saved_r19;
+
+	if (!(ti->status & TS_SAVED_FP)) {
+		ti->status |= TS_SAVED_FP;
+		__save_fpu();
+	}
+
+	permit = syscall_enter_from_user_mode_randomize_stack(regs, &nr);
+
+	instrumentation_begin();
+	if (unlikely(!permit || nr == -1)) {
+		/* r19 is still argument 4 unless a hook supplied a result. */
+		if (!(ti->syscall_meta & (ALPHA_SYSCALL_META_RESULT |
+					 ALPHA_SYSCALL_META_ROLLBACK)))
+			syscall_set_return_value(current, regs, -ENOSYS, 0);
+		ti->syscall_meta |= ALPHA_SYSCALL_META_SKIP;
+	} else if (likely((unsigned long)nr < NR_syscalls)) {
+		syscall_fn_t syscall_fn;
+
+		syscall_fn = sys_call_table[array_index_nospec(nr, NR_syscalls)];
+		ret = syscall_fn(regs->r16, regs->r17, regs->r18,
+				 regs->r19, regs->r20, regs->r21);
+	}
+	alpha_set_syscall_result(regs, ret);
+	instrumentation_end();
+
+	syscall_exit_to_user_mode(regs);
+}
diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index 52e3538cc7df415f0b1613eb3db7de56d5bf20a2..f804988f90d6672e3bf409258a0fccc4ba214927 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -7,9 +7,9 @@
 #
 # The <abi> is always "common" for this file
 #
-0	common	osf_syscall			alpha_syscall_zero
+0	common	osf_syscall			sys_ni_syscall
 1	common	exit				sys_exit
-2	common	fork				alpha_fork
+2	common	fork				sys_fork
 3	common	read				sys_read
 4	common	write				sys_write
 5	common	osf_old_open			sys_ni_syscall
@@ -72,7 +72,7 @@
 63	common	getpgrp				sys_getpgrp
 64	common	getpagesize			sys_getpagesize
 65	common	osf_mremap			sys_ni_syscall
-66	common	vfork				alpha_vfork
+66	common	vfork				sys_vfork
 67	common	stat				sys_newstat
 68	common	lstat				sys_newlstat
 69	common	osf_sbrk			sys_ni_syscall
@@ -242,7 +242,7 @@
 309	common	get_kernel_syms			sys_ni_syscall
 310	common	syslog				sys_syslog
 311	common	reboot				sys_reboot
-312	common	clone				alpha_clone
+312	common	clone				sys_clone
 313	common	uselib				sys_uselib
 314	common	mlock				sys_mlock
 315	common	munlock				sys_munlock
@@ -474,7 +474,7 @@
 542	common	fsmount				sys_fsmount
 543	common	fspick				sys_fspick
 544	common	pidfd_open			sys_pidfd_open
-545	common	clone3				alpha_clone3
+545	common	clone3				sys_clone3
 546	common	close_range			sys_close_range
 547	common	openat2				sys_openat2
 548	common	pidfd_getfd			sys_pidfd_getfd
-- 
2.43.0

