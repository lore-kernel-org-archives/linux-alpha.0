Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3AC48C8DC
	for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808681; cv=none; b=tWa33BELlXjQvPHOfht/PkhaHDqN/yDBU+tSqWj6yd50n/Mc1tE2TCsqjtTYDzMgBxNJQ0io82xqHZfkRg9oqm98IcHLmDOs7l9xw5wOIDAfE0n3uyWshaxNY21y4mrSm+2sCpaKwYrF+lbqUIfVikRk3oH7fq+dlEjydrZH9Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808681; c=relaxed/simple;
	bh=VH0AM69Ra+gB3iZQ6SWDCq1VTBUq+NfYyh42eZTZN6M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WY+szMK9+y8fK2vIjOMeYIr7aev+iegstPnCJ8pI9N15D4EtI4H9n3yOmqyI6tAPCdSTiVK55w7T9lU9zNugP8taW1mP7bebQ19fp4X4UZ+xre9+ihYP0k7WwisacElw5ciCTyth3GmOtnBXFZDNbOnpVbLUK57d854nYD24thI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHyFXYEK; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHyFXYEK"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1062688f8f.3
        for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 05:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791808676; x=1792413476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FAa1zh2oFmbuGXbuxB3nKxDGq0l8J98l2LtUP9fmNNc=;
        b=AHyFXYEK9PVW3OlQ4XLbP62vQBFVIyoKzFxnXAZ8DPf0iTldGDhpPsEOaZ3sZ9yKRC
         4I299NxDfuU01EIwt3Cp0zNc0OJzQs3Ucg0afDMds2155iCz3A5NhMFehys84ZcHIvDz
         Ty7dzLmbaBvHrF0XqHEZs18xAuIAPDmV5OpJQ1PqA/haeCIfmSgI9D44TbAXvUXdSsr9
         /NKxqeYqyj4aZDAwCyJCQsS8snOFR4CsGgRB3cTC/rNwtlOPdu8zgIYYW6aRFVK33nvQ
         IRKdA+CFI2yztZ+L/gw3QvMVuF9N/KwRNSUTKI9nNIHaVJ3dT9fw4fYIGhE5CXMzajj2
         qJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808676; x=1792413476;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAa1zh2oFmbuGXbuxB3nKxDGq0l8J98l2LtUP9fmNNc=;
        b=sfYJT/p3+3w+/kdDNoekPUUUSpTIL0a6nHpjqkXZVhdJPQgbFptywEjKIIlhu8Whuw
         dLFdTlhLCsBIYJ9BN7vpcYj7aXUNGd/SSJE0BaTvakFRk3RqPiKCa6Vs/6/rVBOsdapl
         WsQNnIag7hQFfVhMCfHLbpmMXDdMEgpp/6RngliX1H6UBnOIgRK638+h+RoRmQctmyO9
         thOJhEw562tldD3fdabQpzbVGCNRtGrCphTkZUH53e4gul3xaxvnX5YbFj4EoqHKnZoj
         JRB1aMbDJ2u06YGAj2RVWIrgqAmAwypyuDc6PEKVy+yDOQm0wGj1/IQteOGD3KrI3MtL
         KQ5Q==
X-Forwarded-Encrypted: i=1; AKwUvByktTOblBqpuSub2iqX1MP0lpH+ws4J32XpEVw6ekIlGOop9QOrgdOzTfPYQYsTfnRXLrfNnyB+OpoNXg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKd1hU9D+eedz181ZBnomUqm/s3POBxUk3qR07owv+JF0AAndBV
	ct5qUmGPS8iBYMIOJTxvohA8X+jV+Dv3W6YLFBlC4PrfLBIXREx+vAxd
X-Gm-Gg: AYBFou00k6ECiohCP/W0cjsn2ODqDhnIthfuTJJPY+UA3IlGeKXItys8Ax5duxeZANb
	ggxSWhQELgvZ35gXKjQs1hJ/7/Nbr7T9UtEiw/BexkdW/OXm/rx4APy1zRW3nyyQBqQsJu1EG9g
	/iIiyNk+4C4EM8fPwugioVOck2NZXvLYR45dWXsfp08eOCCxDRqpN/E6gQFUBQL/Fn3LU9zYhAH
	lUxqoVsmJBhJfplicnGpdH2rnc4MEHZAGbZ/q6+ubFPh26Pp3n8vw4LJA8tNMZnOLXRpexJ3kia
	uEsmTawCJ1Xdl+NTz7dQqwx/hoq4ZwGlDmBgGwe/4aJj+39HWTcS4AHloqu9fgPtLeXKsw95JD/
	WnittH3QLzMfN4/yY2pxKcx7/NGF7TRdHAmEGKgWG7bWTjxPOyy9WiTeICg1kga9HDy/Ks0lX5X
	DX1kKIP1m2Ut2NsS8+ilTZFgcnuMN2Shli4BPPg4Nx8LmOWXIpRYUfxfDfw4RIiMhQKWtjl86v4
	h6t6stUW38I6qPDNT5sKF2/MmXBHBSmQWE=
X-Received: by 2002:a5d:43cb:0:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48dbaae4c6cmr13859682f8f.46.1791808675476;
        Mon, 12 Oct 2026 05:37:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm19599710f8f.57.2026.10.12.05.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:37:55 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:37:53 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Matt Turner <mattst88@gmail.com>
Cc: Magnus Lindholm <linmag7@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] alpha: add 128-bit shift helpers
Message-ID: <20261012133753.3a5868e9@pumpkin>
In-Reply-To: <20261010022039.1610210-1-mattst88@gmail.com>
References: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
	<20261010022039.1610210-1-mattst88@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  9 Oct 2026 22:20:39 -0400
Matt Turner <mattst88@gmail.com> wrote:

> Selecting ARCH_SUPPORTS_INT128 lets generic code shift __int128 values by
> a variable count. gcc open-codes such a shift when optimizing for speed,
> but with CONFIG_CC_OPTIMIZE_FOR_SIZE=y it calls the libgcc routines
> __ashlti3, __ashrti3 and __lshrti3 instead. The kernel does not link
> against libgcc and Alpha does not provide them, so the link fails:
> 
>   alpha-linux-ld: lib/ubsan.o: in function `get_signed_val':
>   (.text+0x1c0): undefined reference to `__ashlti3'
>   (.text+0x1f8): undefined reference to `__ashrti3'
>   alpha-linux-ld: kernel/time/timekeeping.o: in function `delta_to_ns_safe':
>   (.text+0x2ac): undefined reference to `__lshrti3'
> 
> Provide the three helpers in C, as s390 does, and export them for
> modules. They are built into the kernel proper rather than lib.a so the
> exports are present even when nothing built in references them.

Do they need an explicit (shift &= 63)?
I've seen gcc/clang remove an explicit '&= 63' because they know the
hardware instruction ignores the high bits.
But I'm not sure what happens here.
Adding it won't make much difference - unless it matters.

David

> 
> The 64x64 to 128-bit multiply is always expanded inline with mulq/umulh,
> so no __multi3 is needed.
> 
> Fixes: fd04433a5bf3 ("alpha: select ARCH_SUPPORTS_INT128")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610090831.DSxrGQRc-lkp@intel.com/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> Magnus, this is an alternative to dropping the select. It applies on top
> of for-next (496e328c6107). If you would rather drop "alpha: select
> ARCH_SUPPORTS_INT128" for now, I will resend this without the Fixes tag,
> followed by the select, as a two-patch series.
> 
> Tested with gcc 16: defconfig plus CONFIG_CC_OPTIMIZE_FOR_SIZE=y and
> CONFIG_UBSAN=y builds and links (vmlinux and modules, W=1), and the
> helpers match the compiler's inline shifts for every count from 0 to 127
> in a userspace test. Not boot tested.
> 
>  arch/alpha/include/asm/asm-prototypes.h |  6 +++
>  arch/alpha/lib/Makefile                 |  2 +
>  arch/alpha/lib/tishift.c                | 70 +++++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100644 arch/alpha/lib/tishift.c
> 
> diff --git a/arch/alpha/include/asm/asm-prototypes.h b/arch/alpha/include/asm/asm-prototypes.h
> index c8ae46fc2e74..672fea15032f 100644
> --- a/arch/alpha/include/asm/asm-prototypes.h
> +++ b/arch/alpha/include/asm/asm-prototypes.h
> @@ -17,3 +17,9 @@ extern void __remlu(void);
>  extern void __divqu(void);
>  extern void __remqu(void);
>  extern unsigned long __udiv_qrnnd(unsigned long *, unsigned long, unsigned long , unsigned long);
> +
> +#ifdef CONFIG_ARCH_SUPPORTS_INT128
> +extern __int128_t __ashlti3(__int128_t a, int shift);
> +extern __int128_t __ashrti3(__int128_t a, int shift);
> +extern __int128_t __lshrti3(__int128_t a, int shift);
> +#endif
> diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
> index 84046e730e6d..f77d4a46f2e6 100644
> --- a/arch/alpha/lib/Makefile
> +++ b/arch/alpha/lib/Makefile
> @@ -35,6 +35,8 @@ lib-y =	__divqu.o __remqu.o __divlu.o __remlu.o \
>  	callback_srm.o srm_puts.o srm_printk.o \
>  	fls.o
>  
> +obj-$(CONFIG_ARCH_SUPPORTS_INT128) += tishift.o
> +
>  # The division routines are built from single source, with different defines.
>  AFLAGS___divqu.o = -DDIV
>  AFLAGS___remqu.o =       -DREM
> diff --git a/arch/alpha/lib/tishift.c b/arch/alpha/lib/tishift.c
> new file mode 100644
> index 000000000000..488e1e483d48
> --- /dev/null
> +++ b/arch/alpha/lib/tishift.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * 128-bit shift helpers.
> + *
> + * gcc open-codes a variable 128-bit shift when optimizing for speed, but
> + * calls these libgcc routines when optimizing for size.
> + */
> +
> +#include <linux/export.h>
> +#include <linux/types.h>
> +#include <asm/asm-prototypes.h>
> +
> +union ti {
> +	__int128_t val;
> +	struct {
> +		u64 low;
> +		u64 high;
> +	};
> +};
> +
> +__int128_t __ashlti3(__int128_t a, int shift)
> +{
> +	union ti ti = { .val = a };
> +
> +	if (!shift)
> +		return ti.val;
> +	if (shift < 64) {
> +		ti.high = (ti.high << shift) | (ti.low >> (64 - shift));
> +		ti.low <<= shift;
> +	} else {
> +		ti.high = ti.low << (shift - 64);
> +		ti.low = 0;
> +	}
> +	return ti.val;
> +}
> +EXPORT_SYMBOL(__ashlti3);
> +
> +__int128_t __ashrti3(__int128_t a, int shift)
> +{
> +	union ti ti = { .val = a };
> +
> +	if (!shift)
> +		return ti.val;
> +	if (shift < 64) {
> +		ti.low = (ti.low >> shift) | (ti.high << (64 - shift));
> +		ti.high = (s64)ti.high >> shift;
> +	} else {
> +		ti.low = (s64)ti.high >> (shift - 64);
> +		ti.high = (s64)ti.high >> 63;
> +	}
> +	return ti.val;
> +}
> +EXPORT_SYMBOL(__ashrti3);
> +
> +__int128_t __lshrti3(__int128_t a, int shift)
> +{
> +	union ti ti = { .val = a };
> +
> +	if (!shift)
> +		return ti.val;
> +	if (shift < 64) {
> +		ti.low = (ti.low >> shift) | (ti.high << (64 - shift));
> +		ti.high >>= shift;
> +	} else {
> +		ti.low = ti.high >> (shift - 64);
> +		ti.high = 0;
> +	}
> +	return ti.val;
> +}
> +EXPORT_SYMBOL(__lshrti3);

