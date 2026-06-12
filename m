Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1EB36A35A
	for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 17:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781286753; cv=pass; b=EsKlZYbiapoaqI5aMLGbfkDLylANXQpCIKUbgoodrWqW6zAyybKHT2U90oVmtQjJtjWI46WPjLlfQaee3Ha66dLa8Cu84reXWKz5eno/HvTWSereninQjbIU/B+w8VYquZyZe8PPnI10/EZA1aR/7lPDCp4F/tXb1iNcgYyyV58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781286753; c=relaxed/simple;
	bh=uIfyrVm9MT82wNo4BzX/N141wwB+DkjsU0Ga4SUVXCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hlByjfHfvczJ78DV4dSzMRj53zA7GhSYKo1LhqhNlHeSDKfFJoyltXl46qvFF04Dn7l03VAb16dPmjZr9C6XnLNDdHpxmFNuyVqUuCQR7XL/QSwcmaWDJMZXFI2UeEvpH5SJBi18KjkoRgwBy6cjwO/EXgcfcrd78OX0WRl6UUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1w3PRpf; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1w3PRpf"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-396779b9a7fso10985621fa.3
        for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 10:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781286751; cv=none;
        d=google.com; s=arc-20240605;
        b=K5Y23tkREVuRFJ559s6AeEoY64W7XuH1Bh5RNYxT+R9rJ5qVjRWb2z+qagu8aYaBWc
         oUBMM5D4h861GAYtmtaZ2/YunvrqIoFuEPIYYMI5fHGokFJU+RAs8x/VxycK0Y4CFGgx
         R1oDTuydUbScz2MYypcStmBDq12E5PCbsgSKPMcmbFfIHq/PxLpFYJkY418Tu/63SaaX
         X8+C0oNlCCX/Bo3mcQ+DYjo3KmXX4dOApq6rvBHVWP0+JkAzeodOCa+S/g5k+w/GWAjd
         eIPKncfOc6T9Npkbm8tTqnwXC1q6W+alng7Jj/Mm5ZoAXcvA/uzWGHT01SQnPjF5hpcf
         pWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J2eMLWFxtI2UR/JtmPcXA4JRSYllm40ckvw6GJocUo4=;
        fh=vKXHIVyLVUWPyfreO6WJOtVr2WjzKQ7ktp2E5VOi2pY=;
        b=aYsYXH1Mxgb6PdiI1fQfaSYBTCgp48vSgj5AFzlZ7noq8fPv2VcOmPNzbPQt1CrViu
         ET1GhU+JeZ9mR62yQTWqs/edFCwW1vz9AzARAJoXJpYdh0Qf81i+wXeTO+v1wYH8bzXj
         3Puf/pSzTZe94+OG2hoUbx0nEM6woHfc2beuQhm8HI5G7UjIrC+4FiCoIH8wGIIaBHoU
         U7s9hJKLTYmLGiLv9ihDlb1C3wcfL/Lkhr7nhcYEQ/4Bv1w/VlgxCpK3p/ZZzcELdPL8
         W4zkqgP/SWgPYxrKPOOmdwJgeNdW0f63aCFbO3rQ2zMbgHov2MBXzUd+gJw4Ug7oUsKs
         Xm1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781286751; x=1781891551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2eMLWFxtI2UR/JtmPcXA4JRSYllm40ckvw6GJocUo4=;
        b=K1w3PRpfw00SLrtxZVNAjvlenX1qc2o8Oo5m+nWDF8A631smfSLbegYH8lvkfDulJQ
         UdQDR+b3ZWcf60Om9b6EUp2e6Pk9/6Fssys34GuNZWXUr52lkf4L+afoY/ouNU5HrT6D
         KmmQWjy06+hVoiSZrtfeQVb5I6KBA3CNSWUHsyShClmxM+zlwIUb8UlAb5p7FpRjSTLE
         Dj+QJn0V6jY9+ZXJWnHxmlTwFnvTsq3cwAw1wUiT466ya88oyvqg5baeO91yfaCDDhoH
         bx58I01wcdIPgDRjifZ363SAyWBjnaupZIyDLLPNovOFAefKf3VhmepP169w7dp/qach
         xK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781286751; x=1781891551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J2eMLWFxtI2UR/JtmPcXA4JRSYllm40ckvw6GJocUo4=;
        b=az2MjsBS8nr23nnHd8dFs4NVX4GjKWtp7HZMxjyjCd4+js4UqfSvshEEoJK2widP2T
         h0EOo0gKrxNHrEka+M8T9jGsFLi/02r6umgnJRxYXYc9J1uubE00YoDAPSmoqBDENn8U
         6R/WqLTO5e/2gl9H0U95Foh15Dm4Np0c3qCOyXuppN+VcixNvkNgJwMqiyDVrvIJOEYH
         u/N43Z4gEVTgiVDs8DmLVTi/HCyfMUhdyM5ernOdknhaY4V5HmTgCPB/MnVvjtsZXt60
         RCrnDOKFs+HLbuqTf+afmm1+RS9gExtd2l+Jq9ix6OsPlN1lMlpzGgz1FLFvQQ+SGZcI
         l7ZA==
X-Forwarded-Encrypted: i=1; AFNElJ8r6hTRdbKsQ0YmuapJGQT+/9QxANOqR/zKG9i4JL747p5nPZ0SsjNclBAQxJ6tqKWbNpYan3A/yhtlqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi9uAAzXkbfr8egwmdWS7NB+0BCFhQnXd7qyaQ3ltWBVImSbWV
	RhZQ+uov/EVNoyqioH8Wf/scukiAPAOa5/N8IDtixVWJ7vlp5O74BlxOX3Ak+wXDhYCgvku/Wm5
	jLqFO8ZZ0avK0mWpXNDE0A6tsfi1i3qM=
X-Gm-Gg: Acq92OGawI7rsXKANCHwUnpeR9BvM8RgMZIM9QpP89vhnjgbypXofw6dhbYWsRTriit
	9cU8+neQpvfGVVchb8d92O/grZkEJNj4ntbjhaKBYymd5YqDpQK2NWF46dYlo829xLe24cQB3gE
	rioOTFuU8j4hilhMlPQqxuGC+rQPSfC73owF3aUVnphyQWAM7Zz+JnYs2MwwKu6lj8q5kxeWF0r
	14YxovxHlDn5tkfFYl95nAD0ED9oXFEWPLwQI+p7nZfvXon5cMlEFP+GD3SmOCy2NFzUVJ2JIoZ
	rogrqIwNyng5MeIi5UwTmmZaw8xiLDFV0iswAQa+Jw==
X-Received: by 2002:a2e:ab19:0:b0:396:8c15:a4c5 with SMTP id
 38308e7fff4ca-3993556e8bcmr628791fa.1.1781286750507; Fri, 12 Jun 2026
 10:52:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529142322.1362438-1-linmag7@gmail.com> <20260529142322.1362438-9-linmag7@gmail.com>
In-Reply-To: <20260529142322.1362438-9-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 12 Jun 2026 13:52:17 -0400
X-Gm-Features: AVVi8Cdti_igjL_5FW80ZbufwlmDjIYJwO4x27jsDQso-aTxTZtInsT3tQJk4kA
Message-ID: <CAEdQ38HYJoUKTcC3=sU1kzRZEqDuOpx+HF7CkVqXBkJ2Drtz2A@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] alpha: enable GENERIC_ENTRY and GENERIC_IRQ_ENTRY
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, 
	ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 10:23=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com=
> wrote:
> diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
> index 69eb337347df..d4a8937985be 100644
> --- a/arch/alpha/kernel/ptrace.c
> +++ b/arch/alpha/kernel/ptrace.c
> @@ -134,18 +134,51 @@ get_reg_addr(struct task_struct * task, unsigned lo=
ng regno)
>  /*
>   * Get contents of register REGNO in task TASK.
>   */
> -static unsigned long
> -get_reg(struct task_struct * task, unsigned long regno)
> +
> +static bool
> +valid_regno(unsigned long regno)
>  {
> -       /* Special hack for fpcr -- combine hardware and software bits.  =
*/
> +       switch (regno) {
> +       case 0 ... 31:

POKEUSR implements the floating-point registers, 32-62 (63 is FPCR).
We should implement them here as well for symmetry.

> +       case 63:

I think we need to implement 64 (program counter). Without that, I
think single-stepping will be broken?
