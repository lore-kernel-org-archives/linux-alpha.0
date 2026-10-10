Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B02D331ED0
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 11:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631884; cv=pass; b=pe4NKDnXsfjV/z/FxLYli2uS3lXjzW4UtTcQcr6h5ODkghJgQ6b3dBiPGDEdrpccP6hTKWhrbg9D1J5RPjPVnE+EEWs7E9EdjS1aYQ7H6XwnYEXJN2a96ou4E3OTgg7KM9ZygkGdKiRmmTOL+LlnjTrsIBbLZDZxlnLvxrvF0R4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631884; c=relaxed/simple;
	bh=gv4uWDfgFmz9WVtkNmwJAWshwTrVyFn/VfmnlB7WXT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qg3ncFJ1bWE5KsrlKI7UIyXhuIp7DdNSL04WeW5rW/DwBiRlIcS5nD4VssIAeY11EK+MW5QaIgRLE+7vxY7uJePGbQuSNWE1/8D4iKJ4TAZudcj/AarmnNObsRPJi+Vy1vRC0rpXIvBPqfYWoqi+pPI/aoiE4kmMI4+EzeSJvn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty+929uB; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty+929uB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so730819a12.0
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 04:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791631881; cv=none;
        d=google.com; s=arc-20260327;
        b=pPYOPYDzML6tcsK/cTZ6O6qvcM1P7A/yt5fWyCyq0UIybKs59/4NUy5pmLqymnTed2
         p/qS8o1MnYnjANTGGMBodmzC9eLNbDXpqo9z8WHvQhsJVzCD5/4t7BXGlA1RyJGTNHPo
         7kqZeTrX339uGdkVI0TAHdfuSPh+QAdFzN2WQdgssc0Hx8Uw9yYT8eySOZeVzHWS8zo/
         a8I3cpi/i45QOiPsUWA4Jp2GpZYWkBlmEkupq5pbA7corEm79DShMc4VugSoAP/m5Lgz
         aucfLL2r+b+XZ6VI8+HvefzxRjw9aOqAzZNkjuHn7jVy4BCtCnn1JHA2nEoYuTrYmLVj
         SL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gUQ+lGifeXqqAlciKTopFGFnd8gQ9mlyrmzyDz9aPAM=;
        fh=IicPBqA7QGEsRfLUJxNQ4RN0mQZSVkPmDPFkfRC6pes=;
        b=UVPVcyOTulYKw3rbsPNNcBhzoahmG/zSdSwCScHHjEyYodFTvXNLBXLDt8j0QwbftK
         I2qRszScDvR+y7BMECM4FE2x+sVrTcLYteOfDL6g2hW9uxE47awvKmlbrHgUYZR2/1kw
         b5dYX7SIpGf/r9p7R7popMKB+D9BWWohfx+Y/+0E5m8Hk/qZpG4Iv0xWerV/YaGP+CrN
         RD1K3/S0jyA41n2CXC9l7bkS2jCqdiSq0z3SOwQvTaKnc5HNRedAh4e0eHanFcARHQjz
         2Y88PA6zfNkprcpv0u/A2qolqYp1+awGhZWXGUDOtMyJ5NxNJuCJHKh/YN3ztpBorae0
         yG9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791631881; x=1792236681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gUQ+lGifeXqqAlciKTopFGFnd8gQ9mlyrmzyDz9aPAM=;
        b=Ty+929uBFE6ZVVF6ZS+zXaFPyt9i69Hh1w7OmIJOIg9KnXJ7USpRZkNTAp33g1wslU
         XsPOehdqC1fk4lPlGSf32B+J6tdsKmPWxbyJ1qJUTDfNcD2gsQQV7JxWqnmywrMRbUHv
         oz2qG3y9F2lkwMQeE+E2zTqteIvOYdAaHOrTVqw+d/b6ZCVfZeOPwxTXPlXrT+qkqxVs
         j2PMuOqOhBCdcX1A/3AyeTzMwPa8GQBqUdExTRQ2E3Cp3AOaxI6pwTJ1eJvHTsoNWeyu
         h54Q7AQjhdteX1QxjQYvF6RNw1rDsY30hIAmyxWQyJHxsQlUJzcyjdwRs1G3REwT4U6m
         UHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631881; x=1792236681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUQ+lGifeXqqAlciKTopFGFnd8gQ9mlyrmzyDz9aPAM=;
        b=qzNyeWlnBRfsPg3oLBEVO79n+oQ1dG9h1xa4qqbtu4ObOuLaVX+P+9uuxOyyqoXo2X
         kUpfUwT7L9ytnqv/0/wz85KW8yiwtJyb7/ihHkNh6VS7v/tSZ1ZzOZzgTFaPh0Ee11KN
         +GaxLrVXaHGTORNjS/6N4GZtrNYY7Y/uZ5wmK0TxOB/Kl9GiVQzAYXwO1eVHzdn4eKVU
         7PV8blHuVmdbtYGrSsHqRMBNAGPtyDSM1gmqEZXvikTHpltg6LEnvBmMITg3HiA7p4Dz
         Xwyt6GLW8+tQqcAbnHkS+INyHzhUQ79moRrjuAMHpDcFrMtphCwGAY/YbyqbEnQttS4f
         LMOA==
X-Forwarded-Encrypted: i=1; AKwUvBybNWdZwnV5q4y38NFPkZ7EEx/DtRpBpj4Z4+Q6a89RQroSW8iz1dtdJOYaul5NnHqXVuZ23RZlsmaTaw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL4g1Lf0YYvkyW+3AWUOWhj4RZoWjRkRfhWyPS58ixJNN5QkB4J
	ySsIZ/FAkeo9EYC+pgCJg4o7nhk4OxiwoMFXQJzglvMxHusHZz3gLYVAdkPeygfQ0iPju1RUP6j
	UBPfy4uNnskIZoSQSAQGc0yzG5U1wCZ8=
X-Gm-Gg: AYBFou3BS9SAIjOxWR6hnJ7w/S8+OJ4QcnHdT4W0OBZra6uymo9acXFyigTpjH8QNmb
	FQ3OwcYq68JK+gFiXAvAeBgmznTeVp+HyZuu29/H0EGU7jXjf4ta+9Ug9Y6ceZy+NPShukyl7LG
	89/63fdmlERmhUJwqEn2KNJKzbNVVF7HDGuz48Rl6STywqwTKehBA+3osXXDT50xagSK1A5sL6H
	XCqIBCB2CCSjCeNBcsDeciE3Y7OsQWNMFccrvdzMrRNWBeBUXcVXyhFlwqZ1VDXj9TfLfX2BVkZ
	1TXbNR+mw6SdSIglNPwy1fD1G/MACNla+hARHbdG/GYKfwcHv3iZKTnFijJKlfT2Q9NnryJm3VY
	v0kRoGURZwAF8G+AqIshEci+Rzp9d9M0yRNDOd1BS3A==
X-Received: by 2002:a05:6402:501e:b0:6aa:7ff:4ebf with SMTP id
 4fb4d7f45d1cf-6b17c23d561mr4283966a12.15.1791631881629; Sat, 10 Oct 2026
 04:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009092759.968521-1-linmag7@gmail.com> <CAEdQ38FEDRnc6DR0mTtiAfct2WwvSVjrFWtTzQrN-DtECaS-MQ@mail.gmail.com>
In-Reply-To: <CAEdQ38FEDRnc6DR0mTtiAfct2WwvSVjrFWtTzQrN-DtECaS-MQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 10 Oct 2026 13:31:10 +0200
X-Gm-Features: AclHuK-k44Zg3lCAgQHkrzNsPm8zibwWe2DLtPLR_2BC02_lZn9oOvK_TySUOe8
Message-ID: <CA+=Fv5QCu4W0msvg9Wx4koVtiiu6GKNWji1vJOmzveD6PX9hLg@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/seccomp: add Alpha support to seccomp_bpf
To: Matt Turner <mattst88@gmail.com>
Cc: kees@kernel.org, shuah@kernel.org, wad@chromium.org, 
	richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 10, 2026 at 3:28=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Fri, Oct 9, 2026 at 11:27 AM Magnus Lindholm <linmag7@gmail.com> wrote=
:
> > Skip the pre-notification signal test when /proc/self/syscall is absent=
,
> > rather than unconditionally skipping it on Alpha.
>
> Nothing in the tree skips it on Alpha; that was only in v1.
>
> > +/* Alpha returns positive errno in r0 with the r19/a3 error flag set. =
*/
> > +# define SYSCALL_RET_SET(_regs, _val)                                \
>
> r19 is still the fourth syscall argument at an entry stop, so this
> relies on the callers also setting the syscall number to -1. Worth
> saying so in the comment.
>
> > +     if (access("/proc/self/syscall", R_OK) !=3D 0 && errno =3D=3D ENO=
ENT)
> > +             SKIP(return, "/proc/<pid>/syscall not available on this k=
ernel");
>
> Alpha selects HAVE_ARCH_TRACEHOOK, so the file is there and this never
> triggers. I guess that is why you have 12 skips now instead of 13.
> Please drop the hunk, or send it separately for UML and friends.
>
> With that:
>
> Reviewed-by: Matt Turner <mattst88@gmail.com>
>
> Build-tested only, with a cross compiler.
>

Thanks for taking the time to review this, will put out a v3 asap

> Unrelated to this patch: with the selftest setting a3 itself, do we
> still need the fixup at the end of alpha_elf_gregs_set()? As it stands a
> tracer cannot skip a syscall and have it return a small positive value;
> it comes back as an errno. The r0 =3D=3D syscall_saved_nr check in
> alpha_finish_syscall_to_user_mode() has the same kind of problem.
>

Interesting, I'll make a note on this and look into it later, you may be
on to something here.

Magnus
