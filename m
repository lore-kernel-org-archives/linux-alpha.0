Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEF63909A4
	for <linux-alpha@vger.kernel.org>; Sat, 12 Sep 2026 19:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789242956; cv=none; b=X8c8J2W4KDXXr/vtCOqKKXIwqpaMuglvrRJ8JuMzqrBsXEaonSH4xbAOe/x9BPmbFDPpMqwCSrCPfN04YEbVg+bQTdUlHErW9SJitDXAGQMfpb/PKubW/QM6PKOCHLk8wBdgvxwDXQT9w+pKFFc0theO7znCRu2B6ggOi8lv8jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789242956; c=relaxed/simple;
	bh=Z9d6JzR5Uhj2Cd5rBHm8HgYcaDCfhxyZeJSyHLpwZiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IycJu0Bs2GQCs1M/n/SpC2eoaSGuRTlpyZKHIQnIIlCHfc9+NcuoH1oNFw7SyV8qcf4U+yWR4jHLPyQ9PwdNV/FeWiH+IUDaVvLCR8/QPCMd2XOE24hpY0HS/Tm5xBiKW1N2UonoK0CpCym5Z0Z+BcRtqvzSVmXB3Zc/XkKYyxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgMI95U7; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgMI95U7"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab201ebso659160d50.3
        for <linux-alpha@vger.kernel.org>; Sat, 12 Sep 2026 12:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242954; x=1789847754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOUV8mAvBSbMZ90ppsa99TwLjB+SJahPtVIVptfXwoQ=;
        b=IgMI95U7JeCauiO2fdlZZ2K+CnSB84Q0L3n3aavqARJr8ocrLnPwwkZYJU1kxC49QN
         z2/UKCZiTyVNcka87BDXzbCBdfo1TbApMnOXhoffcO5wGDOCGiZFb3DofRWJBdUJU3tn
         iESuB4VNyLYCrEw0nYgu+Mj4fY7wRHqP01Gma0bKiqm3OrbQESdsYynfChnpA9D7p5yk
         K7PTe7mvzcpJhdQMA17b1Bbe8HH8vmPcjI6Naq2C5dKrEDUxoYGNugUtpKmP15SFaE2S
         z4auoJeSRwfS/VOAlf57RMdbgMC+3A9V3Joy8tCPDtrwlNtA0s2/lRl8uLY1yh1SAAKj
         zKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242954; x=1789847754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOUV8mAvBSbMZ90ppsa99TwLjB+SJahPtVIVptfXwoQ=;
        b=SqFq9MwwPvevZNgWV1dRg3vNkTmu7GY/A+NeupRBNYGCdyHqGl9gYR8cRpvOCHHW4s
         uTMtGB4OQcTvJqrtWEhguHMTt3GwPhqqtrjQ1OlBp07/a6fQDhxlQ6JFLRzvmyV9lY2U
         Y9Bpa+KUQA3HYaI1g/LZSNaArpA1hj71OmcHFN7pDNVv3NhzZEhPrgWEeC3AlNSt2d3D
         L0fPdRF3RBLAc6dyxf40S8lm09HQ74me1HRIRSzullBexcJZ6cogyvx01eV7FvhIyHVY
         yusxludDh4KSItMAHr0IcCoAvxdqMlM2ddaV3IM9JG8Fols9QVfn7aYyXk298hqlSMlA
         nEwA==
X-Forwarded-Encrypted: i=1; AKwUvBzIyMdeMh5QK1eRPQ41PRpsS5N8rWny5GvUHUwpP8u8hVYVLW6iDAY3m2RT+4JMl62JQdmWSqPD3DG7fA==@vger.kernel.org
X-Gm-Message-State: AFuF++mXacqEfP9skpk8vcCsZbLQAPdideoXJ8mqZBAlh+7wkBPlu4n9
	wqBO4BwfFQmb0QFKdpjc0DyYCgQFwbnnOFueMhtJ0vEItvCrds2SEkf1
X-Gm-Gg: AYBFou2n3oQwvU77zyi/Ke3+YJ0onkoRqC4eym0EesZb0oQ33peMWzhjZnD3x1MTtr9
	/42grY1mPFbqHFJUOC4nvWbslzuLahL2P5ZwytwCPcu4YWFyDqfkb3PpGoF6G9Nusc+OmVm4ZqR
	Q3EKxIhHWbD6JW9E6YoOoZyOpv9m8Eeh3+xznsE5h6bCfv3D1G88IfY1DnuzPTYnqpkWG91nNQV
	74aUiNmGM2yYYr7iyEngeDsOli7/RPIs/02LErtJiOt7zyiTJY+udosAPczcEkhA7+zyTgDlJFS
	Pxyi7TTbl/oLPzT2aCoYgdshKuDl+IqoEpnrI0DvYpDBdWLXgulzt8IfRIeq+f3i97dvvJ2yUlF
	aNYkWYRrpWUkSzrSibGR/EuebWeyB0rOddXNL6RtYPToiG7A0drU9qZiIyhLPOOyM25Y/zmCnka
	nrSHphJV7xebWEFR9KARyu4dlx6BZowrG1zDY1Sai4i6hn9h79EKloV0rjhYWXYZcF9CpM5jean
	9P2GzH8XQ==
X-Received: by 2002:a05:690e:4198:b0:671:22e4:6602 with SMTP id 956f58d0204a3-671249bc6abmr2628896d50.56.1789242953751;
        Sat, 12 Sep 2026 12:55:53 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125ea8a35sm2596291d50.19.2026.09.12.12.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:55:52 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 12 Sep 2026 15:55:45 -0400
Subject: [PATCH 3/3] alpha: support the remaining kernel compression
 formats
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-alpha-kernel-compression-v1-3-ce9d55330193@gmail.com>
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
In-Reply-To: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
To: Lasse Collin <lasse.collin@tukaani.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5407; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Z9d6JzR5Uhj2Cd5rBHm8HgYcaDCfhxyZeJSyHLpwZiI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKWrrN3mXlr06yVbtr7+fLsO02O7RAUmNV4Jvnp7VdN2
 T6Hy2af6/jIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhrJuUyMixw3xVXML
 nueq+j4OW4NRUv+t/l2z8y5m2+eDPsxLQ9ywsZGd7GdtWueepzOWDxhqJkuVdCDpx7bDslNuqd3
 WsnbrTlBxsA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Nothing about the boot stub is specific to gzip, so wire up bzip2, lz4,
lzma, lzo, xz and zstd as well: select the matching HAVE_KERNEL_*
symbol, add a suffix-y entry and a compression rule for the piggy-backed
image, and include the decompressor into the stub's misc.c.

Only gzip's trailer already carries the uncompressed size, so the other
formats use the _with_size variants; output_len, which vmlinux.scr takes
from the last 4 bytes of the payload, then works for all of them. The
stub passes it to __decompress(), which zstd requires.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig                  |  6 ++++++
 arch/alpha/boot/compressed/Makefile | 31 +++++++++++++++++++++++++++++--
 arch/alpha/boot/compressed/misc.c   | 31 +++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 2688bb00f175..92cc7bb8d29a 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -30,7 +30,13 @@ config ALPHA
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_GUP_FAST
+	select HAVE_KERNEL_BZIP2
 	select HAVE_KERNEL_GZIP
+	select HAVE_KERNEL_LZ4
+	select HAVE_KERNEL_LZMA
+	select HAVE_KERNEL_LZO
+	select HAVE_KERNEL_XZ
+	select HAVE_KERNEL_ZSTD
 	select HAVE_PAGE_SIZE_8KB
 	select HAVE_PCSPKR_PLATFORM
 	select HAVE_PERF_EVENTS
diff --git a/arch/alpha/boot/compressed/Makefile b/arch/alpha/boot/compressed/Makefile
index d826f7e4384d..06deaf51fcfa 100644
--- a/arch/alpha/boot/compressed/Makefile
+++ b/arch/alpha/boot/compressed/Makefile
@@ -5,7 +5,10 @@
 #
 
 OBJECTS := head.o misc.o trampoline.o piggy.o
-targets := vmlinux.lds vmlinux vmlinux.bin vmlinux.bin.gz
+targets := vmlinux.lds vmlinux vmlinux.bin
+targets += vmlinux.bin.bz2 vmlinux.bin.gz vmlinux.bin.lz4
+targets += vmlinux.bin.lzma vmlinux.bin.lzo vmlinux.bin.xz
+targets += vmlinux.bin.zst
 targets += $(OBJECTS)
 
 # The stub runs before the kernel has identified the CPU it booted on, so
@@ -18,18 +21,42 @@ KBUILD_CFLAGS += -pipe -mno-fp-regs -ffixed-8
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING -D__DISABLE_EXPORTS
 KBUILD_CFLAGS += $(CC_FLAGS_DIALECT)
 
+# zstd's decompressor uses __builtin_ctzll()/__builtin_clzll(). Those are
+# inline code only with the CIX extension, which the base instruction set
+# the stub is built for does not have, so they become calls to libgcc's
+# __ctzdi2/__clzdi2.
+LIBGCC := $(shell $(CC) -print-libgcc-file-name)
+
 LDFLAGS_vmlinux := -X --orphan-handling=warn -T
-$(obj)/vmlinux: $(obj)/vmlinux.lds $(addprefix $(obj)/, $(OBJECTS)) $(LIBS_Y) FORCE
+$(obj)/vmlinux: $(obj)/vmlinux.lds $(addprefix $(obj)/, $(OBJECTS)) $(LIBS_Y) $(LIBGCC) FORCE
 	$(call if_changed,ld)
 
 OBJCOPYFLAGS_vmlinux.bin := -R .comment -R .note -S
 $(obj)/vmlinux.bin: vmlinux FORCE
 	$(call if_changed,objcopy)
 
+suffix-$(CONFIG_KERNEL_BZIP2)	:= bz2
 suffix-$(CONFIG_KERNEL_GZIP)	:= gz
+suffix-$(CONFIG_KERNEL_LZ4)	:= lz4
+suffix-$(CONFIG_KERNEL_LZMA)	:= lzma
+suffix-$(CONFIG_KERNEL_LZO)	:= lzo
+suffix-$(CONFIG_KERNEL_XZ)	:= xz
+suffix-$(CONFIG_KERNEL_ZSTD)	:= zst
 
+$(obj)/vmlinux.bin.bz2: $(obj)/vmlinux.bin FORCE
+	$(call if_changed,bzip2_with_size)
 $(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,gzip)
+$(obj)/vmlinux.bin.lz4: $(obj)/vmlinux.bin FORCE
+	$(call if_changed,lz4_with_size)
+$(obj)/vmlinux.bin.lzma: $(obj)/vmlinux.bin FORCE
+	$(call if_changed,lzma_with_size)
+$(obj)/vmlinux.bin.lzo: $(obj)/vmlinux.bin FORCE
+	$(call if_changed,lzo_with_size)
+$(obj)/vmlinux.bin.xz: $(obj)/vmlinux.bin FORCE
+	$(call if_changed,xzkern_with_size)
+$(obj)/vmlinux.bin.zst: $(obj)/vmlinux.bin FORCE
+	$(call if_changed,zstd22_with_size)
 
 LDFLAGS_piggy.o := -r --format binary --oformat elf64-alpha -T
 $(obj)/piggy.o: $(obj)/vmlinux.scr $(obj)/vmlinux.bin.$(suffix-y) FORCE
diff --git a/arch/alpha/boot/compressed/misc.c b/arch/alpha/boot/compressed/misc.c
index 72998582be68..8ffc546e1a15 100644
--- a/arch/alpha/boot/compressed/misc.c
+++ b/arch/alpha/boot/compressed/misc.c
@@ -23,6 +23,13 @@
 #define STATIC static
 #define memzero(s, n) memset((s), 0, (n))
 
+/*
+ * decompress_unxz.c supplies its own memmove() unless the identifier is
+ * already a macro. arch/alpha/lib/ has a better one and is already on
+ * our link line, so take that instead.
+ */
+#define memmove memmove
+
 extern char input_data[];
 extern int input_len;
 /* output_len is inserted by the linker, possibly at an unaligned address */
@@ -42,10 +49,34 @@ void __noreturn error(char *m)
 		__halt();
 }
 
+#ifdef CONFIG_KERNEL_BZIP2
+#include "../../../../lib/decompress_bunzip2.c"
+#endif
+
 #ifdef CONFIG_KERNEL_GZIP
 #include "../../../../lib/decompress_inflate.c"
 #endif
 
+#ifdef CONFIG_KERNEL_LZ4
+#include "../../../../lib/decompress_unlz4.c"
+#endif
+
+#ifdef CONFIG_KERNEL_LZMA
+#include "../../../../lib/decompress_unlzma.c"
+#endif
+
+#ifdef CONFIG_KERNEL_LZO
+#include "../../../../lib/decompress_unlzo.c"
+#endif
+
+#ifdef CONFIG_KERNEL_XZ
+#include "../../../../lib/decompress_unxz.c"
+#endif
+
+#ifdef CONFIG_KERNEL_ZSTD
+#include "../../../../lib/decompress_unzstd.c"
+#endif
+
 /* Scratch heap for the decompressors, larger than any of them needs. */
 #define STUB_HEAP_SIZE	(4 * 1024 * 1024)
 

-- 
2.54.0

