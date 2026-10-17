Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7833ADB9A
	for <linux-alpha@vger.kernel.org>; Sat, 17 Oct 2026 16:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792256046; cv=none; b=cjvmlUtBkzPbtU8W2XpzWTyYYZOqw6Et8pfeCpN3+Ptb7LhCZCgPHGHrVhRVuWRbPh39XP77NzxS/on7caghcPcBaEZmxNu3fo86kAESVBCOr9PrgBTjoWC/xOP3CiNdrT5VL6/KGY+8l8lhQazYCw1klKp3oXQJ/lvl6c3F/V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792256046; c=relaxed/simple;
	bh=hAzB2NN/8PbnRJAcc9NLmO4Ty39zshTaAYkCMytNEG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OlCrwwjvhGRmwEVpYcPBfNEZ071yrqJiOb1MnArgiNbFilD9clJ9MzudAx3WtN1g5SB8H8JSZpjQXRGlAmyJf76AEmO2ANl2EKb4b6nZICpKNzH2Tb9rM8ueBWBaZyiLRqdyxylVad0DaWoNmn5p1tULQclu+wREC8up5tXTJEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Frluxtxm; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Frluxtxm"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ac9d666d4eso6314477b3.3
        for <linux-alpha@vger.kernel.org>; Sat, 17 Oct 2026 09:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792256043; x=1792860843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGU0cbuhu7iBbLOC8hKhryTOPjhSKAntgwS4e7w23sA=;
        b=FrluxtxmZjvAiY7UXxTFN1nlr/uJhcLKtBiXrkJSvyGJLRCEayIhQpoAzBWvYGwL88
         rT4yKLB5aQVK762cE/9DTLNGe7ZuIhyEbPevRABsjkwZ+Z9f3tnbtJ/h5n27NFkmWSI3
         MWYZSMFsjwxaJ0BrIxfhC+AspR6HOLUG9MuKY142jb8VzweGgQr/Ywxck3O2sdvtZ958
         g6VTbr+FC1c3KnLMwgiDuMTq/+KRoMf/bdTpUfHnif3cifcISCDf6f66ga/aziZvAXWA
         tmXYAusT4NErzQ8d9i7TMd5qpo/gt2+dA3I1TYmi+FcCV2ETvT/GrembFjP/Tt4q0Fj/
         /esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792256043; x=1792860843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGU0cbuhu7iBbLOC8hKhryTOPjhSKAntgwS4e7w23sA=;
        b=HDvpqCf6dNbyOOhK5FPAz5afn06RykBlutMkTOL9PO8/xXEVuwtMxbcEAVe5YJ63si
         TGL8TV5h6AzvjCLi4g09tmd4lR+Qc06C8QZJiy8TT1tzE9ZDsgJntvrjuWZ7DVFS4xsr
         drsqtb4GCLjVx+wGpAoU5tbU+dg38vqg7D+py231QrhKd5alP+oH9Em6mzWqWTS2XMbn
         K4RwLE1NEzDggPTl4mwXAqAgi/1kyu7Qn7gPDwBlqgYuBSHVPHFMTkwQU1M/h7Js/RAD
         oX2C+lfrgswly1FVuFxblXWQ6oQEgIkKVAiDyNJzTyBLL1nQ/M6Vsb0FmP/XRb90DTFK
         E63A==
X-Forwarded-Encrypted: i=1; AKwUvByuJtvlkHfaguuap1SYp7GB8Yw+Nqp81oJ2fHa4eTVq2S1jAWo0/ZND7cGKWI16BFM6jUGAkbsesnNbnQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJnqRVaiVykSjkyQCa8pqy6uQweDKGQN1MkoiLpPyNG/lTcVCUk
	7yqRuCUwlkjHibwik6PV9GaVkuOvv4VAfS1/pdYi8OPecWM88SHor5Qz79KI/w==
X-Gm-Gg: AYBFou3L2RrYI51RhYAEkl7e0U842745OHZujfA6Gr1aYc8N6GSA11PFPNUu4e8i/Ns
	kgV76nakc5I4qWJ+M5cl9MvrMExzKc9Kn8QfdsazVcf5JDljhL+r/dnUzelAdfpDrtzIOkucFhI
	XPEqj9NGQ2gFLjfvSk870GVd/lSbIYh+1kHd8/RqjF+0NViMe2tAwgYBUvDICmEY3T74o65qh0W
	vEQV/Hjbe8WUuEV0rUGAvBKkbN4DC5KazIAGRFtHeR6PrQH7DBHZOlT2Dfoe6SuAaUW9k0U5G08
	vTDS8KPzFrNFyniALA+Xk7Okyjnyo9V1Ai1pYtcbVac8MXOeSBpNX27TjnmhHDgu9BZwHZoWGHn
	p5TtBDuc4JdYRSMu/18bC/XRPqtumBCiMh3QkQ12kHTKs3QMX5XnnfkqAvCraOAItYpJqHFIX+p
	20B17XHhhRonOHtFUzuJN5wxOg6/4IoTRdvmCz6WaP9qbWD2fnO0W4bnDwdj665TTx4q7ezxWiK
	VVnlCgOIm1NyV2EPAmom2PyMUwrx4m+yh0kJqifMBokzrzajQ5+NiiPspBTD9hF1au6KGTMEUwT
	05JoFPtWbZxp2mvwoPwA51MQe2kf
X-Received: by 2002:a05:690c:39a:b0:8b0:cd0c:11dc with SMTP id 00721157ae682-8b0f21e8ffbmr10019357b3.86.1792256043433;
        Sat, 17 Oct 2026 09:54:03 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e5885546sm22449297b3.16.2026.10.17.09.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:54:02 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 17 Oct 2026 12:53:35 -0400
Subject: [PATCH v2 3/3] alpha: support the remaining kernel compression
 formats
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-alpha-kernel-compression-v2-3-c71e6b08dc63@gmail.com>
References: <20261017-alpha-kernel-compression-v2-0-c71e6b08dc63@gmail.com>
In-Reply-To: <20261017-alpha-kernel-compression-v2-0-c71e6b08dc63@gmail.com>
To: Lasse Collin <lasse.collin@tukaani.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5597; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=hAzB2NN/8PbnRJAcc9NLmO4Ty39zshTaAYkCMytNEG8=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIur+B9oPyv9Kx95848Ru/6sw7VFx+wb/T7laew7JZjy
 jamzf8aOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaDWsZGXa8F1/8vW
 nLIsdD/TNje99feBnVJ1c+KT+B5apfUl7XjNuMDOeqaj/6ebV8EThhNL3vfN++8uazv0Mu7Ihac
 uSg6cKIkywA
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
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
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
index fe7eac100617..692a29588aad 100644
--- a/arch/alpha/boot/compressed/Makefile
+++ b/arch/alpha/boot/compressed/Makefile
@@ -7,7 +7,10 @@
 OBJECTS := head.o misc.o trampoline.o piggy.o
 OBJECTS += memcpy.o memmove.o memset.o
 OBJECTS += __divqu.o __remqu.o __divlu.o __remlu.o
-targets := vmlinux.lds vmlinux vmlinux.bin vmlinux.bin.gz
+targets := vmlinux.lds vmlinux vmlinux.bin
+targets += vmlinux.bin.bz2 vmlinux.bin.gz vmlinux.bin.lz4
+targets += vmlinux.bin.lzma vmlinux.bin.lzo vmlinux.bin.xz
+targets += vmlinux.bin.zst
 targets += $(OBJECTS)
 
 # The stub runs before the kernel has identified the CPU it booted on, so
@@ -44,18 +47,42 @@ AFLAGS___remlu.o := -DREM -DINTSIZE
 $(addprefix $(obj)/,__divqu.o __remqu.o __divlu.o __remlu.o): $(srctree)/arch/alpha/lib/divide.S FORCE
 	$(call if_changed_dep,as_o_S)
 
+# zstd's decompressor uses __builtin_ctzll()/__builtin_clzll(). Those are
+# inline code only with the CIX extension, which the base instruction set
+# the stub is built for does not have, so they become calls to libgcc's
+# __ctzdi2/__clzdi2.
+LIBGCC := $(shell $(CC) -print-libgcc-file-name)
+
 LDFLAGS_vmlinux := -X --orphan-handling=warn -T
-$(obj)/vmlinux: $(obj)/vmlinux.lds $(addprefix $(obj)/, $(OBJECTS)) FORCE
+$(obj)/vmlinux: $(obj)/vmlinux.lds $(addprefix $(obj)/, $(OBJECTS)) $(LIBGCC) FORCE
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
index 72998582be68..1b5b8e716613 100644
--- a/arch/alpha/boot/compressed/misc.c
+++ b/arch/alpha/boot/compressed/misc.c
@@ -23,6 +23,13 @@
 #define STATIC static
 #define memzero(s, n) memset((s), 0, (n))
 
+/*
+ * decompress_unxz.c supplies its own memmove() unless the identifier is
+ * already a macro. We link our own build of arch/alpha/lib/memmove.S,
+ * which is better, so take that instead.
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
2.55.0

