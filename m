Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA483C13FB
	for <linux-alpha@vger.kernel.org>; Sun, 13 Sep 2026 09:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789293414; cv=pass; b=Q2w4G4T5ex4bQHVD5BpEIGaduUjTuUwsJzoqKLlr3BJURS8xnVtMZKNwTzGTMUQtKcu3Y0w6gx86MKhHpQUT3ZCrrufsbnRipKLKFdI1rezmptW2liFB350hajnBq++39brMSJ/bFjp59MvulV4MW+ASjGDNNH5GA9uAI3lwy9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789293414; c=relaxed/simple;
	bh=PJTasas/l3dTYzsLv4aWlES4SRe7qHB3BKP34ST0/b4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lM6UvWMqj1TfQkLpjaXkMz8bg0QEHsbM34lwXP4N9JsLww/enc/6MEwHMyW36UIiraJXeeB2mgqSvynbSCRWLKcTOb9bK/LXOmUC2hB8RVr6LVJItZ9KxF0IRgJIfrVywitz6wIk1HKyjOuNsM4CWPuKeBn3IeuLYmA7C3pB7Ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pm14VBeo; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pm14VBeo"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aaf2ecfso703547d50.1
        for <linux-alpha@vger.kernel.org>; Sun, 13 Sep 2026 02:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789293410; cv=none;
        d=google.com; s=arc-20260327;
        b=AeUBiq0fuC5wncUxoHBtfo42W5v40aI6XHkKLmaX/bHH5CXMAud0M35IN31ZbtGUGT
         JU7sB0Y9jCGoFYJUAmwyeIQ5djYItDfn6EcPg8aJCutdQgQ/sGwD5V6NOSll7bqBNU7d
         jEFkNrPWUtNAF9MiboWfI7xBztVsi7JujX6ScQsez6gaQT2WgT3MZm69VdqBCEkk+CFp
         S5shzPqfBdFNsxaFyeDDSBR72ZAmMJr+7uVnzez871LmR0SdQOSh9uMqcxRT45kbtV3w
         pKoyqdRL+zs2uA5TUiqTgiP8K+IN5otJfYMxM+9AwFqZ6+5cSlF5O5H9Htfbuy1PPgxL
         pUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z7tmiuRHmLYw5FYKyUNhUzWjCRJFU7SLYb7Jzbj04WI=;
        fh=2rVItOKESTs2mJULUakHzJDINZGbEnZiFe6jrwgQNCw=;
        b=HjaGp/VrKI+1lsIovQCMnHPYqpkPG8t7EEpDzQABUbbIvF7x4Fa7iGFquvddWUIdqW
         ZTvPjZFIug2EDNIdo1xMFGdqFOjhVFQpLvEZ19ChlhXvT7nbQlAxWz+nHH7O+nSB3idG
         D54Z0W16e1kWBMJW+UH+17knL2SklmZGmIUVG5oGZaq0g9GTnh9d1R6PR7r4bDiaCval
         +RhMhdHkAgjVADCtyx4UfOEwqABwpwO7Wt/QS5nEDRIXWnkZCRM2Nbuz/deJ+g6oqRah
         lKst7xzEuFBllu9LPgrW3HttsjAwmUbRw68pwDxbaOCsC/oWFUC3H2YAcVB2g+KaOWvt
         /bjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789293410; x=1789898210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z7tmiuRHmLYw5FYKyUNhUzWjCRJFU7SLYb7Jzbj04WI=;
        b=pm14VBeon1mHxDj2RJJWJ63aukpKqzzko2En2nQw7D+o5j7zqq12cga2QZXvNKBMcl
         smcnex7wmK+8W9owV/RxN/vmxsKvGy/DPOx5yuWYtRmxCb9HrDCVvmjcZfH8y9b8k+qr
         vOjeKRBBNYau7ouZDQHsiMycLyQq1fRyRRZXq0mYtKZMsaiU396yw5eJMx51S2m2vqkl
         ODQ1qeFvS+J8A9J6K1NDYlNgnOa4z4jfOEib7C/roJ9htmIveYInjcgKMaYAxYDWiDou
         8cIlQZVrtaCITJ6Dj3cC8lLbdXE/k18yxwuVUFF82MtUgYVD+1V1mAozlEe8idT+1QvJ
         7w9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789293410; x=1789898210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7tmiuRHmLYw5FYKyUNhUzWjCRJFU7SLYb7Jzbj04WI=;
        b=mLC+M+ZCUVpAC8OniitCUHSLYylJG1ezwwdaC1YLutEqTAuuwel4EQiRWxc/fAhlZV
         V6c6cy9M4ngyo3yc9xu1HHK56AmWmBKb/DLNpkBUsJqebbEcSPAquYavmC2rydYwU1eM
         FTgjgFcGPtJPxWnFOsKPoBXdNOyLS32H54Fl+xbNqdI0FYwMlOYurgijr1vvrRZOa+Tk
         hA7ne+sYKmGwi2qmBNFHrD2rfxRlzBUW46kkoaxIC87Pb/tCY0GB52fYqWCtDI3w35ou
         mysAnsQBWc5Qz7+T3pXocjfqRYaIgNENJEqGR1a72CY04KU4QmIZ6hjEpE8DdUdRQhMZ
         PqIA==
X-Forwarded-Encrypted: i=1; AKwUvBxOMQvtCsj97uHXe3qqM6gzKiwPecdfzx9auoj4pkftTkkDCjYpHXGeA3YxR8g8VdSihxDKWC2+RRsGuA==@vger.kernel.org
X-Gm-Message-State: AFuF++lMEb5TBXq6EmzmKoBuUg48Anwdjbbs5A+GSK6RW92DVhvcFxH+
	wam73c1hknouhjJcHYi6xGk+jPQrwgzF+bAsMl+b2bbh9TNJePaheZWZTC8P/NLhz/u9ZCNeg0T
	GQ5qIokzrntxGxwkMHPrGq3oWzO5qn0I=
X-Gm-Gg: AYBFou1e9lDBKftKLz1O4hMPTJhu5v7BBqem8DCdKXnXI2sTpK5maOyWoXOBX8PXHvD
	9g4SN//XNnfhKlzrNJHHhyneCmP6njCMhcGlwVpdei5g384LaeZRb5skdyzhzCfonZX+SLmP/KF
	oMmGZnV0Hrul3Wg54pIFo0qHEXHpxi24JDSarq2UA9pZ/4J9l9jul1rFz8mvmzWyR63zsRz5+Oi
	BhygzvW9IpcaMkaXOhoEM2PNPHBGCkGr3W259KjBv6m49cvW28rPTxwOz4VvXU6cBEOJQaKsMdj
	xIXizIuR3z7fLemFjeZuRSWn0jD0DtvIv/0i3ZgsZmcKvmaq4AlNOfDNSuJtCRoEvbKpYh42xB3
	FNtJgcMLZc7Vt/ztuwAyrsKKPoSDalFb65zj8LGnf
X-Received: by 2002:a05:690e:4012:b0:66f:c1be:84e1 with SMTP id
 956f58d0204a3-67135a5362cmr1341438d50.79.1789293410227; Sun, 13 Sep 2026
 02:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com> <20260912-alpha-kernel-compression-v1-3-ce9d55330193@gmail.com>
In-Reply-To: <20260912-alpha-kernel-compression-v1-3-ce9d55330193@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 13 Sep 2026 11:56:35 +0200
X-Gm-Features: AcwNN1WGcAarCUo3f4Nv-bEV7iuL47PfIbM02jBLk_WcWuENI17L3gYnm3P5kLI
Message-ID: <CA+=Fv5QZnub5grceKRNXrtpXYJzYjkMzGFmdQsUrv94oz82O2Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] alpha: support the remaining kernel compression formats
To: Matt Turner <mattst88@gmail.com>
Cc: Lasse Collin <lasse.collin@tukaani.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 12, 2026 at 9:55=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Nothing about the boot stub is specific to gzip, so wire up bzip2, lz4,
> lzma, lzo, xz and zstd as well: select the matching HAVE_KERNEL_*
> symbol, add a suffix-y entry and a compression rule for the piggy-backed
> image, and include the decompressor into the stub's misc.c.
>
> Only gzip's trailer already carries the uncompressed size, so the other
> formats use the _with_size variants; output_len, which vmlinux.scr takes
> from the last 4 bytes of the payload, then works for all of them. The
> stub passes it to __decompress(), which zstd requires.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig                  |  6 ++++++
>  arch/alpha/boot/compressed/Makefile | 31 +++++++++++++++++++++++++++++--
>  arch/alpha/boot/compressed/misc.c   | 31 +++++++++++++++++++++++++++++++
>  3 files changed, 66 insertions(+), 2 deletions(-)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 2688bb00f175..92cc7bb8d29a 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -30,7 +30,13 @@ config ALPHA
>         select HAVE_ASM_MODVERSIONS
>         select HAVE_DEBUG_KMEMLEAK
>         select HAVE_GUP_FAST
> +       select HAVE_KERNEL_BZIP2
>         select HAVE_KERNEL_GZIP
> +       select HAVE_KERNEL_LZ4
> +       select HAVE_KERNEL_LZMA
> +       select HAVE_KERNEL_LZO
> +       select HAVE_KERNEL_XZ
> +       select HAVE_KERNEL_ZSTD
>         select HAVE_PAGE_SIZE_8KB
>         select HAVE_PCSPKR_PLATFORM
>         select HAVE_PERF_EVENTS
> diff --git a/arch/alpha/boot/compressed/Makefile b/arch/alpha/boot/compre=
ssed/Makefile
> index d826f7e4384d..06deaf51fcfa 100644
> --- a/arch/alpha/boot/compressed/Makefile
> +++ b/arch/alpha/boot/compressed/Makefile
> @@ -5,7 +5,10 @@
>  #
>
>  OBJECTS :=3D head.o misc.o trampoline.o piggy.o
> -targets :=3D vmlinux.lds vmlinux vmlinux.bin vmlinux.bin.gz
> +targets :=3D vmlinux.lds vmlinux vmlinux.bin
> +targets +=3D vmlinux.bin.bz2 vmlinux.bin.gz vmlinux.bin.lz4
> +targets +=3D vmlinux.bin.lzma vmlinux.bin.lzo vmlinux.bin.xz
> +targets +=3D vmlinux.bin.zst
>  targets +=3D $(OBJECTS)
>
>  # The stub runs before the kernel has identified the CPU it booted on, s=
o
> @@ -18,18 +21,42 @@ KBUILD_CFLAGS +=3D -pipe -mno-fp-regs -ffixed-8
>  KBUILD_CFLAGS +=3D -DDISABLE_BRANCH_PROFILING -D__DISABLE_EXPORTS
>  KBUILD_CFLAGS +=3D $(CC_FLAGS_DIALECT)
>
> +# zstd's decompressor uses __builtin_ctzll()/__builtin_clzll(). Those ar=
e
> +# inline code only with the CIX extension, which the base instruction se=
t
> +# the stub is built for does not have, so they become calls to libgcc's
> +# __ctzdi2/__clzdi2.
> +LIBGCC :=3D $(shell $(CC) -print-libgcc-file-name)
> +
>  LDFLAGS_vmlinux :=3D -X --orphan-handling=3Dwarn -T
> -$(obj)/vmlinux: $(obj)/vmlinux.lds $(addprefix $(obj)/, $(OBJECTS)) $(LI=
BS_Y) FORCE
> +$(obj)/vmlinux: $(obj)/vmlinux.lds $(addprefix $(obj)/, $(OBJECTS)) $(LI=
BS_Y) $(LIBGCC) FORCE
>         $(call if_changed,ld)
>
>  OBJCOPYFLAGS_vmlinux.bin :=3D -R .comment -R .note -S
>  $(obj)/vmlinux.bin: vmlinux FORCE
>         $(call if_changed,objcopy)
>
> +suffix-$(CONFIG_KERNEL_BZIP2)  :=3D bz2
>  suffix-$(CONFIG_KERNEL_GZIP)   :=3D gz
> +suffix-$(CONFIG_KERNEL_LZ4)    :=3D lz4
> +suffix-$(CONFIG_KERNEL_LZMA)   :=3D lzma
> +suffix-$(CONFIG_KERNELI built the complete series in separate output dir=
ectories for all
seven supported compression formats using alpha-unknown-linux-gnu-:

    gzip, bzip2, lz4, lzma, lzo, xz and zstd

All seven builds produced statically linked Alpha ELF executables with
the expected entry point and no undefined symbols.

I successfully boot-tested the bzip2, lzma, xz and zstd images on an
AlphaPC 264DP through SRM and aboot 1.0_pre20040408. The bzip2 image
was additionally tested with an external cpio initramfs.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>_LZO)    :=3D lzo
> +suffix-$(CONFIG_KERNEL_XZ)     :=3D xz
> +suffix-$(CONFIG_KERNEL_ZSTD)   :=3D zst
>
> +$(obj)/vmlinux.bin.bz2: $(obj)/vmlinux.bin FORCE
> +       $(call if_changed,bzip2_with_size)
>  $(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
>         $(call if_changed,gzip)
> +$(obj)/vmlinux.bin.lz4: $(obj)/vmlinux.bin FORCE
> +       $(call if_changed,lz4_with_size)
> +$(obj)/vmlinux.bin.lzma: $(obj)/vmlinux.bin FORCE
> +       $(call if_changed,lzma_with_size)
> +$(obj)/vmlinux.bin.lzo: $(obj)/vmlinux.bin FORCE
> +       $(call if_changed,lzo_with_size)
> +$(obj)/vmlinux.bin.xz: $(obj)/vmlinux.bin FORCE
> +       $(call if_changed,xzkern_with_size)
> +$(obj)/vmlinux.bin.zst: $(obj)/vmlinux.bin FORCE
> +       $(call if_changed,zstd22_with_size)
>
>  LDFLAGS_piggy.o :=3D -r --format binary --oformat elf64-alpha -T
>  $(obj)/piggy.o: $(obj)/vmlinux.scr $(obj)/vmlinux.bin.$(suffix-y) FORCE
> diff --git a/arch/alpha/boot/compressed/misc.c b/arch/alpha/boot/compress=
ed/misc.c
> index 72998582be68..8ffc546e1a15 100644
> --- a/arch/alpha/boot/compressed/misc.c
> +++ b/arch/alpha/boot/compressed/misc.c
> @@ -23,6 +23,13 @@
>  #define STATIC static
>  #define memzero(s, n) memset((s), 0, (n))
>
> +/*
> + * decompress_unxz.c supplies its own memmove() unless the identifier is
> + * already a macro. arch/alpha/lib/ has a better one and is already on
> + * our link line, so take that instead.
> + */
> +#define memmove memmove
> +
>  extern char input_data[];
>  extern int input_len;
>  /* output_len is inserted by the linker, possibly at an unaligned addres=
s */
> @@ -42,10 +49,34 @@ void __noreturn error(char *m)
>                 __halt();
>  }
>
> +#ifdef CONFIG_KERNEL_BZIP2
> +#include "../../../../lib/decompress_bunzip2.c"
> +#endif
> +
>  #ifdef CONFIG_KERNEL_GZIP
>  #include "../../../../lib/decompress_inflate.c"
>  #endif
>
> +#ifdef CONFIG_KERNEL_LZ4
> +#include "../../../../lib/decompress_unlz4.c"
> +#endif
> +
> +#ifdef CONFIG_KERNEL_LZMA
> +#include "../../../../lib/decompress_unlzma.c"
> +#endif
> +
> +#ifdef CONFIG_KERNEL_LZO
> +#include "../../../../lib/decompress_unlzo.c"
> +#endif
> +
> +#ifdef CONFIG_KERNEL_XZ
> +#include "../../../../lib/decompress_unxz.c"
> +#endif
> +
> +#ifdef CONFIG_KERNEL_ZSTD
> +#include "../../../../lib/decompress_unzstd.c"
> +#endif
> +
>  /* Scratch heap for the decompressors, larger than any of them needs. */
>  #define STUB_HEAP_SIZE (4 * 1024 * 1024)
>
>
> --
> 2.54.0
>

I built the complete series in separate output directories for all
seven supported compression formats:
    gzip, bzip2, lz4, lzma, lzo, xz and zstd

All seven builds produced statically linked Alpha ELF executables with
the expected entry point and no undefined symbols.

I successfully boot-tested the bzip2, lzma, xz and zstd images on an
UP2000+ through SRM and aboot 1.0_pre20040408. The bzip2 image
was additionally tested with an external cpio initramfs.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
