Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BD83B6377
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791647774; cv=pass; b=AbZeXfxvifM1EYlSwehVYxZH0n61eRTGb0UUgOtx5PrA+apXxUAIPDdtSr7N0OI/99+tA/b417HQc/72H9CoTqbMkykViTcflin9QupGSSciaGESoX7ne5foYkVqYeZyk8A+c8M7okmBTnFb4oSCFdxO4qVp+y79+GBwxzzcBcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791647774; c=relaxed/simple;
	bh=1LlNv9iLTw5kz6VsMVqZfAokfIUtc3HuT5Y1+gdSsVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGFWwqHd/dV0ky9PIXoHELAnpoaTIIsQa56a/e8OoJUGVk1uILW5uiDVZcpq4xiPAYjHG5B4+ywP22s5ouw+u36aGIjEV7mhfYTm23Lm+dX6MSnzPZTJciJeZ86tuH4XKXkXQXSu+Wkg8r8r3eLsLUi6j9TNcNrXkrJlzYjJz+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4w7wdqI; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4w7wdqI"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2e5f8fe879so114486866b.3
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 08:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791647771; cv=none;
        d=google.com; s=arc-20260327;
        b=hhSHvvlBi8sy8GC2ysdMNbDh9GI/GydQ/NrBOcKOhMMpS7i7QyW1qhAGLhsDiEQhlm
         ba1QeTuAr/2z/4dCyZHLVna/nnWZVmk15ulDCalF3pP+ehyx6wCYutezWUfb8OGRYAp0
         cWH03bPF9h4/IG40nG9rf4pjntyuOXEBQiMKzLBml/wc7HgJ4YWUE02XmcQ/dnxtt7Vt
         H6vmMYWlHtk1q7E3LGfvJePyJ5bMP2TnWNKLuuIJo2/5nvnyCLtJa4c/h4h2TR9eaZ+7
         YTbf8CBF7Um9PA1Oj7JVAAGqwRnKlyvdgxVmorCYLfy0Ed0Ms9A3X3hSV5PXWYXmN1hW
         34yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UrVuj/KtTic62Eb1wEr1a7bTAGelasNdPgxfdOzKGbI=;
        fh=U/LNnDXNLJUiJkI9KhCaF7AK8bIgAXPiWgks++bKrY4=;
        b=Io8dbX9Ef0NUrH5mluxmXSuAO2ifPbZQuNwsfS9wIBs6Qh3sdcus2cMcrnGriPIjsf
         hP6o3FIAGLQnN9AQnc7DUg5quxoh+KT9ApsP745ZqKWX8Qhxx7HD3SSN1CaEiVBI4E7B
         iYipTBfFAZ94HO7bSWAdMvnAJs53zMDn36Frf81xe5PFOguvxd51f/P/X83Tu3gdrs9P
         5hGAu0GQE5gYFheGHWmbJSNrm4Gm1k/yAs8iJSwvuJqtQqMkKkxVSZAu4hC9ALeuOIJ8
         L1uj0yEOMRvIo1pbmjfBslDsS6ZTT/mLx9c0lwbv0PvU44Hk1+0PVNtgs+ujKglRutpl
         bIqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791647771; x=1792252571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UrVuj/KtTic62Eb1wEr1a7bTAGelasNdPgxfdOzKGbI=;
        b=Z4w7wdqI2lUBMaIisI/MyWwgO4RBhfg1wt2rPVPDxzkXynA7symJQO9t5864NzWmTN
         poqXr81KL/g2nWVoHRaV7RsPqkiZlnQAJOMfl3b6ghKCKdWFDSkdFPpRK0ob3IAvi05N
         7qo1r+Dm0+w9zlyKQ+/KTd21o2fPCGKuKvii1NdlhoGvPBR6/++nT3yQotiVuyb1nMrQ
         VASox20Vv7HYghKR6QbpZGT2DRD6GaZu939IzbhMA7TBQkqwewXhzmRSg8EACSXE9WI7
         bkDqkbG7MzZndA2n5ShedFrwJ1fjg06zeCz8ZMD6Pd6L94vMR2ZF4oqFoRqJ4fFJIuvw
         c7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791647771; x=1792252571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrVuj/KtTic62Eb1wEr1a7bTAGelasNdPgxfdOzKGbI=;
        b=vmwjaLa5j6KR/F5cAxU9O36Pkfwwi8TuNWg0NNrjocexo619eX7CX5pw61xc27KlQ7
         MuistEbKIGiMw7+jICz6/8zQygPRWA85Xhg5pBZZClIamt0wuEJEu3PqeUcoTFw2QNEm
         G4yScpPg6Hf+Q/Q7XJB4eS9mBUcTmW4tiYsxLww8glrcZm5e3GsWXs5SzIsDOB6T1UaM
         r+6DqwJ8A9inI15yJk9Tn+bbIRAfnTvTvXuAprc1g69fppiE6X3ztgqnwIqwwvacmjKO
         9/rdxZtV6xAXfGofxpeA3D03MTf+zXVuPpdjtw/rvRxXuNIFxgiEGd3znbxyGpTLTWkP
         7D3w==
X-Forwarded-Encrypted: i=1; AKwUvBzcxlpxCJskAC53cgLtbvPtONLjnDjQCiiMN2WD5W77nEf+eLWImN2BfccNG8yUGMBNp/YVIC0Ajoi2kw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLQKhYapo7zcuehPXe4AuUjzsFWhbQOnCsOuEpCRkVVwfTR1hXU
	io9e/35AIDKq2jp3C7EeUDpFfxbOU17l2P6DOsnSOKs2kFYEaMewtzGO4nZpFt4WW12qBh+SDiy
	7MIY9uxk1OIQxAR0CWzOWG3LdhqkrV+Z3GLgoXic=
X-Gm-Gg: AYBFou3NXSQ2vIgGLmxJ6+zWggEZ57VLHDKo260MTmVITWJm1Sgnv+DEy55RCyPuqBD
	hzioEIhhfappNOKU/IeO0Ls4oTsvKKVhR4V0mRMzvyTqOncAHD2MlJ/ww7tXKtVI8eDnwILqqkl
	UTHU/95/VKReCqWzzyYuOblpUVOHLnXymwx2W0qBFb8kWkrkq67b6jp7D86l6vAj/25n+nEGrf6
	rdX+bRhplt/OhAlh1Xc+ywrcyi9aRbgcoS/e2AHezxZCMoBUfuIbsQW9yRniL722XrNWHv0rg1U
	8BLb/YEftaMXDfklftyfRpynVqmOC4vCV6L5Kqcv5meDDe14UDV7oNU4ugYJYV/cfYTsJLbUTXC
	ZUZ05b1fwhtIx/B991dGeBwu0o+LJmVhf1hfuRM37Kg==
X-Received: by 2002:a17:906:7305:b0:c31:866c:9696 with SMTP id
 a640c23a62f3a-c31aa09edfdmr448825766b.31.1791647770611; Sat, 10 Oct 2026
 08:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
 <20261010022039.1610210-1-mattst88@gmail.com>
In-Reply-To: <20261010022039.1610210-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 10 Oct 2026 17:55:59 +0200
X-Gm-Features: AclHuK_4R9ladkJBFXKnSPR1Gb2rGeGfvuj5KKc4PC21RA5o7-m4C9wi3sPQdTc
Message-ID: <CA+=Fv5Q0p+v5dp-P_pQJ6ks3pZXEO3VPB-E+=t8HYRRAypH=yQ@mail.gmail.com>
Subject: Re: [PATCH] alpha: add 128-bit shift helpers
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,


On Sat, Oct 10, 2026 at 4:20=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Selecting ARCH_SUPPORTS_INT128 lets generic code shift __int128 values by
> a variable count. gcc open-codes such a shift when optimizing for speed,
> but with CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy it calls the libgcc routines
> __ashlti3, __ashrti3 and __lshrti3 instead. The kernel does not link
> against libgcc and Alpha does not provide them, so the link fails:
>
>   alpha-linux-ld: lib/ubsan.o: in function `get_signed_val':
>   (.text+0x1c0): undefined reference to `__ashlti3'
>   (.text+0x1f8): undefined reference to `__ashrti3'
>   alpha-linux-ld: kernel/time/timekeeping.o: in function `delta_to_ns_saf=
e':
>   (.text+0x2ac): undefined reference to `__lshrti3'
>
> Provide the three helpers in C, as s390 does, and export them for
> modules. They are built into the kernel proper rather than lib.a so the
> exports are present even when nothing built in references them.
>
> The 64x64 to 128-bit multiply is always expanded inline with mulq/umulh,
> so no __multi3 is needed.
>
> Fixes: fd04433a5bf3 ("alpha: select ARCH_SUPPORTS_INT128")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610090831.DSxrGQRc-lkp@i=
ntel.com/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> Magnus, this is an alternative to dropping the select. It applies on top
> of for-next (496e328c6107). If you would rather drop "alpha: select
> ARCH_SUPPORTS_INT128" for now, I will resend this without the Fixes tag,
> followed by the select, as a two-patch series.
>

I'll apply this on top of my for-next, no need for a separate series


> Tested with gcc 16: defconfig plus CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy and
> CONFIG_UBSAN=3Dy builds and links (vmlinux and modules, W=3D1), and the
> helpers match the compiler's inline shifts for every count from 0 to 127
> in a userspace test. Not boot tested.
>
>  arch/alpha/include/asm/asm-prototypes.h |  6 +++
>  arch/alpha/lib/Makefile                 |  2 +
>  arch/alpha/lib/tishift.c                | 70 +++++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100644 arch/alpha/lib/tishift.c
>
> diff --git a/arch/alpha/include/asm/asm-prototypes.h b/arch/alpha/include=
/asm/asm-prototypes.h
> index c8ae46fc2e74..672fea15032f 100644
> --- a/arch/alpha/include/asm/asm-prototypes.h
> +++ b/arch/alpha/include/asm/asm-prototypes.h
> @@ -17,3 +17,9 @@ extern void __remlu(void);
>  extern void __divqu(void);
>  extern void __remqu(void);
>  extern unsigned long __udiv_qrnnd(unsigned long *, unsigned long, unsign=
ed long , unsigned long);
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
> @@ -35,6 +35,8 @@ lib-y =3D       __divqu.o __remqu.o __divlu.o __remlu.o=
 \
>         callback_srm.o srm_puts.o srm_printk.o \
>         fls.o
>
> +obj-$(CONFIG_ARCH_SUPPORTS_INT128) +=3D tishift.o
> +
>  # The division routines are built from single source, with different def=
ines.
>  AFLAGS___divqu.o =3D -DDIV
>  AFLAGS___remqu.o =3D       -DREM
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
> + * gcc open-codes a variable 128-bit shift when optimizing for speed, bu=
t
> + * calls these libgcc routines when optimizing for size.
> + */
> +
> +#include <linux/export.h>
> +#include <linux/types.h>
> +#include <asm/asm-prototypes.h>
> +
> +union ti {
> +       __int128_t val;
> +       struct {
> +               u64 low;
> +               u64 high;
> +       };
> +};
> +
> +__int128_t __ashlti3(__int128_t a, int shift)
> +{
> +       union ti ti =3D { .val =3D a };
> +
> +       if (!shift)
> +               return ti.val;
> +       if (shift < 64) {
> +               ti.high =3D (ti.high << shift) | (ti.low >> (64 - shift))=
;
> +               ti.low <<=3D shift;
> +       } else {
> +               ti.high =3D ti.low << (shift - 64);
> +               ti.low =3D 0;
> +       }
> +       return ti.val;
> +}
> +EXPORT_SYMBOL(__ashlti3);
> +
> +__int128_t __ashrti3(__int128_t a, int shift)
> +{
> +       union ti ti =3D { .val =3D a };
> +
> +       if (!shift)
> +               return ti.val;
> +       if (shift < 64) {
> +               ti.low =3D (ti.low >> shift) | (ti.high << (64 - shift));
> +               ti.high =3D (s64)ti.high >> shift;
> +       } else {
> +               ti.low =3D (s64)ti.high >> (shift - 64);
> +               ti.high =3D (s64)ti.high >> 63;
> +       }
> +       return ti.val;
> +}
> +EXPORT_SYMBOL(__ashrti3);
> +
> +__int128_t __lshrti3(__int128_t a, int shift)
> +{
> +       union ti ti =3D { .val =3D a };
> +
> +       if (!shift)
> +               return ti.val;
> +       if (shift < 64) {
> +               ti.low =3D (ti.low >> shift) | (ti.high << (64 - shift));
> +               ti.high >>=3D shift;
> +       } else {
> +               ti.low =3D ti.high >> (shift - 64);
> +               ti.high =3D 0;
> +       }
> +       return ti.val;
> +}
> +EXPORT_SYMBOL(__lshrti3);
> --
> 2.55.0
>

I build-tested this on top of the current Alpha for-next branch with
CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy and CONFIG_UBSAN=3Dy. Both vmlinux and the
configured modules built successfully, with no unresolved references
to the new 128-bit shift helpers.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
