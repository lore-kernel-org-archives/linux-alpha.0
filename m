Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2D61311B5
	for <linux-alpha@vger.kernel.org>; Mon,  3 Jun 2024 16:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717433884; cv=none; b=Q7MnN3UD8kRiq5/M1NMS8j00FAPluWS05wt8TFFG7f7UbGYLzHBE/XbPVaL8c11sI/6lIukbFGm+dm4OxivGGHvhGuEQh5iMW404d1NQj/GyZ42icq4NAc83W/flunHguQLkd5aHWAOPncMEZzn4wjIKIMt/o70ApJZQDQRP21Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717433884; c=relaxed/simple;
	bh=YmfhrGKR576T+lERklhD3qCbieB1UQ/6RTgNn0+mM/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VCvOsXXL1tgC+1IPZH5lEdFZmFFbAjveUc2NRSI8ZGpkdtQ2CrxkE7TiDjiiWjRNP8j/ctHa0mDgpceYY3jMQ+iXEOLb63pjb5Zj0gRHRNEvdSZQqjLUr7UuN6rTldDl9UvCDP2zs5TCDuzS7Vdw+H3rb//xTyAC2gHpGYWYB4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=a7KIZvvx; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="a7KIZvvx"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57a1fe639a5so82304a12.1
        for <linux-alpha@vger.kernel.org>; Mon, 03 Jun 2024 09:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1717433881; x=1718038681; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5ebltTeVjJmxSwR146N9eCu8AyLuoasTttIxwHglR0=;
        b=a7KIZvvxBugNNfA/aUlr+aOMfzFDM8ip7JlhYDfPW5ZPWIY3om445LAw6aFOm4DxNY
         tVYk+W0zurXUXbo5qrf34Y9dSkJnlsI0/NHxEO1xgF2KItCYSBo5hyHCkGRu6ZvUX4Vi
         ilZDkU/503KC5lScK8mEiMV+5hP9nX8oRlqPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717433881; x=1718038681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5ebltTeVjJmxSwR146N9eCu8AyLuoasTttIxwHglR0=;
        b=U4EUFdst/EMya56E+SEHrN4P0hgy6na7aEmHH3K1SydRDi8d2ghPIrKK5DRxbXAbfa
         y3FL4UGc9IgyvmYhxPTSrPsJ0ZjWxwKbGiwJITPOUhzicaa98cCPWrAABHUjGNOWcKhT
         t5jpc5itSuhr4BUQGajTW77syslnGSNzTbDUcqHLenojqrYsqJOrD/2a1QyqwJfqESAu
         m3GwCyawu8jVHZ7TYglwDjbm4CZKx++6a87tS6fayW8Y0c4uq64S+HFhKisFg0WJZ5Ig
         cds1lrBBW0wp5Z/W3WIJQRKE5nDcsyqrYO5hhT4meU4m54k7dDbs8VPaEIpEuTPamA7I
         lm+A==
X-Forwarded-Encrypted: i=1; AJvYcCXySQsL6EZyuv8wTYVn9F3btdXoeUfOvlwtmdGEH9OR8hNiVPabaWc86NhMreW1h5yUt+Pbt909ryCsvF1iJuQhkEO7nePc7Q3aSFI=
X-Gm-Message-State: AOJu0Ywp+pUZGGey7dXMRXE0Z6u3TsZRcPL0FcgvPWHiRMb9ZjmEVp1s
	uE0WQvEgMo7nuuiZykSjtOZ6g0iauiwnIQnTeWH++Qtpu77KTfnmzLYgNZCJnB3HjAK7Yc7ZOQD
	S0L24gg==
X-Google-Smtp-Source: AGHT+IHx+4BbEn5K/TXf6GdgPph4ZUt46hUbjBjHuX6A8VK80pRx0QNkS9iFFqgbmE+c32ypYe6sJQ==
X-Received: by 2002:a17:907:9392:b0:a68:4397:a80a with SMTP id a640c23a62f3a-a684397acdcmr609928366b.17.1717433880930;
        Mon, 03 Jun 2024 09:58:00 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a690f020b9bsm170867066b.140.2024.06.03.09.58.00
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 09:58:00 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57a1fe639a5so82271a12.1
        for <linux-alpha@vger.kernel.org>; Mon, 03 Jun 2024 09:58:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAUgiXbyHvLzOOFO6m8gvfZCqKIPmvHKm6f4xCgnw0AsQFpA5vrXaoGOiyrVXpvImm+gtn95HdLrYPcyF/ysvKKKuIyu5lIoM1MNM=
X-Received: by 2002:a17:906:2855:b0:a68:a2e7:118b with SMTP id
 a640c23a62f3a-a68a2e7230bmr456124266b.19.1717433879674; Mon, 03 Jun 2024
 09:57:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503081125.67990-1-arnd@kernel.org> <272a909522f2790a30b9a8be73ab7145bf06d486.camel@physik.fu-berlin.de>
 <alpine.DEB.2.21.2405280041550.23854@angie.orcam.me.uk> <aa397ad5-a08a-48a1-a9c0-75cfd5f6a3a5@paulmck-laptop>
 <alpine.DEB.2.21.2405291432450.23854@angie.orcam.me.uk> <CAHk-=wi7WfDSfunEXmCqDnH+55gumjhDar-KO_=66ziuP33piw@mail.gmail.com>
 <alpine.DEB.2.21.2405302115130.23854@angie.orcam.me.uk> <CAHk-=whiH6g+T7+YWSYgAhJ9HsJ2bUUDJfLLo_Yhbi8CVgkHDg@mail.gmail.com>
 <alpine.DEB.2.21.2405310457060.23854@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2405310457060.23854@angie.orcam.me.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 3 Jun 2024 09:57:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wha2rH2UcTvHUYK+dNnP6UCDRkYM0atvw_GTP5Sz3OZrQ@mail.gmail.com>
Message-ID: <CAHk-=wha2rH2UcTvHUYK+dNnP6UCDRkYM0atvw_GTP5Sz3OZrQ@mail.gmail.com>
Subject: Re: [PATCH 00/14] alpha: cleanups for 6.10
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Arnd Bergmann <arnd@kernel.org>, 
	linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	Michael Cree <mcree@orcon.net.nz>, Frank Scheiner <frank.scheiner@web.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Jun 2024 at 04:09, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
>  Anyway, back to my point.  A feasible solution non-intrusive for Linux
> and low-overhead for GCC has been found.  I can expedite implementation
> and I'll see if I can regression-test it too, but I may have to rely on
> other people to complete it after all, as I haven't been prepared for this
> effort in the light of certain issues I have recently suffered from in my
> lab.

Yeah, if compiler support makes us not have to care, then I don't
think the difference between pre-BWX and BWX is going to matter much
for the kernel.

The real pain with alpha has been that it's special enough that it
affects non-alpha code, and BWX was one big piece of that.

That said, some of the EV4 misfeatures end up being a huge pain inside
the alpha code either because of the horrible hoops that the IO
accessors have to jump through, or because of the broken ASID's.

So even with enw compiler support, maybe it's worth trying to
re-introduce any support for older cpu's incrementally.

For example, the ASID hw issue is _claimed_ to have been fixed in
PALcode, and maybe the games we played for ev4-era cpus aren't
actually needed any more?

And the various odd IO platforms should only be re-introduced when
there are people who actually have access to the relevant hardware and
will test.

           Linus
