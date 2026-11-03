Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738266;
	b=TilujbfKFV1ipvvVXyapRzD71KJ7IbBn/l26zqmPoG8kbwss40Fy6IS6yTsQDmyj/fgq
	 R001W9xUmT9CUSCIdq9i1GTUAddkYMMS2dQEtg6Rhv/mbZKdeEv3kYobGvWi4hTcX/Ml1
	 yj5scbx80t8q8EkMieipe2QyfZBZoAS23aHzBAHHwISmaR9aH+QIS4HwYWZdA7+1L+HhF
	 /WmLNuGN1cL5yr7JgtRnGvSAe9Zri6E+pt9kBSMhKz2ZPo3goPFIAd5HgIwzeeQRqKGsO
	 zteGmWvHeazd1zUXK9nRwekuA2h29yNwzr10Un9Y8K+31jTSNoG0wHoSWNkjusFP9Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=yhfMQyhA4yeVo/bZMJr9JjklAVTmBlY2c8c0GfiXoB0=;
	b=Uem2MiHjQzBrcChbJCJiRsLB2MqeOj2du8b1gOzzVNiWB62xs5tJ/gOsyTQsZVFMGJCg
	 glcJ44HRlTHxKglkLanyJ2MkKe+OlfX+9OlbO/IrYgJrAtAozk48y5W3MT7ETaxpHkyma
	 9rAoe2i7NV1d7jR15XojMid6y8yNjBoqW9TDda9kyl91SbaKLxL03/hPdlDyCY+IvfoYg
	 LBnWxLMvgi2EKyTLgM6TNUz+4GtbkzSyc9Qjre7AUqLmQbOiZcpWhzn26qWrZyhuk7rF/
	 bqXcmKXyq8R95rlvL2UMB+PKu1T7CEfogcaOL7JZM3/U7ScfZ7BSidmz7MfvIPqPjqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2H3uHIE;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E3F606D803
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 20:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E3F606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2H3uHIE
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67992884b02so23584d50.3
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 12:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738264; x=1794343064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhfMQyhA4yeVo/bZMJr9JjklAVTmBlY2c8c0GfiXoB0=;
        b=b2H3uHIE6MH5SCNXmTqyQmQw9x60pFn5rWYqpuCa2D5eetD8N0iFCXIIZY1kJC4omS
         e2rJlxWBymAFAnIQDoDpq39Y0ZbORYn9SnCIuDKOv/Vosa+P8gSV2GH7hVvH1wDmI+vD
         8ifAyXQ5QtO8+yvJE9ldJjvqy4u97CQFrOmzv7w5jtArrOFVfyxAuwJJa/08JAof9hqJ
         cbG2DtIqnVF5VAOAczYP0fDP9Fdgv0xFpisISqWEWmVMZHf7mGKAjBzVe4hIDfL9Zoeq
         +hgyHpWG+hWW9QQiEuc1fpsYSJ7/CB+dj94AbOayvC22CyFsccCyWTcvG6D2YoynBEGu
         MP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738264; x=1794343064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yhfMQyhA4yeVo/bZMJr9JjklAVTmBlY2c8c0GfiXoB0=;
        b=fUh8N6TAB2xonm5t9bhmiEpv/1rFH2ZPGC+4efkF68CCuxwP7LoRsBUSRbaIwBHA4P
         nwUMSBJxJqusjsw/wtxhDavBWZwG3JmbHKRq9gDYQdaYf8+qZOsOBp6OGe8U/hM82iuR
         FmdYlowORYckWq/rP9/rnKF0C1Bik5MCl1HyD6nbZR1NOhe4SpCvTI4LUVEqA1fK4KTe
         zhjwxlm4k1wmIN0tnoLACqwxo3MMlrxezm1299QoOOXsyaXw5hs1R/4TW+CfCsF9340h
         8U4b30f+71sZNvEhuNxvDfkhYId6hOGvvVCjavRWTtzntx26P2el+xFFHPwgi71wtAeD
         H89A==
X-Gm-Message-State: APuU4Z87n+xc52ipR6YAQqVp+5GCflA7OG3B54GUAKtZbk3gzx8tvUq5
	sCf9ORws2keBZVj80zsdWF/2BBBT0hNyAHdwtlQQnisTSx9BmeG8posYvf/diQ==
X-Gm-Gg: AYBFou36sPUDlqp/rGY4ADp/mf6QgRLsJTBjZXFcTp5eeXmfRJrWly4pKfiLIWJ5iLs
	GWtsoKoTHSdt2yOXcdFwpaM2YZVyoOBVvkNqsyywlpFz/Ml8vUJ5AuDmbiHbCfyFVuAunAhSyNN
	44yav7VSZQXnJevzlUBS/FW63HDT20jNiincSmAuh5FWq5RsVNfp3jtaeDkeetRRHCaT0SG7mIF
	ZnwnzouT/q1RkDxL/AnkjMfK5huOABAtcAlzZkB1tfMeOOJRviMBOBUOSF66gQ0KDWCEyeJstiL
	Y8G/jHWVHsYMFHzdGVOdZ8Xf8iL3QfsFl32lsA87cmlHWdArNeR9dxCzK5G6MZDhrun1Ed1MlqO
	2HCqkWPj4tYwae99w6t+hKU9DQDJPD5tsJK3PYS467lCv6dMAgMnvkVrG9G5HnSaPKN3/pgT9qa
	uecryeTGzpa0zbNeYLl98C8r8G2lWHZu7M6Wy1BTpDOHIrzKvA7CV0HcFVLz2qyUTeinShHlDMB
	OvC+9zeIhR3RJ4k7sJYYrJnsPwywS2t6dPICac8jaI1pFplyTnJPcql6rrAVxHsr3sksjIAdGD3
	Q6IbQWDLg86+U7k4/5pRo6HU6rYYPTS5Jybo5jkRs/ZgpxXShCDWVulpuFlYOKC7fl3Cwf5R6s3
	Vr7rXasjHRw==
X-Received: by 2002:a05:690c:60c1:b0:8a8:9149:e4da with SMTP id 00721157ae682-8b2b67fe3aemr79052567b3.108.1793738264234;
        Tue, 03 Nov 2026 12:37:44 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bd1672sm4541337b3.43.2026.11.03.12.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:37:43 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 03 Nov 2026 15:37:37 -0500
Subject: [PATCH v5 04/11] alpha/perf: do not report user registers from the
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
Message-Id: <20261103-alpha-profileme-v5-4-bbe3937fbf3a@gmail.com>
References: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
In-Reply-To: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
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
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJeufHZGzuv7D1wpD8wuLhnzfXzv/yZze9U/tj9weH6g
 uzWY6ZPOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaUD+G/04lnSYKDt
 uapLXuFxrMdDi4YnIX376kg+9P7f7L3CK5RomRoW+Gi3d8WoBETHjHvZz2IwuDYv9WVIpvyjVws
 +ZZnfaNFQA=
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

