Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EE6385535
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 02:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791598846; cv=none; b=TdbH4TFh5LQnhPF6ZZdCHT6v3bZulz+BnmUajzm/32dHyku/OzStp7M26YYbPcnJjJpaWKQvYe/xIZ/lFCEGyk5//mefd8/Z3Wti1obn0abeq67kyBZgyJzfJMFNsvzXpNraK9xk3pmCzVbBBWyWL/m8q+xlI03bkujAXZ/U1vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791598846; c=relaxed/simple;
	bh=ajMR9wriE6H4hnRyZehwGFnQ9zm37m15JPxPCyZmK7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KO4oqT0ACKt2+F7Zv6v9A/3EbRCKB2iBmDK1P/Q5NCiXaQ7Fv9GnKXDuoxIdviSSfaDUnH6+7E4LFSrXPFm9mGD2rE4hsVeYJNCfUbpdAJwWhm7t8m8rHvThfywJBLYGO73tZ35Z1KKdQ7ic0Rp6/Hd/cl4AiGY/vNnrs6oIsCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTY9/Jc6; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTY9/Jc6"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8871ada1a26so1587117b3.1
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 19:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791598844; x=1792203644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nptkRAMUsiGRhK+Kku+TFYLcLth8GwQXjFMlm17rysQ=;
        b=BTY9/Jc6jU99bNN0v4EZpCH8aGvASm240KakFik6ciDt5il54DMc4Irf/j1Avi7/Gw
         EGaPr49qsZE3LhSwCOcC5WjBbw4TLhWLUN6nKodFdsRLYmKGnqji3Gavks/W+bV1ivyI
         5mNulEIxsRlEPAx4ilajLiviszx79s0wVtFCa3HqGphZLezV6sS4bt4/LqQMoqi0coAg
         umR1toKIDfO0msclfRELsD/93LrP9FGTFANOackdhhqWCtkTWzHImJQ0pVtXuQ4NLiPK
         MkLFOlyl3PHismg02Y9iuC0WOwrGsRm0Xdl2Raep5t8WRcHdgB2hutHipzj+t5seiegO
         yxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791598844; x=1792203644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nptkRAMUsiGRhK+Kku+TFYLcLth8GwQXjFMlm17rysQ=;
        b=tL427z5QcxTO2ylyHKysJhUeU209oC+XfdVIouNwaKlCfRQozTnwi50b6TfY7B0H0h
         sVYIZRxU46to7LDzCvVTMc2zmQOQGu+GKG5xUX3/Tfb4E/IJrwgFVnhMp9kf340gctt0
         2Ka4OsE1ERH2LVAmrJv8WypRSU50J9isyLlmaeNGg2nNnt1yWwmqEKMPdSwKoHCLiz2/
         7rxutZU1P70T9frq4ChuVM4XbNW0vlXTOeVyvSKHE/Ty9Ad27rbeNBCGoZmvtnomVGPB
         ASgc3t37jP8348rfz6Vkns6NhSP25yE4ZT7Ekhy0GGzQYUCOPtb2doFW3/NSXeEi/507
         jH5w==
X-Forwarded-Encrypted: i=1; AKwUvBxwJ7JMP6ShJBgbytRUW0VUQxO0LPOu2aJgoKEWmyzkNsM7SKym5aZiUdeN+Xbja2KGel68pmt1LO1+wQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJRHfrP5TBcmS9KOYS/Ntk5hxrk0YYAcaVAfo5c8URUQbYrvWLB
	1PdMztrnUKg0IGZbS5ros7UUuJfBslkiNGrQzz1onTPsJVudNZ0aVVs9
X-Gm-Gg: AYBFou0zr4UilAAWAkEKNJ61F1wxaOgRhROzHzdWXeJxzTvkL86NGc7nIeoVWt3zKBY
	dXm8flt9l0n9onNyF4tgwDyXONZb5j1aUQqU/7IdxiWNrOqUiuPpUOHH389b4Cy91cBiS1JjXJc
	mDRi+Z8tTrU8/lbfTL1Tw9xvIzRN3uboiI8RBV04wsk1grBVjvE0oor/f5Lzr6I9Z5/y9DgaHMJ
	1LfsSGVlX0UgRgqHmb2OZmk0JDU/ATWHcufGIvE65FoKYVDiJKCbBYSH48NLmKKHNWgVGqxi4JD
	VBLS5SqkVgPGtZyajpyuJ1++NfQOpgk3u1CLeY0SaCKpFMKQN0UemrflcTJ28QdYot5DjB4YL2S
	kB9Xf9CVk5ySjj2YkNLBHcuzGIpSlsyR22qnkZFfrCQYHyuR52SXmiWGM8bVyhY9z6vNxVsHPJd
	n8jqPxtQLagwxGtWI7Dr/JyX4H1Y9pRfUiQowARAvClZYjtG4GZZ3FBem3dKiAxULSGO9qm22JG
	bjF3J9Uv4BhrYvlMmoQvo/8C2d+i4emvPzkpcrG4Kc2gbGaLcaix84J
X-Received: by 2002:a05:690c:6b12:b0:8ab:400f:75ca with SMTP id 00721157ae682-8b07ee8393bmr10390787b3.89.1791598843713;
        Fri, 09 Oct 2026 19:20:43 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f281184sm13948507b3.49.2026.10.09.19.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:20:42 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: add 128-bit shift helpers
Date: Fri,  9 Oct 2026 22:20:39 -0400
Message-ID: <20261010022039.1610210-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
References: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Selecting ARCH_SUPPORTS_INT128 lets generic code shift __int128 values by
a variable count. gcc open-codes such a shift when optimizing for speed,
but with CONFIG_CC_OPTIMIZE_FOR_SIZE=y it calls the libgcc routines
__ashlti3, __ashrti3 and __lshrti3 instead. The kernel does not link
against libgcc and Alpha does not provide them, so the link fails:

  alpha-linux-ld: lib/ubsan.o: in function `get_signed_val':
  (.text+0x1c0): undefined reference to `__ashlti3'
  (.text+0x1f8): undefined reference to `__ashrti3'
  alpha-linux-ld: kernel/time/timekeeping.o: in function `delta_to_ns_safe':
  (.text+0x2ac): undefined reference to `__lshrti3'

Provide the three helpers in C, as s390 does, and export them for
modules. They are built into the kernel proper rather than lib.a so the
exports are present even when nothing built in references them.

The 64x64 to 128-bit multiply is always expanded inline with mulq/umulh,
so no __multi3 is needed.

Fixes: fd04433a5bf3 ("alpha: select ARCH_SUPPORTS_INT128")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610090831.DSxrGQRc-lkp@intel.com/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Magnus, this is an alternative to dropping the select. It applies on top
of for-next (496e328c6107). If you would rather drop "alpha: select
ARCH_SUPPORTS_INT128" for now, I will resend this without the Fixes tag,
followed by the select, as a two-patch series.

Tested with gcc 16: defconfig plus CONFIG_CC_OPTIMIZE_FOR_SIZE=y and
CONFIG_UBSAN=y builds and links (vmlinux and modules, W=1), and the
helpers match the compiler's inline shifts for every count from 0 to 127
in a userspace test. Not boot tested.

 arch/alpha/include/asm/asm-prototypes.h |  6 +++
 arch/alpha/lib/Makefile                 |  2 +
 arch/alpha/lib/tishift.c                | 70 +++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 arch/alpha/lib/tishift.c

diff --git a/arch/alpha/include/asm/asm-prototypes.h b/arch/alpha/include/asm/asm-prototypes.h
index c8ae46fc2e74..672fea15032f 100644
--- a/arch/alpha/include/asm/asm-prototypes.h
+++ b/arch/alpha/include/asm/asm-prototypes.h
@@ -17,3 +17,9 @@ extern void __remlu(void);
 extern void __divqu(void);
 extern void __remqu(void);
 extern unsigned long __udiv_qrnnd(unsigned long *, unsigned long, unsigned long , unsigned long);
+
+#ifdef CONFIG_ARCH_SUPPORTS_INT128
+extern __int128_t __ashlti3(__int128_t a, int shift);
+extern __int128_t __ashrti3(__int128_t a, int shift);
+extern __int128_t __lshrti3(__int128_t a, int shift);
+#endif
diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
index 84046e730e6d..f77d4a46f2e6 100644
--- a/arch/alpha/lib/Makefile
+++ b/arch/alpha/lib/Makefile
@@ -35,6 +35,8 @@ lib-y =	__divqu.o __remqu.o __divlu.o __remlu.o \
 	callback_srm.o srm_puts.o srm_printk.o \
 	fls.o
 
+obj-$(CONFIG_ARCH_SUPPORTS_INT128) += tishift.o
+
 # The division routines are built from single source, with different defines.
 AFLAGS___divqu.o = -DDIV
 AFLAGS___remqu.o =       -DREM
diff --git a/arch/alpha/lib/tishift.c b/arch/alpha/lib/tishift.c
new file mode 100644
index 000000000000..488e1e483d48
--- /dev/null
+++ b/arch/alpha/lib/tishift.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * 128-bit shift helpers.
+ *
+ * gcc open-codes a variable 128-bit shift when optimizing for speed, but
+ * calls these libgcc routines when optimizing for size.
+ */
+
+#include <linux/export.h>
+#include <linux/types.h>
+#include <asm/asm-prototypes.h>
+
+union ti {
+	__int128_t val;
+	struct {
+		u64 low;
+		u64 high;
+	};
+};
+
+__int128_t __ashlti3(__int128_t a, int shift)
+{
+	union ti ti = { .val = a };
+
+	if (!shift)
+		return ti.val;
+	if (shift < 64) {
+		ti.high = (ti.high << shift) | (ti.low >> (64 - shift));
+		ti.low <<= shift;
+	} else {
+		ti.high = ti.low << (shift - 64);
+		ti.low = 0;
+	}
+	return ti.val;
+}
+EXPORT_SYMBOL(__ashlti3);
+
+__int128_t __ashrti3(__int128_t a, int shift)
+{
+	union ti ti = { .val = a };
+
+	if (!shift)
+		return ti.val;
+	if (shift < 64) {
+		ti.low = (ti.low >> shift) | (ti.high << (64 - shift));
+		ti.high = (s64)ti.high >> shift;
+	} else {
+		ti.low = (s64)ti.high >> (shift - 64);
+		ti.high = (s64)ti.high >> 63;
+	}
+	return ti.val;
+}
+EXPORT_SYMBOL(__ashrti3);
+
+__int128_t __lshrti3(__int128_t a, int shift)
+{
+	union ti ti = { .val = a };
+
+	if (!shift)
+		return ti.val;
+	if (shift < 64) {
+		ti.low = (ti.low >> shift) | (ti.high << (64 - shift));
+		ti.high >>= shift;
+	} else {
+		ti.low = ti.high >> (shift - 64);
+		ti.high = 0;
+	}
+	return ti.val;
+}
+EXPORT_SYMBOL(__lshrti3);
-- 
2.55.0

