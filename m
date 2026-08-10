Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EB32FBE
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 02:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786329938; cv=pass; b=nYZb13/KUbVeWdoyzwrWlJfTTLDLXs+Xox5gaETLwTBLTL/Nx0RpIGcMvsGKfd+3uaqegG3srNoxR+eswXOvQIanp4gx1qwgwom3i1wthdlHh9m2k+FAlj9ZBID0+s9Z0M+/QBfBe0KxhKCOOSvS7QYUZUFNm3z1P6U85+JnxT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786329938; c=relaxed/simple;
	bh=KO71j+Nd9/b5mPQL+wIvMj3mS8QeRqi/TzjfzU+eRPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vla6FTwVwmL5qQ05OQ0mmSCPnn1GdvEgF74YMJvGDhPUiPYggqxNKtlnqEHxIwKncnBPHW9gIKbufmX55ZX1fJ9Y8BEQF0nOPwrh1LBTxX4FHCKkPU3VTTvAHXfPdsKl8hJiH/eaqv1pICxHlGKP8alL8X5nFd2zZ0ObyOs/kkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBAoCHQS; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBAoCHQS"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so1605514e87.1
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 19:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786329935; cv=none;
        d=google.com; s=arc-20260327;
        b=RsrVpnDIFwSxV10/BpI3AVXzhVpiz7t6RA6/eA3TNnL55ys/grqv6zVPuCIsIINwFK
         lGSGG247TWMMeZBBoH0kiXh1bI7Bg2yfY7Exz9Lm6dn8wXEzLshSNKXz2LtyyU6tgtn0
         yw+vAtVy7FR0O+9TS3SFyGoUwLEBqbDU9DrghsxRpfssZmk7zt/mJHc+hzJO5rNm0XhC
         0FfOCpXFyEYBDKWOGOu2jPOJdjohnEkefN7Z5EpaP/Gav7IBcNLxCIpAesFoPWBq5Vsl
         i2+3dMdl4YYSDBgxNcY4ovbnFXNmQ7wUG8t8qN/cJ2SLvAh4kAeM4NpeVsRBl7vZ9XtG
         hDLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OVDsPM+DjMhqJUTTTfRiZAqNagGEvGInMBIstasEQvo=;
        fh=Y2LHcOGdH30xRy25ZYaI8BODuN7hBjJ3ryZVxaw3V80=;
        b=BgfmCnZxpBNXz73UfjxoAsp80BU9wzQZkgzj9CQ2n2tZg5Z9OhY4fZw9LuNvhc2LIN
         zrOHBx/ssyhkd9/AIXzvS1+Uj98+r1+7CXv8WDEssJVtqUjDP9sd38b9gO31APUJ0FHR
         UgZb9zu1eGyuAMC9c89iI1F9AFmIaJygR7EQ6yCAAeFAUgVwzklfLe2tU6Atsgs1ropd
         XaUjTV3uObuVr6dIwRGqk7ltnOnVG/OAn92GppomvFnRmlnpocJsVHanJCPF8OaI5sYd
         xyWZHC16hW5XY6nnJVBkWijB5xo5/2kwZVtmIdazG2LeGkNtMZv2wwCyDclFKrgnCzdv
         Pskw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786329935; x=1786934735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OVDsPM+DjMhqJUTTTfRiZAqNagGEvGInMBIstasEQvo=;
        b=eBAoCHQSSBrDLQxVueR7myJEhprnqRqUgKvmhzvAMgLCBY2Q1ail2vlZOc8sDqbpNP
         Yk2nINk0yhtd8MUHWOuvb/otKe1kWMIx6vBBgyBhECr1Hr0uMAzu+YxO4rGA0j1+TjqV
         U1EyvN+iyC1zyZ1vho+vRtCqG9eH5QeVCcDlTwo167kRtUUUjMfTFf5WzhFloshPCu0K
         +8b3jqwz+Bms21aW2RvgaesTo/8RCfOw8FasYW0llaUDQ3EY5IP5l6izaL///ZBPK3MA
         9SYJ1ZYAFCH1A07cvr87fUe3zFG42IytNRnYfBbbI9Q1Majz8+F7vjM/6WZNHrf53WPe
         d9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786329935; x=1786934735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVDsPM+DjMhqJUTTTfRiZAqNagGEvGInMBIstasEQvo=;
        b=D+PXhz1n5Um2DtMWUaEH7Pi6JWsKqai0jOr8LHWu94p60XmjyYoI4QmvZDpi3BSMCI
         uBYgmtfBP5QaF9yE5Ai/x1Ovw8gz/845xdDoI1v6v6zjm9qTClYOlCA3lCfcEVpuqoCu
         o9JKbSKIQSJ+/CQTyI9RNtqStdbDFS+9gIfudAY7JiTezrKwPDJi8usmm8uIHpqreXED
         JI0paWVz+qdtSgQl+qImlLKWGVJqaiGNiP0Pk+FletmvQT2KOjUmhB1Vmgvr8sTodxhk
         SiJW3WtfBfC5cQTVR/F5F9JqLGzxTztEEEAq/eeNpZQRzcPJUEhxR1URacAW2vAW66xf
         cMFA==
X-Forwarded-Encrypted: i=1; AHgh+RqJPU4TebJc/mFaEy7rIP6Bv+50DSV+Z4VE/Qin//haS2LlduoobwvQXuvDp6csOvGwJOt23TUX6/a5gA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzleL2bQLN6FpvRx+PPf4zWKyvQaYgy1cgzak09YH0Ald63t1kl
	wprU7KEcFgXfQ5yOYX8N65SxqdL+qNg4rTyAXQtBQOaJ9AzdMv6cXqt7eXG5fvfDJmBq0Ogi3YJ
	5pHpy7gR7ze9YwLuEkXnGFlwuVdZ/AtIF6/DKb0w=
X-Gm-Gg: AR+sD10aOeypmnJridej7wQrxs45k+DqqJwb7561GX0P1QpzSURvltEa0a6oiZmAFXe
	m5Sy9atiNh+oSj6dtjoS7X6wMt7JI/j5PccnrgObyf47+HvJPxqJZeB4T2H/iu1Et1evKXKAOlw
	1Ug2zqWCwwzlW5LnUbTORE8x2x48ja4mJzs7Od8eY6FKjggFm0jDK9JoYr3ZtBxUX042mhe7Viu
	FZAAE3/OQ4KSQVrbCbG+qnEi+dvxOMryZgroEhr1Apj8be6Z2TLB0QgImHgCn44Eo8qMeZCIXCs
	vk0+45mAA/2P+KhHmpNpsVOS5wA3BNJaMoNN34iCJJ490dJpRiI3MEc93wfNNxFnOm8zUPh+ZO7
	QppPOKmDkAUZ6
X-Received: by 2002:a05:6512:358f:b0:5b2:e178:4088 with SMTP id
 2adb3069b0e04-5b30c0192camr1953974e87.4.1786329935034; Sun, 09 Aug 2026
 19:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809085208.3262799-1-linmag7@gmail.com> <20260809085208.3262799-5-linmag7@gmail.com>
In-Reply-To: <20260809085208.3262799-5-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 9 Aug 2026 22:45:22 -0400
X-Gm-Features: AUfX_myYOcdxEOFGBbFxbOatyu5Jdw9VAgFuUXO0CH_xah7xXAvy6gQUMK0fW5k
Message-ID: <CAEdQ38HYF0KWE0pxRBdWYfr9e0q8HqJ_BQu=_Zaredb3Xp+euQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] alpha: only use a targeted tbi() when the target mm
 is really current (UP)
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, 
	ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 4:55=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> The uniprocessor flush_tlb_page() has the same defect the previous patch
> fixed for SMP:
>
>         if (mm =3D=3D current->active_mm)
>                 flush_tlb_current_page(mm, vma, addr);
>         else
>                 flush_tlb_other(mm);
>
> For a non-executable vma flush_tlb_current_page() issues tbi(2, addr),
> which acts on the address space context currently loaded, so it reaches
> the mm's translations only when that context belongs to it. Under lazy
> TLB an idle or kernel task keeps the mm as its active_mm while a differen=
t
> ASN is loaded, so the tbi() invalidates the wrong context and the stale
> translation survives.
>
> Use current->mm instead, as for SMP.
>
> This is not theoretical on a uniprocessor. folio_mkclean() runs in the
> writeback flusher kworker, which borrows the mm, and with one CPU that
> kworker necessarily shares it with the thread holding the translation.  A
> test that writes a small MAP_SHARED file while background writeback clean=
s
> it loses data on every round: the mapping holds one value and the file
> another.
>
> flush_tlb_mm() and flush_icache_user_page() need no equivalent change
> here.  Both use __load_new_mm_context(), which allocates and loads a fres=
h
> context rather than relying on a targeted tbi() against whatever ASN
> happened to be loaded.
>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> ---
>  arch/alpha/include/asm/tlbflush.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/tlbflush.h b/arch/alpha/include/asm/t=
lbflush.h
> index 0c8529997f54..6593a64090f1 100644
> --- a/arch/alpha/include/asm/tlbflush.h
> +++ b/arch/alpha/include/asm/tlbflush.h
> @@ -87,7 +87,14 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned lo=
ng addr)
>  {
>         struct mm_struct *mm =3D vma->vm_mm;
>
> -       if (mm =3D=3D current->active_mm)
> +       /*
> +        * tbi() acts on the address space context currently loaded, so i=
t
> +        * reaches MM's translations only when a thread of MM is current.
> +        * Under lazy TLB an idle or kernel task keeps MM as its active_m=
m
> +        * with a different ASN loaded, and a targeted tbi() would then
> +        * invalidate the wrong context.
> +        */
> +       if (mm =3D=3D current->mm)
>                 flush_tlb_current_page(mm, vma, addr);
>         else
>                 flush_tlb_other(mm);
> --
> 2.53.0
>

Maybe rename this patch to

> alpha: fix the local TLB invalidate in the UP flush_tlb_page().
