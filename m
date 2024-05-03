Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFDA23749
	for <linux-alpha@vger.kernel.org>; Fri,  3 May 2024 16:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714752490; cv=none; b=Nvgy2AWMb7xz7On0qTqkWxawX1k160l85WZuaPAeadEHhkohu+3r/GcXsuCU/wgEuocGRucfa+sA8qzTmgbtwCVjSjugHIGXnoBnX7FGwXu8wnfty8hqhGVybumKMul2piJMNUrgoch8+XXoZgIkgSRkntDcmPJWSKMnf/strWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714752490; c=relaxed/simple;
	bh=sZM2aaIMRxH4vyVLuwDYCONIXnYdMCnrbPqlQ3tLIBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mIOBQm1o172dN9S/7vJmCJusKYOP6lOQHGkUsX8srzl6B97S45pXflsDPIrauPeFbHwh4oRnypDHomQcfk0bLS+b+0fCKdH011+pNA8dXcvsKGoxOdCcLZRd4/9vwLoZIO7pv4LUhVm/PHA5x3detxQFOWmn2bAbS8ZbzhKmuek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LhziKS8K; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LhziKS8K"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a599fcba36eso55017566b.0
        for <linux-alpha@vger.kernel.org>; Fri, 03 May 2024 09:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714752486; x=1715357286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WMaOhHAAnwImn/Mcwtmc1IDB+Tf65rtUNoBaGwd1lr8=;
        b=LhziKS8Kz16RAOeoI5lArIcv9spTuGApYFwUoELppotzMVrrT6ftXwnyZA1l0/YJir
         JT0dQiXHNfkGPBWRRZui/pk18Rh0pXJFVmSHkcFlEWxGKDiXzgXxtkTcFQR7CBo1qwwL
         mdKLXKlmWWsxL8WbDHcx2YPGF7G03MkVF3j+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714752486; x=1715357286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMaOhHAAnwImn/Mcwtmc1IDB+Tf65rtUNoBaGwd1lr8=;
        b=whwKa5mWlIKSpQIHHjH7wIp6pz1KkAQBTLDLzpFNHOxUPlyCxi29kwPM66H4dVEX40
         NBR6kOjGtU1DOvimB8lCBr/BPB8zOkRR/T/nbXVayXXvHGHdxPZskb77U7S2AMs92rPK
         CyehuIWcDGEK9ltkkS0/3K8Pyn/AX/qqE1X1x2XzTVvO2P6lEar2S3IU0R8r57t4ARby
         uuPygzPTyesweXnRwjDiwYAItOkLiecciOxWDUeJj+cuth/xe7vqyPVphaKbL6Z+KorO
         7TpyUP0e4pGM8ucCNTXSwEPWqL0XcdRmgFEKrbwIF25m0rOy3Lfvzr9O5lWSy1JSqH3l
         edAQ==
X-Gm-Message-State: AOJu0YxlEBc7935h6L9WnuSQGxoyLg6sEQHHVMowQURoBxYEWf+7KpLe
	XOaf216a+iXnP1DpESAMmhpRe5cYkmpfQ0hWadvs9UkHZu/miMU7AdWcbP2DkbZixBKPGWKCr+g
	k66f+vg==
X-Google-Smtp-Source: AGHT+IH3l7aND5xs2+JZDdGhs/4U8xkWu6c6a7LueG2SDfMdk9isrwMK/9uDvX0PtAb55pwYbgiMBA==
X-Received: by 2002:a17:906:a145:b0:a58:832d:c3e8 with SMTP id bu5-20020a170906a14500b00a58832dc3e8mr2078901ejb.58.1714752486553;
        Fri, 03 May 2024 09:08:06 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id b19-20020a1709062b5300b00a59a05a8030sm92235ejg.25.2024.05.03.09.08.05
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 09:08:06 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a598e483ad1so208411966b.1
        for <linux-alpha@vger.kernel.org>; Fri, 03 May 2024 09:08:05 -0700 (PDT)
X-Received: by 2002:a17:906:60d4:b0:a55:5ba7:2889 with SMTP id
 f20-20020a17090660d400b00a555ba72889mr1639743ejk.42.1714752485577; Fri, 03
 May 2024 09:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503081125.67990-1-arnd@kernel.org> <20240503081125.67990-11-arnd@kernel.org>
In-Reply-To: <20240503081125.67990-11-arnd@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 May 2024 09:07:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=whUDyvBNVna_vbYGfN0SUjt1jN6hUgRjoLFq_XTV_0gMQ@mail.gmail.com>
Message-ID: <CAHk-=whUDyvBNVna_vbYGfN0SUjt1jN6hUgRjoLFq_XTV_0gMQ@mail.gmail.com>
Subject: Re: [PATCH 10/14] alpha: remove DECpc AXP150 (Jensen) support
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Marc Zyngier <maz@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 May 2024 at 01:12, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> This is one of the hackiest Alpha machines, and the only one without
> PCI support. Removing this allows cleaning up code in eise and tty
> drivers in addition to the architecture code.

Oh well, The axp150 was the machine I used originally, so it's a bit
sad to see it go.

But yeah, good riddance. The lack of byte and word operations were a
fundamental mistake and made those early alphas very painful.

The design team obviously made other technical mistakes (sw fill tlb
etc, with memory ordering being the one that never got fixed), but the
byte were the killer for any sanity both on the IO side and the code
generation side.

                  Linus
