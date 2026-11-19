Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795073160;
	b=e0WSlMfdPC/zx2MJ6fITkKFIXnWNnJWvxP5ZEoLsqgUJSE4X/GDWCvYAyrkVa4573IID
	 BgiqJBhGbDVQ1h2HwaizOML27S+k1eJ0i5MTvCVzCykb/egqxDENzAEIX8KRdp6zGOIl4
	 3cITo0JM3JGCSUpDU5r7T3EvgLOImB/NXOKz+FFWcNICvif9VAzJEu0O41tfAb6SMY4Tn
	 8Whd1MpZlXrerekr1mFeiwFcW/m5lqg5CSeEmFvZz5k4TLWWMs8B+mDCFDuJb06zcT+XO
	 7XI54+lTZNdEBIRZ8zmJAIT+GVRXGNr5pesIf03Cmvu8Kvwe8fVDhEhY67ouy1d2QEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
	b=Ux7eWllyWhUNsh9hr2WR9/qTDgag1+2vzkfssPjIqWcr5U5lvXVVOTYWYhT5qV0Jrcr2
	 rbNAduBz4/ExJrC16cq9EiXPUVmOzBDGmQgsbQfhPxa09tr2jBlhzNk7ppK2OrMReE2Ig
	 MExfLwj8tDz+FwHWo1JtDl4GcOBUYXqP8kXqamgpJuduz8Dj75IU7IgSpE82Cmz+tYIPE
	 b+D0RBThPkMW8O/AR2rATntHQZRfDW0eZVpZ2X6TuUWn/Qsc7W07Lj8KLSWlzGzRSG3tN
	 jZu0rF+egi+GMUjPjBUgU2LfIMbFJImSUNLo1+c1VIvXgH8dmuLHiIR2SpQmPvUCyWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HC8Id32C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5F0606A320
	for <linux-alpha@vger.kernel.org>; Thu, 19 Nov 2026 07:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E5F0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HC8Id32C
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso3224369a12.3
        for <linux-alpha@vger.kernel.org>; Wed, 18 Nov 2026 23:26:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795073159; cv=none;
        d=google.com; s=arc-20260327;
        b=oje7BNdQd/GrLt0YtVhtrtDgyi7ZcFKfPtniKnC9ruzvAUFuAK6YR8lxI2JnKVgd2v
         lmOdWEuShgTsLqplSeOO2dWjcSDZJNiKDrRnxYwu2veviZCUaJzgh8xlQpQrzAGvCu2n
         bRgPfWjuCerkGw+bNhk3PvaN76VhiCR0MndtVgHmOLiSJ6u1C87wGzCmPT6Ok/ZfRRKP
         Z06mB09xWQcRHzDs6jnjGa6IANFwzshJ5M8460Anj5JOifaVlUeBllD4K4rRDykKQSxy
         3I/hFZ5Hur1yjMwyat1a/qDgwQniXe+HzzeMtYwfjhTknmhuFYFjrlycVaGzaF7AYq6C
         sa+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
        fh=x75Sc5mAJlfubNnA2LLE+HhBBlntVu0ihgj5o+PFPaw=;
        b=ll0MIlqiuOr0PPtRq4nQe3jIsgTzdRLh50+ocgp2mo5k307bNUk8CErtiZyyqL19eH
         a3lwjIlkoeHVwHvmrpJTjTENg/N1KnUGxenrLt+KkwH3XaNaxnj4905ZjI230Luv0FCI
         eHGHMSvnyPH28QSaVanBdDb9ofiKwPRTnyos78hmWLMlGR4qVuH5PiTm3yvDfpOvqB6L
         tFcgMxySlBdeewei9PNLkbDkfRSBZfMyrH9qaxGL3bujisJPnVcJM7PPMHjhqZCdZqqX
         Bt2yDrmhrZPaEEed1LGgEZHALa3++XatUTaXvJKrTPvAIGwb0830nyrBRuwALxSQ4nk5
         4NFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795073159; x=1795677959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
        b=HC8Id32C7RWMZBoXz82YJl81D1EqvihefSHlq5h8EUvLSFNV9QpAdr3ptsjLkhST3j
         zfeLncnprzaUqqgGCoJpffiGs1ll7ni4xogqY0TsPwmm0Iup0b0FIc/aDmk8ow4x7R8X
         NkEozZ084pCEcLtx8z3iF/CHKNhBmGYUkZTvTGRge93vS+FXkrk3854Fl+zvjjuBe84q
         pP2RWLoRXjx82FqmnOZ51tgibYjy1PqAQU3Fpw1C0PQ+zmOZ6TLMRnoy1iZL25Jq0hxI
         6RgD/BUnuFcHkkck/TOxfpseKYnGcK6NEFHAQ45r6dKn8UZwicceVJgsfhzDZZyn1jHP
         YPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073159; x=1795677959;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
        b=B0d/wQHHrDyMX6cdBYaY95o0oj6iOAmQwIAUKLs1kK5rSaJwEi7y1FyWrWek7L1rPD
         sw0tLRmqZh94dgxPoPAuyGvUTjInZ28+f5ecIvk0H3OnC+JInvL5vm4uhpB8haoFUCgo
         Soi/cosuOv4b7NtrTtvXys4BSMCHRB1zICTadKAJAUjspvHSBSUSIVXrerLIAN72deOi
         U0wW/Xm0Fl8lSoi+le9zVk7en3SikkxNVYmRaLskvMldL/5djTNqC7T/0nUuZvcZUuO+
         9pTVXWGz8YUOsyeP497bSGEpNfuLCllxTBSnmGIbhXahyzcLWt0k8msYROTpvqOxW4fA
         prsQ==
X-Forwarded-Encrypted: i=1; AL+hErHxiGaKz1A41jqbJwCh+fj9eV7yQyWR22ulPyJ07M+B4TBozx9/GrA43sy8bnHBO5Gc6koSsjGxGAO88Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+7FSrTZpatgWS17yWvVe/AiFHveQybfp80inZ9SU3zl4XESPB+
	6dsk1bZflqnf4QyVU4sJfShdpC3Lo7muPp1SiPqCuwIa/QrBMh02Hp2xp2iYyUj4pIp6dPDBQQT
	i6XmGz27cWNe2pjleUrgXpY+vSTGPbSI=
X-Gm-Gg: AYBFou2FLh5CSlSNhclveC8dHqnt1vZnaqYsd77p9fxigv9lI4WqgwKrKaXZXxOdN6V
	FjkFCu07aq6oRCFEGTOX3HLC0QIbjqzSBQ8XnuMLlYd60qkbHqSqzNnKUmPgWZc97rOn6aZT98e
	knY1SqgUu5iJAZAkeL8RKr9z6VFVgu9y3eoqOBsILcTY8HAE+bDiej6lsQYsY8a4kk24c19X4v7
	te3mb0SLb7a9tofpFZvRCVRnwl80/l4Gvf4cw/g+OUwcAGdsV79BJhpAS/gXALl8A47T70kJxhM
	Y5vixnM1tg+o/GjV9DmFpTWeZM0ljOCRkxUQqXhsYtKr2Mc851JfBINhmzuyZ4p+mjia4Js3cJF
	ZVyC+9aQmH0U90O3IavPA1YWGlV2qsHhIrzrTYQSO04MtEySUS+TTJazBTNdzSpjKB4i8b0dwJj
	fzfVKg6Mu0f6YYqOU9vP4apQXEvJtM+cMB/mlDQ2xQd3r/
X-Received: by 2002:a05:6402:2350:b0:6ba:137c:70f9 with SMTP id
 4fb4d7f45d1cf-6ba137c7371mr579765a12.13.1795073158722; Wed, 18 Nov 2026
 23:25:58 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
 <20261118-marvel-env-v4-6-200317e496c2@gmail.com> <c212df8a-6ff7-4a4f-a90e-7bb6c073f617@roeck-us.net>
In-Reply-To: <c212df8a-6ff7-4a4f-a90e-7bb6c073f617@roeck-us.net>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 19 Nov 2026 08:25:47 +0100
X-Gm-Features: AclHuK8PPneiYACCRObBpglxAjEW3linYDQRjYYK3WkE2RlBOYGn_Zv-GNu7UxI
Message-ID: <CA+=Fv5TteAQNLesw83Z+p8GFYiM+Bs_JYdVJyp9bGPEP8s+w7Q@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Thu, Nov 19, 2026 at 5:17=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 11/18/26 16:09, Matt Turner wrote:
> > The management firmware of the Marvel (EV7) AlphaServers, the GS1280,
> > ES80 and ES47, monitors temperatures, fans, voltages and power supplies=
.
> > The SRM console describes each sensor as a packet in a power and
> > environment node of its config tree (GCT), and fills in the readings
> > when asked to refresh the node. The packet layout was taken from Tru64
> > UNIX.
> >
> > The firmware gives each temperature, fan and voltage sensor a warning
> > limit and a failure limit, and reports the sensor in the warning or
> > failure state once its reading reaches one. Neither state means that th=
e
> > sensor is broken: a temperature past its failure limit is too high, not
> > faulty. Power supplies are either working or failed, with the cause
> > (AC, POK, overtemperature, fan) logged by the firmware.
> >
> > Export the sensors through hwmon. A temperature's warning and failure
> > limits become max and crit, with max_alarm set in either state and
> > crit_alarm in the failure state. A fan's warning limit becomes min, wit=
h
> > min_alarm set in either state and fault in the failure state, which is
> > when the firmware counts the fan as failed. A voltage exports its
> > reading, with min_alarm or max_alarm set in either state and lcrit_alar=
m
> > or crit_alarm in the failure state, depending on which side of its
> > nominal voltage it reads. The console gives the nominal voltage and onl=
y
> > one other limit, so the voltage limits are not exported. A power supply
> > is a voltage channel with only a fault attribute.
> >
> > A refresh keeps the boot CPU in the console with interrupts disabled fo=
r
> > up to 300 ms per node, so refresh a node at most once every 10 seconds.
> > The hwmon core serializes the callbacks, which also
> > serializes the refreshes.
> >
> > The console callback lives in core_marvel.o, which generic kernels
> > built with ALPHA_LEGACY_START_ADDRESS leave out.
> >
> > Signed-off-by: Matt Turner <mattst88@gmail.com>
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> I assume thqat the series will be applied through an Alpha tree.
> Please let me know if I should apply this and the next patch
> through the hwmon-next tree.
>
> Thanks,
> Guenter
>

Yes, I plan to take the whole series through the Alpha tree.

Thanks a lot for your review and feedback, and for the ack.

Magnus
