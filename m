Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E573AA1B8
	for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 06:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781247461; cv=pass; b=lJcYCCrYtMftpqPBHGVgZ8J/vE4aBbfENZFsod00FHVfPlwobqMArQku4ZO6wQHdMpw1ABrr28bCW5lr/AbMN1H0Od714cyAUUf6Fmb7MYoDnC0OaG1OmcWzM9VEHWEbfsV9oI2QMtmuUUBRh+GmK9k3Wl8KBeG21HpxN72kBBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781247461; c=relaxed/simple;
	bh=lKIPvMknFSjE5D3g1xxyCLi2aju86fxE9FpB18IoWzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A3mT50AbmOIEWKIVoOxVPSPfnDqvphy+NgIbNWJdTDuXIatQObLo4y3SfGZ27adT2cRMC+Yfw3U63jWyqjiNpgctMbW7j6rArGnsOuSY2thWiMiSECUSfWzMcKez4dQrmOtlY5+fHbpairnp9ngJfPGYpUt0QILrlCmLaYg4VA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVdwvZlP; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVdwvZlP"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68d23396ed3so1143914a12.1
        for <linux-alpha@vger.kernel.org>; Thu, 11 Jun 2026 23:57:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781247458; cv=none;
        d=google.com; s=arc-20240605;
        b=WgxbqjHsQSaAPBBZttHGg+40jGkTkPj5MTAxGOy9IrmHy4LETxcW/sVxy0B1jiTZ1L
         uABvC2UTECyjOlXjtW+Rd8aX9dmbNSRRhr9IdKAkiAZFfy+7J7llqh1ZIZ7a7LB7vI1S
         Omsinemttmd0GEPfqwk4N/XRasXPq7n8jCuE+9nLYeIPLodd2VbPVNHrzcQtnPzaPi79
         Tnh9J5RYpr/ivRFhRjFH8zGqgpf8U2lQ9ozV/kkvaSVtahfFWV1NcfdJt2SCMDTMHUcg
         rQLV/gWSzOf1vBGdgRR/3E65h4Mhlfm409DaG0rs12LD2rHihzqaiSRiMLlBGl4iUGAV
         veOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lKIPvMknFSjE5D3g1xxyCLi2aju86fxE9FpB18IoWzI=;
        fh=rIl3UCMaxoQDB7shydtMAe7/R2OoU03+V2xN2KKoHLY=;
        b=II+ULfVG4eOXeHbmk3n1mVeyDKM8zFkCzwk0IOD7l0dflQcZD+ZQ7GgdRKFGIJfBK6
         P3ISi7E1+T7xEEeZeBjQhdiOtLEJZ7Y9qN9jBnlly2797kd8c1/r2CV63lbYagvZ2kar
         5b2uNQiPoPtih3BEfZ1fR0N/r8pCCEuS8gqc66yIU2m+r9J0BgSuxEl3xAUBfB3mLU0B
         QzFR1oW/SGtx7g4y4sz3bvbyFiP9JMwkdLlSPFQ3beE1QcrE6C/y87JgTU+STYvA3goq
         GsqJV023mgI/GJoqAxRRelkITyQB6I0IWpytf7xLpIE93sl2fpVeqDF7nIY3TvdwzfoZ
         dVBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781247458; x=1781852258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKIPvMknFSjE5D3g1xxyCLi2aju86fxE9FpB18IoWzI=;
        b=TVdwvZlP3eKEj5V3RArkPNDpfcJoinSuGgsGZzoFdzeOk2uc5vWdt/4UyJK840ytPw
         DQb8ZkJrWBH4Ycs8iLmcTzOHcon55/QAA3g/ylfkuWbRhmCU5/HeiDTHt0XlUdXmbb/i
         gzn19iUgKFBV4tQAWidlc+kNqJa+sWPW0EQWY0PIotnm+PLi0FCEHfnQuadxPKKwz8bT
         rsZtVtkS6kNVAK/9law2VdGBEulxNAkyQ82nWcF5/+5IKrS6BFXhLuGQExQOUBp63BL5
         V7st3Q3nYGFqrJ3w5rk4zDWU8RXjjCpJ/28R+PXzfYUOh6N0QsrbFqeIeKULihgDG1q7
         eygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247458; x=1781852258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lKIPvMknFSjE5D3g1xxyCLi2aju86fxE9FpB18IoWzI=;
        b=F1fN4NSXXMUHMFCE5nqU00W8Jnj1SbijmZESRzrMVDD2JE7aFkaFyD6ybm93WUeGVQ
         xCh9qXXfc44zdmecz602HSKZ5XgL9URfHxt9lfzKLZySYLV8e1XVhl9ZHfzOi0DghFJW
         e9QfMuItMXmuzem4CicF7w5mp2lBFz6Lb1/zXG+9E+z5xvRy7JHwYMiBJCwTrU7bCcVY
         79dRRR/MRkr9pkvJ7cJAZxQMsYbHbsrEhfz/TkClfL6Zi1TPo399GNe19SuVzRWppBbM
         sh4K8HBC6Cw4Rv5W7WZn5XuVzk4jrkjkunKSvyJbtjnym0H9o3DX5rWz4cEG7q+XCSYj
         cWFA==
X-Forwarded-Encrypted: i=1; AFNElJ+TM5JS1Ca+F3ZgzK7QIPDUTapk3ENmXPCdXNrrMGq/k4NAZccryy73QIgW/apfHbmTFU0tkA7bG3W3ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYxlkHuZVYMNmrF3mW7RMM10cO7Xo5i5+UZXlzc5CIhoyXL4OJ
	Rj2m1CdVBW1YIMnBGLTTG/nqI8OyW/l5AFj5LSRhDKRYcfis2xeCUFuoptT9onb82KDZ2YmuOnq
	NDEbefyTDoYy+Mp+kKuPeUjcOBNgrduo=
X-Gm-Gg: Acq92OH6Rvtg5BpbWh+XhwY9dtH1OsQUmsbZwGLDWj3BK5R+d5Ai7bWNKm/tmXKMDJU
	G51b5pSMoHETBS4fyT4eXb1x5ElaDREiu5yO2tlbUsveQ83zFY3bCGMEpO6zAv0nSi6L3LJGMSX
	XuIPslifQmVr3tJKdlkQONEpDrtojuRMQZSKWf8/PJmVhG3+LORDVmS3isvGEz1T8nyEnTaUYFa
	JzbLi3HfHhMaTp6ZSYMSWATzkboWMSL3VSkjOo/fc5FnSTF0plXjKz86Hv6dfnPfy8t6m3VsaRO
	NVPKlGMJkS7TbLEDqYPRM0BORK2kErlc4VjpVxaxJ31gcX9uh1Q=
X-Received: by 2002:a05:6402:530b:b0:689:6c2e:6cdf with SMTP id
 4fb4d7f45d1cf-69378177712mr619365a12.22.1781247458101; Thu, 11 Jun 2026
 23:57:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203063357.14320-1-linmag7@gmail.com> <202602041817.3967F048D@keescook>
 <CA+=Fv5S=XxDyNFdqhR3p_wEPwGEpjfE+Rqk1h1JJhactWFib_Q@mail.gmail.com>
 <CA+=Fv5SZK0eaT5Y_a-eTdZacFEcp36rF1YE=tyooDuVpZW=uOw@mail.gmail.com> <202604210947.C4D4020@keescook>
In-Reply-To: <202604210947.C4D4020@keescook>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 12 Jun 2026 08:57:25 +0200
X-Gm-Features: AVVi8Cfpy1G0RZXF5eSSncQcJBRrkN88SHt7N0V04O8PiTWBgGHUAU_5EcdO9RY
Message-ID: <CA+=Fv5T-CMVrZMSoz-LiqQo_JAFhOZu9Wm7JTgwcdV=5kRMVGQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/seccomp: add Alpha support to seccomp_bpf
To: Kees Cook <kees@kernel.org>
Cc: luto@amacapital.net, wad@chromium.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kees,

Will you take this through your tree? or do I take it through my alpha tree=
?


Regards Magnus

On Tue, Apr 21, 2026 at 6:48=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Apr 20, 2026 at 07:13:09AM +0200, Magnus Lindholm wrote:
> > Hi,
> >
> > Alpha support for SECCOMP and SECCOMP_FILTER was just merged into Linus=
' tree.
> >
> > See: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/commit/arch/alpha?id=3D55b22075f7840ef48254886758976531fe146609
>
> It looks like the selftest changes still need to be landed?
>
> -Kees
>
> --
> Kees Cook
