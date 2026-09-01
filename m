Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3BA47D956
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277921; cv=none; b=LjEVb6dD7tpQywMZIBoY/ECfX7zXe2mcgL/JDKqZN4UNqcxwJnAeQpWCVoR0SlSBZfxHAGQqz2IZ6yGeEU+SSah+hs6lSpj+rJb6FVZ7oid5XowICEXxa27YMqACtY453DAm4z+uj8CYdoXycIJh/62WD23mz0Te6ba/lUfNvo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277921; c=relaxed/simple;
	bh=vTqcmwbEB/dIC91BCJ1yGw/szB9HfP7Gh8a/Ud0X7dY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FGdBr0ZSfiYoCoXoqIAkSHCe1pTrW2J9Vt6t0X91HGcJ2QOnH81OECmlgbgcZbQbKpf8nKKzrvYBf3/8JIQOPXd4Z8MGx44blG5zAo2b1qRwEoc/yD96XVtq1U6NKZ+cJZkYBIncvCn5gMXrM40lkGoj/4OslQFV/QXRmGFN1wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hq9sDX3s; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hq9sDX3s"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66d116f0de8so28458d50.0
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277919; x=1788882719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4jsg3iDmSH/C678yYqTzSKMJa2GFh5aA/0gO9hsCRg=;
        b=hq9sDX3s4T0hHJAiV8zKdVkNX4sJa0GDjDLp0IFXOoCAMgltbETLhiBlh5Hv/E2jPl
         zjkYxU7Ze62I2vUGK00BXA9UaDZyt8O2EAAPp16CPR/Wp5iFLL/pMZokR8AjjZBvO5JR
         Bz1uOCSqUamBfT0f2MczPOTegEgXFWJX2t3oEAVxncg+RpePQ2aCcGgVhf+3VAKD7a7k
         Et4KfNT3rAlvPdrYmDfAYWUuaXRKdPmws82AdUyVGkJhHUpdjBRJotYFMw3qbfIl3bYp
         muRREfftp38uHRpTfoy/ymnjNQu+Lp0/VzESCjiVtcJN4C1QTLYcNdmzWnjo2mcuohqd
         d4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277919; x=1788882719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o4jsg3iDmSH/C678yYqTzSKMJa2GFh5aA/0gO9hsCRg=;
        b=qJs/9EWoTP/Pzd9oeHFkDfOsz76Lgb9G+5znO7UKHDghG/51y73sFYuKex7r+tb9Q1
         2NxVGzYIzykjWj1J4Ls7j4j3q2PbZAGiztOlRZ25JeI0uawJxRxOKa24Sy+feG2G69xn
         twd3oArRyin5OzPiLszmkxt3ch3LLWAO9YbKV61zOOt62cQbLTe3vvu7IYJjby04d+1p
         vzCleSmnVNcGfQdtN1Wz5Ko6oeiGjEThyfz7Zzlj0LikOzvCMToz6GRM0o+pthWKMc5Y
         E91TKW13sZYt1n/v0jOxSNES/yRoOrlZYcTKhoxT60EFBuyeYnABj1gzj60f22OCivGf
         UsCw==
X-Gm-Message-State: AFuF++kXf6t1Bda2CRhGsgKCwxK9d00iTK80XcW+J51DKFty5yoUc/y6
	ggSh/sZydG+Y7A1r8q3hx6fUkyUaVoyX1i9g4IbEsQT3oH0yI/o1tbUWn6BC3A==
X-Gm-Gg: AYBFou1HTLijIqgbET4/eZ5K/n6IY2Jm9IBAPWZxLvpbiGIs96vu2jj6AMAPjbrIl6A
	1eU+XCxyDZhimpXfwKo0nI4AS9p8hcj6BqXvFZAkGD46cbYnBZf0gA0YwvFUzijCf+LUVFldmd2
	0O6GA/qyZJrWccjRpraTvgvhFJ39o2BYhkMb1uz+r1b5UA9qMoNHdqnv5zI5jtJqCfQX6Ooe8Wl
	JEt1ClI1MTDpKA/Bl9A9uSaeuKkBubMGLLNBXv4PyPYbbcRK3kQR9XWYGFQkHZg7NSsrvQwJG3B
	6ngWlqHIhsAzfEwawbOXHKLDkUaR3STIU3VGWg/W/HZnQylObeaw/7x42MNltS8nPFCdlqEHDRP
	tAYbGvdWiPlobDOz/fFyzgPH6ZClkeP1xDK6Fy/OSncGHfotsjOwBlRd5k2gnQK0Wri2BY9y6Ri
	nGwLAGZqpPozPO32pLHzBvnG/WQgKC77pwiWnP1V/LVdud+8sXCX7g5s5US5WcCv50P3WhfHRvP
	K8H90JpeyE/A2zDsxiChUBslGrgZ85gCmaH0YDo
X-Received: by 2002:a05:690e:1347:b0:66f:8a2b:3db1 with SMTP id 956f58d0204a3-66f8a2b40ebmr2143252d50.46.1788277918775;
        Tue, 01 Sep 2026 08:51:58 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ed2a78bsm8602672d50.20.2026.09.01.08.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:56 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/24] alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support
Date: Tue,  1 Sep 2026 11:50:35 -0400
Message-ID: <6e7a5e56a201a74c00d1615a7ac1d58d385194eb.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the perf register sampling interface for Alpha. This enables
perf to capture register state and user stack dumps with samples,
supporting --call-graph dwarf.

The perf_regs enum exposes the registers available in pt_regs: r0-r8,
r16-r28, gp, pc, and ps. Registers r9-r15 are callee-saved and live
in switch_stack, not pt_regs, so they are not included.

A switch statement maps perf register indices to pt_regs fields since
Alpha's pt_regs layout is non-contiguous (unlike architectures where
direct array indexing works).

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig                      |  2 +
 arch/alpha/include/asm/perf_regs.h      |  7 ++
 arch/alpha/include/uapi/asm/perf_regs.h | 34 ++++++++++
 arch/alpha/kernel/Makefile              |  1 +
 arch/alpha/kernel/perf_regs.c           | 86 +++++++++++++++++++++++++
 5 files changed, 130 insertions(+)
 create mode 100644 arch/alpha/include/asm/perf_regs.h
 create mode 100644 arch/alpha/include/uapi/asm/perf_regs.h
 create mode 100644 arch/alpha/kernel/perf_regs.c

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index bda8443a7323..74d13a29b8a9 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -31,6 +31,8 @@ config ALPHA
 	select HAVE_PAGE_SIZE_8KB
 	select HAVE_PCSPKR_PLATFORM
 	select HAVE_PERF_EVENTS
+	select HAVE_PERF_REGS
+	select HAVE_PERF_USER_STACK_DUMP
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
 	select GENERIC_IRQ_PROBE
diff --git ./arch/alpha/include/asm/perf_regs.h ./arch/alpha/include/asm/perf_regs.h
new file mode 100644
index 000000000000..6045da1a2a4f
--- /dev/null
+++ ./arch/alpha/include/asm/perf_regs.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ALPHA_PERF_REGS_H
+#define _ASM_ALPHA_PERF_REGS_H
+
+#include <uapi/asm/perf_regs.h>
+
+#endif /* _ASM_ALPHA_PERF_REGS_H */
diff --git ./arch/alpha/include/uapi/asm/perf_regs.h ./arch/alpha/include/uapi/asm/perf_regs.h
new file mode 100644
index 000000000000..afeb6a1584cd
--- /dev/null
+++ ./arch/alpha/include/uapi/asm/perf_regs.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_ASM_ALPHA_PERF_REGS_H
+#define _UAPI_ASM_ALPHA_PERF_REGS_H
+
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
+	PERF_REG_ALPHA_PC,
+	PERF_REG_ALPHA_PS,
+	PERF_REG_ALPHA_MAX,
+};
+
+#endif /* _UAPI_ASM_ALPHA_PERF_REGS_H */
diff --git ./arch/alpha/kernel/Makefile ./arch/alpha/kernel/Makefile
index 4ea5c189e60e..0c04b89676ed 100644
--- ./arch/alpha/kernel/Makefile
+++ ./arch/alpha/kernel/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_PCI)	+= pci.o pci_iommu.o pci-sysfs.o
 obj-$(CONFIG_SRM_ENV)	+= srm_env.o
 obj-$(CONFIG_MODULES)	+= module.o
 obj-$(CONFIG_PERF_EVENTS) += perf_event.o
+obj-$(CONFIG_HAVE_PERF_REGS) += perf_regs.o
 obj-$(CONFIG_RTC_DRV_ALPHA) += rtc.o
 obj-$(CONFIG_AUDIT)	+= audit.o
 
diff --git ./arch/alpha/kernel/perf_regs.c ./arch/alpha/kernel/perf_regs.c
new file mode 100644
index 000000000000..e15081ac95e0
--- /dev/null
+++ ./arch/alpha/kernel/perf_regs.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/perf_event.h>
+#include <asm/perf_regs.h>
+#include <asm/ptrace.h>
+
+u64 perf_reg_value(struct pt_regs *regs, int idx)
+{
+	switch (idx) {
+	case PERF_REG_ALPHA_R0:
+		return regs->r0;
+	case PERF_REG_ALPHA_R1:
+		return regs->r1;
+	case PERF_REG_ALPHA_R2:
+		return regs->r2;
+	case PERF_REG_ALPHA_R3:
+		return regs->r3;
+	case PERF_REG_ALPHA_R4:
+		return regs->r4;
+	case PERF_REG_ALPHA_R5:
+		return regs->r5;
+	case PERF_REG_ALPHA_R6:
+		return regs->r6;
+	case PERF_REG_ALPHA_R7:
+		return regs->r7;
+	case PERF_REG_ALPHA_R8:
+		return regs->r8;
+	case PERF_REG_ALPHA_R16:
+		return regs->r16;
+	case PERF_REG_ALPHA_R17:
+		return regs->r17;
+	case PERF_REG_ALPHA_R18:
+		return regs->r18;
+	case PERF_REG_ALPHA_R19:
+		return regs->r19;
+	case PERF_REG_ALPHA_R20:
+		return regs->r20;
+	case PERF_REG_ALPHA_R21:
+		return regs->r21;
+	case PERF_REG_ALPHA_R22:
+		return regs->r22;
+	case PERF_REG_ALPHA_R23:
+		return regs->r23;
+	case PERF_REG_ALPHA_R24:
+		return regs->r24;
+	case PERF_REG_ALPHA_R25:
+		return regs->r25;
+	case PERF_REG_ALPHA_R26:
+		return regs->r26;
+	case PERF_REG_ALPHA_R27:
+		return regs->r27;
+	case PERF_REG_ALPHA_R28:
+		return regs->r28;
+	case PERF_REG_ALPHA_GP:
+		return regs->gp;
+	case PERF_REG_ALPHA_PC:
+		return regs->pc;
+	case PERF_REG_ALPHA_PS:
+		return regs->ps;
+	default:
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+}
+
+#define REG_RESERVED (~((1ULL << PERF_REG_ALPHA_MAX) - 1))
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
2.54.0

