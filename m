Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818159;
	b=vBBkWjG0IoteaRJapybiR+4w6Pb/qs5IwSDFTCcYkMeG5PeVOJehBanEvpL6UhsGqmCQ
	 zgInYNI+l060TpSANxlJdxiVgeVLjGgxJ3WpTvCAyOBWKriGj12dzp7y51gen1Jcuo4OG
	 WjAM73iTwdDMsdeCTT+TadCcObtGs/N4dRmVkQffmrE9qZ0GZJ4m/2v2fEMJmyDibxdWx
	 7YYZdNOtRT87G0MdDWnxUKsQrYm/AxqOyf/sHErfCAJ5ZKHsoMGDQZLjR/87VNt9NIKQR
	 rM7PM+48CzNGZTWQnLZ6Sg7fgUFED+mSuvs5U5BMREQZ6g5hshMXXlQZ1IVOWoVUMow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=yhfMQyhA4yeVo/bZMJr9JjklAVTmBlY2c8c0GfiXoB0=;
	b=H71HMkjbmfMiZJxZTKxXIdkizFp3LWl3d5Bi52SaT6qP3X7rq0CNM/8lWMEmeoGuZIap
	 wKkiisKWQav7jRF38le3SUMpL82tt6h2fBop5AZV4x7PdARUHGuUDRikpDuRvjbQNImBU
	 LwsKgeTuYEYyK/uP2MKy/aWeXqxZaS7DlkP3T71p037mj/1+UWjX24NnY4yXW6R8Bhh4G
	 uy9bFDJPRqv14uaSUB+dqKf/i7cVdCc2bdNJivDFV9jykrBCgwrA1vliQ+o8Pl+E27H5M
	 p3KFr2TMlofVhRtrjjV2w1X3PU7VERzZCgjsE2zPZzsSXlOloyWpNU6hBiB/fj2suDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bhPpiWYE;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146E7606D832
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 18:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 146E7606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bhPpiWYE
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b125371596so19434847b3.0
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 10:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818158; x=1794422958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhfMQyhA4yeVo/bZMJr9JjklAVTmBlY2c8c0GfiXoB0=;
        b=bhPpiWYEVC0nDETzl/teZ7dUs1c1dgW2dwyyLfcoMuI3ij+wL0bdhUJbJq2VtxJqee
         yyh/05NRv7aPFR68V41dK1j4GImbcgTKo+xlMsc+5lAGLzADoB0BQ9rXLPYtVCuXGMuO
         Cqu1x0CfgIkIcMaOyYV30uZ7LT61qT3DHXYAq8LhW1BHFQj9gnJG/jnU/oGLsO5gqcAt
         iWxaqW00SrjJ8TXeNIhUyb3dVchLZZjef8f2eGuamW7HC/EpX99WDGBtK3oFNmtUdUC/
         TpFFFrkNMNcFW57AYCvOSt0rEBJDWmrzPyuMPcROjjL7jC3oXiwAEcI+Aq9sf+e2vz+Q
         E7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818158; x=1794422958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yhfMQyhA4yeVo/bZMJr9JjklAVTmBlY2c8c0GfiXoB0=;
        b=IUPlyXWk4+//5+sVGkfluUOQLicNWjMnrrKq+XLU4v7ssaTcCCzaBgYsVkn5jPfhKL
         PnsncI3DpBxyn3yFeNtQBdTlMqa2JWO8FWBqlr+hMBngR8c49/OD7uBiGIIHGoiCstPF
         AnJIEHwz/H+VlbI+hhwQ7UvwCZhIu1dYPfCgtYlsW5Nxj43rDFLWdS+ULkM1F9BePxVu
         z7EnhNbRca9EeTzI+Uxj/G2g3ZG+FrQuz4HmyK/jngWKsVGsYnr8hMg2s8U+IoVpDCZp
         LNmPvWn0zK+C0x2cG1J71eG32Yod1ftLAeG4+VaTUSbotmTPD5gwoOKl+jxFcrlvQ9Nn
         9lww==
X-Gm-Message-State: APuU4Z93UTaxw+jIVt3gzCJNvWe/nN+vEER6n6wig3bTtsd/JUg7F4tc
	Nqapg1MrOM9rpx1g5mUIKHdOkha36wCIbzXUkc2pckX5EDP/POcfx7ls
X-Gm-Gg: AYBFou0AMYZi14LYoQOyGupEw3AAo7y9uaj3R5AhStEI4Z7GIJNAJiJcRoR7CiAoYRc
	VlaDUpbOXuFvjH422xB/gApPEDFoN0XAhIrWu3jfUoEdZXofiB2uYb+sPIC834KCdOeVnnl1rjy
	WEpUzEFx/xMPRqGcEtDNVz7/dxT+9uwfg5fWKiKl5DmOif2RhKfvi3JY5Q3mUG+ztDj+rQL6IsZ
	BsJr82/MpKC24hRpthUCajxSH6HO9tBOYfXkFdbDBn12XV7T2JrQH5BGCJtekuOI01JX9Zm2lJ4
	G6oxFJB+wR9BaWSqWoJYVgeihb7VeTuwFCSXmstviLNiytvo/CgAhNX3j1AZ0sUk0TZvC+NAgwY
	TzgZSkGbNYnWY0sy8xWeouvqR++aB4bz7/RC0QFVkfiodRnXUQ79fhsPOy4paIFCpS5fq+IEvVq
	u9mE9Ob+WYfJBnmRd8M7XdCEZ7d+E88VC5CmG9lQyR7VihtW6KDkPXqnvfo6KfxCPX0PXaz70vX
	yjrFlj0Nr5uSRDI40rFjwjbz8n/7MG4zJ6VQaMKuJKgtDsg8oKOGVa3ZnR/1epvMT63bcmwIgZd
	8TL8wdSrTR2vnJRaSSZzx2pHvolJeu/iyiCmssasctQnoco57otYkmpmIQ4DW3P7n6c7Pr7ZXfy
	rIW2GClnCnA==
X-Received: by 2002:a05:690c:a012:b0:8b0:cd32:b8dd with SMTP id 00721157ae682-8b328e174b8mr1891967b3.17.1793818157715;
        Wed, 04 Nov 2026 10:49:17 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098c3174sm24622517b3.12.2026.11.04.10.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:16 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:49:11 -0500
Subject: [PATCH v6 04/13] alpha/perf: do not report user registers from the
 entry code
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-alpha-profileme-v6-4-63362e9290a3@gmail.com>
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3878; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=LiN+Yv+pum+ZIoYCbCmWoIHtlAzTvYQXPQL0PlKXs7o=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe16kIO6+MYYzv/yrI8i6s8upfOWOjyEubr61ZI+Q7v
 TgovlGu4yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK6JamFk+Bweu9Rmmd
 6Z7Ewduz+3pLiFvq7/vyJfTOmTgtAae5Uv/Az/rB1Vf96VKNC1K62oWrPg+80HXp6Cy+QT/Vadl
 /DaV/iVEQA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

perf_get_regs_user() returns task_pt_regs() whenever a sample of a user
task lands in the kernel. But exception entry runs with interrupts
enabled, so the sample can land before the entry code has saved the user
registers. Only the part PALcode pushed is valid then. An interrupt
taken on the first instruction of entUna, say, pushes its own frame on
top of PALcode's, which overlaps the rest of the user frame, so r7 and r8
read as the interrupt's r23 and r24.

Report no user registers while the interrupted PC is in the entry code.
Such a sample also gets no user stack dump. The range is all of the entry
code from entInt to the end of the save in entSys, so it also drops the
registers of samples that land after they were saved there.

An interrupt that nests on one taken in the entry code still reads the
incomplete frame, as its own PC has left the entry code.

Fixes: 9280e99d87dd ("alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support")
Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/ptrace.h | 12 ++++++++++++
 arch/alpha/kernel/entry.S       |  9 +++++++++
 arch/alpha/kernel/perf_regs.c   | 13 +++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index 45d1229344b6..1400ba3e7d43 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -14,6 +14,18 @@
 #define task_pt_regs(task) \
   ((struct pt_regs *) (task_stack_page(task) + 2*PAGE_SIZE) - 1)
 
+/*
+ * Whether pc is in entry code that may not have completed the frame at
+ * task_pt_regs(). See entry.S.
+ */
+static inline bool in_entry_save_code(unsigned long pc)
+{
+	extern char __entry_save_start[], __entry_save_end[];
+
+	return pc >= (unsigned long)__entry_save_start &&
+	       pc < (unsigned long)__entry_save_end;
+}
+
 #define current_pt_regs() \
   ((struct pt_regs *) ((char *)current_thread_info() + 2*PAGE_SIZE) - 1)
 
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 790389a15c3c..b8d7804e5aa3 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -186,8 +186,14 @@
 
 /*
  * Non-syscall kernel entry points.
+ *
+ * Between __entry_save_start and __entry_save_end the frame at task_pt_regs()
+ * may not be complete. perf uses these to avoid reading it.
  */
 
+	.globl	__entry_save_start
+__entry_save_start:
+
 CFI_START_OSF_FRAME entInt
 	SAVE_ALL
 	lda	$8, 0x3fff
@@ -479,9 +485,12 @@ entSys:
 	lda	$8, 0x3fff
 	bic	$sp, $8, $8
 
+	/* PAL_callsys does not save these, unlike the other entries. */
 	stq	$16, SP_OFF+24($sp)
 	stq	$17, SP_OFF+32($sp)
 	stq	$18, SP_OFF+40($sp)
+	.globl	__entry_save_end
+__entry_save_end:
 
 	mov	$0, $1
 	lda	$16, 7
diff --git a/arch/alpha/kernel/perf_regs.c b/arch/alpha/kernel/perf_regs.c
index 33ea2e831ba0..894683851b30 100644
--- a/arch/alpha/kernel/perf_regs.c
+++ b/arch/alpha/kernel/perf_regs.c
@@ -59,6 +59,19 @@ u64 perf_reg_abi(struct task_struct *task)
 void perf_get_regs_user(struct perf_regs *regs_user,
 			struct pt_regs *regs)
 {
+	/*
+	 * Exception entry runs with interrupts enabled, so a sample can land
+	 * before the entry code has saved the user registers. PALcode has
+	 * pushed only its part of the frame, and the rest may hold an
+	 * interrupt's frame. An interrupt that nests on top of one taken here
+	 * is not caught, as its PC has left the entry code.
+	 */
+	if (in_entry_save_code(regs->pc)) {
+		regs_user->regs = NULL;
+		regs_user->abi = PERF_SAMPLE_REGS_ABI_NONE;
+		return;
+	}
+
 	regs_user->regs = task_pt_regs(current);
 	regs_user->abi = perf_reg_abi(current);
 }

-- 
2.55.0

