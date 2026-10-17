Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AEF38D3F0
	for <linux-alpha@vger.kernel.org>; Sat, 17 Oct 2026 01:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202171; cv=none; b=bzYy51/eOAs/MY6LLqX0KbpuEOUXYiEL4P1/ybxdjc5rWglXeyxZy/QNyVb9IzfJSipb/3XdIcGl0fOVTQocsuIsYKKpRJDep0WEyCkz+H4gKjV9kQRQ+rDNzogbiTVMxoM7rv9AutOqKQ7SOfuOCk0FED3iAzjTYp8udoOy+ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202171; c=relaxed/simple;
	bh=VxOR/bCOVZkIw8KCvCXFIKKLhAZToFxwLD68oZ1t8k4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oVMrzLilEINxrxK576XNL1DJQhXCU49OKgTYJstD2duG6nqy+xvagYeP/ven/mRufjwOSvbIZkEHc9gVUq3MFV2h2egwnXNUD9l7eX32wsx0DG/xiUPVQE1cSoGaOblJZdzEh+3IItdnG9yGpPpGr0GEUuGC8yGbwfuviiqT36A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g03DmBHX; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g03DmBHX"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0f59a5fdaso1238007b3.3
        for <linux-alpha@vger.kernel.org>; Fri, 16 Oct 2026 18:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792202167; x=1792806967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUlIHV3Y/eyAzB+bNbhTZ2vi/60rQRriQzgaW1YAFSU=;
        b=g03DmBHXk9PAFolHh9Tva+e72oO+o1nns2f7Z02WJwU9JciCrJvhVyMnajTZOCceDS
         Vxk61xbFTMyVLCkjIzGG/mbdGvIHGLX03snvkVitNpEMvAiGYWuHDfsZRsm2p1Xm2d03
         9BKGcOzetRaokciA29Az+dr9/FiuSDuG/lPUYaZJgBGp5bZQjrQ4ppHxLpBbgBsjRaTa
         Mr49a6q+gjs37Tcy8gvn3H72+7En79dQb/nFalXwc6ELuAhPTSJiPnWZwil25tY2AXKM
         7H5rkKwTnhZY5y9q7jAdsdTFtGVjROJ3PzEdHHJyd+7xe6K7Nt0t1Mvgp1jOVAsaz06K
         8Pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792202167; x=1792806967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUlIHV3Y/eyAzB+bNbhTZ2vi/60rQRriQzgaW1YAFSU=;
        b=A7+j46VvKEfOMwKJr9Aib2MSK7S4/pK63TlbBuy2NHUNxapGmONHBgntof3O9RyjfW
         w+G2BzwQxIOwkaYp2nxhreOmD+qSqHCOU/0qEQdJ5TWLjrSOZgaSehfbuQuAfc2tFDyq
         L3cUa6FkXGRNnravO4psWI0ICdBaRR7cci2vKD/YKy3HoJ5fq9FUKRHv3f4QRcgiHQx9
         3+P5cFpjaQvIHvc9Z5YTxBWUpUEYOgkt2GJqgcisD+6wzGGud4A3IUxOhC3wBv5py4M9
         PyBjo+Lflc0VynEPVtx/cZfDj74VBVPB7FHvsRgHrKVAbCjnDNZOVJD0Qf+FyZmvkSNs
         lYRw==
X-Gm-Message-State: AFq9FYIGfzYkit8VbZRaxHHo+qIgBQ06Tcqwzf/DdP2hLKUMp4nRqzhp
	PTyt1izRC7S1Rhhm4RPbcQugT5ULbLkvK6anuJqXsHc1Ds5bNRdOQBnM
X-Gm-Gg: AYBFou3YBC7pDlRWr0oTFqFyX1Fl9hHRdmZY4/2F+uHuOBflg/GEcb4VbpMopLbf9Lz
	ITRXJLi3huoaAi7MGwW1rZ1fAsgH+vNwlCMRqb2NcPEIG7Wp8a6Zoba+Ny3d4SvogaKamTPeB2F
	3iqwrDcoLRR2GoAmCtgvP98OuEHBIFeWckGFlKkcj8hU+cpuRY57oNMcg5w2qCrVa8GT3AJ4bI6
	QopubdRdj4BQQtsGGBmrVSvObdcE2Q2ynZc7uvpfAXSeBlKyfBOsrdRu2Q8syCH4c1vdQxzf4Pi
	E9uqddU2ZtmywXJlnLQHXuHbgXntcrl1I6zvTrFjyyGO+atVPPSfCrwx81NKenPrM0FqeADwrlL
	dnURh8vGcG0K/QrfC0G9A+dIgo6FSWFxARpmCddl0YgVGB9XeDllx/emvVweAAfh2UA/4noens6
	qdmwTBLZZbIjQ4JKGtRVBYRDBSEWoyBd9s40Sb3nf6bE/Taa/lXskI1dTKW0ndx/tkyPFx+nOPm
	CuTH3yzOYq90n66YVKJ+7rqEbU+6ts3B9npMODSzAgtRK/hIDCAY9jqXzJaa8zNoZd2B6fyWO11
	XUWAE70yYgEgP3pPpDFq8BM9UFpe
X-Received: by 2002:a05:690c:47ca:b0:88e:edf8:e375 with SMTP id 00721157ae682-8b0f205768bmr6093527b3.5.1792202167343;
        Fri, 16 Oct 2026 18:56:07 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e58af029sm16566577b3.19.2026.10.16.18.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:56:05 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 21:55:48 -0400
Subject: [PATCH v2 2/5] alpha: stop storing the user stack pointer in
 pt_regs
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-alpha-perf-regs-v3-v2-2-17654742226a@gmail.com>
References: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
In-Reply-To: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Ian Rogers <irogers@google.com>, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3175; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=VxOR/bCOVZkIw8KCvCXFIKKLhAZToFxwLD68oZ1t8k4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIuXV1c59RwxmL5JvtizY70OTqfrzt+mix8xUqFJWeKL
 d/xHGmnjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLkmpJaRYfnyxdcPpY
 RMFeWabq+1/MNa61/HF1pEJbbz5qYJdRx5xs7wP4d1+el0ZovUZzuYVrFbXXVo+3StvSZ+94Uy7
 aULjzrcZgIA
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

