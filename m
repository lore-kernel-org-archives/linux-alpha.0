Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7C44F7CC0
	for <linux-alpha@vger.kernel.org>; Thu, 17 Sep 2026 17:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667666; cv=pass; b=ZFUVfsoarP7CJGD2x3burheWz93ESWjWthpbEg5km+CZumW7QFa1axtu9T86aTh12MXJG3LSsPaAVsFoH/jGOoS8Wq8pHsDMyHNfG+wdc/7grJsx6+BSYNb4xNGTo1F5CDnLeuM1L/NhEYRReS9dsODQ60+d0Q7WNH3Ex/3jBzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667666; c=relaxed/simple;
	bh=lV53x9iap7CWHKayETL36WLG11uBzdsYNl2pBib1Gp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dw9D/BD7t3eodcf0Blr4vW5PhA2dOI1Ym18UnPDGYawstHsg7CVmDAFilL4AZ+lPk89J6YGM93cyhDwS0NYpfURmWAchNNSVz2c0E6lZNyNbIZ4lBIqgAyq4p0Z0THzJYmkLS821TyMETEO/foSLMdouC5DBG0Lsw3bMbRCZbJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpPSHEmV; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpPSHEmV"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso2021776a12.3
        for <linux-alpha@vger.kernel.org>; Thu, 17 Sep 2026 10:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789667662; cv=none;
        d=google.com; s=arc-20260327;
        b=mAI50R4sUp0r5NXjvT8POlYH01vXP+A9axLrrqUbnEZpvdUih3sMx8BhmZQIEyjo/W
         nkhgUWvxgeSAr7A7gweqEbLCxgQMDcy0bdHKeIjw4IGu+y1p3Bo+YrEgJGhRpl83KZoD
         OTwaXXXjgysyPZpiS9/LXT19ArVs2+OtzJLRt1ymSJqFPof3q2uxIhypxOWGeO+0EC1I
         wvW0aNJZEHD6i5QiWYXe9hlG/MSNm0RC1cLro5PfnIzuo8QtoDjUtMQWuguIy9ZBEgki
         2AI+2jnSp/sJr9mMZBoeh7EiA1wOwHEO7Dmv+LCWp/U25nz1nNUWhfnhK4fpbIJODVGX
         alEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Buk1YbOGNfq7p+FGXzo+IE9gOuA+FToX+F15GNq95I=;
        fh=fCmIkrbDJ7044Iz0lkuyyyQM7BH1gIUAwqjEZRby+l0=;
        b=UKNMzHATPvn8R3X6cBxiT9282R/yOKkIDaT648fOkewEIQLJynx/gCQjNye4wLuQ2L
         mI3U7BoQ1cAy4Sq/Ts20/sbfJ31aoctsELT6xwGBLU5r6yoPmCgwlm88FyAg7V9QbE7r
         ycBkRe+RJrju1PMGSSSNMtKRkYY0i1Fynpm5izUIYTFA86bzJ2pN2eD4eS+qQe/e6dby
         MJcXpMRbVe0e4w2YmQsGD2iFts8/5SwPtIQpUthGxGaiLWcPeqN9+nT5jbiA8raENuGh
         fiueplPVpY+Ht2LEt8U6x9WdwTAmUZhkec6ZjNncq+UGGxjO6lGoMBa1p+uIcvg0zRQp
         o1ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789667662; x=1790272462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Buk1YbOGNfq7p+FGXzo+IE9gOuA+FToX+F15GNq95I=;
        b=mpPSHEmVzw3vcv8GfUUr/yPtx9dfgVBoOqkTtcEupeTV/34oICBDbPpiZJ+MyjYeq/
         zxgG13txuumlE2Q6kcgEjDdWd8e1tHqMBosOpEG6lEzRV+rienp25DkasDniTkhBmSjl
         XAEPuSF5bgbC7WYZS7lMzL0jFTHg8oUJCKa7FAUOPnGYISmAQvERPdqIWpALrBnrj8kT
         r9iZbjtvXCJ8VVTMiU67L8scTTHToyNLx6diO/GDBNMLYNpMnaRrpoUXlklDk8rZtgOg
         So8R6Q087gIi91I7+dt+XxIdHOr+jPAjKbJqofo+sHblWvHUsyiLsapZ0HuaGXy3gTNM
         6DDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667662; x=1790272462;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Buk1YbOGNfq7p+FGXzo+IE9gOuA+FToX+F15GNq95I=;
        b=EoIx/QXKL12S85Gz03DqMx7v7n5vsbYwufkFBNTTqje67I3QoTDmRFCd+PCMZeCJFz
         MmtS4gMOyGf81lCAoJoTOlkJ4lU/DZwhspAiyBkJZ+sZi6uwa3ytRfF9XAUkxz4kzS30
         E+mFqf4+rxoA5/YSN9Nax9gfvFc9MiRvPCky0WPLC7LFWlHCdqTSFb5jRrUzBkQbd2nw
         h6m0WugEgTPrYQtl5lWv1kIEcsotj7pyj7UKD2O1J9c3K2tvBCk6EOgYNEXxsmJK2Uy0
         T/0W06h304QWsraGS99XAQQbDKRfYMoxkTf4YhhvjVFGWbNQJmOAsHDNy1tB/Pn8gxt6
         2vDQ==
X-Forwarded-Encrypted: i=1; AKwUvByXQAyCBNcBMLKkQNnjgQelDFRJtGVxKglefY4wat0B7Hbxl3xccpqkfxI4+MNEln5soeBNj65yjlow6w==@vger.kernel.org
X-Gm-Message-State: AFuF++lrvIghDfxGKWPfjyJFBK8olfoBGjoSTsoarnY+NvP3Q+TjEOks
	gkt69CS+3s93jU4TBkA+o+oFHMTWzCtqnWlO0yBFncuRLHGTNIgkb3j9Fi6qlKUnHrsvKqBOeGc
	N8ai+ibZdTgz2DhjdYJlAbP8Bya4UL/A=
X-Gm-Gg: AYBFou1U6hcN/uqvcf+bBUTmsDcORdUUHCSQK/uPLgInx+wrKyO6pON8Uko8yRmmFY0
	o4MMKAjgjX7khoPWBFxwMH7CLWrHiKPHYJMbj5Jwmwp3oPPQIbbv7PzJmn30en7lBjS6jMwiLpW
	kFYcF5Au5oqlOs8488XPt57upJtB8FprDfaCDIljMHxQpesD5QjrmSM41e0YQR7Nj+1426Qx/eu
	njoNUoefYn4pK0t+EPWUGuT1YTzfsuxZ/uTalE5cPhGkYMYIxZUQSuowOmXJeMRZ20jt670SCUa
	WrT+uG5cBkIyesv6ThE92ItcMgMFHnsP3h7BdcGs6B4YodGa0gNCVNPFAX7topPORLpV/hOOprR
	oUhnFJymvGElKyKfbqSRYMWh4mILfOlWe8DasfqNBAg==
X-Received: by 2002:a17:907:3e08:b0:c29:6092:39de with SMTP id
 a640c23a62f3a-c29e5311b55mr533263066b.48.1789667662379; Thu, 17 Sep 2026
 10:54:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
 <20260912-alpha-kernel-compression-v1-1-ce9d55330193@gmail.com> <20260915220301.64f72f3f.lasse.collin@tukaani.org>
In-Reply-To: <20260915220301.64f72f3f.lasse.collin@tukaani.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 17 Sep 2026 19:54:10 +0200
X-Gm-Features: AcwNN1XFQaD3-In1KSOuGhL77cLzYksu55zUVpJQR1dIQvXxYtX117DrcpPGuP0
Message-ID: <CA+=Fv5SSK4CXcHkyZMNyU1DigGzevJHYMR+dKPQZgGKdEeu4dw@mail.gmail.com>
Subject: Re: [PATCH 1/3] xz: add arch-specific tuning for alpha
To: Lasse Collin <lasse.collin@tukaani.org>
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lasse,

On Tue, Sep 15, 2026 at 9:03=E2=80=AFPM Lasse Collin <lasse.collin@tukaani.=
org> wrote:
>
> On 2026-09-12 Matt Turner wrote:
> > Alpha has fixed-length, 4-byte-aligned instructions and no XZ BCJ
> > filter, so it wants the same LZMA2 settings as the other
> > 4-byte-aligned targets. Without an entry it hits the default case,
> > which warns
> >
> >   scripts/xz_wrap.sh: Arch-specific tuning is missing for 'alpha'
> >
> > and conservatively assumes 2-byte alignment. Alpha gains
> > HAVE_KERNEL_XZ later in this series; the correct alignment also
> > shrinks a UP1500 kernel's XZ image from 6469320 to 6448840 bytes.
> >
> > Signed-off-by: Matt Turner <mattst88@gmail.com>
> > ---
> >  scripts/xz_wrap.sh | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/scripts/xz_wrap.sh b/scripts/xz_wrap.sh
> > index f19369687030..5af0d9045cbc 100755
> > --- a/scripts/xz_wrap.sh
> > +++ b/scripts/xz_wrap.sh
> > @@ -10,6 +10,7 @@
> >  # XZ-compressed kernel isn't currently supported on every listed arch.
> >  #   Arch        Align   Notes
> > +#   alpha         4
> >  #   arm          2/4    ARM and ARM-Thumb2
> >  #   arm64         4
> >  #   csky          2
> > @@ -44,6 +45,10 @@ BCJ=3D
> >  # Set the BCJ filter if one is available.
> >  # It must match the #ifdef usage in lib/decompress_unxz.c.
> >  case $SRCARCH in
> > +     alpha)
> > +             ALIGN=3D4
> > +             ;;
> > +
> >       arm)
> >               if is_enabled CONFIG_THUMB2_KERNEL; then
> >                       ALIGN=3D2
> >
>
> Thanks for Cc'ing me. For this patch:
>
> Reviewed-by: Lasse Collin <lasse.collin@tukaani.org>
>
> I looked at the other patches too and didn't see any issues around the
> decompressor usage, but I didn't really review them.
>
> --
> Lasse Collin

Collected your tag and added this to my for-next.

Thanks

Magnus
