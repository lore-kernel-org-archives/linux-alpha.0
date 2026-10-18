Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D54C10CD
	for <linux-alpha@vger.kernel.org>; Sun, 18 Oct 2026 14:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792333348; cv=none; b=X0mEotDhuFwaV9wvvOaMl2xnl+RdBNrPiv7QFwxI6i2P/IQIKwUPjRFCTtzfvHoxLeBdlYKv7Qe3Fn1Wh4hFBBGF3XhMoJi9a7cqeZlL4m9jH0rpg1mfzZ1lI4FwkwK7vcx9SX1DuzDzWX878xgD4yk8XBRPA1iJEiBE0/A42ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792333348; c=relaxed/simple;
	bh=VxOR/bCOVZkIw8KCvCXFIKKLhAZToFxwLD68oZ1t8k4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBqFIMebrRvkzXr53eOasqOXPNR5s7ySp/MCfbVygtCsOX3gSciHcTqmtEThRiuM8Ou6MzGo9Zano3FSZt78FWpAD/0JyR3CVBJpQYuAT3Zf3+Bo0HImGTR9FjBKknI50rm3/i1z9D6L5fBs9YsetvbZ0YGWUMapH48gea+tYd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rRs2J1mh; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rRs2J1mh"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b056d58f2aso9041057b3.2
        for <linux-alpha@vger.kernel.org>; Sun, 18 Oct 2026 07:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792333345; x=1792938145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUlIHV3Y/eyAzB+bNbhTZ2vi/60rQRriQzgaW1YAFSU=;
        b=rRs2J1mhqX5bwvPb6V4+pexg8CQt1Ndrl+2w8jGT1f/UgBbHjmuBChrRU1yjBWexBI
         PCP8r76kksd7zais4alPXwAM3qz73W7QaJS2CQ9hivfH+XysG5M71gvNBeWUrO3MtZbC
         1q2Prcsvo3n7sZa2j3HD7a0UMfHNqiGmg/hbpV7k9wD7yG84p2iSpaI+dGskxVknsJ9P
         sHFJJa6o+dQNfR2Thhb7TQxk5dwHm03rcKhTP3sVMEeeUhcvLCFDhKUHwZ9H7RoIWGWd
         uxsZIgVbrrHaza7AH18of/YR+I2aURtK7f94AYlO8Eudkym32j2hWJ3Dcs57xLcnKkWo
         z2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792333345; x=1792938145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUlIHV3Y/eyAzB+bNbhTZ2vi/60rQRriQzgaW1YAFSU=;
        b=S2v8MgZJWMebJqTCV1M4L867quWghASpQ56HQemJTqACI1d7gDu0TbkuVXpqsXbQ6s
         TnuQxVHKKxocXlGxDIzQoQI0huvpCk1yCuhyUGxlEOxPNC+uckO+zj0xwBEstUjYEjfX
         pdxjz7VRvCAGPzt8z8QgAMx41eWKsxi0T+4gFzjf3+tqHfKalAQvLDd87hnUWm7MQWjn
         b0dPwZhG7EXk0yM9iFwMgIkyU/KG1OlcDNz19Lovv6er8wo1Bbal0KXuUxJg6XJfF3Hm
         c/gQuZ+3cfq1OMvbwgB8vW+4KJf7jR44ansswe9m9FNmdbbltod52m0GBy/1ISTet0mz
         WODA==
X-Gm-Message-State: AFq9FYKB7RI43eAm7b5kSuarLOj4mU9vvmN1geOoWtjP+xyzhML5otL+
	28qIDyauD+rz1nKM/C+wdpnSvhwm7Utr26Ayp3ivgBoAogJ90ta7BLKP
X-Gm-Gg: AYBFou0gX4HtZIfF0mRgDWtxgPjGnClXOdoasIJmHaKaspsOgiqMWOXasp570sQVidC
	dYLNXX4EW+HTJf8zlO6sQAoP7bWPOTUEizlgDPHczdBcZYP0k1Ob7GpfxDJTA1OqeNdTr9K4AZE
	0ZCJABJy9E6rSL+VAgDb8g88RV6fqAL6nDn36Xou4h8/RNt+dBUxoKinNI8wxVBRbbVxCRjxW/L
	uyYQXjbP3ndTpMR4rVvvMHkuJoQPzmOvlgNmMvc4ezmr0AO6MOirEqrR2Oj/uih+ZJ0dcD9et8u
	rEWpg32RU8ZVIZAAYBoU5UlSm3mX/OHBzReRLPnIifIP3Udjwwd4jbziBqgV7B1czF3BA6O1Itu
	BOZcqTMdb1EHlUuVGH25VJUnHWpUVk3YAGqnR4LD2LWeaLj7/DVVXhkLKzz/u9HtHsCDWeYy6j8
	SKo2zazSBPXCfvxVvHfkdwIWnKWiNIhk58dWofJODkwe1qQRKDEThHbQHLyniawTcB4+aNXtupb
	c0iReT7DVKmYwRhT1KQ6Y4J389l7EGQH8h+BcxlhUEX77E/qFsx7Xv5trTirA1f+AJp4K/eKTi3
	O8VCMMDwVzCN9a2JQ7jsCtT75Ob8fApTbRu91V4=
X-Received: by 2002:a05:690c:a75a:b0:8b0:b1dd:c09a with SMTP id 00721157ae682-8b0f21bbb9cmr11567547b3.64.1792333345125;
        Sun, 18 Oct 2026 07:22:25 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e590b586sm29403807b3.31.2026.10.18.07.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:22:24 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 18 Oct 2026 10:22:02 -0400
Subject: [PATCH v3 2/5] alpha: stop storing the user stack pointer in
 pt_regs
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-alpha-perf-regs-v3-v3-2-52be85332c57@gmail.com>
References: <20261018-alpha-perf-regs-v3-v3-0-52be85332c57@gmail.com>
In-Reply-To: <20261018-alpha-perf-regs-v3-v3-0-52be85332c57@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Ian Rogers <irogers@google.com>, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3175; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=VxOR/bCOVZkIw8KCvCXFIKKLhAZToFxwLD68oZ1t8k4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKuXOOs62SZ+eg+F3emovLvc1Mz5mwpdUi/ZRqwW6/3Q
 fvLmRWbOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYa2eOMDKfWPxaP0Y
 lbXMtktYfl3XzliNrA1KyEX0bl71dap5yWm87IcLtcp+5uhnTgoZ3yfCy+iceVn847089z8XSCH
 fNXphRlfgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Nothing reads pt_regs->usp now that user_stack_pointer() uses the PCB.
Drop the stores, which saves a PAL_rdusp call on every syscall, and
give the field back its old name.

Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Acked-by: Ian Rogers <irogers@google.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/uapi/asm/ptrace.h | 2 +-
 arch/alpha/kernel/asm-offsets.c      | 1 -
 arch/alpha/kernel/entry.S            | 5 -----
 arch/alpha/kernel/traps.c            | 8 --------
 4 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/ptrace.h b/arch/alpha/include/uapi/asm/ptrace.h
index 9d86b2a1526e..72ed913a910f 100644
--- a/arch/alpha/include/uapi/asm/ptrace.h
+++ b/arch/alpha/include/uapi/asm/ptrace.h
@@ -43,7 +43,7 @@ struct pt_regs {
 	unsigned long trap_a1;
 	unsigned long trap_a2;
 /* This makes the stack 16-byte aligned as GCC expects */
-	unsigned long usp;
+	unsigned long __pad0;
 /* These are saved by PAL-code: */
 	unsigned long ps;
 	unsigned long pc;
diff --git a/arch/alpha/kernel/asm-offsets.c b/arch/alpha/kernel/asm-offsets.c
index c89792c86044..22ed3c975b1c 100644
--- a/arch/alpha/kernel/asm-offsets.c
+++ b/arch/alpha/kernel/asm-offsets.c
@@ -30,7 +30,6 @@ static void __used foo(void)
 
 	DEFINE(HAE_CACHE, offsetof(struct alpha_machine_vector, hae_cache));
 	DEFINE(HAE_REG, offsetof(struct alpha_machine_vector, hae_register));
-	DEFINE(PT_REGS_USP, offsetof(struct pt_regs, usp));
 
 	DEFINE(TI_FLAGS,        offsetof(struct thread_info, flags));
 	DEFINE(TI_SYSCALL_WORK, offsetof(struct thread_info, syscall_work));
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index bfa116d455fb..790389a15c3c 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -476,11 +476,6 @@ entSys:
 	ldq	$1, 0($sp)	/* syscall nr from saved r0 */
 	stq	$1, 8($sp)	/* regs->r1 = shadow syscall nr */
 
-	mov	$0, $8
-	call_pal PAL_rdusp
-	stq	$0, PT_REGS_USP($sp)
-	mov	$8, $0
-
 	lda	$8, 0x3fff
 	bic	$sp, $8, $8
 
diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index cfaef96c4ce8..5882c65b7ef1 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -30,12 +30,6 @@
 
 #include "proto.h"
 
-static __always_inline void alpha_snapshot_usp(struct pt_regs *regs)
-{
-	if (user_mode(regs))
-		regs->usp = rdusp();
-}
-
 void
 dik_show_regs(struct pt_regs *regs, unsigned long *r9_15)
 {
@@ -186,7 +180,6 @@ do_entArith(unsigned long summary, unsigned long write_mask,
 {
 	long si_code = FPE_FLTINV;
 
-	alpha_snapshot_usp(regs);
 	if (summary & 1) {
 		/* Software-completion summary bit is set, so try to
 		   emulate the instruction.  If the processor supports
@@ -208,7 +201,6 @@ do_entIF(unsigned long type, struct pt_regs *regs)
 {
 	int signo, code;
 
-	alpha_snapshot_usp(regs);
 	if (type == 3) { /* FEN fault */
 		/* Irritating users can call PAL_clrfen to disable the
 		   FPU for the process.  The kernel will then trap in

-- 
2.55.0

