Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0823434CFB9
	for <linux-alpha@vger.kernel.org>; Thu, 19 Feb 2026 17:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771520438; cv=none; b=KfTKhUWTMrFO2jtBQtu3xz2pV47Rc68n8Z2wVAkVT9/gi5jPDooR2eCBsmW6BBzm4p5kwIJqjMy5+f9sc1MDp1Irrvr1pPF8YztXbSg4dK5F7kGN0oPBFUTn07xQTmgzZqOnilGSbRIiL46aQM13yxUhXkVsxjgpVQoePEjy8Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771520438; c=relaxed/simple;
	bh=usaSafH/3bwju2Rwu/8taBKJ5OpmmOQepzkGFUWOVOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WuygDttHGNleB6gW9z3+j832S93UmmBqi4mFDKECf1e2ZG8gc7uI+wrJyPlrxFrvTB0Me+RDVxx/v2zzaduIPgygOkkYQyfyKLZQbt13lexrqVZlMn+Oo2gMP6Z13yH6A6JAvpjIxAmI5w8IPRoMjgb2BrqG+NkfKHXh8uQO9h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhotuFR4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhotuFR4"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59de8155501so1190739e87.3
        for <linux-alpha@vger.kernel.org>; Thu, 19 Feb 2026 09:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771520435; x=1772125235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylDqjRlTnxhdcC81WSF8MMZDNKWYvgVW8vEJnMDl5os=;
        b=MhotuFR43seU1Vd+TzYf+Kpwn1mtmdOerSKclt/zwNydt0lOmbmO7xCtmaNScy2fSq
         IqrpdpNlU284aMsuadQI8in6DiLc3IxT8siI5mfNltqrJrWa/MJlQMwj11FOxAB6e8C4
         5jRF5/JdXMnWmmy80VaW3O/Rqki2JCv4rA+Y+iT/MRSVEuKiNLtACaRTkin9WEyQV8jH
         +m9roasMLD8TLdUq8oSpfs3QZnGeljwQ4TlCzURBo2EXyNIB6uWZPiYslp1hySU7wQM7
         46gALBoISNB+4QT9OVbbQZs9Zo1Unfxikoux49d26senvb5KjtC5ypOn3vkccxI0GQxa
         B9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771520435; x=1772125235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ylDqjRlTnxhdcC81WSF8MMZDNKWYvgVW8vEJnMDl5os=;
        b=xJRNq+O7Cgx6UfYzhPRJkmYb/AJgDAWm8yIT6N635hdOL3TdKBMRYoKCoKGQXJkBsu
         mbe3B4jxb7Xdk2zBjfciGvz69hlmHPjDXq2jG9Vj2OCVpWepuITZFy2VlMjFXWPr9YI4
         bVbmDcKTVBt+g5sf5+NizHqrq6yQlL3hp0oOrU0INXFHBE+e0eY3sjSHsxeX1Or7TrPm
         58QVHReXzecdgZA3EYQZywfVW2d9o9AXsN05VQxkbeF+nyQlln3MJGNGfLMe3/osaZox
         XCfkZhQjwx8g6SCkLi5JU6dDrNSnLr/31+PyJZiV03qyM9P7Wxx/MPkTh0Wn1h1GjFcj
         HymQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdprEldYC0zciXh/cfFUJmpuHhmeJaHAzcYbaO3cEYOTFGcE0Zx4bHOgWVAbirHNgXngHnF5qd1OJp3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ7wtjzDjOOHiMAJu1nh31EAmdVzG5efPeOmO11f/P8afwkI/Y
	y/NwWis6Na46IWq1LUS3qciaoYC68uOrdHa12sZKvMycD2D0VvCTKQv0
X-Gm-Gg: AZuq6aISMOB6UUMOqC3deEdd1Jh30B6vGbt5w3Oa7pyN7odQKcYfMaGA5WWXeNmvWSZ
	moGNv4AQZP+QEu8El+GEC9MRKxUK0pX0ONh0qXyvNN8Ay8/nGfRbaRgSX/deZUUxPqLHZgijbv0
	4mO2TxNnoYRCuDGmJdTbMfP98JxihMNpB2VK2jeHKvQRe/qllb3qoz27J2rWqe3M6VEKbKHVkOg
	wUDoFo7WO0SOmgnlvGgzFEkMh1WQ+02id2cDRAvzEe8fRhlcANSAx6YliEQgKOS8jof2ofS0WMV
	6hBdms9Y0OzMJK3ZzAFdAaBZmufqCpazrj+gbnTK5xnnt2fMs1zSKLsaRafdzzRyFiP6g9Mz7Sm
	rJ7ITe+sByPts3Og4nxmFs4F7iBC/8bQvtK7ZbkmhG4rbqFRfOvpquU0/5JNNVVoO10cvzRdvZb
	bTzZ8rFtLvJv85VGNJY8+2ztD+h3YgQCaRitAef2xcxFg9IYcMGVA1r+Amgnyuk7+iiq7V7Veok
	9qWk+ixXw546Ka2X8ubkpb1DJ32V4Um6+0=
X-Received: by 2002:ac2:4f06:0:b0:59e:144:64b6 with SMTP id 2adb3069b0e04-59f89751253mr1053530e87.21.1771520434655;
        Thu, 19 Feb 2026 09:00:34 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b222esm5435943e87.80.2026.02.19.09.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:00:34 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	glaubitz@physik.fu-berlin.de,
	macro@orcam.me.uk,
	macro@redhat.com,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 1/1] alpha: Add support for HAVE_ARCH_JUMP_LABEL
Date: Thu, 19 Feb 2026 17:58:32 +0100
Message-ID: <20260219170013.15884-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260219170013.15884-1-linmag7@gmail.com>
References: <20260219170013.15884-1-linmag7@gmail.com>
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
 arch/alpha/Kconfig                  |  1 +
 arch/alpha/include/asm/jump_label.h | 66 +++++++++++++++++++++++
 arch/alpha/kernel/Makefile          |  1 +
 arch/alpha/kernel/jump_label.c      | 81 +++++++++++++++++++++++++++++
 4 files changed, 149 insertions(+)
 create mode 100644 arch/alpha/include/asm/jump_label.h
 create mode 100644 arch/alpha/kernel/jump_label.c

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

