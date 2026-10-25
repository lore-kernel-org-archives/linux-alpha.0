Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936377;
	b=X0iH7/WMB9tdoHTqWJ/jEeUSo6/BILgZAtWViPdSK6gKGU5F1uEkadueKvDYFdETCwQn
	 RHde0V2BfwzDM+mUxQ50VRrtjPqtlU2pGnho0tICIgxOZjfeBk3ZJ2VXaABE5AZdOw2H5
	 QewXJmIRIeXKOpazK0arTa2LHDDxc5N3CfimAYH8h5tayJKkXQw3lsjUY5NV6TWzW/xKx
	 lin3bTQiMyFkITXDCb6n4ztBYqe5GmsZuzrbcb1RtFB2effsYaWu036VKNGR1uLYGFVeM
	 htAOVfHLc3Yzld/QifAi83VqrgFJF8wB1QLHeJh2gZB1aLa/Q4ll3zu8w5JbbiFmvwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=w+35OHT8eig97D6eOQL/H2On44eSSo3B/P3W218Fgsk=;
	b=IqJwvpQU5jOHCly++DBkLBflqE6ztALJuknurKyrYn99hPXYIOJDBlIe3XGyK8Uzz9Q6
	 2p7Mj7sMuvsV+PWG44qXNiFmPwxDUHb41Bhn+glwZczioupnLN5ZoVTtAXcat3yRRUFR3
	 pGJi8jDTJTaNsbt4w6wp8nwBNn5e3gG3tYLxrrTDhbA2z1st+hBc1dDtGL0MGcspO4c6H
	 KrRQGFe0nDwiEmTv/ogdaftkqcvs05+ccNNP5y3m1Lt5VM8o+3kdWXIBlaw8fiEqrRHey
	 nT2zSA4si3fWgh29IlKoOdgkff361Aq12f7kW5SOuRZ2+2jIV2dKvRKf9EPAG3/k88A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jLAkP2eI;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43096606A31B
	for <linux-alpha@vger.kernel.org>; Sun, 25 Oct 2026 13:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43096606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jLAkP2eI
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b10ac6ab7bso19872127b3.1
        for <linux-alpha@vger.kernel.org>; Sun, 25 Oct 2026 06:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936376; x=1793541176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w+35OHT8eig97D6eOQL/H2On44eSSo3B/P3W218Fgsk=;
        b=jLAkP2eI3nFD6ECuhVjuy9y5smABETQRmxjSpdOTM3eBnvN2TYHqpJa+H7DqtOizYk
         hfL2TkHM9UPjR+sRMCx2qBGYp8D8hS3XE55juNHLJDpeXyr6r4p1grytvkomF+6Jqoog
         s8Nv4gEP1k1pTOlMs/oZIHM7wKFFci4X6XAaNeQvLqRdqEjBkq3mAkePOempRC9DrorX
         gU7jmSYenlJJnB/YwSfN52jFm8DIMz+JeT6NLcv7Cw+dbwR0/lb02GMlO9yiVNoPMfyI
         gO8EJE7LlBtj3PkxlToBVgg2eWd0uIlnq6j0loSqoXCEypnCdIUSfLqPvNLUd6kbwFRA
         hMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936376; x=1793541176;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+35OHT8eig97D6eOQL/H2On44eSSo3B/P3W218Fgsk=;
        b=E6xRRQVShG18qjBKIfMJg8W+M2UwAyMWyYqBthopEWbVIouvZwDFVBAnFhihNRx8Pi
         8XeAoAbTPBLQ3J6efTvs3ImEVWLGzgLwgJV2jjSG6G9tMpfA/Uecjl++8bkFcQIZ+/u6
         jsvMRmhJNvt9wQFdqAd9oy5Y5Np0cp2JiKafvAlvjf4pj8Lcq8ZY5m3OdjGrcJHgQZ6v
         4pmSvzvhdZt0k8FQ27T9iKBUX1h72DkKy3sTw9XCjfLhbiMktLu8Ze3UBTbCOLsTobiN
         heIG2GDLEGPBPgJVc1CFWPrDqttYMq7faO8AbAb7ut+0Uo4PwfuG3z+K+pqRhX+VuR66
         t5TQ==
X-Forwarded-Encrypted: i=1; AKwUvBwveLQPOEFH5WoJLFybXQVqm/363I+FD8jikHCoxRUyi8u5poAiDhV7n6fAvJT1wbEkgppGwhJRSXoM5A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJbI3vWTO8sOVKwmAxpy1MNoM+Wvh2JjDXZhBJr5y67/OYJ7h3h
	zIC9xgYrdTMGOpIwCxbNp68tr1RZssfqxfFywxKXPdAOSuefwz+LUyjg
X-Gm-Gg: AYBFou1njN7H5vlQKFxiUjqHtgB03a4FHXXt94xoWlC1RwnuR5yWlpuJI1FX+02H9mW
	Oqc8xiaJy8z1lm0dQ/050y8N28Z24EEKvb1cZ3vPsRoWaBws1YhaZFukZFhBBQfdw9/VEpQmAZO
	7GW971/JLvd6av98OukxS0hk1+4mt7cmDwekr4D0/ItnObK+Rb/JNjQL1ZZN8vGSgtqtGSxnvYw
	NIegBsP6qb/q4bYD4nGIct4QI9mX0biMVPTDFynVQAlO0URbYJz4ARbngV84RwWaUZTDxq/dp1c
	Bx18kyNZJTMeP9cTTRDXIDJNirlUckW97YifDu9aqc9fBj8LPmbB2h1qHBpYr4rYwpnjPjxoZwX
	KzCW/JkJPX3cnBgQe64ndOGy5tSHnbIeqUmsaxVEC8yEW3cF/TbWGYC1qjkiG1UoG6ccDU9ut6t
	tVK+WP4+6Xd5xpVE0Y+rLJQZjnmgDZ9ybbIvbEpPl6zz729/XSIGc5xU5V1ZU3pOgwYlheeGU9n
	eYo2C+aNmZkwOAlFpkFebqTS+gVHwh37uGq3kxKuYQFgOF8Z+Cn0qiJIhEMP7eBWyVSQdC0NB3C
	+uHu2IBzlEeJxBcj2ZGltf+rZTnaRcAf/DQ9oDr38IPZdYt/PPVXFdzcyw==
X-Received: by 2002:a05:690c:d8a:b0:8b0:6866:c5b6 with SMTP id 00721157ae682-8b1669b73d7mr28746487b3.9.1792936376071;
        Sun, 25 Oct 2026 06:52:56 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166dd1571sm19902957b3.13.2026.10.25.06.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:52:54 -0700 (PDT)
Date: Sun, 25 Oct 2026 09:52:52 -0400
Message-ID: <20261025095252.1749067.mattst88@gmail.com>
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org
Subject: Re: [PATCH] alpha: fix PR_GET_UNALIGN flag mask
In-Reply-To: <20261025074237.1050419-1-linmag7@gmail.com>
References: <20261025074237.1050419-1-linmag7@gmail.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Sun, Oct 25, 2026 at 08:38:50AM +0100, Magnus Lindholm wrote:
> GET_UNALIGN_CTL clears the flags it needs to read, so PR_GET_UNALIGN
> always returns zero. Keep the UAC bits when translating them to prctl
> flags.
>
> This was uncovered while running the strace test suite on Alpha.
>
> Fixes: 3185bd261882 ("alpha: separate thread-synchronous flags")
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>

Reviewed-by: Matt Turner <mattst88@gmail.com>

This has been broken since v3.7, so please add

Cc: stable@vger.kernel.org
