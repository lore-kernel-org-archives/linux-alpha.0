Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499E336D51B
	for <linux-alpha@vger.kernel.org>; Tue,  3 Feb 2026 06:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770100500; cv=none; b=VdPo11AZqjL7zhVmCeIqvc7syfUzxySdufYi9aIENGyc796eiNzTvAr228x7R31t8nH6SBnh2yYvQrrknw+47eukDf8SD13jQ7vhXkYl66g87AcOKBnb1Ap4/F0cHJEIKke2aM4MelNcKMzP9E6Jx2V9z0jVtaCBoFU8Jko5KeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770100500; c=relaxed/simple;
	bh=+jfAbJmK5NygcciGKp6EEwMSd5OUC57idgZm/cik9Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qTg7e4g+fZwLUAC1B2MSOP3iFnQ/q6uF8A8sg6HigkiyKNBKiUka9GYfdm10c/TLOBGV7Z0kmfa5IOTJVAOa6BZ+8UNdGR0zmRBQbKZllFJiGeRcWU1U5CjwE0JTR8ILyiiNrPLArkQz5TKYz5z9zae4ksX0Zo1rSTkVuZMOTj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uecs1NQ0; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uecs1NQ0"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59dcdf60427so6119606e87.3
        for <linux-alpha@vger.kernel.org>; Mon, 02 Feb 2026 22:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770100497; x=1770705297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7veAzn+ssv4gTO6PNq9GiaBpAmIsYoQzI7tl2meJ/s=;
        b=Uecs1NQ0hQC+B0VmmpsdWHrtqMj/OivpTHDg5UYHhVRGBz73HmI9+/ZU7GqdIN48iU
         gPoSOKPUTF00wK4DvkpaXTt1qezSA7BOroWM/WmIWnnuSttJA9obgDM8rz2oz2zK4Gbq
         2fnQSZYk9yq8WWzkK8a+BG991DWqAZy5GXBmxkNI0bcG5XAOipbMh6+mJ33GhDXZHI6O
         KYGMg0rILO40d2OGMEE+Mej3bXEhcKG104aqkEjs2p0T0REW4X4m52AhciWl77Ipt/B6
         VOV2s2MWFb3nWvuz7Ulmncp5r2i63XK5q6JpimhIGJ61jgL2zY8zahU4m9Q//S4hCvm/
         rSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770100497; x=1770705297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7veAzn+ssv4gTO6PNq9GiaBpAmIsYoQzI7tl2meJ/s=;
        b=oA/HAq4Svk6Zev8jkRiSHB0C+fohzSubH55FHDtFtrdSeptiFTaxkQv4C4dCS5TXDZ
         9xih02YUpYitPhP5pm0zXhYIlfv9gktFs619KH6/AKW7DuuolhMQwwFv1lrtALmhhFGb
         vNvBOAD+bJDBqWBhssCMIQjJhTc1aHbAds7my744oqNvKkQxDe93ePQznmawcksKqTgY
         NQcnP4k73qMksX21N8guCKpHmwRqitBuLLHHm51icdjNHnHTp8ueigBL5FygAyz3UcDq
         4ByEB9OxCqgnzAbHZVOsuu+dvXP8RcgLCfTAdKalIvsycAteJhrqcE1geur3D4pklpGa
         GjZg==
X-Forwarded-Encrypted: i=1; AJvYcCWxKFKtEQ1EwL1cGfoLLlfUyKc/vQw+8IeV2zKsHnpsEwh6s27cuErdlFnM1TZpbmWHUYdzdjZMGYhNjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyps2V7oa97U6pY4C+jQGgcrWQCMJxWgJXooCyWwAeOyhYUeiDl
	Q2CEU6Ssa6YISUbA8ZUOCrNVRiCcvoU9za+CnRfdDdTxqgK9R/tQROCy
X-Gm-Gg: AZuq6aLD6xNLoQpAyNrFimmPmaW1+xKrWjBkqEJDsz5dhVP6PaI1eSo5bH7d/fYLm6R
	q5aUOcX01kquqm1DAksDXD5BdUVFwT/0icLNZX4dbvqEyB2To/KY8I7vkSy9nU1tTclPLJdeBxB
	r6oAOtQDkSExSUX5bpfdJmroQHQiEtItmXGc66GxZvRcK0ncKVCSoNtoFQVBeWCpMqZFayndEZs
	5C6T6aDWMewC7VYfacndcQ3ETeWV+G2uapohBPRBZsyLzGygm2AOh0g3EIy0dsP8y62wif1qmat
	1GzlL7u3dA33bCg+2CSvIoz/rgUnHY7AjRSr87K0OUhEFMS2SgH/ZMjwHGQt7dGBQ6kw36k8dIW
	7yavhLjt3j/LHnLasmvzYAiMIHKzGFZSuasXxKJmBP+mb/dS8b5zd71KYRhmpUf12p7BXGBlAhi
	BVHFAHmwbtKqBYCHLgIS1LAwwYAnYeGHtoskJHFrTIVa0nBJmIy7Oss7JvOPuG9ZHX8grF5xgp/
	+ZWdfGET2uPRz3BsCpwjwc=
X-Received: by 2002:a05:6512:238f:b0:59e:9b4:96a7 with SMTP id 2adb3069b0e04-59e164420cfmr4144034e87.37.1770100497341;
        Mon, 02 Feb 2026 22:34:57 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074889a7sm3993935e87.31.2026.02.02.22.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:34:56 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: kees@kernel.org,
	luto@amacapital.net,
	wad@chromium.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	glaubitz@physik.fu-berlin.de
Cc: Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH] selftests/seccomp: add Alpha support to seccomp_bpf
Date: Tue,  3 Feb 2026 07:33:26 +0100
Message-ID: <20260203063357.14320-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable seccomp_bpf selftests on the Alpha architecture by providing
Alpha-specific register definitions and syscall accessors.

This allows the seccomp-bpf test suite to exercise syscall tracing,
seccomp filters, and user notification on Alpha.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 32e2d4df397b..db2c81bb89b6 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -136,6 +136,8 @@ struct seccomp_data {
 #  define __NR_seccomp 354
 # elif defined(__x86_64__)
 #  define __NR_seccomp 317
+# elif defined(__alpha__)
+#  define __NR_seccomp 514
 # elif defined(__arm__)
 #  define __NR_seccomp 383
 # elif defined(__aarch64__)
@@ -1748,6 +1750,29 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # define ARCH_REGS		struct user_regs_struct
 # define SYSCALL_NUM(_regs)	(_regs).orig_eax
 # define SYSCALL_RET(_regs)	(_regs).eax
+#elif defined(__alpha__)
+#define ARCH_REGS struct pt_regs
+#define SYSCALL_NUM(_regs) ((_regs).r1)
+#define SYSCALL_NR_SET(_regs, _nr) \
+	((_regs).r1 = (unsigned long)(_nr))
+#define SYSCALL_RET(_regs)     ((_regs).r0)
+/*
+ * Alpha syscall ABI:
+ *  - r0 holds return value (or positive errno on failure)
+ *  - r19 (a3) is 0 on success, 1 on failure
+ */
+#define SYSCALL_RET_SET(_regs, _val)				\
+	do {							\
+		long __v = (long)(_val);			\
+		if (__v < 0) {					\
+			(_regs).r0  = (unsigned long)(-__v);	\
+			(_regs).r19 = 1;			\
+		} else {					\
+			(_regs).r0  = (unsigned long)__v;	\
+			(_regs).r19 = 0;			\
+		}						\
+	} while (0)
+
 #elif defined(__arm__)
 # define ARCH_REGS		struct pt_regs
 # define SYSCALL_NUM(_regs)	(_regs).ARM_r7
@@ -4643,6 +4668,10 @@ TEST(user_notification_wait_killable_pre_notification)
 	pid_t pid;
 	long ret;
 	char c;
+
+	#if defined(__alpha__)
+		SKIP(return, "/proc/<pid>/syscall not available on Alpha");
+	#endif
 	/* 100 ms */
 	struct timespec delay = { .tv_nsec = 100000000 };
 
-- 
2.52.0

