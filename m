Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742203;
	b=RSpl+m6xxD3qY7XOvDI0SQzJT90CgkWxNjKV4d4HyIGPVLmvoxeLrBbZ3yippcfh/J2U
	 rLRJjrgOLezOIrFqL3x0IBLrdF4uM4cPZJNUlGthZoCkZUsvjur6eAerR4OOMZKlnbS5Y
	 CzZkXP6WvmUNLdhsM05ItZq1++PkwGjvzdvswnSZYp6jW/QBtP/5UUCawNEQ05iwl/96r
	 OEsWShray+40er+B71savJPDtQtK8k+NJH0isB6KR7r4SaK80EwQJudStyTMLsDVDtCIA
	 1BR6ggmKEu27y3//wLvuTpI79Cbb0T+LoYbHZu2HshSoJXqRk436CTASCTu+TkbR8HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=81mqqgopMMqaUyS97akIwgKPW+Eqt+aTu6eaajJHQ9M=;
	b=hlgAhAO6PHkS4wZXO5vltofXHI79+4JXbu0bqUDD/A9JoczLP5IyNPypm/z49K5pc0hQ
	 iVI5+WR98lJhmzloX+jGSY2crKHNqTNi5ORXCgg6DUQH2p3KD9iGruc/RB8b53nfHdaFy
	 DfPHtt9eD3Kugp9rQlWZkIEcvqek96HyW7PxRayE+JP7cRUNk0C+cFiM2kefO4YDexnXP
	 O/fwlvuOxpltgXcGlSvTO55ZuTWNLXhzJZepjtPotrePn81WOkUrcFGjwNAULKyE+ewE9
	 Mtlz3H1MwrDJyDopAd4ujiCNDSNRUcZXRKpGMXlBdrrFv/d+h1bgdnQ9FmT/GrFd7YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LfTmx+ef;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB82606EE8D
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 21:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB82606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LfTmx+ef
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so8187647a12.1
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 13:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742201; x=1794347001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81mqqgopMMqaUyS97akIwgKPW+Eqt+aTu6eaajJHQ9M=;
        b=LfTmx+efFswCAby3m3Vw92kBaSJTODARnqfktZh/gGGW2SiJQJZTtGQw/PO+c7/fT9
         sGLIU9BjLOm9/GVP4sh+ZsZgKyThKaBrO85qGdntNz133zN9j+IepFHI7D6EEclEopVz
         j2EPu+Hddmd14B8SmmqtQuVZAK7ZDdtyVTognBmRJw6QKWsTqHi1QxSNWxCPg8M3VgGG
         uEG0jcQOHKJ4ihZBwaqUheCWsEMbaAjNvUDwtZ8QS1b7XN+SWdzCZK6mAka0p3F2hFD3
         830KpGHnxhGgLE0Zu6ck/K0+HREqz0AjnPru3rAbpYNP3MRbvf6zpEFr7FfNhwXfn0Dt
         Q7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742201; x=1794347001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=81mqqgopMMqaUyS97akIwgKPW+Eqt+aTu6eaajJHQ9M=;
        b=y6LLWCuMe+b9libgX7zDVYUOPm4n883xvhJJA4LsmxkXnkCRfh6HOiE2awkfQewZR2
         nJv1jrsmQikLGocb3Ne0dCkLQaKF5dSB3/W9nl/NfxL9Pe3ngTxSHeX/b8wo7ZtqIClb
         KgYTk4i8CVekyK4TE65Wgi9qvUYI47j29pPM4r59/Jj1DhSYb/RRmURmEovhJlpH23Wj
         1G3PB3EwaQeWEi+yCei9ESNydyA39i4gznjyVb7cludPoHgRwJwDNLZRhcECqEAbieBA
         L4JruX/tIt8gvbkhP3YtJArNYSZ5FDcIolNjHWa0x/mUAuunAucC9TL7f7j7/6p2R0Mg
         Tr0w==
X-Forwarded-Encrypted: i=1; AKwUvBweWKxobuHHXPSn0nttYXVNPPpfpL9T54KdOg1QyOUnN4VBqo+vzlFX2SibwMwFCUqC3ar+xH0CHYjing==@vger.kernel.org
X-Gm-Message-State: APuU4Z/oBU75GeMbGTrNHumD7Iqeb2gEUhD+GVobA1JPgRmRXWk9JrH6
	AGlfAuZ7dH2fOQP9u0hSqSe387pdpROyC9yyE/9K7laI6Q0HRwV7gyVMAvm6NrfmS1U=
X-Gm-Gg: AYBFou3ERG7JWFODYzJF7zgWFs2k3nLmwKgq650PHLb/KWTP6H7MT98AqkGERVHHAke
	zmPgzcBmrA3jFFWqIEBDUZ2NWww1eNX4cArI+lscXAqrvIhJboAfEjWZWSq07wLYWzMdtBxJiud
	KIVuW2xrY6WymQjNstr7TmVC0YqQ19iUEhirdSYVV85YxMq4gdj/zFHHzknRJjmozmqiudd8VDg
	Gu/L4t7AFVqlIOejfokz9Uf29USog9smfRQ0xzoY1QrLQhY9eh92cM92/Fq62p436mFZp0q834p
	R6CBR5w4J4CphBns1sGQJOMPZcb7+3m9v7AFXH/X7CW+Izzd5kmdU8/O7VUoI6lrqIBTTwuPiT2
	4MLV5y2JJAF3CX2SKCcX+ovB9oXJUBOlSkiMTFfTSOLp3pcreJJ1aSUJtccwZtTklN1ciJNPrwP
	3JpmGuHnPuP5ieY748XM/TsbX9KDPCC1yL6w7PQtrN9XnE6SoaBRaav1Hs+FdM9MxEFDa48zfkb
	qkWBXBDgsjXiebd3DgWk4ukRKiZF1wt//P15BlzD6LrWqGysYFsJeGcnSxEnT9e1TVeccd3TuPl
	7XXSVAwvnLP/RBpd7EB+qP4Zmh9qIwUhwM2q3El9xZzA3Ydilpg1Ii0GEBEVn0Fujta4mXo=
X-Received: by 2002:a05:6402:7ca:b0:6b4:35af:327f with SMTP id 4fb4d7f45d1cf-6b4d515d7efmr8563685a12.43.1793742201019;
        Tue, 03 Nov 2026 13:43:21 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:20 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 08/14] alpha: use generic syscall exit for new tasks
Date: Tue,  3 Nov 2026 22:35:14 +0100
Message-ID: <20261103214120.1099893-9-linmag7@gmail.com>
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

Move fork and kernel-thread startup into C and use
syscall_exit_to_user_mode() for the return to userspace, retaining the
saved user context for exit work.

This also supplies the child syscall-exit tracepoint for fork, vfork,
clone and clone3.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/entry.S   | 23 ++++++++++-------------
 arch/alpha/kernel/process.c | 16 ++++++++++++++++
 arch/alpha/kernel/proto.h   |  6 ++++--
 arch/alpha/kernel/signal.c  |  8 --------
 4 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 2233eb6da7065e7d85cbc668a09e565bcfd75a52..5da8c0d17a1d893f59bee1a12f5782276432674d 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -417,11 +417,11 @@ ret_from_exception:
 	beq	$0, restore_other
 	br	restore_all
 
-ret_to_user_from_exception:
-
-	mov	$sp, $16
+ret_from_fork_common:
+	mov	$17, $16
+	mov	$sp, $17
 	DO_SWITCH_STACK
-	jsr	$26, alpha_exit_to_user_mode
+	jsr	$26, alpha_ret_from_fork
 	ldgp	$gp, 0($26)
 	UNDO_SWITCH_STACK
 	br	restore_all
@@ -548,9 +548,9 @@ alpha_switch_to:
 	.align	4
 	.ent	ret_from_fork
 ret_from_fork:
-	lda	$26, ret_to_user_from_exception
-	mov	$17, $16
-	jmp	$31, schedule_tail
+	mov	$31, $18
+	mov	$31, $19
+	br	$31, ret_from_fork_common
 .end ret_from_fork
 
 /*
@@ -560,10 +560,7 @@ ret_from_fork:
 	.globl	ret_from_kernel_thread
 	.ent	ret_from_kernel_thread
 ret_from_kernel_thread:
-	mov	$17, $16
-	jsr	$26, schedule_tail
-	mov	$9, $27
-	mov	$10, $16
-	jsr	$26, ($9)
-	br	$31, ret_to_user_from_exception
+	mov	$9, $18
+	mov	$10, $19
+	br	$31, ret_from_fork_common
 .end ret_from_kernel_thread
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 2182496c535661f399a73400e308c0a7fc6d76f1..c7e6e7b593af10305414ea30f5b944b9d21dd2e2 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/cpu.h>
+#include <linux/entry-common.h>
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/sched.h>
@@ -226,6 +227,21 @@ flush_thread(void)
 	current_thread_info()->pcb.unique = 0;
 }
 
+/* The assembly stub keeps the complete user switch_stack below regs. */
+asmlinkage noinstr void alpha_ret_from_fork(struct task_struct *prev,
+					 struct pt_regs *regs,
+					 int (*fn)(void *), void *fn_arg)
+{
+	instrumentation_begin();
+	schedule_tail(prev);
+	if (fn)
+		fn(fn_arg);
+	instrumentation_end();
+
+	/* A kernel thread may return after a successful kernel_execve(). */
+	syscall_exit_to_user_mode(regs);
+}
+
 /*
  * Copy architecture-specific thread state
  */
diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index 90af335cd6798ad4039ecc2a3c67505eadbd32a2..c418333d0b89d910ec59d1d57d6bcc0550efc4aa 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -164,14 +164,16 @@ extern void entDbg(void);
 /* pci.c */
 extern void pcibios_claim_one_bus(struct pci_bus *);
 
+/* process.c */
+extern void alpha_ret_from_fork(struct task_struct *prev, struct pt_regs *regs,
+				int (*fn)(void *), void *fn_arg);
+
 /* ptrace.c */
 extern int ptrace_set_bpt (struct task_struct *child);
 extern int ptrace_cancel_bpt (struct task_struct *child);
 
 /* signal.c */
-extern void alpha_schedule_user_work(void);
 extern void do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19);
-extern void alpha_exit_to_user_mode(struct pt_regs *regs);
 
 /* syscall.c */
 extern void alpha_syscall(struct pt_regs *regs);
diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index 244fec20294b81e0c749a07321f917befb62b1a7..e3cb1b50c83d9680032731799b644118b46803bc 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -538,14 +538,6 @@ do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19)
 		ptrace_set_bpt(current);	/* re-set breakpoint */
 }
 
-asmlinkage noinstr void alpha_exit_to_user_mode(struct pt_regs *regs)
-{
-	instrumentation_begin();
-	local_irq_disable();
-	instrumentation_end();
-	irqentry_exit_to_user_mode(regs);
-}
-
 void arch_do_signal_or_restart(struct pt_regs *regs)
 {
 	struct thread_info *ti = current_thread_info();
-- 
2.43.0

