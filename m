Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE803393DCF
	for <linux-alpha@vger.kernel.org>; Wed, 25 Feb 2026 11:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772017584; cv=none; b=apX2I4XuIjmLh2e57H0O7HEGShfg7q5ByH2rfiwtGg0Azsv5Bjju43XlXyiFF3dW9diFET7n/wA2bj2DxHSkEYJUEJoN9/O40RWutIwFKkKT5CYVeKTkdooQVNdMjxhziDLCUTKt19mWs/KTTZG/kUPPnzTwu18ORnMWzAcsDMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772017584; c=relaxed/simple;
	bh=KZGk8jShgJ+UVPPD4bygf8HYr4zzyZJVBv3mjU3pj3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ixGValg53dl79854I9KV1LIHjdfymXRUwPar0dSrcVZXttaexntdRx86R3WG5wC5UBDBDsmriFNBE4zoojJVPsp7ytlq5+KX5gzRz/gqFUwGJ1CTXB+liPtZBKwxi+KZ8ItdTE6jXhjNWIy1kY+NcU/ehmhFGqGssX3HmGpzcBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEmOAEXh; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEmOAEXh"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3870c7479c0so60870221fa.3
        for <linux-alpha@vger.kernel.org>; Wed, 25 Feb 2026 03:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772017581; x=1772622381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bvNM7nuV1kvyZuXbd57dM/KygANB/KeHuFkkf7XGSk=;
        b=mEmOAEXhz3v07o7JITRyYucMrWSUtgQiGFAVZOtKX6aedSKDR5mtjMsiTalMQY9gSV
         XQtkKXtZaVJonIPrZR+XSrRYc5VXjRc646Exx38NcXpZrbex+326wcrRrvH+ErA3dr79
         VICMK5K0OvNRgLpiSQZzsMGAIE/Mul7OZExm/Iqsulm8ARFMh74uKf+tP9zFhEcVqmUK
         +N0wc2DlgVatdV9Do4esgXRHda5gMcd3XE096HUJ9p+61dtuxLXgCM44S7dwmQlKC2/3
         kk0sMTeeLs0Z9xpUz4cAhULeZmQeHd2Xx/dQQYbt/AxcvXOHcaf2MqWgYAbx/67NTqa5
         IAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017581; x=1772622381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6bvNM7nuV1kvyZuXbd57dM/KygANB/KeHuFkkf7XGSk=;
        b=VkdTJ1P4ivUlWsoXi71XACVnRcY1N1hZLpxlGYstls++sp1VWknu2Wh3PvkD/PxQq+
         PsUXUPiJ/PQImxrQPqk+oP0mxklJAML3Tmxfj+Q5QIc03T9RMkYhltbPUr4lw7jfBvYz
         jG6Dzon5hPL/RF2l1bmhI/sJDxqEMkSZfG1QWkItis28BetAVVoq/11h7/JK56hfO1Mm
         VVlOqyApv4mxZgDU6ByT2XEZxqcyIGvn61cqKqShTkXZ99WspoFu6ZesNFMiupiaPUlE
         KtZ2T/8ppv30N579LIu8RrG0b8IlSkt8SjrzVP1RvYPJmGGbZ8KUx5aoWI02exOsYlk3
         4XsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUZWEx45Yuf8f+X2rtrI8jiJYZhAirEuSwg0mEN9iqDeA4wIuODDT6vonyFGzSlE8VIEt9q7SGSdkKEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyInjjX0L86Yos77kshBirCrxSEAfWeukLOHz8LxtG1EQ/WV0TS
	vaxURZ46/itXWSTVJKXobLj6ZuM/xlCSz9D4npH+5R+87nd0OeugEBuS
X-Gm-Gg: ATEYQzw3RnS9oY+kopfaDYP4SzgUTjnOFolizS/5bPzXxVumexRs82Q8SUpZXM9d6wn
	7gH5j54fGaY/OgkWnFajAWg2D3Lp7qldxQcX/0hqazhr/l97BnV0YTpe434CFzMieHE0MK4vGjP
	GFwWiUDyv9N+NFMtCUtKvCZVisi+Gu8HWi+5Iks3+6kOJNlbZTe/Rys1+lo6Gra2+7mKf2zoSwp
	wv4tOjmiuVqcgaQcm9DlaGjLDnT7M9wWFni2lwQbdBeVJbH1lmzILUjmxN+7id8m6QbA1vtbz0V
	y6GhKDJ1KEWLs/vbgT+Jy4E7vJC0YbqCJCviwGmLVZQ84ChBSjw58Knsecl8LbLFcyXge7GyTub
	Rv8LKYjZdJYvlGqoFebBDY7ec+NKzosbWBPDAmvMO94KNmmeTT0jdp+Twkgkf6ElCXSAB4Px8cD
	UIpFj1dgAf/6SDIUrVAEPb0ZBM8ZM652IPg0wkYAlEw4DuceBb0ljB4sXmauPPjzV87fkIV29Fp
	THi/woJSbwttK2FLQ4tQb5j46KFS/o5/rTUeXU5sIdJQw==
X-Received: by 2002:a05:651c:1ca:b0:386:fdcd:b2c4 with SMTP id 38308e7fff4ca-389a5e6d6f7mr43765891fa.35.1772017580727;
        Wed, 25 Feb 2026 03:06:20 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78d2326sm29347181fa.15.2026.02.25.03.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:06:20 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	skhan@linuxfoundation.org,
	chenmiao.ku@gmail.com,
	shorne@gmail.com,
	corbet@lwn.net
Cc: glaubitz@physik.fu-berlin.de,
	macro@orcam.me.uk,
	macro@redhat.com,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2 1/1] alpha: Add support for HAVE_ARCH_JUMP_LABEL
Date: Wed, 25 Feb 2026 12:02:46 +0100
Message-ID: <20260225110548.31431-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225110548.31431-1-linmag7@gmail.com>
References: <20260225110548.31431-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement static key (jump label) support for Alpha.

Provide arch_static_branch() helpers and implement
arch_jump_label_transform() to patch a single instruction site
between NOP and BR, with appropriate I-cache synchronization.

Tested on Alpha UP2000+ SMP. Static key sites toggle correctly
under tracepoint enable/disable and repeated stress testing
without faults.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 .../core/jump-labels/arch-support.txt         |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/include/asm/jump_label.h           | 66 +++++++++++++++
 arch/alpha/kernel/Makefile                    |  1 +
 arch/alpha/kernel/jump_label.c                | 81 +++++++++++++++++++
 5 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 arch/alpha/include/asm/jump_label.h
 create mode 100644 arch/alpha/kernel/jump_label.c

diff --git a/Documentation/features/core/jump-labels/arch-support.txt b/Documentation/features/core/jump-labels/arch-support.txt
index 683de7c15058..119c71b7cec0 100644
--- a/Documentation/features/core/jump-labels/arch-support.txt
+++ b/Documentation/features/core/jump-labels/arch-support.txt
@@ -6,7 +6,7 @@
     -----------------------
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: |  ok  |
     |         arm: |  ok  |
     |       arm64: |  ok  |
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 6c7dbf0adad6..71db2cc7b3c4 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -41,6 +41,7 @@ config ALPHA
 	select MMU_GATHER_RCU_TABLE_FREE
 	select SPARSEMEM_EXTREME if SPARSEMEM
 	select ZONE_DMA
+	select HAVE_ARCH_JUMP_LABEL
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
 	  marketed by the Digital Equipment Corporation of blessed memory,
diff --git a/arch/alpha/include/asm/jump_label.h b/arch/alpha/include/asm/jump_label.h
new file mode 100644
index 000000000000..b570a7cef4c9
--- /dev/null
+++ b/arch/alpha/include/asm/jump_label.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Alpha architecture jump label (static key) definitions
+ *
+ * Defines patch site emission and jump table layout for
+ * Alpha static key support.
+ *
+ * Copyright (C) 2026 Magnus Lindholm <linmag7@gmail.com>
+ */
+
+
+#ifndef _ASM_ALPHA_JUMP_LABEL_H
+#define _ASM_ALPHA_JUMP_LABEL_H
+
+#ifndef __ASSEMBLER__
+
+#include <linux/types.h>
+
+#define JUMP_LABEL_NOP_SIZE 4
+
+typedef u64 jump_label_t;
+
+struct jump_entry {
+	jump_label_t code;
+	jump_label_t target;
+	jump_label_t key;
+};
+
+static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
+{
+	asm goto("1:\n\t"
+		 "nop\n\t"
+		 ".pushsection __jump_table, \"aw\"\n\t"
+		 ".align 3\n\t"
+		 ".quad 1b, %l[l_yes], %0\n\t"
+		 ".popsection\n\t"
+		 :
+		 : "i"(&((char *)key)[branch])
+		 :
+		 : l_yes);
+
+	return false;
+l_yes:
+	return true;
+}
+
+static __always_inline bool arch_static_branch_jump(struct static_key *key, bool branch)
+{
+	asm goto("1:\n\t"
+		 "br $31, %l[l_yes]\n\t"
+		 ".pushsection __jump_table, \"aw\"\n\t"
+		 ".align 3\n\t"
+		 ".quad 1b, %l[l_yes], %0\n\t"
+		 ".popsection\n\t"
+		 :
+		 : "i"(&((char *)key)[branch])
+		 :
+		 : l_yes);
+
+	return false;
+l_yes:
+	return true;
+}
+
+#endif /* __ASSEMBLER__ */
+#endif /* _ASM_ALPHA_JUMP_LABEL_H */
diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index 187cd8df2faf..8a357b78eab1 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_MODULES)	+= module.o
 obj-$(CONFIG_PERF_EVENTS) += perf_event.o
 obj-$(CONFIG_RTC_DRV_ALPHA) += rtc.o
 obj-$(CONFIG_AUDIT)	+= audit.o
+obj-$(CONFIG_JUMP_LABEL) += jump_label.o
 
 ifdef CONFIG_ALPHA_GENERIC
 
diff --git a/arch/alpha/kernel/jump_label.c b/arch/alpha/kernel/jump_label.c
new file mode 100644
index 000000000000..ff061a09d813
--- /dev/null
+++ b/arch/alpha/kernel/jump_label.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Alpha architecture jump label (static key) support
+ *
+ * Implements runtime patching of static key sites by replacing
+ * a NOP instruction with an unconditional branch and vice versa.
+ *
+ * Copyright (C) 2026 Magnus Lindholm <linmag7@gmail.com>
+ */
+
+#include <linux/jump_label.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <asm/cacheflush.h>
+
+/*
+ * Alpha instruction encoding helpers.
+ *
+ * Branch format:
+ *   [31:26] opcode
+ *   [25:21] Ra
+ *   [20:0 ] disp (signed, in instructions; hardware multiplies by 4)
+ *
+ * Unconditional branch:
+ *   BR opcode is 0x30.  We use Ra=r31 so no link register is written.
+ *
+ * Updated PC semantics:
+ *   Target = (pc + 4) + (disp << 2)
+ * so disp = (target - (pc + 4)) >> 2.
+ */
+#define ALPHA_OP_BR	0x30
+#define ALPHA_RA_R31	31
+#define ALPHA_BR_DISP_MASK	((1u << 21) - 1)
+
+#define ALPHA_INSN_NOP	0x47FF041Fu /* BIS r31,r31,r31 */ /* common Alpha NOP */
+
+static inline u32 alpha_br_insn(unsigned long pc, unsigned long target)
+{
+	long off_bytes = (long)target - (long)(pc + 4);
+	long disp = off_bytes >> 2;
+
+	/*
+	 * 21-bit signed displacement: range is [-2^20, 2^20-1] instructions.
+	 * If this trips, the site/target are too far apart for a BR.
+	 */
+	if (disp < -(1L << 20) || disp > ((1L << 20) - 1)) {
+		/*
+		 * Most arches WARN and fall back to something else (or BUG),
+		 * but jump-label sites are expected to be in range.
+		 */
+		WARN_ON_ONCE(1);
+		disp = 0;
+	}
+
+	return (ALPHA_OP_BR << 26) |
+	       (ALPHA_RA_R31 << 21) |
+	       ((u32)disp & ALPHA_BR_DISP_MASK);
+}
+
+static inline void alpha_patch_text(u32 *site, u32 insn)
+{
+	WRITE_ONCE(*site, insn);
+	/*
+	 * Alpha needs an I-cache sync after patching executable text.
+	 */
+	flush_icache_range((unsigned long)site, (unsigned long)site + sizeof(*site));
+}
+
+void arch_jump_label_transform(struct jump_entry *entry,
+			       enum jump_label_type type)
+{
+	u32 *site = (u32 *)jump_entry_code(entry);
+	u32 insn;
+
+	if (type == JUMP_LABEL_JMP)
+		insn = alpha_br_insn((unsigned long)site, jump_entry_target(entry));
+	else
+		insn = ALPHA_INSN_NOP;
+
+	alpha_patch_text(site, insn);
+}
-- 
2.52.0

