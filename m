Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E46644471C
	for <linux-alpha@vger.kernel.org>; Fri,  9 Oct 2026 06:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528756; cv=pass; b=n5s1ZxlK+RK5OeHIAUMMgZ3M5UYJbfyoAad8D1iNbquvtdb1/0FWdaJPtuXzX5exxVPfwsMxkSxqXEcwhgomRrOtggyPN0JgaLYe0M/gVEqknkSsP7fDUVWUvW0F4nS7ovqOmhKfrc8PBPiGdMDFxVxuLkOwetQ5vh/Os2TA+4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528756; c=relaxed/simple;
	bh=4NY3b/9uFqqbJNZv2e54a4GGP4HJaG4h9wCOURl2pcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDAv4IihPR47RSdqMvWYN+h+h0iLLOsuWlY8cA1B9xKDyCMKKyjBPcnfycD+wAaAkPD73pFtieg7xNRLVmvnZfKqDzVJe9R17TFVJ1ZmAv4bm1HDovKhgRHpGFQFaFmSW07JacpDk/pNQDToKEBccUFqrtdYQKwpZMW4jDLUXac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdAMV4Ni; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdAMV4Ni"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b16824c0fcso1736975a12.3
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 23:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791528748; cv=none;
        d=google.com; s=arc-20260327;
        b=NVAlavZD/Yq8l0nkPHSZ4PgifRpp92nFejvOrM9VYDJEkHBZAiCYntLuQ5i+cxkdQB
         Pv1KiqRtL1wrDHLBLY7QJmx6DKIDhJAPPsQXbFfPI7XwApgnKpfVgvONo10pzSoUmmzP
         4zdBJfnozQfFz/H68ea0Zwb4mv3sfR6ifjjltjd+DRH9aKNtwpdwJom5EsIgpQLgcECJ
         4o4ZyOCQAfSpLQPdxQqk98VsUgVWmo+KZxtVkNqRGCXdWMTnf1O1N/QgI61GFVvPhBq6
         xFkGMxHghNhvxbZMZGP+e9s7+i6E0BjBg6JZsXarhHX8gl8Zu4iW38hEiYefGiJqE8pj
         v6/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+dS3K8yuawIJTpHR5tebZaf9aB405AvauMGqVL4l6U0=;
        fh=S38izrvzxXNIRosXnIFxhsM/oOy4nhjdaRFQoEp+auc=;
        b=U/dk0jWcZKZ7H1/biVDcl3EPV2zFPPjTnNuDbFDJFMCqJ4p36DFCLU32aE8a7I4z/h
         aHt8axW/uLMwAUXETUwBlngRUDsqWEy4G6PkHrPhkYj3o8g+8OiHA0EvtqjZgdoVIbgL
         dSvlRInn315MIbUk82Wr3DU8AlvXG65wE41SE4P5UINfFEI3pEK1zPGMr1kj/jz70PZE
         1KpwjndfgRokYdlwkpFd5t723gnkFSmLN8k+cDFYzUxuk3vdTWxWupI93duXCjXEk44u
         gQdXvbXujvn26B+9hcCBodN8FLMgmEIGYLY0Fzkgnth/2UuXFfm8iue0wcBphlOAf/NX
         tquA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791528748; x=1792133548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+dS3K8yuawIJTpHR5tebZaf9aB405AvauMGqVL4l6U0=;
        b=JdAMV4NiOsNnKzodZ1REyjHh9rZxhax/u/cAmbUKdeMyaIR1WVQqMK33pFmHUGKWWT
         w4CEDkbEG6hiL+/e3UBo2iR65oNMPZsAOB2f8jGB4KEyQJduOVe94SuDO74cK6ZNbJh6
         XQMPcVq7tNvG5KZqLov5JgUtSx5+OYkh3UA6ePd+Y4ec7M3sFMCs2Ktw17qA9QbeiHKw
         epCwfJskhgIKdvANnwtSmb1t4TvjvaOfO9DXT1RdC54oQ43n6PKnkTQxR1kAc2E+dBWZ
         69EIHWDrKqZqb/7/q2WQVkY3UDPYX1pzoI62PVaqmpP0CXR1MFDXzGt+VRcereBHzpcU
         Ouhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791528748; x=1792133548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dS3K8yuawIJTpHR5tebZaf9aB405AvauMGqVL4l6U0=;
        b=niBQMkjNEaYU3rMUgeDdUl63u1yMq3pSsHJxY85B3jUvt+4w0x9jHnvR2zyS1lWUjc
         BIf1IdS+tXogUUU45pI0EtkZqSvY75E3mOE6Ur/stwNHpP+E2mY/1DJGPEpkm6/FoQOA
         hqSefhoh+EeEWzMu1TE4nI1iYdUqRrU/ZuGLeEbczWJ3smZfHwLiyLs7LUa8PtjtB+Gk
         cR07x+Tuk8Vq709rIwCrehazYtQd2MtAf45xzPGGe9AtGnFZYB/ulcsiXtfPuog2kjfn
         fcdXawrloHBIfkO+KmxK8MkEJNFt+otMM3A8e77E+ZehbWyJKFpiBaSLzEn8WYivHcHZ
         /B3g==
X-Forwarded-Encrypted: i=1; AKwUvByfvLtF2k0eR0fWpvrFmzHqLquhrBnlK07cRhzcjXkvgy/tWptx81g0W0Nj/pkOibL/vTVVGnCKJBqQig==@vger.kernel.org
X-Gm-Message-State: AFq9FYIlvEVmcGiiTsffkaNiBpE4CctC15DhXLOqSmK3WHHr9ztHTM1t
	ICPL0Nv2IUYbfmCdsZq2zvWGHgAxxW99xuAS3be0h2SIjyXbwmaURmCAHXPYly2yXl9FOuaEQ4S
	FtLW2w8P6TK6Aa22Pbu2nwH1LEbuhqcA=
X-Gm-Gg: AYBFou0lvdPwnOZCaDenALBaPrlVwSQZVpGZk/SGSuevcQL3M62jjCSfAKMNhV6C3As
	Dk6aJzlyuAMA14E8sDvTeL3FQVKO6QfYsgREl8yXvwQk8QO2oBl9Si6Ixw9MuQEDL6r/3v1nCTx
	BibIOVRCNVxCG7os7nfqkKU7lfhluG5VFRN5pHtgqYQhZ/5x9bho9nPoYERoVeIR9xSRzI2oRuz
	PDVWrD2dCZ1bOETY88/+7X5CVmy/Orvkoxvzv5h4HYvaFtCtqiJzRp0muYvuojjrB9NfTP3w4NB
	G7vm+1Youqor4D8+baLGhIzpOzNL1kHHqEf+yog7ZaplhPSXaDLeZ6I/n5K56Yq5tFdOf87+grd
	elxcZk1hNICPTgmCq19IaGD5JCnXaeBn+WERBKEHBxw==
X-Received: by 2002:a17:907:a089:b0:c2d:cbc9:3529 with SMTP id
 a640c23a62f3a-c31a9ffd78amr101019566b.20.1791528748116; Thu, 08 Oct 2026
 23:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com> <20260905-arch-kconfig-options-v2-v2-8-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-8-83e8245761a2@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 9 Oct 2026 08:52:16 +0200
X-Gm-Features: AclHuK9oTCyjIBQo-KDpBuWM_JxhK4IiThl5vFb7lnINqfE-VDcwwfdZ-Pom2sQ
Message-ID: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/22] alpha: select ARCH_SUPPORTS_INT128
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Kees Cook <kees@kernel.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 5, 2026 at 9:29=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> gcc supports __int128 on Alpha, and the 64x64 to 128-bit multiply that
> the users in the scheduler and in lib/ care about maps onto mulq/umulh
> rather than an out-of-line libgcc helper.
>
> Gate the select on CC_HAS_INT128 as the other 64-bit architectures do.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> Tested-by: Magnus Lindholm <linmag7@gmail.com>
> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> ---
>  arch/alpha/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 2672971b83f3..bed3f1c8d9d2 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -16,6 +16,7 @@ config ALPHA
>         select ARCH_NO_PREEMPT
>         select ARCH_NO_SG_CHAIN
>         select ARCH_SUPPORTS_ATOMIC_RMW
> +       select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>         select ARCH_USE_CMPXCHG_LOCKREF
>         select FORCE_PCI
>         select PCI_DOMAINS if PCI
>
> --
> 2.54.0
>

The kernel test robot reported undefined references to __ashlti3,
__ashrti3 and __lshrti3 with CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy.

Alpha doesn't currently provide these helpers. CC_HAS_INT128 confirms
support for the type, but doesn't guarantee that the generated code
can link without libgcc.

I suggest dropping "alpha: select ARCH_SUPPORTS_INT128" for now and
bringing it back once the required helpers are implemented and tested
with size-optimized builds, including UBSAN. Removing the select
eliminates the missing references in the affected objects.

There are no functional dependencies on this patch in the rest of
for-next. I tested rebasing without it: the page-table-check and
hugetlb patches each needed a small Kconfig context conflict resolved,
keeping their own selects and omitting ARCH_SUPPORTS_INT128. The
remaining commits replayed cleanly, and the resulting tree differs
only by that one-line removal.

Magnus
