Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735483;
	b=I1+60RiAd1oLMDG8G4B0B1JjaYtXE7oXrraSfo1rVoUrFLg4jLRsI0vo01W7eaefG0yu
	 qgGSOi7DMXhcx35foaAuyoaTHQuAPHRiOtBm0Lx29LVRs7EsOQJpUTCEBlyk3XAYpypl5
	 alnbbKvBGgLKTRrtPDPu4r2UowPFA2J6mdTtBJB+H8u6zifBRiS8aavvzy1GBLguIu9ek
	 j8teT6zaX3rQVnuKG/Bphpqs1VGd8eDKsOaaqJmUUry9TieKbYKKWhb4QlJo4G93ZvwMR
	 P7OF1pSZljS0qkQkoYMoNPDqkoIwiRX2vKfwtSmvzF0U1OS6xuY80FHWnXgcIWRqQlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L7xE73YnacVCImHadDlbM9nSN9zvnBeeDbefiAX2ogU=;
	b=y/Z5pPk80y4UDN5UdrK5BGnCBsjHCi9bmdaJZGt3RWWxPpWB8DV3YPE97vX1jM+j78sQ
	 i1i/ei2vUvnF/s6/BCBsLQHvreMGtS3xIKfEfdrUhangJc6e2723S/iWJNVdCls5n/XFH
	 inRS8XB+B9jEwNDcRjRK9QSbXHCygtkNfXHoENNYPnlL5E61noLLm2A7fkWBOE9FG2rJW
	 bi6jCxhSm3d76m0gG8wRX1ZbEoRqvivVegC4D9X56hmuREKCZMvXZnJDBOyEmbt9qHSjb
	 zl1JPqKcWnqh0MAyVbZsDREm/ECDReTkIaBDc87tS/ws8XWFUGNFuWDvBWcZpcONdFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihMTyoyf;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0B5606A31D
	for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 09:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE0B5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihMTyoyf
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adfe77d336so26842521fa.1
        for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 01:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735481; x=1795340281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7xE73YnacVCImHadDlbM9nSN9zvnBeeDbefiAX2ogU=;
        b=ihMTyoyfTelnyWJfpjFKLs2RK0I/f5OSe5JMBADPOP6k30mgnOysCtRMeLcAjaD1Ls
         4Y7vuH46kqGe4IqbEw/YybIgQYi1ZWgc+2rIV28P/lB3eEM4dVPLKBHFCRYxznSnTslY
         qvt2t9hrZl9Vzsd9qU5AlsUPzfqqeEwZItiR8D+alWt3rqbT+fhybik4hq5DKKY0NM45
         JRDMRYjPaLVmBTBq6Cma4Cgzo2L16nRxyg8fjEFOIOe3mC+SC2RHkeqkcCpudGwgq0LI
         ajdMX8dm/PvU6eKSboImzVgAMq0BfDML1d86rRUPltoe/9bpU4Ar4Z66bGT7WVS4qlrr
         WAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735481; x=1795340281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7xE73YnacVCImHadDlbM9nSN9zvnBeeDbefiAX2ogU=;
        b=2IL8/x/VUtaAi/AhMxurigDDOXKEHDPHR97yiBzdQKO5Ai8iXFYhuK0F/vAjmqiARh
         Wn6ejfNdIgXDVeyiVpVD80fi608hbOHd6Oam8vB1P0I7r/Gt7XG6G2vkmAgTXuj80YQy
         ukYDF/rmi1uq6NQE0+5CEzl5GYw2lJRcvAJP+O5PNxK7aSFNdkmfSy71RnVnH/ronmSV
         wo08wuD4pD0oPmZn4mhCwQEbhjljykQkRdN1ybvrGrAz96SBaraisr6k46QONg99U7aT
         3PgQSLGmSYC24T4bvCwfGMXFv/VJBtHwc60j8COjujaoc1oXfNVNPOZbbwRU7oB5a3Oc
         v07g==
X-Forwarded-Encrypted: i=1; AL+hErHCAwRt8/Cl2KsRMwSlYB5s+Kjui5qtpKXyFVs9Z4gLs3+nGf7kdBNjQY4Tp/5qSaxYcWZjWOx3q3+h8g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9glLWbVuhfT3zEyW6NK/9NbpxhaJi+A4H1JB5jV/jcWiMsMHZg
	F9YKscKg09UY/T3/Oc3WWGT2+MDAg1g9LTdh2lzsr4Z5pXqYiZaia7sR
X-Gm-Gg: AYBFou0x97thbGbHZV97Z4WjMD0hm+KPnmiPy8kf+UCyRwx6+bS1zXo2XdJLZPcetPn
	gB9OJbUANoBlEr4LiqRKsUmpwPQlQ1mRuRxsiLpKEjQNP7jDmWWCN1ij8c8HRZeuNCmgXZWdt/Q
	xUyrWOFoR13lHzIRJ4z8pM9XBXPztwTvZqBYzQVm4aNYeuuR+neLJ4a40JhcT+8COd+pcV/sssE
	A1ZcjeB6TPDQT0J5fBsoznIrrg78KDy7AEK3psb0Jfl04/tMrwp0yY++Y65QImcXnAe/ER7JAvf
	3RYY97UPbV4kTPytSBiNcxMGhwpITBifBEYPxzXfiMbhyOxVtP82RsJFd6R3PpSPk2DmUK9f5no
	uHs6sDNtz46Sne3xESDst5yMOOyysQDGPNUMVC6ucRbxqxcY3MLmo5ZeyhqTi8L9BnNa+aHzEKx
	2+99E8TMjBmtR+N3XLMXC76rdzbCBG3mJq5ba4bJpNOrEJlJ7Pt0DVkmRt2fOWPrPWPhNXSWSI5
	aqCpt8m/pgXxlkrUnGMpfYNsvcrwcg5ZwpxKDHEHK6cGCVWMnHnyYpHs2RB+2ctcWIV0E1p3N56
	JdJ6fO+IOl0r9wawn5A2f8NymH2dO+BgtBtcbw862FJxnZGKQRuWoo/M9Qy8fcvxrC7uT34=
X-Received: by 2002:a05:651c:b0e:b0:3ab:4014:884b with SMTP id 38308e7fff4ca-3ae2b40f63bmr24055211fa.1.1794735480777;
        Sun, 15 Nov 2026 01:38:00 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7ae92dsm23598851fa.23.2026.11.15.01.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:38:00 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v4 1/1] alpha: Add support for HAVE_ARCH_JUMP_LABEL
Date: Sun, 15 Nov 2026 10:37:48 +0100
Message-ID: <20261115093752.1287968-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115093752.1287968-1-linmag7@gmail.com>
References: <20261115093752.1287968-1-linmag7@gmail.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement static key (jump label) support for Alpha. Emit jump table
entries and patch instruction sites between NOP and BR, synchronizing
instruction caches after each update.

Warn and leave the instruction unchanged if the target is outside the
signed 21-bit branch displacement range.

This relies on kernel and module text being writable; Alpha does not
implement STRICT_KERNEL_RWX or STRICT_MODULE_RWX.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 .../core/jump-labels/arch-support.txt         |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/include/asm/jump_label.h           | 65 +++++++++++++++
 arch/alpha/kernel/Makefile                    |  1 +
 arch/alpha/kernel/jump_label.c                | 79 +++++++++++++++++++
 5 files changed, 147 insertions(+), 1 deletion(-)
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
index 6ccb2d230326..e7e7cb37d670 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -28,6 +28,7 @@ config ALPHA
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
 	select HAVE_ARCH_COMPILER_H
+	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_GUP_FAST
diff --git a/arch/alpha/include/asm/jump_label.h b/arch/alpha/include/asm/jump_label.h
new file mode 100644
index 000000000000..df0b59530c85
--- /dev/null
+++ b/arch/alpha/include/asm/jump_label.h
@@ -0,0 +1,65 @@
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
index 850f1265cc55..279616993fb9 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_SRM_ENV)	+= srm_env.o
 obj-$(CONFIG_MODULES)	+= module.o
 obj-$(CONFIG_PERF_EVENTS) += perf_event.o
 obj-$(CONFIG_HAVE_PERF_REGS) += perf_regs.o
+obj-$(CONFIG_JUMP_LABEL) += jump_label.o
 obj-$(CONFIG_RTC_DRV_ALPHA) += rtc.o
 
 ifdef CONFIG_ALPHA_GENERIC
diff --git a/arch/alpha/kernel/jump_label.c b/arch/alpha/kernel/jump_label.c
new file mode 100644
index 000000000000..69475e840e46
--- /dev/null
+++ b/arch/alpha/kernel/jump_label.c
@@ -0,0 +1,79 @@
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
+#include <linux/cacheflush.h>
+#include <linux/jump_label.h>
+#include <linux/kernel.h>
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
+#define ALPHA_INSN_NOP	0x47FF041Fu /* BIS r31,r31,r31 */
+
+static inline bool alpha_br_insn(unsigned long pc, unsigned long target,
+				 u32 *insn)
+{
+	long off_bytes = (long)target - (long)(pc + 4);
+	long disp = off_bytes >> 2;
+
+	/*
+	 * 21-bit signed displacement: range is [-2^20, 2^20-1] instructions.
+	 * If this trips, the site/target are too far apart for a BR.
+	 */
+	if (WARN_ON_ONCE(disp < -(1L << 20) || disp > ((1L << 20) - 1)))
+		return false;
+
+	*insn = (ALPHA_OP_BR << 26) |
+		(ALPHA_RA_R31 << 21) |
+		((u32)disp & ALPHA_BR_DISP_MASK);
+	return true;
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
+	if (type == JUMP_LABEL_JMP) {
+		if (!alpha_br_insn((unsigned long)site, jump_entry_target(entry),
+				   &insn))
+			return;
+	} else {
+		insn = ALPHA_INSN_NOP;
+	}
+
+	alpha_patch_text(site, insn);
+}
-- 
2.43.0

