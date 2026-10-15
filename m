Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD4652E050
	for <linux-alpha@vger.kernel.org>; Thu, 15 Oct 2026 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071456; cv=pass; b=lV4vJ5B7X4uQivCVNspqZmnNhzSyr5ij97JGwzBRSeyCJpJyQiyV0NUTrvDVzruqTVyOd/gvRWR/WYYwJrqQ8GmNoE9Da0a8I0CyOhcdR0tozxO6e86uNM17NGeEHj2MugTCzGIWL8cBN08OdbMdgP6IYyYaLRoSMCyw/dQCRIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071456; c=relaxed/simple;
	bh=TXj3NS6P/eZrWg/Se3J8n7sYemCu2uKUUC5QwX5p1qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oB7enc5HQbPCob11AvsYH3vanNL9uws25k3ZJ/uQwSSF7TTNxXBmMN/MJAHZ/0Cb4hFZhcPfiimUcnb0cRBf4IxSwk69h5hnF9K4FZutpOgdmDYh1oQKVQUpbi+v8EjWYoCDZZ0DEeiEVZy/0zJR7EIK7AWW53/hnC6RT6LPoM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnQkdHoN; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnQkdHoN"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e3846d1caso855482066b.0
        for <linux-alpha@vger.kernel.org>; Thu, 15 Oct 2026 06:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792071454; cv=none;
        d=google.com; s=arc-20260327;
        b=T6xGBNvOW0ft7eTt1D/6TObVmd2GsVhKeF09YHgvlwzO5XZdCQYTXyZ1s8/S/xMgen
         9D8O9SXYvZEtAyHQE118qqUktjWbsREDq2yUnCNpVfhbjbf7AcraSgCEoNkQt45L+iX0
         C/cBCA5M5ifXP0U3QHUbyss2FPifqwt/1IrVc+8Iczp147SUFPrSvW4W+PfVkpIFC+0c
         cVLiC163FUbyy3WQSTwm2ktKZ86dmlEUgpGYayGogkeJ8u7fcPLpRHjVR8sFcLPTnKP/
         BdlsLgTwBe13yxMdF+k2/2hSqidaHoe5wLB+4/7+G/u6EW+Piskn9QS+PZbZHBgcaMHh
         K2zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=st4ZmCpXjqsFhxZXZDzUQkmMc+ZJJRyqEg8qR1MiObI=;
        fh=j4pjLL8Va88ncXPvINs3pFN3idPWs+l+dQOvDlL5gEE=;
        b=e6/M8mgNsVCOwo3XsdSZjWhhyXpPE/wohMxNohTQOcYVVR9VDoxsn7c/Tx/TU0wlIv
         LY867EfUFNrNWb5FEJTSsoItZTjQnINO7yU9Ip5Nix4PqMy3aI8aoB5xe66hvN4bI8vO
         mcGbgTaZJcH1/Av0bO+NmgUWNyUdSGztzicxl2QXlThF8jM/nMuAExTptso3Xbgxc45P
         b122b7fZwPd11BovmNYvykQkr1Ut9H5F6wHcvnrw77spejo2gJx28CSsZ4ZUzNQpqkOW
         GZCs5ywyfrgd6+kTrAVH/I+fiUpQR17ePGMNuJfkB+EQoA09tzwKc0REPmirhz9kSrqB
         c09w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792071454; x=1792676254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=st4ZmCpXjqsFhxZXZDzUQkmMc+ZJJRyqEg8qR1MiObI=;
        b=TnQkdHoNYjJ3tEU0KvbiZPVgW0gv7vqoer0QSare9PssJVfvgHR9qoFv8E++SmXwxm
         rdgM7VTrGgiLvgs3s/uHZD04U1Jy1ZT0MOQVqi9zlUZW8fpDXMqyvpFk5xzOu2dC0Sdu
         bLkQK8eBLf0ppHUr5wx4sZgJfZNzWKwQ50UPNxh+UjxA3iqM7mUm+ZRmjznn+GLs8vAq
         Rm8j6LumtU8d2rXd8KcdoT2jLFdw5OLNvJvoZWAZ3So87vehh3yN13n24W0H30IAqFCw
         qH3iK6H+xAtGTgcug5B3+ZJehs+EcVrdepcUfiDzvucdU2sh2QwGkQZdiCVdHFAVx64W
         1DhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071454; x=1792676254;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=st4ZmCpXjqsFhxZXZDzUQkmMc+ZJJRyqEg8qR1MiObI=;
        b=b9igAFNzFAeYMhptSxp6d2GPUUW0xvRYa+4IyawOaDw3Q7ABRjjmfy3I49JV2ZaAg+
         B+Djal/jl53nHT/kfNIhRDFZlbRBaDfIcRCC6GynLw7E4CukWpW621Q6Drl7aAruzWFd
         lJk6oeOvlKxgisCds8sYB76/1jYyq+RQ44vsVlHZx5eW/KflkC+4k8CqiPB8y/cxNniS
         Ygw5IEFmDQ7GXYUh8G2mtnQpjwue1mOFw/1lKMqzovnilaC7ROeSYM75FRM1iEyHdCHv
         u+OCOkFt95esbwrynP3kCxpHDR8nDGyKeRGw71iUYgzAwAcmO4WcKajHWAU6YsmuZp1a
         cv5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzzjNm8T1V4eAyIETNJUZUMSC2AwEGgkMmMCbHm7QTpHO0nAqZ+5xxXESYKvD3xpDw7BaeaD/awXuqrww==@vger.kernel.org
X-Gm-Message-State: AFq9FYJXvQ25W2C4hOMcHg11Dp9O2R+ULYboR4dGNcTIXUHU7SaM7qUc
	NBkuAHaLd/LXCUD6qXUPJiCM0fj6ABp06He1+z1Vp+OCyxY4e3odQClSlnIdJLxnKW++LY8yUHu
	Ru+wLRQNyHDrBm6w8+bUnWqjPBRCbkK0=
X-Gm-Gg: AYBFou20UMqw6piRx/82RcSRqmTOKDM8cy8UeiF4OXKNNO1c6kVvQZWOdbmozO2lIFb
	djcJO0VTit1AQTYQUzQaeCBoXQn7F2nhbZwrUnImydbaJ6UT01Hu/Ioe3ZXecyD3/IwjGymV/cw
	2C1gDP0z0FW0efUEq3EE2szj+JvoVoKCi71upjXXjuktnFPdvdyr7glodSrvEcGW/z7kxG2BKp1
	NExPaBI3VCUJlq0kfegX515YyJvdwbYrVcvLxEK4Vzt0h+hHjcehnJGEhvtVWYvUo3W5T9SdjBx
	CeJACqppYfu/xr1hEzMmtkN9nd4SxE9J7wvhCZQWKNjytnjGUBhfmcGGqPdNtogICOgMmJR9eBl
	19hZoK3vTCWH0
X-Received: by 2002:a17:907:7ba3:b0:c29:f159:ddd4 with SMTP id
 a640c23a62f3a-c31a9d31be3mr1784113666b.26.1792071453546; Thu, 15 Oct 2026
 06:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
 <alpine.DEB.2.21.2610120106400.55767@angie.orcam.me.uk> <3a8312daad335c9cc7efdc497155af7c8a32af83.camel@physik.fu-berlin.de>
In-Reply-To: <3a8312daad335c9cc7efdc497155af7c8a32af83.camel@physik.fu-berlin.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 15 Oct 2026 15:37:22 +0200
X-Gm-Features: AclHuK-iitxx5wr2i1EudyqnO0aicnVXWKjyL2GUZ6w8krvfSpmRyFGLWSzLups
Message-ID: <CA+=Fv5RS6tyB28U1b-OJFLkwFLLA6r57amPCsfuMpc4ZQ9JZNA@mail.gmail.com>
Subject: Re: [PATCH 0/3] alpha: self-extracting compressed kernel images
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Matt Turner <mattst88@gmail.com>, 
	Lasse Collin <lasse.collin@tukaani.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, Oct 15, 2026 at 3:26=E2=80=AFPM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> On Thu, 2026-10-15 at 14:09 +0100, Maciej W. Rozycki wrote:
> > On Sat, 12 Sep 2026, Matt Turner wrote:
> >
> > > The SRM netboot path (bootpz.c) has its own boot protocol and keeps
> > > using gzip.
> >
> >  Reminds me to dust off and upstream patches for making an image suitab=
le
> > for netbooting via MOP, which is the only protocol supported by all SRM
> > revisions, since earlier ones lack BOOTP/TFTP handling, such as with on=
e I
> > have in one of my Alpha systems.
>
> Please do so. ;-) And maybe help getting the LRA port for GCC done.
>
> >  There's also a fix I already posted for cross-compilation support that=
 is
> > required to avoid relying on a.out support in the build machine, which =
may
> > not be there; I've come up with a better way to handle that and will sh=
are
> > the outcome hopefully sometime soon.
>
> aboot is also not cross-buildable and also needs some tweaking:
>
> https://github.com/alphalinux/aboot/issues/5
>

I think I fixed cross-building a while back

https://github.com/linmag7/aboot/commits/crossbuild

Not sure if that was part of the PR? I need to check that.

> >  Thank you for your ongoing maintenance effort overall.
>
> Yes, Matt and Magnus are doing a great job bringing alpha back into shape=
!
>

Thanks! it's fun work, especially now when things are moving forward.


Regards

Magnus
