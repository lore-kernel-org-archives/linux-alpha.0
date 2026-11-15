Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794711057;
	b=08nBOCoZlqtUBCYvWK1zc5+sljfBxMIfZp/Mywh3RSHi6ggdNw2MZwup2ZS/2G/4ffuZ
	 eu93/aU0yBwVWTvJ0DjglHQC5ZrfZGBRr3TW2lu49rWgrATYTXaoV/OaXjwvVRzHSEC8p
	 1SenCtSiIaSHB+UQDXoVH1TyoyUeA57LIugUfFrqv/D0+Q/j8wofsVil5smiXVmNgXuPi
	 7srYfBOvV8FAnG8h74QxqWLCa1sNg07txNlVgYS/UkzatPUxplfWT6hIa+PolPaIuiFof
	 7PdzSO9RgPxvk4aeG13OnMF67EdimodRZqEkBJuau09Eku8Ek1M9SLbm+/ZgkfoBNhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794711057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
	b=BUztckAUElsRBdgVj5ZBNBhAxtWSkqvdLbGHU2JdQ6M0qRmxCNgnYxm3nRo3A0MZoRW/
	 WuVlj1GFZcvMcZddri2FGqDXpn/9KfR4/afjDvWEFNYhAKPq74JauIlk9C63dydYGXVCo
	 JncAlP1o4w/VbiHxAjP8ZRJQVlAEiPe/p7haE35dC9rC6AtHYeRIM97UGPefQgq9cktlT
	 KtVCBE83fMLBtD0lerBEdzyNf4swj3Bf1Qal1TJbs2OY96uZTUNT1Ne2UsskMiNFuzzLw
	 /CcHBYMXLwLAhO5sJXbAdqaZQkc23J7Y2fP5TACT4J1gTFhWdmEqmako2dIUkRmalNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3YL84B5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF39606A323
	for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 02:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF39606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3YL84B5
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3adff684a52so26992091fa.1
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 18:50:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794711056; cv=none;
        d=google.com; s=arc-20260327;
        b=bwA6Yx7Qbr+Rssa5hQFhPfArb9b8tnXWYoDbmDKaF/Ex339S4WKZ1sooXd6pYgfcEa
         LYn4mfR4itiaSxKgMc80mZiC0yqZ7ELf7M6OfqnexvmLUDptqgQnbOwoAh7/213L94fs
         mmPopPLojf98hZFEFEfnMi++TcH6tzrroFy5zBrZ95aH21+o1rWEUFsn1rNfQuTr8oTo
         hfmipLHITfVUMNhXiCM6+cNxF4bnglg2cR4A0wtp8EI0t0QLK5JUbbVeuugn+P6nBCB4
         +2s3oU/kIklBUqm/fIfjugR9lag5kmh1peQTyCr6cRvkmnrNxterPR0xdkz8Op+4JHfo
         jgQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
        fh=4tlqq2OdO1yQtallbn/G4YFSkBYn8b/OTZLn1qpcdrY=;
        b=QRg7ZMf3ZgvgLRjS1OuYKhthr/GYRnVQHrmz2vRK0TawCLQpQA71dIg3A8nNjdzC4q
         h2cxY0ttmmMssoW7w7RRC7BM69QuzV/9M1sGEWwVE8yvhni3+/yrvO4PJalsprNiZw/c
         1sSJYJ64S03i/nVh+apEdCC6Ju3r2WVufY1f0MRr2TQEa7wm5hqRZTI5u86pvThLpaTo
         YaBl3RgN3q+O5qmwbiZy1bTL82bR0SszkYEeJLozf9muvu7rKd2Xm4RNx6X+orHgQMoE
         TFdpS+8LSkdWfYbUdRhg5K2G3Yf7kGy38REYF/ELWjFEmMJ/BsV00e58MRFul5i7pf6w
         XlNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794711056; x=1795315856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
        b=C3YL84B5AdvG1vULn8iIHu0VOFFhm8wHMS7GIQReErW5xay/xayGeFR2v08rTSLBHg
         s0D5TfL77gY8I94LYeTsFZ992NL+FrL0HWYEWfoEgohVgSQWYiMOJI1Q0gXgjnELGusG
         yxGe1vxxfx5tEGjZ42nNjhQFu17xAWNFif3Zt759/IlE1SQWPCM5e2ohCHekYZ4bsB1V
         n3pG0iYYk3h1AJhj2x4Ieuyy4fcS5ftmtqComvfDS76iK4MnePo4uty6tbbuhU6daKVT
         rxRNMxf1URagtGlMtyv0/DBqu6w02chfXl3qI1cxbSPefPUuGOIIT8LkwnouANQ+pQk6
         B1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794711056; x=1795315856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
        b=ay+zNTSH+wWcJ8sMx6wCpHOHBEElfoiPOMjqTlH6mEwxnAOQfGef+hhBpIwVLv+9rl
         O4yfQi1XSAL6u2SG+Ewdw3lZnwzEmcTAa3MqIpYF6zt3Cf2H6PKaslognZV4HgsQw1BI
         eFEE0m1VhoJgo1CiEv8iVGmXfd6oqzIfDK/nbZrcv9ChjxHxXcygTqnoQQCjDE6EFuYi
         sXLAb7WZALvUT3fTg5RhgpbGGAAWZfw9ugx2Qx5omyK7HB6QetlySCYureMuie4qPyag
         EEsO5fon/O/DDbNOeWD65r6PItaMczbRGZRjFjMuSjGU7Sr96gI5AU1+ojludB81XnMU
         ZATg==
X-Forwarded-Encrypted: i=1; AL+hErH8csm3meTMvqoyNsbxRoFM73CCqrm0+r4vPG4g1Mvn/014bgzp5+8OpyMuPm38esMPBdS1/KJXo6LaaA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+pNwqEKPfjXekGDimnEebd6bSumz0Xu//V2AB31JbvSIIqvV5A
	RUbkKEjgqpulCVdOI2DQPtYdbpI3sMCULYPdDGunpj3YPZup81x/4d3ctgvg3eTeHEemjaHJ33w
	glfErbkW8HY+ispD1AIEy8ZHzFoaQnvw=
X-Gm-Gg: AYBFou1AdzQtImQYffXd1wCMJD5hXMfCegETeql3UC/67MgrDJqSUVwgg0ZqmRquqZJ
	ZwpM4Ura0R7hLiYJvk7gnXGVc2o7ZR7Lu+xl9phggq3y8LgEi2iZ6RPMR2t5zrkhBHRfwQ+zT09
	ZsY5mPKp0Xy2dJtDKNVY/dL07c4HXlyf0xKHFFDqE+B5d5MldCEOwTW0uVsh7uid7kzIiGXIwA0
	BEAXmIWZjzdohTB40gp/cLGjbrCjb9kQJlb3/61SIbZ5CcKJT0xTisJEE0EGSb1Q0V9rOBZtRUo
	x9RYYWr+pMgmQvBeV3FKogcB3DkTAHJ5JsXexy/l9FT7Hb+3t50kiQPlVsiZ8HBjHksBXtnlZVL
	rU1tLwYNJzQvRCsHt+Zi1ujkMNmBVjlCLBwBpd6mDDqn0FMWzdkBzZjfAbYdfSndo3eqN5gqiMm
	xPMQtD+MtEgvstZ09Rd9c1EHuJn0mEIZ1M+mWrIAzhJA==
X-Received: by 2002:a2e:9a14:0:b0:3aa:f4c5:8920 with SMTP id
 38308e7fff4ca-3ae2b5244eemr16617881fa.12.1794711055318; Sat, 14 Nov 2026
 18:50:55 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-5-890328e4b7e5@gmail.com> <e8ffe364-5c98-4987-b6bd-c263122aeae8@roeck-us.net>
In-Reply-To: <e8ffe364-5c98-4987-b6bd-c263122aeae8@roeck-us.net>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 21:50:43 -0500
X-Gm-Features: AclHuK-sqqPXlIQFX4lO3FN1NrvQTjfvTZhocvr9YoyjI16C5qy2nZEmwXZkKgs
Message-ID: <CAEdQ38GEckm8oU9pmg_t-_EC85brP4ghWAE4tYBNEvF+gcqMKA@mail.gmail.com>
Subject: Re: [PATCH 5/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 6:00=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>> +``temp[1-*]_max_alarm``     Sensor is in the warning or fault state
>
> "fault": Sensor is broken.
> "max_alarm": Temperature is too high.
>
> That is distincly different. A faulty sensor should not be reported
> as "temperature too high".

My wording was the problem here, sorry. "Fault" was my name for what
the firmware calls the Failure state, and it does not mean the sensor is
broken. The AlphaServer Management Utility user guide [1] (section 3.16)
says the firmware keeps a warning limit and a failure limit for each
fan, voltage and temperature sensor, and puts the sensor in the Warning
or Failure state when a reading meets or exceeds the matching limit.
The status byte in the console's packet only says OK, Warning, Failure,
Unknown or Not present (Table B-1 of the same guide), so a broken
sensor cannot be told apart from a bad reading at all.

For temperatures, v2 reports Warning as temp_max_alarm and Failure as
temp_max_alarm plus temp_crit_alarm, with temp_max and temp_crit being
the warning and failure limits. Nothing is reported as a fault.

>> +``fan[1-*]_min_alarm``      Fan is in the warning or fault state
>
> This is wrong since there is also a separate fault attribute,
> and "fault" means defective, not "speed too low".

A fan in the Failure state has slowed to its failure limit, and the
firmware treats it as a failed fan (a drawer is powered off for having
too few running fans). v2 reports Warning as fan_min_alarm and Failure
as fan_min_alarm plus fan_fault. If you would rather keep fan_fault for
something else, I can report Failure as fan_min_alarm only, but then
nothing in sysfs separates a slow fan from a stopped one.

>> +``in[0-*]_alarm``           Sensor is in the warning or fault state
>
> Which one is it ? Is it distinct ? A "fault" means
> that the hardware is broken/defective. An alarm means that
> the voltage is too high or too low. A faulty channel
> should not be reported as alarm but as fault.

It is always the voltage being out of range: Warning is the reading
outside the warning limits (5% from nominal), Failure outside the
failure limits (10%). Both are reported as in_alarm in v2. The limits
are not in the console's packet, so they are not exported.

>> +``power[1-*]_alarm``        Power supply is in the warning or fault sta=
te
>
> "power" is supposed to report the system power, not
> a "power supply warning or fault state". If there is
> nothing else, this should be identical to the matching
> inX_alarm and/or inX_fault attribute.

There is nothing else: the firmware reports a supply only as OK or
Failure, with no reading. Failure means the supply itself has failed
(lost AC, power not OK, supply fail, over temperature or fan), so v2
reports each supply as an in channel with only in_fault and in_label.

I'll send v2 tomorrow.

Thanks a bunch for the review!
Matt

[1] https://ftp.zx.net.nz/pub/archive/ftp.digital.com/pub/DEC/Alpha/firmwar=
e/interim/ams/releases/Version_5_2_0/ams-user-guide.pdf
