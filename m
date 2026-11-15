Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794710649;
	b=cWAw8BfYCH5D3J72UfFkVVf4u7ST7KjqB3ULfeTPfSvSBheh7kpoaX8DC9kJKIqIxmOz
	 q44lmBsT7G9JOgxig/n6Cg1c4ELoYbCRZJFJdHddus3VWaqg8qNd7RHpY+raT9rYWFRAf
	 eRLdk/QYg/ClJ/5fGQO2QpHSbiAKs2P8fZZht+2jE3tDJ4wMrJ71QJG+GaySCJ8ZXCT1U
	 4hLt1MKRuLbVlo9+r0xc9DjNkdmNSIWBgDDLcmaOmJYCanD0TcOK1iQuU4sncucgi9pqK
	 gM4Lnzhse+s5yZF2sgIcTnKlHGNVMPvHUYdFDbw2Ew8LmPOxik8Ge3Q104biDIN0+QA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794710649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
	b=KtUqpet/e5ED34EqQpPAWjaVEPdfzNgT70YcMkkNOGL9/LUh4tmATpj4Tjy11LYYMy8S
	 JwOrN5Tu/tIj1RlfPou+cYI+mUXWmedrvdRK0F7fjJyhXRA+pJIdAP078OcuYh2ngIkvV
	 KL76ULQf9B5r7Y7CkEX1jE3FMZD4ecktg0cc/oT7XCxNXUoM8b+OxZP1bxiVGcUc/wjMu
	 L9I9Cy3hSqrChy3s0/wtS5vnjwnmqUJju0OUrffim+noLJAaIa95rk1nMBFKVKbGtqp/3
	 P5+f5DOrQ2eli1lFH9JadHu6WuxdUXwVUi7CFjzjri84B5r6AElta5u4y1eYWw32S4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJnm5XLx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C42606A329
	for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 02:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C42606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJnm5XLx
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae2ab35d82so20777511fa.0
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 18:44:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794710647; cv=none;
        d=google.com; s=arc-20260327;
        b=STBPzDqiSwVf2qIznf5r5IenRDJ/7PkjlIg3myNubFbMuECBq0VLJsBIqLY60DlwBe
         jNA1wxn+x4lVJhN7uz4U9EZH9F+EGa2OwT1kzhAAGaHTAFvrjonCrDNWCewGKFEgEeq7
         tt6VrsUKEpT1vcWI+3+bBMlVqQZ2CKkeKxN/Kn2yUwmAGugC0mO5/6NPZchN4xxgGzk1
         e9gJlq8oDF7FvJxdLkylvhfUuSs+WQQr6eR9np6lPt940UtRXIVQzAg+uVyI7QSgCVSH
         3n5U7o3v3RDCMGVpTRIVN1c5mF5cKJeqsSTs4WK8NSYXxktEDbj5XvCeQS+6rC/mp3mN
         qA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
        fh=X9CQKtJqlwshAsJ9wfxYlpssDs32RUzdb7iWj+YOc9c=;
        b=eJVdUTHC5R5JmhcbuTuk1l8Zd15dYHpSPivb7D6LSAuS6yZ87zx/KcrstL4YJAJ95+
         3MsLx4P067HcebnuXkAyBO1q6Q7xM14I88/GDpUHx3ctrNpRXf3jW3tTqT5zzVfsdUqO
         FJbEUzCSriXFX5R2bLU0VSW++XakGgPGS2SsyVRdSN1+6t5kRAZpp5YpS95iVsK2Mtxt
         AWkyNNCqhh4ViBi4yR9xnIurKKG4fKuaVvLFZXILLmKApqZ0fPK3cUEwapJlhD1V4kXS
         PGTuzNzrepO9t9y8c1rgCNIJyu6JlIDTb1SHCrHuUYJoV8GFlNeeCgmbF3fdycHTMLK/
         lANw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794710647; x=1795315447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
        b=RJnm5XLxoNK866TvF2CkdY9AW+tb0cJ1wYfWzlZZh4X3OnWmWeykxS1NvAKwM8nW4T
         R0GTMYqQAqdx2m+VPUhijNqDi8cWar7oJaJKzJJHy3fk2ZhupkgqBuEO2Dm1/9fLTVli
         B4TTFx8z1iautbvXT5v2AYyLPiC1D5IFu0cThMCSZq2yjUxVximJ9/eQK3h4Y8PNalZJ
         T0bhpinyLP3mCG8jD9SPRJAwIQG6O46nBkuNR5hDYOKD8kgPQNHFOx2jEmOVhY8xIlii
         X65pjY/kWAjU8ccru4oBjZFJoMbyWVKnyH3W5/nrAP0JqE/t4MtEabZ0HgYpG0dll8c1
         OYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794710647; x=1795315447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
        b=NIRra4WHP+QMcwszoxHj5bQwhLdnIsyRcq5ufQaLeI+QjDzhTy30Ti3KYNGH3ZpvuB
         zgsL27CaeuUHsT/SFLvTWM+m3kcsyeoHqb/f4yQcccVUkGtw0uBVQZ4EBzGevw0/H3Ge
         0yjqGPqM59XFEBkVG6tcRWfbJWSSnYUmGtOvpO1ZZOh6uqLYYJ8mNgJvq3gp2gcvijIu
         XaRVYVJRo6yddM7/LacnNWkwWZtrMQBGrXyYF3PFSmW20VmvH2VhbuDoXcm5gjJKIBMw
         C48gy6eGAjEORtVGTasKvLOCicn+d1Sxtu1M7UbnqXyMO5Z70kf7w82Q68nYCbOy2983
         pINg==
X-Forwarded-Encrypted: i=1; AL+hErEOlIc/xSpidI2ACj/2/ChNNI5adriOxspeIRkdVgwV0Pl+JODR77RJSziVe0AZ3OdmQVp3yitoA2eBQQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8mOuyTsON58fqhHEU3N4BJbOrXEwrTKsALPKcOuy4dmSbX+HDx
	bTREQWV/NFUE7qg5KtxLSL7WR3JGYcgymKafQjO6hP373VbRK2qCfgh1OSOWk1Fb4iBVQXC+TEI
	BpnfpfY70M2p41tSsEgU9pSwjIpH7I84=
X-Gm-Gg: AYBFou3xcqVZGUBJ3icf+NiV4K7A09Si95bwQwnKkoFrZQeavFlYx93+McRa5y6iobZ
	D6TaRmr4qL2rZUvhIK4C+IIYVkx92rzQJaAiB0RfkjXMH/nsfR2sUntTkyc8xlNu8FSo0lwz3Q7
	U5dJ7dNTZq8FvxcRP7DcikiyBZ67a6OUN62TzmcPAzIjNyZwVcEYM9N/JtEdVMDaS4Yj/U8kz+Q
	pSFKw6EfGZE3xj2tUxmS2LrA8qMueooEHnm5GnBhV1Co5gPezX/4z6lp/rCenHmW/uWlht0XGzA
	MSHshAwFhXRouVaxhzgsjWJIWhnYZtDtgAOx/x1PqFrxAe03NZkGhJQ2snKqi0UeowdvVJY7N5r
	MXN4IRiA07AQPDkhElXJZmjNezmilFAq7BsojeM/h8CIxJH9Qz/Esw7zmbWWEClRjNC51MrooYU
	led+HkK60qDLiGNMT7ggHz
X-Received: by 2002:a2e:bc90:0:b0:3aa:ee7a:5466 with SMTP id
 38308e7fff4ca-3ae2b4f52f0mr22163651fa.16.1794710647252; Sat, 14 Nov 2026
 18:44:07 -0800 (PST)
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
 <20261114-marvel-env-v1-1-890328e4b7e5@gmail.com> <4d69d3e9-9e05-485d-87e2-428616cd5d9d@roeck-us.net>
In-Reply-To: <4d69d3e9-9e05-485d-87e2-428616cd5d9d@roeck-us.net>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 21:43:55 -0500
X-Gm-Features: AclHuK-rDAmxPKOpteTkagDnbYP3PTwmOyt-Q5uXcex0poBTc5yw5ifEj6zGwJs
Message-ID: <CAEdQ38E=+Yb2hJs3L1KHgR1Kbe796NDD2z=n=7YytQ+uiJJWEg@mail.gmail.com>
Subject: Re: [PATCH 1/7] alpha: marvel: report environmental events without VERBOSE_MCHECK
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 6:01=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 11/14/26 09:39, Matt Turner wrote:
> > The service processors report temperature, fan, voltage and power suppl=
y
> > alarms as system event (0x680) logout frames. The frame is already
> > classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
> > header line reaches the log, which does not say which sensor or what
> > happened. Print the subpackets unconditionally.
> >
> > Assisted-by: Claude:claude-opus-5-5
>
> For all patches: This is obsolete. Please base your patches on the latest
> kernel and ask the agent to follow AGENTS.md.

Sorry about that. The series is on v7.4-rc1, which already has the
removal, so the trailer was my mistake rather than a stale base. In v2
I've dropped it from every patch and mentioned the tool use in the
cover letter instead.
