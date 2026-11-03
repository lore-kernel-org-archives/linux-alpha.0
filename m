Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742198;
	b=P284ljA0gxKX7ITdBYoU/TcJDo+WPynt+4pD1m4khcyEXR25QSYiLX9/vA/yKBZZR5Wa
	 26h5KvO2lbNoTmlG9ejzUY8c6+HbCs4f0TeFauPmhOT59ezFGarjbGrCqg/eVGFZRnRwU
	 gQvgf0VYHTvdmF4SNOLkEt+/AWJzao86lMmdM1Mfsuuj02WvZhILun7UTFmiw8BBXLkFz
	 so7XEHJVGIhcCvwmVyu70sFF/+OnUeEjrXhSTsCK4MfhypFi5pLFUR1POuvwGI1E17ey9
	 ZEKySt0w1/T0EmCiD2VPvLifZ/Q6ICneCsJgDzdn2QrHUdq4hPl2GKaoNohfF7zml7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4P8XRThq1Wu1TjVMMjPvOh5ua3op9yoqp6jtpZeTP9I=;
	b=EGspvNy/PCxPcmw7f30YBxQ50AT86x4jreWAfgUAE6U9DhgMbhkqFUgzLGXqw6zvsCGK
	 QjZbvwwimVdZNEU3XBDDSP2L27YT23JXNXMno0QtWqaeeOEdWm/02Nb1m8O/uS5YGvn4Y
	 Xs9vpT8FgAOIjY2ZIE6/31evYprPZO4vsS7h3hc1lZjSZ1Stv8rks4WLI1b9b1hg7M8mf
	 TPMOS3W7VopD1xWx301A75kvA6a9OPsWbl8oolyL5DYmNdarGpnCa7zy49e+cCUssZNsz
	 NOpgJgFlSEX20yqYa8oeF3DCqU70qTfZKHo9p3j1INudTYEdJj4H8dqcWoLunXVjm9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=exJQJ5SR;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D919606D819
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 21:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D919606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=exJQJ5SR
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c45551fa84eso9693266b.3
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 13:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742197; x=1794346997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4P8XRThq1Wu1TjVMMjPvOh5ua3op9yoqp6jtpZeTP9I=;
        b=exJQJ5SRRmD3cZY1VidWiAtntqIsF9RrZcZrpFw/ca2dJvD9uO3LbdtO8jK5p+CZvN
         19HEmVOV9kjAPVazHdDDRAK7wO1KS+XGE+aBOnMWnxiOWjj80wFfh5tC1iY02yBlBwer
         cPw5eH3DRc+3z10qjXQuD6XiRmiweTCxihtSAzB2jvKIONfezkmWWAXPJPHtTaEUNlyf
         PFPrUgrjn34WGKrxXcI3MO3bWT53GBwJfu5ZEeWH9ZerOb30omngiVakFG0CWo6P2mpU
         c+jzBVrM1nJUhDx29utoPCEx5lBRpU2cKOg5uzEiqphmSPuYCK6hGZLTm5JBG6nuFItH
         RC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742197; x=1794346997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4P8XRThq1Wu1TjVMMjPvOh5ua3op9yoqp6jtpZeTP9I=;
        b=MOAgBGXNfNdfS2QW9N7TEG/bT7y5DJS+MG5mjqOs618peuNMWizXIfrrnkbE+FPqdC
         Hqqh13AHBZ5nsjQhvMaWx9ZzAq9Lf0u3fVun2S6fAL2YwCt55cMaCGY+xqaXAMO5IqK0
         OOi8T/CxvmP8ieKOVpyjR2kzXOj8fO8V0BnO6dHmzvZAXwmsw8eKLNF7rqoEa560Br59
         c7T6PvmBmqbxoUfgwmRnvaIUfoe3n41LHuZmGupiKgfO0oc0+hBo1FRpIWe64Sp6ad9K
         0XbIMlq2t4rAgWE4GdUpgIhvwz/YXM2pCQxJKNB4D67DK4j4teMjZM2cPIU9Knh9ZC3a
         AlAw==
X-Forwarded-Encrypted: i=1; AKwUvBxVZtaGiPgo7JeyGFVmws43ZNh6P+qT2GXGecWlcAsNexjKiWMD2XklqBIEflfHvkku9KAzy7btsrZiRA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8fOSz/o5SkA5uZBW1phRlUs4AulHwzrpdUANFaeP/Y4oZYvEAY
	EvTpXnS89hP+zpFqk9QgpxNapIbFlEo6B7gcrTGmfmbq6oJFdAiG16YG
X-Gm-Gg: AYBFou3f1H1ekzJTJtbs4MtbHMOJtt7oXt23wd5L2jjZ1pKLrqBwO2IykB72A61OMXN
	fSqGqSq3cGyWfNeZyGdAmQxVCTCT6PCLLkQ+1jF4hi/TV+BsMiC29eNxWrhZsj55NwF9Z9xszEF
	ayL2RKCc2d+boiiKxku5rJ8tg6jywFzbgsUCAVpSENWWTzRqBxaelhZNtcgpXaytjiUmcMpbYOP
	exqzN80m9hj348+9CyQwhKfTK7cMXaQPsY7tc/xO8AaTyi2KLO9Ip6UNPU4e3bw3lnsL4OyL7FB
	/BObzXV/XkVlHwaXLJx41MtFqxNb+AKieHOvDk5PkDDk2AvEE8OrfTpk5c2W/J+G8m1sJ70fsY4
	zjy9VEgLLv8UEduWLskH0hI5UUZVvRlLd+2uBxCqeesN3v/zxuGjm5t9X1zeFoTjCM7xYBW3a/W
	dAjEdmcBd7TDIopJUK3jVoiO/5/f583pIyRPs+sTtUlWe6EygjXfP5lczkmwNDh83Ei5NpYhIy5
	6gFm4rk86owBMD3WmmKlqAeGewDcf1Iwz/XK4xvHMX+ABzP/l/UPwjFo20EAwAMX7T2woSXWo4h
	5DJ+EdlqaS8UuDbJTUox38H43ne2bgna7JgG+ZlzhB60kEd+0RDoI1WSWxiNvCBH/GUvSZ8=
X-Received: by 2002:a17:907:3d89:b0:c46:645f:cedf with SMTP id a640c23a62f3a-c4ca7a0708amr1244476366b.15.1793742196882;
        Tue, 03 Nov 2026 13:43:16 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:16 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 04/14] alpha: fix syscall restart eligibility
Date: Tue,  3 Nov 2026 22:35:10 +0100
Message-ID: <20261103214120.1099893-5-linmag7@gmail.com>
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

After GENERIC_ENTRY, stale restart state or a successful syscall result
such as 512 can be mistaken for a restart code, corrupting r0 or the PC.

Clear restart eligibility after use and before returning to userspace,
including signal-context restore. Require a3 to indicate an error before
handling restart codes, preserving the saved arguments for replay.

Save the fourth argument before entry work can replace r19 with the
a3 error flag. Preserve that saved value when seccomp or ptrace skips
dispatch and supplies a restart error; dispatched syscalls still save
the argument after any ptrace changes.

Fixes: 83bd31c2840b ("alpha: enable GENERIC_ENTRY")
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/entry-common.h | 10 ++++++++++
 arch/alpha/kernel/signal.c            | 13 ++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/entry-common.h b/arch/alpha/include/asm/entry-common.h
index a811c73454d28dbc166b83b6f5cd550da339b5fb..85dabd1021da012269eb28acb3ce2da21e0ad706 100644
--- a/arch/alpha/include/asm/entry-common.h
+++ b/arch/alpha/include/asm/entry-common.h
@@ -4,6 +4,7 @@
 
 #include <asm/stacktrace.h> /* For on_thread_stack() */
 #include <asm/syscall.h>
+#include <asm/thread_info.h>
 
 #define arch_exit_to_user_mode_work arch_exit_to_user_mode_work
 
@@ -11,4 +12,13 @@ static __always_inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
 				unsigned long ti_work)
 {
 }
+
+#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
+static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
+						 unsigned long ti_work)
+{
+	/* An interrupt after returning to user mode must not restart a syscall. */
+	current_thread_info()->syscall_saved_nr = 0;
+}
+
 #endif
diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index 3fae37b4593f22f07a375ab7bc0b0712d0130a07..ab32affa09c41152eabd1f3be92a126a85fb7a2d 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -154,6 +154,7 @@ restore_sigcontext(struct sigcontext __user *sc, struct pt_regs *regs)
 	struct switch_stack *sw = (struct switch_stack *)regs - 1;
 
 	current->restart_block.fn = do_no_restart_syscall;
+	current_thread_info()->syscall_saved_nr = 0;
 	current_thread_info()->status |= TS_SAVED_FP | TS_RESTORE_FP;
 
 	sw->r26 = (unsigned long) ret_from_sys_call;
@@ -497,17 +498,20 @@ do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19)
 	unsigned long single_stepping = ptrace_cancel_bpt(current);
 	struct ksignal ksig;
 
+	/* Consume restart state once, even if the exit loop repeats. */
+	current_thread_info()->syscall_saved_nr = 0;
+
 	/* This lets the debugger run, ... */
 	if (get_signal(&ksig)) {
 		/* ... so re-check the single stepping. */
 		single_stepping |= ptrace_cancel_bpt(current);
 		/* Whee!  Actually deliver the signal.  */
-		if (r0)
+		if (r0 && regs->r19)
 			syscall_restart(r0, r19, regs, &ksig.ka);
 		handle_signal(&ksig, regs);
 	} else {
 		single_stepping |= ptrace_cancel_bpt(current);
-		if (r0) {
+		if (r0 && regs->r19) {
 			switch (regs->r0) {
 			case ERESTARTNOHAND:
 			case ERESTARTSYS:
@@ -571,6 +575,7 @@ alpha_syscall_enter_select(struct pt_regs *regs, long syscall)
 
 	ti->syscall_meta = 0;
 	ti->syscall_saved_nr = syscall;
+	ti->syscall_saved_r19 = saved_r19;
 
 	if (!(ti->status & TS_SAVED_FP)) {
 		ti->status |= TS_SAVED_FP;
@@ -614,7 +619,9 @@ alpha_finish_syscall_to_user_mode(struct pt_regs *regs, long ret)
 	unsigned long meta = ti->syscall_meta;
 
 	ti->syscall_meta = 0;
-	ti->syscall_saved_r19 = regs->r19;
+	/* Entry work may have replaced argument 4 with the a3 error flag. */
+	if (!(meta & ALPHA_SYSCALL_META_SKIP))
+		ti->syscall_saved_r19 = regs->r19;
 
 	instrumentation_begin();
 
-- 
2.43.0

