Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794675289;
	b=e9qgT/uHvzF0o3LtJrdOWIP6vXyWW4cHqVDGHmW8RJMyLzyCaDbGsQq8kiGeEmhgcFuw
	 aUBa7rWunYplz+K5wfhjugORQyw16oQrrPj6hgdqLNj5pP5pI9ah2Boc4EcaCop7vVG3O
	 6YlXWy9wHAv10B7pwoTjs6iXV2X4+2nFy1DJkIvMn5wadphg5fqVfrswDKrrNbD+lU4za
	 5mPNorSIt2rQjfoD8GoHQWHtKAn+4dwgB3V/g/M1D1uJt47FfRVhvbvFPtTXRa49XWLGj
	 bTDU3amkuI9igOVdC8wmyNdoKBUAHeXNQqKne2TFTixHAUo5U0M118nqFHtDCqzu1FQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CF2sg4s32j52wgctvWrapA+d98gMLIJ8r2rlSSFzULk=;
	b=NNH9ZbLWj0KCrgOWUPhn4D8wXdBaVUb5/PQjpX0074G9v1dOyBm4RvLVD1dMqd7BTIOj
	 EismnBkM//WJcL3xw/sSyMggLLtll478k6pyHtwBBEYUDlNkfdd1Xj3shgzzzi0od2pAz
	 vtgPm53uRg15DesUBnknHaCHgPQVd2CEKAFBVsEC6QsF0Y4AZ5dwJIw2SryadPePEP6yh
	 KlZ5LwuiBGGDp87Z1dhzOWvQV4mrN/i5kdsV5aybD26QfnPDd0UpU4BlIqXlnJ2VifzMx
	 U/I7M0BMcUyIH/p3aI/6xT2/s3Pc7X9i6Yc3890tpsyTDXw+fb2mpmY2DAF1/NPhd6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFHvuLER;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950A5606A33F
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 16:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 950A5606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFHvuLER
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so22944981fa.1
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 08:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794675287; cv=none;
        d=google.com; s=arc-20260327;
        b=jznP0vTvyGbameK3gW5p6CmHbB5inigTGL9ANr1OLfXhjvu93f2EgBu5SLn8qicwc0
         7fdD34gVgW3dvSBJeDvva20b5oXM4h4VmlqSGUTvTq/3mSAeoQcRFAPRCvNErHNdFh7Z
         z4gkJPurvIQnmu0ynpzk0PeST0ulyZ+OqYdKvQt8ki6DqsjFZiQ1YktZoDJIXX3tAxwT
         z0Sf/1IsWnhm6qna1caq3f69jzWLT/Gg87UhGKlTqK3sdT/jrvXAQX3i5V6ybmCu1bH/
         eTX6hqCqgFITJOe74jAbfCChKVySnCBU1aIxYF0KtZQprB/zwkyuTzZjdIu749MY747h
         bWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CF2sg4s32j52wgctvWrapA+d98gMLIJ8r2rlSSFzULk=;
        fh=+pySzmyDrqGlUNdA8Tl+1sDYeE9c4iNxG+UxfhpRQrM=;
        b=s5PckUrPDUFZ5mY31i1Ta6RR99Yy8LdP6gBd7kl+CW+J4LOTzKzQQsaBxtXmLSqDre
         6gE4PWj9KDPEoQ3o6aGFVNS1FyyBDf8Q+bx0UfLO+rrdp2WPAvFKkCXxX5GqEExh1g7F
         cl876CVRPG632Ux3RTAGf2A7cPCyVmVHbEvjz8M0Sv3gKghCAAra/uAb4KD/FRFrlYMG
         ENA02UnjxJhLfgIf9pyuVygGLMYdhg+NsXgFMTl7d/Od6T/IwRUab5tcu2lbivem3/IU
         fcO17SJ22AE5Hr1XWJHmGBt19ebTtq/zEW8l2W8AKHsUHM6TaJcAnD1t3eFif1mI+uKb
         qTrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675287; x=1795280087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CF2sg4s32j52wgctvWrapA+d98gMLIJ8r2rlSSFzULk=;
        b=XFHvuLERxLWaiXCeE49sALtCyWFdESrxx+rfmFUwsPIg4y31Pau9ZD63BGRXdEP8AR
         SOzbYRY/+Ts95qKSUWlYY4rpoNQ+U9NaVy/Volm6uwuG0JE0YStQBNCCmYj8qd/hJVMe
         DnH8Tj7FPa2oc0EIj7Mwrpdx96DEvY5c275PQtrYYUudnR15FrAF/y5P23SgGRJpOJRL
         3weuOg0cH7opmmjxQ/+d+jx/BikIBwLyOAK72uw60Y4uxbCIRTyuZb52jOfEOiCMaLE/
         QCdjeKLmNsqZpst4WrsHxCP1JhkiKlQIkPwnW/Vwa5ikmDTAEfOy5KoHTgQNSWAa1Hsj
         mfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675287; x=1795280087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CF2sg4s32j52wgctvWrapA+d98gMLIJ8r2rlSSFzULk=;
        b=O6Dt++gvWGvvFl+Au+U7Mg4+WKqOYRM7o3W5c9IRpnw9HEOLyxsbGdeFBt+QGW1ske
         eozJ8PROs80SEc+KXKqsCZSZA4BMypK6hgNB6bGvHwXsOENTlfeNQ0tVUPgvGAZQ5WMj
         6f2aSlsnc/6TKbNd94UFVQc7fil3f12RVFG1OhtwJJqZgT/7lm4Of5TdOinpGnnwIsJl
         C84lg6vEPEInlz7omJXEH/lzHDToIP47jmVV4Xhi/BatfCZWA7l3Iay+QIjItZCn3dyL
         CYX1NaoCq2WXJB9qo5RmHKpUiLi0IEnW7eZaH5cCpCp23vkRmq5KjjIzaUCLQ0LpKfd/
         GccA==
X-Forwarded-Encrypted: i=1; AL+hErETJzfu9SseapjWasAbf5mBr//xKX17ENtZwHP4v56PrGtMl7TWI1K5x5XDvWGu82l/e/+7rY/i0DKpAg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/pDa4L23vyFbqtG5u/4PcDMeIJ3gZLZiNrkr1v8TXbP8HbqLaJ
	vXY6LGKBVm4orIVpDaM1A7oEZqyJcLY/c2ok2iFYp1fS2UpaFox3LXWMQj0JTfUFr3p5vRSxypD
	TNweJWTz/jASLHpQW2S/G7RqKcaYBUuw=
X-Gm-Gg: AYBFou22HIdKg4iYFmJHzvFWnHyGcY8upTRCP9phyh/9CMgfiJIHFTR060+ycjdF+05
	mY8lVQx/C8xyTx7WRq0990yaBpg0OMH1Y5FCuFocoTttWaR+kw660zXsbg0sgIvcqAqld9ZnS5C
	FfQGKc33Xq0FhpPGfswjtgV28dcEelynOA+ui2R4L7JhsNXDBPCaKP+ZW7/mvoOTZSPsJuwzMZC
	D8es0+74Wr0/3DwlTKnQscwQAiaGIpsQEK5g3FLNcNWRem5BIaZ92ZtQPDCsSbecCueVJGUAl+P
	CyiXQNCJ5rbZkbGGoJkIa2uP07Rl8XCPibCrSiY4dxp5NJ58AAhciE1KLcmjiAo95NlYvypaU60
	6QYxE+kk/W4OXrIpA0OgZ3+tmPs5g5yBjBTCJBfopFem7qBJnzaGRDalg0ipiBFSJgLQthdSsys
	GPvr4JGvgsjopqUQ9w/ubt
X-Received: by 2002:a2e:a105:0:b0:3a9:a1ed:634a with SMTP id
 38308e7fff4ca-3ae2b5223dbmr17570241fa.21.1794675286552; Sat, 14 Nov 2026
 08:54:46 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114094826.1282965-1-linmag7@gmail.com> <20261114094826.1282965-2-linmag7@gmail.com>
In-Reply-To: <20261114094826.1282965-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 11:54:33 -0500
X-Gm-Features: AclHuK_MrK0yJPPK27NhA5Tq6yYsNjKGRvII1NkeAvzQvNnX6YCbiW-FDudKjyE
Message-ID: <CAEdQ38FMuOzdFkU4RQFhZJkSiczzVLu-eBiZmjwpiUUahDvjCQ@mail.gmail.com>
Subject: Re: [PATCH v3] alpha: Add support for HAVE_ARCH_JUMP_LABEL
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 4:48=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
> index 850f1265cc55..4088cd56866e 100644
> --- a/arch/alpha/kernel/Makefile
> +++ b/arch/alpha/kernel/Makefile
> @@ -92,3 +92,5 @@ obj-$(CONFIG_ALPHA_TITAN)   +=3D err_ev6.o err_titan.o
>  obj-$(CONFIG_ALPHA_TSUNAMI)  +=3D err_ev6.o err_tsunami.o
>
>  endif # GENERIC
> +
> +obj-$(CONFIG_JUMP_LABEL) +=3D jump_label.o

Nit: this would read better up with the other unconditional obj-
lines near the top of the file rather than trailing the GENERIC
block.

> +#include <linux/jump_label.h>
> +#include <linux/kernel.h>
> +#include <asm/cacheflush.h>

Nit: checkpatch --strict suggests <linux/cacheflush.h> here.

> +     if (WARN_ON_ONCE(disp < -(1L << 20) || disp > ((1L << 20) - 1)))
> +             return false;

Thanks. The target is always within the same function and Alpha gcc
doesn't do hot/cold partitioning, so I don't expect this to fire, but
it's a cheap safety net.

> +static inline void alpha_patch_text(u32 *site, u32 insn)
> +{
> +     WRITE_ONCE(*site, insn);
> +     /*
> +      * Alpha needs an I-cache sync after patching executable text.
> +      */
> +     flush_icache_range((unsigned long)site, (unsigned long)site + sizeo=
f(*site));
> +}

On SMP this is smp_imb(), so every key flip IPIs all CPUs once per
site. That's correct, and fine as a starting point; batching via
arch_jump_label_transform_queue()/_apply() would be the natural
follow-up you mention in the cover letter.

I applied this on 0b4cadbe7c39 and cross-built an SMP defconfig with
JUMP_LABEL and STATIC_KEYS_SELFTEST at W=3D1 with no new warnings. The
patch sites in vmlinux are the expected 0x47ff041f nops with nearby
targets.

The diffstat in the cover letter is stale (63/146 vs. 65/148 in the
patch), but that doesn't matter for applying.

None of the above needs a respin from my side.

Reviewed-by: Matt Turner <mattst88@gmail.com>
