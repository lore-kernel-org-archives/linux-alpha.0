Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2441B808
	for <linux-alpha@vger.kernel.org>; Thu,  3 Sep 2026 05:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413658; cv=pass; b=FHZ1SGuFOApaayPotc7sZGN7h79tM0iFsdrA6KPFX3viffr3F+/uIxLXXNKfAhUd9E72HAU/mFJob3K7mJ45PmFMs76vpKqAluy9I7P05//TTohaH/ORV47qrDoYkvvtyPyabk5X23ImwbhSIW0jzF+aYskEP3tWuwcHVTz5PPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413658; c=relaxed/simple;
	bh=F8UQAaBlqFnPI7rRgzwKKAVEZwJyQUhTyNGcbDOngr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEqGU56FJS9mosFoDBjkwyTdGZczHnFVtTjDgkS7cqFBjloyZ69xTrqpUE1jfTF+OtX4hPKeW2NG5akmbGzyoJ/fY68d+7vFWQCHuWpnRYJAkfI1SvRon2sVj5hcuoMPXCRp3sR9+Y0vpZvtu77vSGOEpSkoMqmp+GYC8e8798k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=quilRdce; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="quilRdce"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so3148713a12.1
        for <linux-alpha@vger.kernel.org>; Wed, 02 Sep 2026 22:34:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788413655; cv=none;
        d=google.com; s=arc-20260327;
        b=sZABHYIiXNSiem876hIrBve4Z8QotZhdbKLDAGUtfI06rCzI8HL6DrdLxsRPTdp5Vt
         fHotlSEK5QicNns6nXeJnV9PCEd8KuAXnXXToMLUtlCWLiKcP3//C/Aic/ivO8RovzpE
         Iru1MljpN5tcp3pDwpKQlKMSu1XuGwx/NRkKPogoYpqymgf4HSJ324ji5zK1/rDopWf9
         dGAJ/jJvrjdEqAjRixG3sz1IsLJIk7hsJox2YHce01pdoEzJm+3iL25qTDRg2E890fq2
         2iRUCCWsMbYscs9PytZtL4TbugvqzaXlbaS4bX1Xm9CNgrTacMtA80vyoYCqBt8GyJSi
         fTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sQDht6d4W1Y1iAmYhRjK3jxJe9gEuYEJ4ZOP2eHF1KY=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=n500mc6ZCg9MbG0yghswxZXxgZf55NqLaIwnz59EqroEcdlrSI9kD/2uEeV2h92KMf
         9NlG44wWXCDzUpnNn5/Bkm27GjFvLi4xVxB5luo7VmuCoM56cZwlJAU2CSU3FfNtIPJb
         QfFP460jxOnynOOi00EbpF4Md9xhzknYoQEQ/QYm0Ed6YS7Fp0beP5ndkJ5FHUR72ZYg
         9/dEnJI+ruwCrWY7I/2XhFKEP3HCsPMeEchZSG6UHNKCmZHMLyAlHapkqiATiwy1Ekre
         3vXI9zaO9Dji5PfakqRbuhQsx4DVxnAH1a1POkGHjhmZ7g+QChnNFlPYKjeVmppN1i+n
         9BOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788413655; x=1789018455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sQDht6d4W1Y1iAmYhRjK3jxJe9gEuYEJ4ZOP2eHF1KY=;
        b=quilRdceto0+YiYJme7RkwDzcwr3vf9yH76ui+rF7gMIda+dKED6ugzgSnUXuOjcn3
         DMQmoijfMEpk3WzVs/ijbhPWQbxvvakJNV+pVXxCn5k22J7ZnfxtYT9mjQxARk9i8KPw
         XJMzvZ+UWnnrvHqIQqxRAJUPbb06liyYmjRk+obiLTF9m09u9qwjwJ1fV//3KV0Zv4kV
         udrbt3e6lO7xyBxHoK870dXOKVoTgBu6+xvSIp0q3UGKP8mxIxD/tRpNJtL4rtgczecI
         tF/kVJkow2t9Yuy5VSMsdHPcIzQyrzHZ3I6i/mggnPrSv0wKpwyLkCEjSaDK0D5aGJr8
         9xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788413655; x=1789018455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQDht6d4W1Y1iAmYhRjK3jxJe9gEuYEJ4ZOP2eHF1KY=;
        b=MxWmtiINwXTFOiQDQK4DNqwAx/ltWJdReW7nC5mZYSLQ5AyKFBEk1h0j2XV+zzY6S2
         lOI1ZAaOJfQYR75YfCmlTSKc6iehQ0X8yl0JYUurqKqANLsItu+o1Yu43b9MCyO0pZcF
         RxKdKiAkN7PuUI/Boc4ZfQMA+jxBk1HthyhC5POVAs0Se0JGDapGAxpOKTpbfl7plyWg
         snE6RLfn3LGf5a84VIIEofHSKN4cCQ5iaV7pMIeoK2D4q9poorAEG1rBmxHCFp7KIVO2
         URcyl6agj4eXJApCjS5PCF1EL9aPHrerCteQreXbagYuc/DnqsvXG3ZNuvCB2wHDIypZ
         K7iw==
X-Gm-Message-State: AFuF++n/ke17pjFZ7ZLmhDVy3pI02VC2H6YXdqpQV/Py4Wwy8L+mh0HM
	PDFvnn1pjf74LOfn2R3wv70s5x0wXiBXSEwu6B6m2nkTsfC9arX24MORqZ5p7VfGwc+xg503aMy
	KdmVDJr1vpuxNjWvqypf2ppW3JJmGEpc=
X-Gm-Gg: AYBFou0iTMz161cU3wx3UdBpA2lebIXkpH2VmtoIGucsi2OaDfgjsNhdNXC/jZjBzy+
	4A6K18lxgG72eHwsGR5pq/UP4tAbNK54dpKOaq7vcMFw/qcm3ZBxEz/vKumF/+r7MKe3mnGJ3ms
	GSI2sE/BLbQ5mZl09/m9D9tBN62UsEYS/sN4ByzxV5gaqsnhhEaBhVtXK3Uj1jHGSauiR3hyq8u
	cSHKBpJ+P12MbZ8f+iWt89puOiYm/GMhDW3HmNyEeLMvhEwshxjMziFolJmp+dvvPd0npoA8pvB
	yeoV94MspNrQuuAzMMOSshDWUDEcLgLj+bM6A/a3u7WClfJHJXOpRCLIc4gOfiay2yccCGVfV0I
	zOPwbRyKGeKqKure/L0YW7OWXfydgrF0QcGAr744rCG64CwtP8T4m6w==
X-Received: by 2002:a05:6402:460c:b0:6a3:87b7:b516 with SMTP id
 4fb4d7f45d1cf-6a68313fb0cmr6097702a12.6.1788413654726; Wed, 02 Sep 2026
 22:34:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <56f601c91463c7ebaa3aa0d0a5f7aef0f876bd7b.1788277742.git.mattst88@gmail.com>
In-Reply-To: <56f601c91463c7ebaa3aa0d0a5f7aef0f876bd7b.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 3 Sep 2026 07:34:03 +0200
X-Gm-Features: AcwNN1U_EahTO_NN2lJQXULILj_80LIDmyuURS6Fs119god-n9oTvl2NrZdX6Yg
Message-ID: <CA+=Fv5TgxkNPy-i3U1CErTpY-5jHrZYQN9ptiFbEbS9jmec79g@mail.gmail.com>
Subject: Re: [PATCH 20/24] alpha: select ARCH_WANT_LD_ORPHAN_WARN
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> With .eh_frame and the relocation sections now placed explicitly, an
> Alpha kernel links with no orphan sections left, so ask the linker to
> warn if new ones appear.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Build tested this for Alpla, looks good to me.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

> ---
>  arch/alpha/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index 4c60c442207c..827b224f2f8a 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -38,6 +38,7 @@ config ALPHA
>         select AUTO_IRQ_AFFINITY if SMP
>         select GENERIC_IRQ_SHOW
>         select ARCH_WANT_IPC_PARSE_VERSION
> +       select ARCH_WANT_LD_ORPHAN_WARN
>         select ARCH_HAVE_NMI_SAFE_CMPXCHG
>         select AUDIT_ARCH
>         select EDAC_SUPPORT
> --
> 2.54.0
>
