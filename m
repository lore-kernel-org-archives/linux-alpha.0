Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17954491589
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639743; cv=none; b=Yjiqb/WWP/bcmKu9XVr1SbuwkEXWt4ylWGZgUUTSNgpsq9bM8QbHH49MwXZpb0dLHFBQqz6ZeA1+TOlfemfIYgcw2l1i7HXj0ElJ2FNPHlOIboCi76RZeb8Oj7BEuJqJghMW6iDgUz63PEFVWgPmjE5zAVz39UPM3Isls8wBPlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639743; c=relaxed/simple;
	bh=U/nuTPW1GBByzTKEr0lQQY7u1zzIolnPL33tIXMx1cU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ELWu8Lq02t3CH8g1+wS44o9rF8GnlO/WQgn40igyscLxEwVJ/wtCwou67AAtqTZ/OuBQV/t6Yw+cIoQmNVF6mBgEtkNjCuGrEKrCjI9bPSKNtVCc5QJ35oa0RRWORcGYfSOtXoyPElmUa1hp0csy4yuV2IxqaFikgEWS1HbYN70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=shPQVteU; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="shPQVteU"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso951391a12.0
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 06:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791639739; x=1792244539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wqjj2AitxeO3NLrW4eTFLJLT15MYNUPf8jp++HuoGBI=;
        b=shPQVteUHnLgU3JPty5e1vWZpPxkneHim/8NhdvqMRETl4IytjdkAiFDnTdZeFa+ob
         g0EU6re6xblo3CfG+Tkycdc6CnQ0sRul1NXjl4rHuuxbF/wnkUkr1kgzK1p61oeJE2pb
         AveDQSo+8Dk/GpbHPd4uMfuVi+7DWISNUxp6Sy7m7hbgIdBgQJ/42m9mEr4QY5fQun6F
         BrxMk7T7aQQHkelm8u1vrj1suSVlwyzcCOe1GIfFsx4/DXONNV6CJVEn6Rf18wuD8bf6
         RD7aSc4MHuusKMd0e81/ajQzbqx7M4i6PL3slLDP1nzelyWJLHwo3Y1GcIC9GiVvE3vg
         kbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791639739; x=1792244539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wqjj2AitxeO3NLrW4eTFLJLT15MYNUPf8jp++HuoGBI=;
        b=Jryg5pHGF6J+3asUWnQJtFmZAzUAhWBJMdJaChDQv3BLB/pwmxRO7GTpDwoTT7aQzf
         /OtF4ZxcGJ0qVzCnSRvihb4wjVvcE9V2gnVsCZIIEp8+3W+pKDkDSNqhMOnh9wqqiVVv
         jUgQGKNj0HkmFFZ3bJRL8fANWTBo2xI2V0Dkqk77OKZHXCsoPsWGWvu4acuejXLXO1Us
         cO7zHhXLV3yUCDH1CwCaOGGm3Ta9zDtbN8sfbWWi0OHR06kbEHKunn6M2f4HbYU+v3tv
         DruEO/v6bLaEA0FPA/fEx1Wy3HpeSf4CH1E3wQDZdcTZiNEde744PkC6/5hQRSd0/E0D
         jADg==
X-Forwarded-Encrypted: i=1; AKwUvBxQH2fLcYckp69GPZI9VAW3314X8lY9Nen7rM2+4wtJfZLvRAmK3+tfwnqyPSvYHk2kuFkdCsNXsmgYAA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLuey1BHueJAsMel2Kqv0ou/8g7glGkEH8qGsV4AJV67IkHfYiW
	yPKQMymk/x01nSlfi7xwEzyxRmPWfUFYeyIyC3i5OaC+sj8nK1S45u93
X-Gm-Gg: AYBFou2HlDUwwXVDayYD7SV1SWbB/apCBJYHZ6jlT4J4L4ERnSg6pD62nRs/wo7MtAr
	wMYGTfK5XEyrVIUizKjhOExExZEYIP86DzdB2Ar9saanBnPgR6G/lu2Mr8ipqLTY/Qdgne17lod
	6H1ZreFpstCVIq5pwnYztbJNbqZBa00JPc5vVa7HFstqW8K9hVIlDoCxWPywwO5uqnsRdjhFM9Z
	VIg605dE1rxbPxEeWPFXy5LTyYVUBUTt0ADJdwxFJ0QzhKVQwBOGYKugBk93WhvRS1w3ydwBamF
	ytvXHfk5v9DYCA21fJc+neUutn2UCsERVnP0uPbSayRqDw6lhrwIB4hb3eLNNc0142Z6xT6azFx
	xB0c/wOjNeNM4drHP4XSr2jNvljkXEIxEfkRmFPhyptk+mL/jHjnYgSwy67/F2JkNOc6CRT6DtG
	451eWZkbrWvdZ19bKqcX9oYZ1/dw/UAZxb2+cCoql5+DjnoPuB4SzPmFbBD4NTIFvilsBRZhGa6
	4arVniRHEwFfSxztulr1G97VHMN+RmerHV2Z2zToyyuKBoFLiw=
X-Received: by 2002:a05:6402:5018:b0:6aa:915a:f51e with SMTP id 4fb4d7f45d1cf-6b17c28ef6cmr4582411a12.17.1791639739001;
        Sat, 10 Oct 2026 06:42:19 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd395dsm2704487a12.17.2026.10.10.06.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:42:18 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v3] selftests/seccomp: add Alpha support to seccomp_bpf
Date: Sat, 10 Oct 2026 15:42:00 +0200
Message-ID: <20261010134214.974565-1-linmag7@gmail.com>
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

At syscall entry, r19 still contains the fourth syscall argument, so
callers setting a synthetic return value must also set the syscall
number to -1 to skip execution.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
Changes in v3:
- Drop the /proc/self/syscall availability check and its commit-message
  paragraph. Alpha selects HAVE_ARCH_TRACEHOOK.
- Document that setting r19/a3 at syscall entry requires callers to also
  set the syscall number to -1.
- Add Matt Turner's Reviewed-by after addressing his review comments.

Changes in v2:
- Use the NT_PRSTATUS layout for PTRACE_GETREGSET/PTRACE_SETREGSET.
- Set the Alpha return value and error flag together.
- Check for /proc/self/syscall at runtime (removed in v3).

Validation on AlphaServer ES40, GCC 15.2.1, running
7.3.0-rc1-es40-tsunami-v5a+:
- Standard v3 and the original baseline binary both report 98 pass,
  1 fail, 12 skip. The common failure is the 30-second timeout in
  user_notification_wait_killable_after_reply.
- A separate diagnostic build extending only that test's timeout to
  180 seconds completes it in 34.938 seconds. The full diagnostic run
  reports 99 pass, 0 fail, 12 skip. No timeout change is in this patch.

 tools/testing/selftests/seccomp/seccomp_bpf.c | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 0622bc2..79e8eb3 100644
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
@@ -1754,6 +1756,30 @@ TEST_F(TRACE_poke, getpid_runs_normally)
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
+/*
+ * Alpha returns positive errno in r0 with the r19/a3 error flag set.
+ * At a syscall-entry stop, r19 is still the fourth syscall argument.
+ * Callers must also set the syscall number to -1 to skip the syscall
+ * before replacing r19 with the error flag.
+ */
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
-- 
2.43.0

