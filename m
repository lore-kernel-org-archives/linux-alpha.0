Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081B3149DF1
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 03:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786331018; cv=pass; b=TOsc7R1dfXXD834w2okHi/dQloxBp59LqEf817XQtP0LKAnaxTwGfiwIuVtFxeF9BVw2XB0Ah7RSbw8kHpFji/RjXimE/87+agg5CuWkwxrNa9ak869AEB8o92O7bZWjpuLNgaps+t9Z+tsmFMQMEL07q31xr4lrNa50tz3Yx24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786331018; c=relaxed/simple;
	bh=X8S1IqIwXrmAOqjZP2cQg452pSsObxRdN312uji9XLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMLAUzTvWWS30aOWtMw3yDr5px05jfPeqZQq2/xvJ9M05RTcl0XHM36EIb8rkoh4UHybps1lcjbkbq+Dwg4niGMcGBX+MuvIxzpmHt5ehIvx1MzNNMCeEbYRSm5NNdku1F49CSQGCcSo25nJpCk9lJAE0yJ/rgHmIYmG6Xg9NVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0xtJkE/; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0xtJkE/"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39fcdaef6e2so9256601fa.1
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 20:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786331015; cv=none;
        d=google.com; s=arc-20260327;
        b=p+GBryqIOCiJGdw2GQEAR5G35407gfmqUNKEg9dOKxjwhUwaGktrlciOO1MPUprT33
         ECti0jvsGYL0IXvM2krayP0x2+3JnzgjzUSn3ioW89fnkD70ytq901MhP8WAwHhbdHA4
         hKCVTCXoMjx2PzhgB4g+02VAdSddeJ8JBm8fYiFw+LIy1WCDxSKy7iB8GIS2JdT82r3D
         Pubu7drCfa0jUSHANAerw2RAJt2ZYC5r/vBS6Lh15sBOuKATcA5JpADSUh2N39eeKj3e
         WD16WbvMOWKucX3m06A24Amclar1eY4nDbFCSi+QNIeOOiN92Z7VH/jD0+EVB8uAo9Un
         +kew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8IrzNHYqfqHPp2etKhvpO4WVwetlXoKRyN7wC1hU1w0=;
        fh=RbQ5ZS8ycLAmcOu3/AR4+dsLY3DMVHLT4WYBFb3SNG4=;
        b=ILe6wjoqOwoYyrxHiBAqOffrQTT3DQ7VEg2r00PjosgGQyRmc7IRXIFKKYpzXFzj5v
         py3++EoElCCKNkO7TYHM+EQq0Mwt/EBX4lJ2kf4E3hpSRDqQQi1ntFz5AXqcTZp/6TKy
         VcSDzbNUuCnTy0O6VwPN/CRmGH6XZy4k6o7dpZ43QHOaDhZ34nDFryA2DpglRmr8+TI8
         LAh2HUmDwEWivGURqz0Aycdc8S0smXREPWG+AwuhoKIPmhMQzLiLQOf/v9zvqn5NamYP
         79P7w8vsjxuNE1M4itDOimFvuO4KjxxkvHYDhbGMGzrcXpIdGRdQLybWP9nDSvjC4/0u
         kUWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786331015; x=1786935815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8IrzNHYqfqHPp2etKhvpO4WVwetlXoKRyN7wC1hU1w0=;
        b=F0xtJkE/YmiYq1fPmiVmKaEw2Uz4Imqtz7ovnQqZs382Ze7CCMVlrStMW3i02f/XKu
         lKjLa2wXBwWxelIPF1DCRX1/bI0Iz+u2bVckqGRYYjIFkDKnZEia2IXm3q7D0K6Ye5j0
         tniyswhh9o6UoNDgT46kEw3FA3TyLaSSs/UEr2Yh6f6ckDdn1qDToXhAhngLrkH4OTc+
         owG4cjBcZ3y4+l5eDeZ32yTy1aGhnH6ipnw/NmP1uQqtmjnWWeD/SyYY/jG9x+dXToeX
         4cA/gCDS45M2KQ6LMt60k4ELVc06b0fuVVN3pLYKX/sV9Wl1jA5GeRlDurixw9GKm3y9
         o/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786331015; x=1786935815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8IrzNHYqfqHPp2etKhvpO4WVwetlXoKRyN7wC1hU1w0=;
        b=Ckoi2rEmc+fv3RAe8btTGVCPHBprCRMHxF9Yksg1fzRyGDbyriNPO3CGh7Auc9FVw4
         0LVTX0qpqN+yLEbWWpo5YNXPcIRN14oKVvms9KUH5VKHjUNP4qUBZk23duBqZmivt7t2
         qi8d2I5/kp9Inv6GQoIIoOTw9+XNJreXDlhqXjDkgRKGsCa0ptvr9EsmMxhc67P9jfdx
         pUwLRwEGN6MgkKjPwRCoLGfsvY88u83RWJEg96ktiPHLuet+7FAnsfJutfmcDMdyDXAD
         NNCeIIDaV+EhdY7Y2wyN929O9IIL0/EEG4qLsE+uzZWHjpeQJw1lsJ1Nraf848pGJ31w
         UJAg==
X-Forwarded-Encrypted: i=1; AHgh+RpoHp5hmjiuoUuDqpqlDDSPboHo+Fya4G2ym9lbpiOK0IuSpnP42svuXMJ+geXQIKXFqErB4+n2yfq+lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwixedGZseoCrJkqB+va5Dv9xnYKmcWbbsTrGaVNSwK9azvRKcL
	ictscWY86oDE8hRucEfmbyIRlX4iwYZMmHxdmYWA5ZbAEXcNwZKEQ3HM7+BvPMJEDqaqgq87lEb
	ecLwxL6tXnW3DsX5F5oxnqkrvONC+b1w=
X-Gm-Gg: AR+sD10AZNkmNLh6bQ0yMNq+0hJLsy7IaJmWif/FIzeVOfrKwRHTRVL4fQNLiEdlZ18
	Oeby1fzsw4EFbZg9loiCGzHV2yy2nCQ1IjcjOqbLiIpioU3eFWxlja5aKErNAkVqbDbBLaftpah
	pAYWaK/Yf4Q7YOPtZ0GG/cdaiQwIvwZuRbrMTsNVnn4y0XUuuSnBpttoEFe8rg72ccY+cPGeEDx
	kp0wnTBzeMfyl2Te4bU9lyTA+p+GOEQQzhWksyJq8oy07O8dmi9NnorWvkujE8+kVIgO2tIi0Bo
	rdv5lGEZY7LTP637iNu7jmDklnAoqon6FasK6dg3paBM+kJYFpNQnPLjOGRD0QTDP03ltA4QTlh
	/RhIQSAUgwxrM
X-Received: by 2002:a05:651c:150c:b0:39f:6700:9257 with SMTP id
 38308e7fff4ca-39fe58567aamr19238851fa.30.1786331014883; Sun, 09 Aug 2026
 20:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809085208.3262799-1-linmag7@gmail.com> <20260809085208.3262799-7-linmag7@gmail.com>
In-Reply-To: <20260809085208.3262799-7-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 9 Aug 2026 23:03:20 -0400
X-Gm-Features: AUfX_mwuD41J5BSvUPWHyDcXX7JeVP7f8TG_hRzbybH_lqcu7flVFA8y8uZ5H3A
Message-ID: <CAEdQ38FEmxBu4xyf9FO9qqOO3OJewSCA-qoQ+M+X9JE+vGwa7g@mail.gmail.com>
Subject: Re: [PATCH 6/6] alpha: invalidate the local context in flush_icache_user_page()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, 
	ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 4:55=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> flush_icache_user_page() has the same caller-CPU omission that the
> previous patch fixed in flush_tlb_mm():
>
>         if (mm =3D=3D current->active_mm) {
>                 __load_new_mm_context(mm);
>                 ...
>         }
>
>         smp_call_function(ipi_flush_icache_page, mm, 1);
>
> When the target mm is not the calling CPU's active_mm nothing happens
> locally, and smp_call_function() handles only the other CPUs, so this CPU
> may later reuse the old ASN together with the translations it still holds=
.
>
> This matters here in particular because the function exists for operating
> on another process's mappings: the comment above it describes setting
> breakpoints through ptrace, and access_remote_vm() reaches it through
> copy_to_user_page(). The calling CPU is therefore often running something
> other than the target mm.
>
> As in flush_tlb_mm(), the UP implementation in asm/cacheflush.h already
> has the missing case:
>
>         if (current->active_mm =3D=3D mm)
>                 __load_new_mm_context(mm);
>         else
>                 mm->context[smp_processor_id()] =3D 0;
>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> ---
>  arch/alpha/kernel/smp.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
> index f501a91001cc..13b86f7224de 100644
> --- a/arch/alpha/kernel/smp.c
> +++ b/arch/alpha/kernel/smp.c
> @@ -780,6 +780,13 @@ flush_icache_user_page(struct vm_area_struct *vma, s=
truct page *page,
>                         preempt_enable();
>                         return;
>                 }
> +       } else {
> +               /*
> +                * As in flush_tlb_mm(): smp_call_function() does not cal=
l
> +                * back into this CPU, and this function is used precisel=
y
> +                * when operating on another process's mappings.
> +                */
> +               flush_tlb_other(mm);
>         }

ipi_flush_icache_page() also doesn't issue an imb() here, so I'm
guessing it's not actually needed... but I could see why it might be.
Any theories?
