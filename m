Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5383C1F5B
	for <linux-alpha@vger.kernel.org>; Fri,  9 Oct 2026 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538098; cv=none; b=UidFKs3IGNIg1lL/YEvmj9ufP34yMFM8JXYtgQulbfndGYJgjl2WdcL6IZXw8rrZDt5mMkDU4sNeUwCjj4YB1+B619IayusJlHve2c5N0KNZgFyJLL2qYzAsT8KsyjxIQXY1o9kHxpVAvs46e85BQ1pMiPfTQ8TGsU7u8XIyyV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538098; c=relaxed/simple;
	bh=C0YppfDJJ+x8kMmqVn9KuMn1DV8bXTY/luVZqkTUfpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZAPtToXRe5czrP4bsTqNR1WSvkyOnjJR9hCvZqihd+K+H8Xy+O0AhmQ+CuBkW9Qpls11OpdKAqM9O0vngwlp+/K1Mr4y6SUnW6+Li22Un+aQn9LKPhJpH7WpUCvN9oo/mAF3UbxIYLn6WTpuJXtMlFOmHvjCQC59kS6qYla8uxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jg7RdqDM; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jg7RdqDM"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6af9cc73235so2963359a12.0
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 02:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791538094; x=1792142894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uoHrS9ZtPCy6LWxuJaA2Izau9PUZ68iNYzz+yH7AHt8=;
        b=Jg7RdqDMR92cI/mO8vYSvITnLTR9uttC2GU2fbATLKtP59GkdXeOMektR6u2GbiKiL
         HxNhstTMA0rmyPbZ5vTy1us9tP9doHxgOK0wjNrwI7+n7qK7r1Sb0TnZCkscTSgqdQKb
         j0dRv/x8eNzQM6yk74fZDo7jJLoRva3y9XRtT3chkCn9VILSf7oLYPiMfOC4oufreO//
         mjAEGoP4e9e9AAMO1aTmlieuA+n23D41+lRpHlbZlY19lq6nY09hSWrTvO2M9AdDzPnJ
         JcPV+3qNuc+XiVDBpCNJArh0Ku8eXbOv2PTZZr1z66oHxE2DzcxR1qzn2OJe0okbmsDF
         Xl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791538094; x=1792142894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uoHrS9ZtPCy6LWxuJaA2Izau9PUZ68iNYzz+yH7AHt8=;
        b=h1jF85clUpn9WVGmb7EeOBiCHD1pWCQGbzmRzYS0ExBXHqlAm6TNZvjXVNBSVtyBTx
         X98VzboLDGzCUhlbLFR470ipZuy52b/W3s+coJR3XzkFojczXhNnKwW8Fe5vn9DMS5rs
         TX2bR67GBoibnZRMMQ0Ip/ckJbxox2liIEhV5Rl2sBX8xUx5xax14Effdem9OxrelQDI
         TR8RA4XDeKqYQ+ObOIpnlUZ60I0m+jF+ptOCEsFvIWmqNar1ZUBFk2/eGkS+myk/+bX8
         KVDA94/+pRa4Wvx8ryJhZKa3VJPb8jlgP2LWVgqdyyUpnSfWg+BwS9FklU4A4jtRFYhq
         OWkw==
X-Forwarded-Encrypted: i=1; AKwUvBzt2jruUDfBLGiNhgjSxI9fR1VZBcJrlx30EwBC1TlE4xVGKutmdG7w6ugvmjlNdhOO5x0mcyQoId6HRQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIIpfyXFstxWFlwYIicIfq/9x6yY/0dWVgqqZjGfLEPwJ+fhK40
	MmbTL6zodG9KGxtjllvJeJZ2YPXW8Ovhp6TdfOfzMmJw/hWrb/ChOpI6
X-Gm-Gg: AYBFou0r4OxWZ8xoOcmVLijjoz8egRLVo/Jx+xXOVNZvVNZtI562528Xh0YP+KFoeFO
	AdHdTOAs4MMquy/kDCHr90mERI7VzzKnbzf21FRJYLvHczq5auMhKpKvqgck5GP5epAnASt73Fo
	F1vN/6UinwNpV4uSfdx+px+OJhwOLrKXLMif83x2bOj1Sfo/QN47kyx5TF+A8pGyVs1J/W2e4UA
	d54nqrJJ5tCtYoE+o8mVnR7Xzt5XowFWKuZRnM/5hwWnx4eoGEL8fXSOx8RasA1WHbxHRtP45VF
	uf4fr8FDY2T+NK3Jg1v/NB9GKEYSFmEgRl0U/qtpVKft3oKStk/xFV9oqjg8TpMWwrzgFRAv4OT
	1OiGzyqylObkaPKf9wYLm53sPASj3JBU1LCt0wqvhnqTf7HCpd8FfzckReuUMCCSiBsOKCb4yeV
	/2kSIa2a2JygPsGnNgg7x/xJqKNGK4lPP9X8WxyHXxcwXytmIQ1TX+NfSKm+enELbA93Dz2Zj31
	IErSESTWzKsIvndjBTr9YfYpEMG/P5bLBm7K6lDQbIfOXmeWo8=
X-Received: by 2002:a17:907:97c8:b0:c2e:902e:5208 with SMTP id a640c23a62f3a-c31a9d0eb2cmr140259366b.5.1791538093918;
        Fri, 09 Oct 2026 02:28:13 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9767227sm67427366b.11.2026.10.09.02.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:28:13 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: kees@kernel.org,
	shuah@kernel.org,
	wad@chromium.org,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v2] selftests/seccomp: add Alpha support to seccomp_bpf
Date: Fri,  9 Oct 2026 11:27:27 +0200
Message-ID: <20261009092759.968521-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the seccomp BPF selftests on Alpha with a fallback seccomp syscall
number and architecture-specific syscall register accessors.

Use the NT_PRSTATUS register layout rather than struct pt_regs. The
register set contains r0-r30 followed by pc and unique. Read and update
the syscall number in r1, and set both r0 and the r19/a3 error flag when
synthesizing syscall results.

Skip the pre-notification signal test when /proc/self/syscall is absent,
rather than unconditionally skipping it on Alpha.

Kernel support for seccomp is already upstream for alpha so this is
for the tools selftests only.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
Changes in v2:
- Use the NT_PRSTATUS layout for PTRACE_GETREGSET/PTRACE_SETREGSET.
- Set the Alpha return value and error flag together.
- Check for /proc/self/syscall at runtime before creating child processes.

Link to v1:
https://lore.kernel.org/linux-alpha/20260203063357.14320-1-linmag7@gmail.com/

Tested on an AlphaServer ES40 (EV67 Tsunami), running
7.3.0-rc1-00010-g19a47cb46b82, built with GCC 15.2.1:
  PASSED: 111 / 111 tests passed.
  Totals: pass:99 fail:0 xfail:0 xpass:0 skip:12 error:0

Applied and built on my alpha/for-next at
29289afbc513df29f0f981d45676980ed8eb13d2.

 tools/testing/selftests/seccomp/seccomp_bpf.c | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 0622bc2..92d3713 100644
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
@@ -1754,6 +1756,25 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # define ARCH_REGS		struct user_regs_struct
 # define SYSCALL_NUM(_regs)	(_regs).orig_eax
 # define SYSCALL_RET(_regs)	(_regs).eax
+#elif defined(__alpha__)
+/* NT_PRSTATUS contains r0-r30, pc and unique, not struct pt_regs. */
+struct alpha_regs {
+	unsigned long regs[33];
+};
+
+# define ARCH_REGS		struct alpha_regs
+/* The kernel keeps the mutable syscall number in r1. */
+# define SYSCALL_NUM(_regs)	((_regs).regs[1])
+# define SYSCALL_RET(_regs)	((_regs).regs[0])
+/* Alpha returns positive errno in r0 with the r19/a3 error flag set. */
+# define SYSCALL_RET_SET(_regs, _val)				\
+	do {							\
+		struct alpha_regs *__regs = &(_regs);		\
+		long __ret = (_val);				\
+								\
+		__regs->regs[0] = __ret < 0 ? -__ret : __ret;	\
+		__regs->regs[19] = __ret < 0;			\
+	} while (0)
 #elif defined(__arm__)
 # define ARCH_REGS		struct pt_regs
 # define SYSCALL_NUM(_regs)	(_regs).ARM_r7
@@ -4652,6 +4673,9 @@ TEST(user_notification_wait_killable_pre_notification)
 	/* 100 ms */
 	struct timespec delay = { .tv_nsec = 100000000 };
 
+	if (access("/proc/self/syscall", R_OK) != 0 && errno == ENOENT)
+		SKIP(return, "/proc/<pid>/syscall not available on this kernel");
+
 	ASSERT_EQ(sigemptyset(&new_action.sa_mask), 0);
 
 	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
-- 
2.43.0

