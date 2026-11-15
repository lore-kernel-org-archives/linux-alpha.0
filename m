Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794736046;
	b=aezGgElrC8FPj88vD6BJfj9QBLNhJIS5Je4wXogQ2Azvpuyl+4R3/wmi1FMUmE4G07FA
	 eG9egZLoGE+5VW4d5rlgcE/Zkreg6AXGJlEF3gdz4Hgs0hKZedgqBOWJ9VrgCKoEK2TJT
	 td+ORVvEwEO/nACOoKzEi88bsoUKqw/FKDffemGiqQRb4ilZot2Y/jFL3Rd4Ga1coYbHB
	 RdiZDqLkaphKUJv6+RKwplWQkH0kLUd7+TX6MlOSQE8Wdb2Wky9D3QfR+4DN+qItOFkTK
	 9LpV1O1GygUeDmyLW9iflXXjy56f2u1je4M/G+lpywgweKZM1V5DNnxHWNnomGlUJuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VfHEYcb2rNE2iyrm94zQquEkhGNgVZsRO7MYguIDjP8=;
	b=xkmfrKNv+A+A47WKzfyhLqTsy97tk2zcWC3IUjBUEXzi1YJz92xP9snDhiye52xselNm
	 jhuxKrKSC5fvDiEeLy6Z3/xJLooBytXO0qoqAvwddFktZrzq8R0XVlMOa8uwzdAJR6i12
	 zQKBpXIDSf2m5kihEvC/AqfR61S+e01TbWbvbG/MlPs2zo5WFoOxgkSbMOfWvECnglwPP
	 vRNNZb4e0tp7hbgSBml6hyUSLAAGHegsn4AcH1a5P3V4BAEZOpZAe0WB7BkCyHofju02q
	 RiNfmDwF44rHAdG3NcbkV703uaFmdUfB8PASIIe0dR79ODE6k6lvb9yhqoXSalA47HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULcSl0tj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C39606A329
	for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 09:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C39606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULcSl0tj
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b704171bc9so3298021a12.0
        for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 01:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794736045; cv=none;
        d=google.com; s=arc-20260327;
        b=E7t86jvNNlElYxKmfnB5qU/uaIL7NMrNRueagZCAqAg0OJM2lm7+6/ZipZDfaa/EUS
         h802bd4l1OGt4nJQzpIkicAyxnj4QdzGS9guxclqr2KwhO9c2mCh1wf2GvFAx9wso5AX
         HplWAGqHeV2VQwWUPS1qWG/22rhvgkDX95muZqI1QN1GqIhzqdaoRj1toN/68Lden5Gm
         OPaKeHlIxYU4LhmchBXSAn80ksitrerhoJevn5/EVOb73l2JRsbU+2aKxhaal781lpeY
         xXFCapC3qrkPH7m0k0znVhamIdumw7HiIS/8fm1i+s/otIArfMxVdnHA48ZYePxzLKEB
         fa7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VfHEYcb2rNE2iyrm94zQquEkhGNgVZsRO7MYguIDjP8=;
        fh=FVLk6BWDgiaDBUjCxOnJ8GoUdCcpQgZBJjLMx84a8xA=;
        b=mIrYzsYFx/y12BMIN5Kcp7wXOtB5trU4gPRVL4+J+Z0PKAy0pUYzU0/YUSDxvlUdpG
         liLWIpCi2tM1B/sOw4/MrgWDMNchPzEYlkkJjyvMMclSWaaT2o6eSeDNM81rfODY8u8T
         taKk2ofWLVDnCkClKPczSr90q2fnsxaUfXiCmgaHUtkFBsrMTl5ZCSTD3dgoRnFILAGU
         vsehIoIvHGaSKPG4EB5V+gCTkLg9OeJIoGMr9GAFvT2XHPdqcfbsRC8mQnU1k95pkr33
         Ohx8zUU613GYDHN8TMffG/XEChV6qFXmTNxUbnRLAV6Uh6gxMTFKm7JpB4w5yGcXj2vT
         bDbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794736045; x=1795340845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VfHEYcb2rNE2iyrm94zQquEkhGNgVZsRO7MYguIDjP8=;
        b=ULcSl0tjXJEeZizN5NqOx7g1xOkL5/p3DgK9rLhn5627DhSN4mIwoV9SIny66Hap9q
         AQpN0gv4ZOs66D+BkwP264e+8bLRMf1Iq5chGtVz5+sOu68ZGxQjSCVPowfA0dy7ca5A
         JlJOfHn2aNQSa/jenvTLj3+qk3LhHZEnWvERYhDUcIzvGioqHC5TPLu32QoNpgxDZgon
         KNHSnjfV25+rIf7/4I2NEIr5MFM9xH23Zh6pV4bOZXDLbjINyX1dgB1+OyJIy8R09gRB
         ZEXxKFcY7SWTMGuHOgXLda+qhot3falzJyzaM8YnS2Av7PPg0p4tlzK0Sc718MjYdLsm
         dZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794736045; x=1795340845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VfHEYcb2rNE2iyrm94zQquEkhGNgVZsRO7MYguIDjP8=;
        b=XKkAz/Frrgksb/FHy75DDEczoTg0J6PpNr4RO7bC6TWL7oqVDPzJfp/iNwEFUILwXr
         Yz6HH8WuHFJfG8LXHae4NXtbLcThblgjcYp6deGpMnZzEkq/8n52upptqhNidaMqmGUd
         +XJHtH0W85DYg+5te6e3PAFX1mmjAeVhtdXiKKAvQ5yaH2hZAk2fJ6s7ZagDMJK24Fra
         EDJFVRcoJDXXYnIsk1GGniDneAYB3YALvMDk+7Fb/sJWcm52rfvUIzeKf8ppL3jJbVtD
         F3B8FGH9yrDy1kwA146es1hqW0KXjTp7oqdLJ5ZMmubbql8S3fkdQjH01yzEsmAZ3VTX
         TB6A==
X-Forwarded-Encrypted: i=1; AL+hErEs1s4buQ1pzd11p7xhsFL5ogiOMZrzVOfdF9zsf4w61ivtVwMK97Bgv9hWCi5c5BHdIqX3GHNxhnL76Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z910yCqVCR0B/0yOK1PBxp8/VHO5ZWv2KcToHE1kGu/NM9037iB
	6a6WGy+M4qOEDGrj1iuBq2b1G2M+UeGizqERS7/08uiwIdIQv+jC3STIJitomKnktleXEhNYneC
	Eh21gNs3LFALK9B6S3IQ1hXlpK4VHar4=
X-Gm-Gg: AYBFou2J5UJGHdOefJjf+xX7BxuHYCJ3HgWEqOZCn6zL8kajEouVXIKLJnQPfuTugNA
	dCJv3e1vDl5xa32mGH3oF3HIoC/7w6paVXPhh3ZWoIkXKYSbCfwyo3rucuOJlje73gcWp6sWOGw
	2zUYBg/ry6lo/Lzc/OBxImVwKyM9CfszbnyFwRoMBwjNgoEv+USthAzcxTYPP14GgggQZ+tLl56
	kQbbOe8LGjv4cqkjE8FkbHk1b30vRTBZnRxdYG7MwFZEypet02QoX5Cq+ny6SHeQOEH6H+NPhu8
	c2zj1mEF43qeELGtLCXB7m5myAPIRESi0pnaAeNa9qZhu+8gXqj6Gvu+PXLwG3dfGhoXMyZLey7
	W/eAhoVJ6uSGmTCHXkf56i5EgxXXmJAVdzQF5HRAziZ6dNpkkgfi0sJmhWjVBNZBDfKyOHbR09/
	LDIoiPLF/s73h0kqErKlvWfpQ=
X-Received: by 2002:a05:6402:4010:b0:6b7:f9e0:a5bd with SMTP id
 4fb4d7f45d1cf-6b7f9e0a75bmr1572741a12.23.1794736044483; Sun, 15 Nov 2026
 01:47:24 -0800 (PST)
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
 <CAEdQ38GEckm8oU9pmg_t-_EC85brP4ghWAE4tYBNEvF+gcqMKA@mail.gmail.com> <3f6d66cf-8a1a-4074-a234-dfe571622aee@roeck-us.net>
In-Reply-To: <3f6d66cf-8a1a-4074-a234-dfe571622aee@roeck-us.net>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 15 Nov 2026 10:47:12 +0100
X-Gm-Features: AclHuK-agHSxMvaTLWSNegaTGKIV9gehw4JdNQIbbkxCi9Nu8UmTXM9oBoYmDgc
Message-ID: <CA+=Fv5SAtweSW61Y_N5_k0ukEektque1gY41LKSjbO0R_4JRnw@mail.gmail.com>
Subject: Re: [PATCH 5/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 15, 2026 at 4:46=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 11/14/26 18:50, Matt Turner wrote:
> ...
> >>> +``in[0-*]_alarm``           Sensor is in the warning or fault state
> >>
> >> Which one is it ? Is it distinct ? A "fault" means
> >> that the hardware is broken/defective. An alarm means that
> >> the voltage is too high or too low. A faulty channel
> >> should not be reported as alarm but as fault.
> >
> > It is always the voltage being out of range: Warning is the reading
> > outside the warning limits (5% from nominal), Failure outside the
> > failure limits (10%). Both are reported as in_alarm in v2. The limits
> > are not in the console's packet, so they are not exported.
> >
>
> This could be reported as inX_max_alarm and inX_crit_alarm.
>

Only if the direction is known. "Outside" covers both, and in_crit is
the critical max (Documentation/hwmon/sysfs-interface.rst, in_crit vs
in_lcrit), so an undervoltage would read as too high. Matt, if the first
threshold in the packet is the nominal, as the comment in 5/7 says,
comparing in_input against it would pick min/lcrit or max/crit;
otherwise in_alarm alone is the safe choice.

Magnus
