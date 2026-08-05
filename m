Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB793F88A6
	for <linux-alpha@vger.kernel.org>; Wed,  5 Aug 2026 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785922152; cv=pass; b=C714EP+gMiy8Skd58MoNaFxU2cuFqtplEbqQXP3rJZaPY5MaFXw97XXAAJruPti69hKLivQNMpLZI606dUNp1JmytBMAskqv9abAezWhgDl1KkXcxSCLReB3CDniyHH1WoD0GLiTOJmPvvEmALBwdfllLuUCdisbKK1H9+My3Gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785922152; c=relaxed/simple;
	bh=2CYxhUN06atxgyD+NuqEfp0FHRHqnrmTcjPfadvW5lM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AgqXwOsR2N473OvQYQSRFJdUeugDkR6nuKVtzvm5OZQhAHz+nQg4lBYmdZROPMLJ++c539V7tcjOhfWQbl0krvAKI+ILEY7qYpPPMEJIVY0C9qmM3/CpWyHiaAfWWydTGa8p2Ar9f9O40tB+drNnPkNiHiqQI6v0yFSd18cCCp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRaHTj72; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRaHTj72"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a17cb94b26so403120a12.3
        for <linux-alpha@vger.kernel.org>; Wed, 05 Aug 2026 02:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785922148; cv=none;
        d=google.com; s=arc-20260327;
        b=Vxbt0tdpY8g2gq/JoR3hMWb/zXT2+q5E8zyLO9vax9v52ClJRXCuQR+0+xZNdMJJOP
         UELU3Ao8WxEuX9+lrbkcMTELWXhNRzf7W4tyv433WttceQGOO/Bh+sSjoXqP1VbP0S1v
         i4LgxtcwXKMEqcXAS2Qfk5212Qa5XPXCbTyWYKwGL9NmJbzQiJc3/gDimXmOINDmLTxc
         ZeFi9Rw6SkIJFfQID0DaSrtYfMEV3MRK9Rv12LNKHoNj1j8d0bQj1wLheiEXuzxftfEY
         5SGIOTMjFbb1OQ8JzsEHPBBqWxDhwaFVPv3rjvQ6ttOwqAsEQOkhtRPXqDNyDgJrZTF8
         rIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MyPWfyEFm2OExA3jphd/8vOHsrgk8sKB4KgKaoO1auA=;
        fh=Fn90S+udz17B+tz7MbNCwneXxpkjPM/1QUlwT5Endv8=;
        b=DoJOxhGG1G+dWDiozINN6MIGZQLeES7NKSVPzRQKmPmTrcHxFfsvY1PYViiPJzx8n/
         8oYWTrgcYlSHy7AdG1s1MkChS+WoSsoaN125ZyBvijdYZvwaKMJwGVryfEt3EsCgHBbE
         lqQmcxBSdzxAjh7xULmsfoZ2hPAxCUji/JJVy5o9oJgHu7fgzzaK8/piaWrKbHHZPXxq
         gRQei8yFdBlbbwEUJjB1oKvCqOsobFvegRIVBO9tbbICerp6c7Y6uSNJWqFRo91Q7ckW
         6W2C6XKreB+3x9X1nQyoq0nAXhzjwrz+ecE5IyrpISI5EBVvLNllq821Qehod275lZYz
         UUYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785922148; x=1786526948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MyPWfyEFm2OExA3jphd/8vOHsrgk8sKB4KgKaoO1auA=;
        b=oRaHTj72e/XrckuRkA497cnrlo9Fzk7mRBhBXJ1RaHvG+7+2R4vfQrOftchvPQCl/P
         k38QsTQmHSL+o3EqszzoPmxowRxK5l6gqFLnPydloJ6xxUi5if5535ZIQAYitjcu0O1h
         HPKlnfL3fOxxo5uv/mNQpNaK4C87gz3GvP03hg7viPShIQaEPK4/Va4yQSRtx4yN71sh
         7xebecoFtAEsMGmUSloibOVe69FFBOnuJ2IZeqeYn9PUE0zUR3wALOwo4xTWieb6caEd
         5yxFYxilUTzGGFmWNqfK11/uoPLsvyvM/a6IwhXO5V9wvTsI/+rs65fsWVeKLolF3nSn
         NRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785922148; x=1786526948;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MyPWfyEFm2OExA3jphd/8vOHsrgk8sKB4KgKaoO1auA=;
        b=CpG9X7y9L7Lx1ZhQzQKg1jtjbGIExXjSUVQDnzy+l3/3dji2MC074N9YM9Ptj+A2t9
         MquFcUI1SG4rJSkk6jEnLG/F/JQcyFcgWvgfxSssPw7sZoCYiBBw2S5PLYMuPqTOsNKG
         lC9xkMmz2LIdXwsNv3SAdUpO1OLln2lbgqCnnY5hNxs9TpSwxLuuWOSfxYl/YE2hAQrl
         v8bjbCy865l30ePxcwYdSmaZJuGFcA8phvOpkUq/zPRuOn+QggfFICAJdybWOD1SkE/U
         hbkyP3+tbTNd9en/HTRdtP5qByB5yapWhGvmBOpLsavPUgJmTFQUJe497GKy575mNJgM
         HxUA==
X-Forwarded-Encrypted: i=1; AHgh+RrjaiP3ZvSEEmy1mEHG8QdAgHkhhV153dtMI5SLC5UQk4eYLf9mYDTCgBI5U7mQmIaSDmnOQbGlpwLZlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNmo57NDQDZEeJNKXXshDV/ZbkzJARz7HwScmk/iaBeJIRUsHG
	kpGXa6FMCgaWtH2zB3Oq4jbDiMLLQ4vl+O7mYaVAMq1indQXW+73P3svgn6/vbM8rdacsVeD2T/
	nUQk1NdmurSZ7UrgvYwkOqK3BIzrOteU=
X-Gm-Gg: AR+sD12tpizq1RQcFLgDm9/vk4aXQLV7m0kRYARvaPRrKpnGZI6QKwlva+DECmGsBUN
	XiQAfDq+cROMDit+H/AXOBsY6lIRK1VryrKP8hllGOv/vJkf221pBhGP3sVSx7QazOunf3S0pkJ
	63UR9tVH10yjy1MJRN1qi1dUYlNyRDo7s1MAob5S2FNL77RbpM9KK+OTQ5Qa9UN7+Et7oWy+tPD
	XmIWhA2/XXmxw3ZigWtkzBYA5a4WHyyBGbHKNqUjFkyTrv+sq5uDsynH34n3AkGXseggYYLlZt1
	tWB/4qJdD0r2Wp6YngMzGpi1hBs2MpsVPsXJKTJKFD2nDHcHxXIvMR0mAIDYEKu9XHT5NwhBiuN
	VSvotlxKLLnxNCypalPlIYKSXUresb/U=
X-Received: by 2002:a05:6402:4543:b0:69f:2c1d:d83c with SMTP id
 4fb4d7f45d1cf-6a14f2893e6mr2121332a12.21.1785922147806; Wed, 05 Aug 2026
 02:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-fp-exceptions-v1-0-c99d75608e60@gmail.com> <20260803-alpha-fp-exceptions-v1-1-c99d75608e60@gmail.com>
In-Reply-To: <20260803-alpha-fp-exceptions-v1-1-c99d75608e60@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 5 Aug 2026 11:28:56 +0200
X-Gm-Features: AUfX_mytZOAo7u-Z1H4SHvHV7AI6aSPHWr2nPnsXtr8HsGmlt0ibWkok5AeeFvA
Message-ID: <CA+=Fv5RaZZeRvixhLYZVmNsWowBw7oWC5Z6AvbL8=c80CM6XLg@mail.gmail.com>
Subject: Re: [PATCH 1/3] alpha: fix ieee_swcr_to_fpcr setting FPCR_DNOD unconditionally
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 1:40=E2=80=AFAM Matt Turner <mattst88@gmail.com> wro=
te:
>
> ieee_swcr_to_fpcr() converts the software IEEE trap-enable and status
> bits kept in thread_info.ieee_state into the hardware FPCR format.  It
> contained:
>
>         fp |=3D (~sw & IEEE_TRAP_ENABLE_DNO) << 41;
>
> FPCR_DNOD (bit 47) disables denormal operand traps: with it set the
> hardware handles a denormal operand itself, treating it as zero, instead
> of trapping for software completion.  The intent was to set DNOD when the
> user has not asked for SIGFPE on denormal operands, but
> IEEE_TRAP_ENABLE_DNO is clear by default, so ieee_swcr_to_fpcr(0) always
> set DNOD.
>
> Instructions built with the software completion suffix therefore never
> trapped on a denormal operand.  The hardware silently substituted zero
> and produced wrong results, affecting every program compiled with -mieee
> and default FPU settings, glibc included.
>
> Set FPCR_DNOD only when IEEE_MAP_DMZ is requested, which is exactly the
> case where flushing denormal inputs to zero is what the user asked for.
> DNOD then encodes MAP_DMZ, which ieee_fpcr_to_swcr() already recovers
> from FPCR_DNZ, so drop its attempt to recover IEEE_TRAP_ENABLE_DNO from
> DNOD; the DNO trap enable lives solely in ieee_state.
>
> Both functions are in a uapi header, so the encoding change is visible to
> userspace, but nothing outside the kernel is known to depend on DNOD
> carrying the DNO trap enable, and the kernel is the only writer of the
> FPCR.
>
> This must not be backported on its own.  Re-enabling denormal operand
> traps exposes a second bug, fixed in the following patch: those traps
> usually find an exact result, and for an exact result the emulator did
> not write the FPCR back, leaving hardware-fabricated exception bits
> visible to user space.  Taken alone this change would make spurious
> exception flags more common.
>
> The bug predates the git history, so there is no commit to reference in a
> Fixes tag.
>
> Cc: stable@vger.kernel.org # 5.15+
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/uapi/asm/fpu.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/alpha/include/uapi/asm/fpu.h b/arch/alpha/include/uapi/=
asm/fpu.h
> index cea9eafa056f..d28dc36786e2 100644
> --- a/arch/alpha/include/uapi/asm/fpu.h
> +++ b/arch/alpha/include/uapi/asm/fpu.h
> @@ -101,7 +101,12 @@ ieee_swcr_to_fpcr(unsigned long sw)
>                       | IEEE_TRAP_ENABLE_OVF)) << 48;
>         fp |=3D (~sw & (IEEE_TRAP_ENABLE_UNF | IEEE_TRAP_ENABLE_INE)) << =
57;
>         fp |=3D (sw & IEEE_MAP_UMZ ? FPCR_UNDZ | FPCR_UNFD : 0);
> -       fp |=3D (~sw & IEEE_TRAP_ENABLE_DNO) << 41;
> +       /*
> +        * Disable denormal operand traps only when denormal inputs are t=
o be
> +        * flushed to zero.  Otherwise they must keep trapping, so that /=
S
> +        * instructions reach the kernel emulation handler.
> +        */
> +       fp |=3D (sw & IEEE_MAP_DMZ ? FPCR_DNOD : 0);
>         return fp;
>  }
>
> @@ -116,7 +121,6 @@ ieee_fpcr_to_swcr(unsigned long fp)
>                              | IEEE_TRAP_ENABLE_OVF);
>         sw |=3D (~fp >> 57) & (IEEE_TRAP_ENABLE_UNF | IEEE_TRAP_ENABLE_IN=
E);
>         sw |=3D (fp >> 47) & IEEE_MAP_UMZ;
> -       sw |=3D (~fp >> 41) & IEEE_TRAP_ENABLE_DNO;
>         return sw;
>  }
>
>
> --
> 2.54.0
>
Hi,

The new mapping of FPCR_DNOD to IEEE_MAP_DMZ looks correct to me.

I tested the complete series with CONFIG_MATHEMU=3Dy on the same machine
and using the same glibc build. The kernel boots normally, and the
glibc math testsuite improves from 48 to 28 failing test programs, with
no new failing tests.

Reviewed-by: Magnus Lindholm linmag7@gmail.com
Tested-by: Magnus Lindholm linmag7@gmail.com
