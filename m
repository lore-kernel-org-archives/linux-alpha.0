Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B7423CB
	for <linux-alpha@vger.kernel.org>; Mon, 13 May 2024 16:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715617667; cv=none; b=VYfDt4Ox8bLU4NuV5x8Ku7MJjbl2UdRvUX/uZXDgk9l30gGIkV0/Hgmmgy/RGWHvdQ83rkSyXmI3Lq04ftlkdei7bCwKLBK3RcCSLAwQ5oeGiZk/YP5/2gSQEQnDyBIzEddWhGugxc8d3AZ+8jtXBeT9XaniC0yg75HVqTVsvKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715617667; c=relaxed/simple;
	bh=indKPqo7wgjPODxZ3n6dtvDts7VXZJSCW/Fui71Wi8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DQcWJ73nDbEDaM+iz5oibQHrpiwe4ZNaFTwKql4PCFUyRpBmTbcqbfdAFaXpmIBBPS1xGC0NMx5VBdTARjyI3tT2qK9F/xJTCCT6xV7V6UF83UcL0jFjcnb7biF+yd4G7uMISjawOmJv4yT9XqtpFNzw3It7KQruOKzoTNfz1D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DX0JWVbf; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DX0JWVbf"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e0b2ddc5d1so66312271fa.3
        for <linux-alpha@vger.kernel.org>; Mon, 13 May 2024 09:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1715617663; x=1716222463; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AW+bcvxmWZZxt4c3Dh0r2wINUf+borweQyDfSngaYos=;
        b=DX0JWVbfXP59s7PMdwmG75SAT+SER9lV7/d21VIYtCptWJwCG3SmW4+LdEtYjIu63G
         fKIwf6GrOBdZwfhX3KfgL7YHwTvoJgGii967ctZHBirFL9aZrxBDmwERvxf0pjBKjZii
         NNEN+t63kdhH+pub/VDBv81ikmGImoMXo9518=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715617663; x=1716222463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AW+bcvxmWZZxt4c3Dh0r2wINUf+borweQyDfSngaYos=;
        b=wAUrNqwww2+j8BHXCe25TJJgQ9yg3niXfQlURBsdL0i2tOkXkbeHFKdyc0Mx3z2KmE
         eHnabSm+Z3Wm9tq3m/GDaQfQRuovmEVF/Vj43+/o/sB9VSp0Ya5MoYLfmnmKjVHzBZap
         9KlJ283jtzSkZ39Ku76D9/hhaxsidC2cNek3EyfqsyLG72+LBRpYfAREiwm1oCCi4QtP
         EI7cOM9QvJr8noCngaMz5ivLfqVhjdtRLB0XLQnWRfc/KN1HU3IJQNwx9kubYaTIc2iB
         By3gjjL8vXrZIjd8ebtm4hoPjzE8Quo8qq1GaxOcRsXIotQQufoy2rLv86lNl8mnEwgt
         tmkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj6hwVhEomHjhfIR1ZmAoM+lT49dah6GIyFXsuyNSXCSWJUqBzu4aGtdZ8nTpZZRpR7Oz14wXiNFf91l6s+rRswPf0BQ0yUEYowdA=
X-Gm-Message-State: AOJu0Ywf8IlQRFg3kVDcFfSSoXjQPNpbGgAvZG84a557FV2eK27fOez+
	nHz1sr6XsEgzTK6Pva8GnaF2+L3QuKCQMgZWIhoWBFjP+vWjxAEdJfBBnf6ULvXo1Xcialcuy4f
	IkRI=
X-Google-Smtp-Source: AGHT+IFK9VB2AChLK/BpDFrWEMx+CL86MRC+fDa2QZO55WUHnGmM7BJ5d9rYKhVulp771FEkow2sbA==
X-Received: by 2002:a05:6512:a83:b0:51b:e0f0:e4f8 with SMTP id 2adb3069b0e04-5220fc72fbemr7402825e87.31.1715617662515;
        Mon, 13 May 2024 09:27:42 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1787c699sm613066366b.53.2024.05.13.09.27.41
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 09:27:41 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59a9d66a51so1061701466b.2
        for <linux-alpha@vger.kernel.org>; Mon, 13 May 2024 09:27:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2JyeWjGt2IxrWMUcTsBkIVettK/UPxVjeR0WPYs9raZHSn8/Ld9OnahTNY0V/f3fXx0VsUkCDJu36Z1lFcZDZRhXxRgfF3XiamCY=
X-Received: by 2002:a17:906:f88c:b0:a59:c52b:9938 with SMTP id
 a640c23a62f3a-a5a2d6653bamr696929366b.55.1715617661402; Mon, 13 May 2024
 09:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <71feb004-82ef-4c7b-9e21-0264607e4b20@app.fastmail.com> <e383dfe5-814a-4a87-befc-4831a7788f42@app.fastmail.com>
In-Reply-To: <e383dfe5-814a-4a87-befc-4831a7788f42@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 13 May 2024 09:27:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgZ_fCwC5iGri1KOEwdV90H-myv1gSfjHfCwt82ZXaCWQ@mail.gmail.com>
Message-ID: <CAHk-=wgZ_fCwC5iGri1KOEwdV90H-myv1gSfjHfCwt82ZXaCWQ@mail.gmail.com>
Subject: Re: [GIT PULL] alpha: cleanups and build fixes for 6.10
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, "Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 May 2024 at 14:20, Arnd Bergmann <arnd@arndb.de> wrote:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git tags/asm-generic-alpha

Well, despite the discussion about timing of this, I have pulled this.
I still have a fond spot for alpha, even if it has the worst memory
ordering ever devised, but the lack of byte operations was an
inexcusable "we can deal with that in the compiler" senior moment in
the design. So good riddance.

            Linus
