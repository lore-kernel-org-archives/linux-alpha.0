Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A05451986
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791749820; cv=none; b=QC+9q1CiL4e/P2tl73gaXRnQB1S0//o+vzTFxbw+L/cxSvk9nEU02MBFZvAuk2+TfbGkq3vDl6giDMiQ0aBvuQ84amtRR7SbNw+iVq1wz6B3qUxxE6ER+CWdJz7Y1677B77a+Nm07tObtaiVTcPY5QcFpXoucO0iN5f9FK6Y6JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791749820; c=relaxed/simple;
	bh=HKwdMYyKmRuchbP4c1XxhY0dQ26+OiRri0424Ox1MNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EFHMyeauRfwWaR57W4tqCh8nVx1muyUwpJT2kiRP5Fsvf7FLq0puGixD+Wgg75KErquNk2fjM0XrdHYgQ7bjTHDwVLtbRrXY2zncZdHgRRPo6Xp2WtRPaugk2iCOFy2EokSeth1XSeGpuQXKvb1AS+PNw+Fuj417/usG2lkp3Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXvF7HXK; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXvF7HXK"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-677d35fd1d2so1029999d50.1
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 13:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791749817; x=1792354617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UfLUE/KJOT5M/bL0VV01RXMRIPvbS9JV6u+siHBB/k=;
        b=iXvF7HXKteUsiEgHRSA+ARKG6LRzLDjMLwZivqykKZwcZx2GXY7wxgnfn+yQBt7sk1
         GvdFD+M9bWt5Ge09vMD5KwzNHnc/sIgOM0VwuK7dRWzgMrt5zfVcEd0+bUgdU2JAqgod
         o5iVXcafe9UDNrRNGJu4cGIaqpnw7jeQcxlxI1MwBuz6bqJvnQRU3kdHMJncqZxvfFHe
         AWUXgy9wLv5tRENI8nyBr7PjWciSwqaSzfUO1e6eYtptKppOCIs5xlZH9woKgUFgRyQ0
         R3BtviFk5atAPkIpqrDeMsGge+tZM1MVBn3pUmMX9fgSA8FJoWfo8EQ4x3QU2UZN/J3C
         sHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791749817; x=1792354617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8UfLUE/KJOT5M/bL0VV01RXMRIPvbS9JV6u+siHBB/k=;
        b=uB/wX7G9Rm36cLEFtRT0L5LuS5Tx389HzViaJp8DUMvtHEz7FveHR1Ci2QO3OHZPZM
         1j5u9kl+I/5c1siRrduSkkyvqjlrOPoRkoFZF4e2bb4FZoI/jQBdLr/4/d0ZOoMI/mfj
         m+HzDysWbvyfP2pZUQ2FhvoJAC1jkb48x2phEK5diGQX2dJsrYexs18EZD4RX+TzD/Vr
         ICTYNFur21JdQsimM/0NvMk8dLoxLFLM3LLq2KWJkkjF5N4bUuoZx2ZelXHVG44qQfG6
         PWP30px6SvbMv3gFKD4oT3sReeuNdeAxutMkMT6BbAajXG+6xYjiQcVmuxqJ0mCkRMJr
         7yuw==
X-Gm-Message-State: AFq9FYJ/Jtoo2CJlbhC2Qn5SEMOnMy6di6Eh+AxQkVvv7b+7ly2Za+21
	mBhw0GbCEhMh71DEj9kvHyMtH8ibSIZvSjhqki0WEkLiyFK3SWUPYkLD
X-Gm-Gg: AYBFou0vDdhAcHGDoBIvpyV5Ap9mTlMecgvil3Lmdsa2BaviEalsPVoFGKsyAvMhRVq
	cvPJKRRseLL0DWx8Q3C/OPYOobDYPH1CMyUuTTeKXP9jDw3OTvmzyKkQn8I2gvEaLRrAGz6BUED
	bUUuW9PhbDblamf2WzLUr+wGW8OAHw57Vde9uS7mBwzHGuzBFbJZ768OWjcKzxn4p8NFi329MTI
	tNsq+p9MG3DUyfmm4BDexSHCThrRgZ54EwqnSr85JHNUzw4A0cP5N8RVfQjoHdoIF6xHhGBvBDg
	sUmZOT54NwBO3jEkQ0E+gdh+YzmoVw3NgqKVvXey/ET6LfvLSZy6jJZnWIVWFf2sDkxak0pRrk+
	PmO29uZILOtOmQbgKyyPAwFpfyx+wOxAAdhz/dEhyMRaeKDxNmtF3IzLiOEfqwSRglXOtXRZGYa
	499Ui7I4eKXjBteP9QYQBmlao4+T5ADTWzK3AuJnOEHhjZAiNehvXU1noRNasL4d4HbCA1GvrNb
	kFYlxx/LONRHjqQvQMahCEGdeT7UGZYX8R6MmRImHZsAHD/YgDtLj2A
X-Received: by 2002:a05:690e:4199:b0:676:bf92:2520 with SMTP id 956f58d0204a3-6793627473bmr1908818d50.89.1791749817201;
        Sun, 11 Oct 2026 13:16:57 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679356ae586sm2953786d50.15.2026.10.11.13.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:16:55 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 11 Oct 2026 16:16:44 -0400
Subject: [PATCH 4/4] alpha: add HAVE_PERF_REGS and
 HAVE_PERF_USER_STACK_DUMP support
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-alpha-perf-regs-v3-v1-4-eaa625a39712@gmail.com>
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6348; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=HKwdMYyKmRuchbP4c1XxhY0dQ26+OiRri0424Ox1MNM=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJOv1vFYbApjvmsY3vtyT/c3ZelpJ44pzzY7LztzcFDE
 7LkOcSPdHxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1qccY/rtWbWib+v
 fi5rUPNzYev3hx3fw366xvb1z51l5l4fwp3bPaGBkWz3T1vS9Ya8D3/8V/bZvI8q6EtoaDjPH5S
 5U/8LGemcEBAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Let perf sample registers and dump the user stack, which is what the
perf tool needs for --call-graph dwarf.

The register indices follow the hardware numbering, so r0-r30 map
directly to DWARF register numbers, with pc after them. r9-r15
are callee-saved and live in switch_stack rather than pt_regs, so they
cannot be sampled. Without r15 an unwinder cannot recover the CFA of a
first frame that uses $15 as its frame pointer.

sp is not in pt_regs either: for user frames it comes from
user_stack_pointer(), and for kernel frames (PERF_SAMPLE_REGS_INTR) it
is the end of the trap frame, as in stacktrace.c.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 .../features/perf/perf-regs/arch-support.txt       |  2 +-
 .../features/perf/perf-stackdump/arch-support.txt  |  2 +-
 arch/alpha/Kconfig                                 |  2 +
 arch/alpha/include/uapi/asm/perf_regs.h            | 45 +++++++++++++++++
 arch/alpha/kernel/Makefile                         |  1 +
 arch/alpha/kernel/perf_regs.c                      | 56 ++++++++++++++++++++++
 6 files changed, 106 insertions(+), 2 deletions(-)

diff --git a/Documentation/features/perf/perf-regs/arch-support.txt b/Documentation/features/perf/perf-regs/arch-support.txt
index 4c9a5a012075..7d736d678fd4 100644
--- a/Documentation/features/perf/perf-regs/arch-support.txt
+++ b/Documentation/features/perf/perf-regs/arch-support.txt
@@ -6,7 +6,7 @@
     -----------------------
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: | TODO |
     |         arm: |  ok  |
     |       arm64: |  ok  |
diff --git a/Documentation/features/perf/perf-stackdump/arch-support.txt b/Documentation/features/perf/perf-stackdump/arch-support.txt
index dd362b5cb638..17b84ea7769d 100644
--- a/Documentation/features/perf/perf-stackdump/arch-support.txt
+++ b/Documentation/features/perf/perf-stackdump/arch-support.txt
@@ -6,7 +6,7 @@
     -----------------------
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: | TODO |
     |         arm: |  ok  |
     |       arm64: |  ok  |
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index b2c359b947f6..8fafbfabd1e5 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -41,6 +41,8 @@ config ALPHA
 	select HAVE_PAGE_SIZE_8KB
 	select HAVE_PCSPKR_PLATFORM
 	select HAVE_PERF_EVENTS
+	select HAVE_PERF_REGS
+	select HAVE_PERF_USER_STACK_DUMP
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
 	select GENERIC_IRQ_PROBE
diff --git a/arch/alpha/include/uapi/asm/perf_regs.h b/arch/alpha/include/uapi/asm/perf_regs.h
new file mode 100644
index 000000000000..da96a31b12fb
--- /dev/null
+++ b/arch/alpha/include/uapi/asm/perf_regs.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_ASM_ALPHA_PERF_REGS_H
+#define _UAPI_ASM_ALPHA_PERF_REGS_H
+
+/*
+ * Indices 0-30 match the hardware (and DWARF) register numbers.
+ * r9-r15 are not saved in pt_regs and cannot be sampled.
+ */
+enum perf_event_alpha_regs {
+	PERF_REG_ALPHA_R0,
+	PERF_REG_ALPHA_R1,
+	PERF_REG_ALPHA_R2,
+	PERF_REG_ALPHA_R3,
+	PERF_REG_ALPHA_R4,
+	PERF_REG_ALPHA_R5,
+	PERF_REG_ALPHA_R6,
+	PERF_REG_ALPHA_R7,
+	PERF_REG_ALPHA_R8,
+	PERF_REG_ALPHA_R9,
+	PERF_REG_ALPHA_R10,
+	PERF_REG_ALPHA_R11,
+	PERF_REG_ALPHA_R12,
+	PERF_REG_ALPHA_R13,
+	PERF_REG_ALPHA_R14,
+	PERF_REG_ALPHA_R15,
+	PERF_REG_ALPHA_R16,
+	PERF_REG_ALPHA_R17,
+	PERF_REG_ALPHA_R18,
+	PERF_REG_ALPHA_R19,
+	PERF_REG_ALPHA_R20,
+	PERF_REG_ALPHA_R21,
+	PERF_REG_ALPHA_R22,
+	PERF_REG_ALPHA_R23,
+	PERF_REG_ALPHA_R24,
+	PERF_REG_ALPHA_R25,
+	PERF_REG_ALPHA_R26,
+	PERF_REG_ALPHA_R27,
+	PERF_REG_ALPHA_R28,
+	PERF_REG_ALPHA_GP,
+	PERF_REG_ALPHA_SP,
+	PERF_REG_ALPHA_PC,
+	PERF_REG_ALPHA_MAX,
+};
+
+#endif /* _UAPI_ASM_ALPHA_PERF_REGS_H */
diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index 4ea5c189e60e..0c04b89676ed 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_PCI)	+= pci.o pci_iommu.o pci-sysfs.o
 obj-$(CONFIG_SRM_ENV)	+= srm_env.o
 obj-$(CONFIG_MODULES)	+= module.o
 obj-$(CONFIG_PERF_EVENTS) += perf_event.o
+obj-$(CONFIG_HAVE_PERF_REGS) += perf_regs.o
 obj-$(CONFIG_RTC_DRV_ALPHA) += rtc.o
 obj-$(CONFIG_AUDIT)	+= audit.o
 
diff --git a/arch/alpha/kernel/perf_regs.c b/arch/alpha/kernel/perf_regs.c
new file mode 100644
index 000000000000..10afe4e205e9
--- /dev/null
+++ b/arch/alpha/kernel/perf_regs.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bits.h>
+#include <linux/perf_event.h>
+#include <asm/perf_regs.h>
+
+#define REG(idx, field) \
+	[PERF_REG_ALPHA_##idx] = offsetof(struct pt_regs, field)
+
+#define REG_RESERVED	(~GENMASK_ULL(PERF_REG_ALPHA_MAX - 1, 0) | \
+			 GENMASK_ULL(PERF_REG_ALPHA_R15, PERF_REG_ALPHA_R9))
+
+static const unsigned int pt_regs_offset[PERF_REG_ALPHA_MAX] = {
+	REG(R0, r0),	REG(R1, r1),	REG(R2, r2),	REG(R3, r3),
+	REG(R4, r4),	REG(R5, r5),	REG(R6, r6),	REG(R7, r7),
+	REG(R8, r8),	REG(R16, r16),	REG(R17, r17),	REG(R18, r18),
+	REG(R19, r19),	REG(R20, r20),	REG(R21, r21),	REG(R22, r22),
+	REG(R23, r23),	REG(R24, r24),	REG(R25, r25),	REG(R26, r26),
+	REG(R27, r27),	REG(R28, r28),	REG(GP, gp),	REG(PC, pc),
+};
+
+u64 perf_reg_value(struct pt_regs *regs, int idx)
+{
+	if (idx == PERF_REG_ALPHA_SP) {
+		if (user_mode(regs))
+			return user_stack_pointer(regs);
+		/* Same kernel sp approximation as stacktrace.c. */
+		return (unsigned long)(regs + 1);
+	}
+
+	if (WARN_ON_ONCE((u32)idx >= PERF_REG_ALPHA_MAX ||
+			 BIT_ULL(idx) & REG_RESERVED))
+		return 0;
+
+	return *(unsigned long *)((void *)regs + pt_regs_offset[idx]);
+}
+
+int perf_reg_validate(u64 mask)
+{
+	if (!mask || mask & REG_RESERVED)
+		return -EINVAL;
+
+	return 0;
+}
+
+u64 perf_reg_abi(struct task_struct *task)
+{
+	return PERF_SAMPLE_REGS_ABI_64;
+}
+
+void perf_get_regs_user(struct perf_regs *regs_user,
+			struct pt_regs *regs)
+{
+	regs_user->regs = task_pt_regs(current);
+	regs_user->abi = perf_reg_abi(current);
+}

-- 
2.55.0

