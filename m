Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC75291C10
	for <linux-alpha@vger.kernel.org>; Sun, 13 Sep 2026 09:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789292749; cv=pass; b=Xk3JIQdQcd4wZHZkWwBHUEfmsxZIrXmzysAataXm7//lSvFLbV3lERnwSrIvdL7bZUR7eV3kftRjMa7rHRIIRCAi5flv0Mxlwcv/bubmKcPYXHa/Ki41RGkpqovCaj0JweFikFFsgsjM6lYglQbmljHB3S5A3v33q54m9UhN3FE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789292749; c=relaxed/simple;
	bh=St6W6hDnL+quEVCQWlY6BjLk2qoCPo9Xwae5VZ5pIg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbyOxhY3IslbnC0zFhMvWuA7KdNwSFmGWE5C3ae9BNFaQPst9RZJPmv15S9+AABePmgxhcVoZaIoC8eU77Rd4w/3bXXjnWZg9Do2hqgiWRjYlQBzE+la//T9+dsDHSPOZNSQVYJJOMYFmLZq0a7Uz22QYfAopE+cdGLqkilt6qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZy3dquN; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZy3dquN"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a9e35826baso294285a12.2
        for <linux-alpha@vger.kernel.org>; Sun, 13 Sep 2026 02:45:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789292746; cv=none;
        d=google.com; s=arc-20260327;
        b=LYpBd6TgQyNJIdTBQUsikWGqV9NdSUtCd3haI+6ly7jtMwkQ38YmELaq1lgLBEs0J1
         8BlOa3ajbm5YkCAq1UX4wXAfWxKXHVlnLtEE7fIoTlazqWF1d182v7YKMBT5lx4RZEUF
         xPhrXXxm5wuF/rlczuj85vT2kZFedNR+gdRzevbxD5x+7SkDmfFTTMd2G1xjHD/miHfD
         KOrvJ0tWFT7uVddt7hLxTaD0izQqYI9F1f8lnubhvkUAouUJpR+NO9D9l3iiLc7UoF3u
         S4tQ9+bU4oMgm8j07x7guUtbSJQ4sB8dzDd7snQ2hXlfmWDZvI0lKXHk5nn+Fmt9zVQO
         i78A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4GSFK0IBNPKD/n/w/B3EdbmLmtX6QuH+6lVrbbUZq5A=;
        fh=s+kFNRoGsZmQCur9AshTSXXWe3vK7PJdmGOJNsAHvhA=;
        b=SvkY7mw/IxieWTT+43FsBzfWSFzhdyXgPW/vDXtJ/OVPh5tcs8+j4VklTeUC9APuzk
         E2Q3fTZyKET9941VNK9z3q8eryd2bNZndzqZebSXkIyUGi+CuAMkfnN6RXmqKaZyvGvY
         18x3Oc95VwC8K1G09BYY6/zEmmaOwyudfRx5PNf4XX5BiH3W7ABbXF4lWqoH4yTy2jzk
         cJGc2vedqkxOI11+jypNh4+YdWJ9FVCRujjN19ugD8g19/to6/np3pFJQPkximQX83pb
         eV+23NLenVbvlbbNH2HUKnAcNhAiPm9W17kfWQJRBuZZ/Jh5wogRhXUUgkjaFWj4DR6h
         VvqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789292746; x=1789897546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4GSFK0IBNPKD/n/w/B3EdbmLmtX6QuH+6lVrbbUZq5A=;
        b=iZy3dquNJAjoMgwIl90UDpIezY3BLSZyc2K/HsAfc+n4oqXi0sufr+raY4f4lCZlj2
         EEgiCWXbD8FrIzxhUufDLJVM63U2Kcx8mmSgg1hg3fn6VZ1zZiQ5S7MVYmcWvU5CIZej
         i13PSoBxzuZJRWLEWD4svym5W6ZaeyXwyx+4qhk+fFHrwyJ77cG+LogJa54xGTfp+k3Y
         duLTSihXgdalsCgcWLEiIH62IjuzQ3R23bQ0BK5K3gi9lqHHoJD4MVNOoxAOqhSfZ4ys
         Px9Bio1gxzCHPoHy49U7h558uKtw4TQI+KAdyV2VYqozK5trmsJt57OYmd0rcQYNmDaT
         JHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789292746; x=1789897546;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GSFK0IBNPKD/n/w/B3EdbmLmtX6QuH+6lVrbbUZq5A=;
        b=QUvDwTYdc82hYkaZNR5RvbLjlUOP0w7r5TxwnCK03Y0Mp63R2khsseccdpBg4jY+wD
         h+RAQ/55sbSbBpjl+b235ptV3LZnXrftVlZkedTk1LxcwvNH4jNBG5rp7ulNvIKn4Uqx
         9jUeD8iOKMNBz3jcQIDQgj8dwWnKggU1pMGWQO1UNbXceZ7U+bBcmkOeTSfb23TQ6vd/
         JdAr1+qV7pzv5fWdEKBJIPfTbsS0IodDFoPVFwICNHWW5L4SX3bTrxii2on6fiKdIGb6
         JnXtIRj6Tz1u9ZiJ4dCIuvmiWmLcJlq0gFnTlKimdiSDn4bPlzwouCKdO4nSTapt9A9i
         xGHg==
X-Forwarded-Encrypted: i=1; AKwUvBx2BdAvsduSUDrn1Jy0KF7vejFL4/JH2lcWYfr1lYPJJ0nfd5NHFLFf6UViGoPA6slPLpBRPN3Fxg7Z8A==@vger.kernel.org
X-Gm-Message-State: AFuF++lHDSn4/KLICZwCe3r7YXX/dHlAQYupr7TVi2iW0rBTnB4SyR7H
	34/EHofRzLIMSJUgVXtofxpuaIaQg6OpmN1TXS355sI/JoE/d/TaQhSD2YU3iXE8KvIxI8Y9ubT
	5rAbwDk1lctdZ1n/zwSpJuPv7ivE556s=
X-Gm-Gg: AYBFou3gFAsRB3RrP8qM5TplfWKli3lBbXnvS/yRpTd67k0yvYGFpILLk/MrsysNkKO
	LNAYVmTgJF1dSTric/sjVhfAAmp6RdOtyYnwy5K1nI6Z600Phg0UbT+fKgZGiplovrWM3h1G5X/
	Y8wHtpU9Bu6FhnnB26j04ZgggkgfX+VbLPjLpjFKpdQdv/33zCjwvnSQtmYmyj4WXA+N8ltETft
	5Lk9HdrBLh6Dk6VcAQjyYw0XSj4kGWDFkJ6UBZc8kBytHWpCTmibaZWEGgFESF4Tf1NxbTX68aa
	PtSs5LoWgww0Kb87vpaw8Sja+xvLxSfNb1yUyF3oJqfWEGqwl8EoIZHayFKpEDren3Y0uLPiErx
	v4ZuzSC80OFxxxNgQu203roanHC8YJqIwtP/ram4W
X-Received: by 2002:a17:907:724b:b0:c26:19de:9126 with SMTP id
 a640c23a62f3a-c29666bc600mr654836366b.25.1789292745708; Sun, 13 Sep 2026
 02:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com> <20260912-alpha-kernel-compression-v1-1-ce9d55330193@gmail.com>
In-Reply-To: <20260912-alpha-kernel-compression-v1-1-ce9d55330193@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 13 Sep 2026 11:45:34 +0200
X-Gm-Features: AcwNN1UDXelwUT5y0X3b0OlpBwZ_KqKPnFEdccs_qg7KSWeFBiSwlRza_aFNtcQ
Message-ID: <CA+=Fv5SfPzqPx8-YqOatq7YNJ_s=z-9LaCg7EJbsgViB54bXLw@mail.gmail.com>
Subject: Re: [PATCH 1/3] xz: add arch-specific tuning for alpha
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
> Alpha has fixed-length, 4-byte-aligned instructions and no XZ BCJ
> filter, so it wants the same LZMA2 settings as the other 4-byte-aligned
> targets. Without an entry it hits the default case, which warns
>
>   scripts/xz_wrap.sh: Arch-specific tuning is missing for 'alpha'
>
> and conservatively assumes 2-byte alignment. Alpha gains HAVE_KERNEL_XZ
> later in this series; the correct alignment also shrinks a UP1500
> kernel's XZ image from 6469320 to 6448840 bytes.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  scripts/xz_wrap.sh | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/xz_wrap.sh b/scripts/xz_wrap.sh
> index f19369687030..5af0d9045cbc 100755
> --- a/scripts/xz_wrap.sh
> +++ b/scripts/xz_wrap.sh
> @@ -10,6 +10,7 @@
>  # XZ-compressed kernel isn't currently supported on every listed arch.
>  #
>  #   Arch        Align   Notes
> +#   alpha         4
>  #   arm          2/4    ARM and ARM-Thumb2
>  #   arm64         4
>  #   csky          2
> @@ -44,6 +45,10 @@ BCJ=3D
>  # Set the BCJ filter if one is available.
>  # It must match the #ifdef usage in lib/decompress_unxz.c.
>  case $SRCARCH in
> +       alpha)
> +               ALIGN=3D4
> +               ;;
> +
>         arm)
>                 if is_enabled CONFIG_THUMB2_KERNEL; then
>                         ALIGN=3D2
>
> --
> 2.54.0
>

I built the complete series with CONFIG_KERNEL_XZ=3Dy  and successfully
boot-tested the resulting XZ self-extracting kernel on an UP2000+ through
SRM and aboot.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
