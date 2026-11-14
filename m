Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794649718;
	b=E1YwQ/eYKyCvdcZU36K7lffmm1iVicfAGILxqy/YYNbVWhT0KeC5ziq+xXxoC47tt1rE
	 G8nGZpG3k5BxjTOnG2ut78+YSEes3QltRmUkw6IyoF+El4YBur+h0xuhd1r+DrmczjuOQ
	 e5E8CJJL//THtz+UL3Zq42c+cep3Qwvaq86Lj3zk7BpNngtm418k+4HnLz7GvzepbARBQ
	 01BGJhAOosqRuPhMRhPOYwyrSD2LwJU1dLZpCjuyLbtbojrdtC+fm9FwuLWgH12StOBOF
	 Km/TLc/4OI6KWE2RLXSsNm3F9cJJpalTQYWznserHeAFdkw3h6UVt6SpaPKFtCey0CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794649718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cGthlXWV1TPnbXav8/uYptPiYuvwIvb0LRz3xc/iwOs=;
	b=eA04jjZK7q9VWLHoO2ntTasTJK+q83m97FewdgESza0yWPmGknjIfN+edlNgwIjBHggc
	 +ocwmbLvphGBvrRJ5a9ehdyLuxMUOmOTnRdqclCRT6UOIKQ3ALWrTFr4btTEM7uGjjNL9
	 Z56csrcTKD6JpNDKqM5Bib+UOa6JHIbaLjIxGMo/2ljVOjqSN6dL71gZFC5qE7VlSgSDS
	 wi698Sy9vROgOYINWHpDh0wlKo+1JGXdQMXp5pbW3PidMnRZy35DXSfI/Qj8ECM2JQDhi
	 4Td5C+hiIBIgcHsrQFSxPGKXepdemjf22SiGmBFqB3gavSuo5v7YSfXOMwCYgotzESg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwrD58tL;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817B5606A333
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 09:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 817B5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwrD58tL
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so3144918a12.3
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 01:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794649717; x=1795254517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGthlXWV1TPnbXav8/uYptPiYuvwIvb0LRz3xc/iwOs=;
        b=mwrD58tLg70M8xqSV+oqj96b/06LwWYbQEwB3QoQKHV4dEfp0pNSWr6HVnD0UrCY+7
         Elf70LNvG260+GWlJtE8H3E0Tc2tDJRX8an4aNvduL2CHHHil/VEdYwpHc6djmMU2Ly8
         ZDhunIPrW6ob4UTjvazWOvDsVju9+pfmB+rdLmTVc0yiW5dS4haWmYCmlA49lzkNQGqH
         pgaubz3M8wZRw9TF3wup1BvKVwmkHfnd3jWygoAt3z1mL6O5vPP9nqqfIVX0de4DuWVV
         D8wKQiWnHM1hakPlh6xpAHtqn0oaIFK9JtLWdEiHpZ3dg7qggzQ7J/Spxl4eQdBo4TIB
         aU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794649717; x=1795254517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cGthlXWV1TPnbXav8/uYptPiYuvwIvb0LRz3xc/iwOs=;
        b=2AnebB3W1m+JxLn8lXJBdDhW1ebWb8B4gc6EnEUazGUXbe3m/aKjGbketMDvx6CaFg
         /9jO31fb1sEJtNVBZgUp0p+UYqeKpc2d2zA+oYGM7d4DgwRaHBUia6XGf2q3muKPTmzx
         0eCZjIasTLbweJ94Z0auM11VdJ/t9HpohhOjHEPp/jovWoE0UZ7p4eLB6W0qF2Md00lL
         KTXNhO15Wraj453S9b8bQC/GtHR8+X01gMOYaxYXkcivcP2EHzjlb0sLK31tbk1J1KtN
         i7mppgTSuEy3EwfHkmvHlBsZ1SYrEsQLBw9NWlZ9s5nvYrKobi9QOCXI1Zmwxdk58K8D
         sa8Q==
X-Forwarded-Encrypted: i=1; AL+hErHZ5bYL9o9aE77YIJSv0OAuZp1xSbh/URtuQgoTMUNg6XDYa5RCyIs7jjQ5iwgq28Dc4k/J+es6JPrmWg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ehFvwL1uTp6RS5ljPzOZXu85xCER5z+Jpm8i2a/XhbiaR+whG
	z07GpWFcWMe3qmjFdrJj1sB1feGv5paq8z9JH09EUVOy/o9a1gCSc/Vc
X-Gm-Gg: AYBFou2W+O24vqAFpKc1KSbDVKoWoWxSR9GZG9fNhIL65MJCjeinIlpEYnC90jMn2ui
	l6wvJk0+wbDJyoQeUTRlos6DNpgDyxiWpoff9FkeWlco1jb2lrrs2g9dFqIXpMJcWxTF7KhU/eX
	D90zw2IZE0kPQFaJx6qhUP4FpSw1JPqamm/6Qyi9x7RVNdn84hdfb7Kv25yQF1Gfw97mIe0iEoX
	yq9+5Lf8XKE6AGPAZ5TvQp3qmgBeEKX3wXsfI8Foa+tjsXT7OKsKCNJ7z9da5Cc1JhccQDR0d7z
	xwSD578CpLrKgrUn0O4bV/vpdMO+AuBcNduo01BmBJQA/5lj+x9NHO4Fr0vLZ8m0D3h6iFsbHCc
	Z2JcymkkH8pHnFJPUvrvFqnZ8KuyomLBHA/tPMIwwjrkzCGxyNm1CVTvl1IKYR4MYExcppySIYI
	/uiH4+hP5WZ2yAY9tHCpdZFT2bMOjbDX1JC7ie6fnqZJ6nXK8blXDY002mPsElla9zZto1E/M1R
	073eE/Ooq6UwKtgOUlpAc4+l7D02GkUd4mzcMCRcJioWs9itoAWVauiKYPuFpbrBIilYWM4XgB3
	Wxl2aWrfiMpXaBCrV8llhv6/ODRP8QzHyTUAuarpd31J00ac2tnfhIwd/HaQ9z3NW8xXtEM=
X-Received: by 2002:a05:6402:4413:b0:6b5:9150:edf3 with SMTP id 4fb4d7f45d1cf-6b7c0d144a7mr4237429a12.43.1794649716926;
        Sat, 14 Nov 2026 01:48:36 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c672asm2062135a12.15.2026.11.14.01.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:48:36 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v3] alpha: Add support for HAVE_ARCH_JUMP_LABEL
Date: Sat, 14 Nov 2026 10:48:19 +0100
Message-ID: <20261114094826.1282965-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114094826.1282965-1-linmag7@gmail.com>
References: <20261114094826.1282965-1-linmag7@gmail.com>
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
 arch/alpha/kernel/Makefile                    |  2 +
 arch/alpha/kernel/jump_label.c                | 79 +++++++++++++++++++
 5 files changed, 148 insertions(+), 1 deletion(-)
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
index 850f1265cc55..4088cd56866e 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -92,3 +92,5 @@ obj-$(CONFIG_ALPHA_TITAN)	+= err_ev6.o err_titan.o
 obj-$(CONFIG_ALPHA_TSUNAMI)	+= err_ev6.o err_tsunami.o
 
 endif # GENERIC
+
+obj-$(CONFIG_JUMP_LABEL) += jump_label.o
diff --git a/arch/alpha/kernel/jump_label.c b/arch/alpha/kernel/jump_label.c
new file mode 100644
index 000000000000..9168d5da978b
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
+#include <linux/jump_label.h>
+#include <linux/kernel.h>
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

base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
-- 
2.43.0

