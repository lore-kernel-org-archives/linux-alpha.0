Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BED8D2FB
	for <linux-alpha@vger.kernel.org>; Tue,  8 Apr 2025 00:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744072540; cv=none; b=j/g2p1/ccRQ7io/3zGG3KIMQS31W35GkLmfYmDQX7jspRbNBsp69syS+8s3L4J/UjHqKtsxQmakjE3AhL5bViuSXDm4baPxhJOrJZ4dh8hF/6yPkr+ak0sYHJSbKElKRIFlv5nI+a06HHLv41TdyzqgdJ0lmsYfGW8rlQgdlltI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744072540; c=relaxed/simple;
	bh=DaV65SDOazR9yPifTzNsvT2tHThc/Q1IbGQ47406ibk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RV6uukWUQQYZp72XCn5fAaKFaxqvBA4m9ZpClUyWkaqzRlsRujq66tj5ZFPgGAxMftHkSK1g/J82AsjzbpPIplZZrsAh0XPp7NW83ETWB/V0UKQZdX7pH4P6tcVnAdEM1g+jIV50yCBDDKH4WKk4ZvT3zQYVolapck56+xkqHI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GD4mg3c9; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GD4mg3c9"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so766679666b.0
        for <linux-alpha@vger.kernel.org>; Mon, 07 Apr 2025 17:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744072503; x=1744677303; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r+ZxkGINI7rLoBc6b8D+uct/d147JQCfpdqDjWea//I=;
        b=GD4mg3c9QtEMjy9JQxYfq6gxscesftXjRfWRnq3O7+E1w4TWtUAhBihbeqhgbBXXCu
         bFYNieZyqjc2KXNb09BppbLsgnHO660BQra923cF85wP+ovnftYoMvaaJQYwgADqt1aT
         k0cGohV5d5hxpo0Z4t4dDXop7MATj/4OTx+j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744072503; x=1744677303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+ZxkGINI7rLoBc6b8D+uct/d147JQCfpdqDjWea//I=;
        b=C6EuUyCr+M5gjvYF3+V+1aCvuJWCaSWpvTM+6FLv4ue17rMR7RZ9UMEyKXDWi+SO+r
         QQOj3ZzLTGSTF0ix5HZTGDkJWlUyrCT9fIVtVQRHxHH1hJDmy9pe69obR1k52QGcpW9G
         rwT92slO/sRPlQ/u5E6GrqlATO1VdHtw6g19Z9v2a7sMkihUayHIdXDSRILDZlCXcNeB
         BY9cj6zdGj5DxpJobFrhY7xwWY/lcAKZ3fgYDPZfJSWlunqzRcRfBf3XNG4Uohc6VZFB
         8aopVjLYv9A7LzviMfUuqqn5nFKFKdZlGL85M1PAU10x7q9gWbVRdUQur2l1Hqe+6fUE
         kLwg==
X-Forwarded-Encrypted: i=1; AJvYcCUJqxKzO3aIE0lcKwXMr7J4/XFW8SgG0LGIOD6Ug67fzbECmHb0vuLKDna9eGCaIvGPSvwFeQJgy80IVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMgkURXzmkVVmYVZ1y3kCoxRCOMwPpUFYQcBizy5CXt2jIPtIC
	IaEEfzY3Fk1gF79nDowI7WMLNDIFO8OYi7X/9gTZZVQjHsgUZpSH+rylA5A5Q2mJL4CQCCQBH2j
	2zcs=
X-Gm-Gg: ASbGncvePTEJt0W1qLBJZJdtU7O5iNv8/CEa2LRFq0DBRyHqoZL5k6K+hrR/EDm82ls
	7xZwQwCPiTKZhUxKzHsyqcG03/myWkqqwvpGNNtGc8E1XECGSQsT8h74i9IdpkmivAeSkMYDkHx
	edUucMFIpgRPj2qaYpT8zZqlEi3rtA6IxxsG5YuJLVy7FpmktsxLDz1rZXy9lY/IVCxdU42DdEZ
	V8/Zuc0i2/s5bR/wWM6YrLl6qC/K9XRSIWToHM/vSuDVkWmtEktVWePBfHTqerJT9Ht08kPlz2T
	KwVEZ4LEjQJ1OTsbz+bmedOXCHPVjWKlffEkY1pYTx0f49Ao2yz1a2woWb4kFDO+BV99VuVH1kO
	I3yQyHH+DnZfFHjs3CJwTl8sFA1D5gQ==
X-Google-Smtp-Source: AGHT+IGc4D/n9Bo96yeU9li4oZzQJEWOGm2OltqstJchlfOEtMt9O7zvgZPo9gdRF0J8TDrYwuIvcw==
X-Received: by 2002:a17:907:3f2a:b0:ac3:f1dc:f3db with SMTP id a640c23a62f3a-ac7d6d224c4mr1136319966b.13.1744072503097;
        Mon, 07 Apr 2025 17:35:03 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d794sm835628866b.11.2025.04.07.17.35.01
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 17:35:01 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso670449266b.1
        for <linux-alpha@vger.kernel.org>; Mon, 07 Apr 2025 17:35:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0xJbiQ2s/VnVXdDiE6KlwnV4nSB2ORXcbaG1b5aFnH3Cm+Xovl+zMvRFn3eLEASUEm8++AmaemL0IsQ==@vger.kernel.org
X-Received: by 2002:a17:907:7eaa:b0:ab7:bac4:b321 with SMTP id
 a640c23a62f3a-ac7d6d6447emr1163743766b.29.1744072500876; Mon, 07 Apr 2025
 17:35:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alpine.DEB.2.21.2502181912230.65342@angie.orcam.me.uk>
 <CAHk-=wgBZk1FFOyiTKLnz4jNe-eZtYsrztcYRRXZZxF8evk1Rw@mail.gmail.com>
 <alpine.DEB.2.21.2502202106200.65342@angie.orcam.me.uk> <alpine.DEB.2.21.2504072042350.29566@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2504072042350.29566@angie.orcam.me.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 7 Apr 2025 17:34:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=whKa0-myNkpq2aMCQ=o7S+Sqj--TQEM8wfC9b2C04jidA@mail.gmail.com>
X-Gm-Features: ATxdqUHVWAsCJEhhvm-QPqcunGy72geDTRo-IlsWBZxYAFW1rFkcbu5rDcC9MaE
Message-ID: <CAHk-=whKa0-myNkpq2aMCQ=o7S+Sqj--TQEM8wfC9b2C04jidA@mail.gmail.com>
Subject: Re: [PATCH] Alpha: Emulate unaligned LDx_L/STx_C for data consistency
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@unseen.parts>, 
	Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Magnus Lindholm <linmag7@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 13:46, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
>  So unless I'm proved otherwise (e.g. that all such code paths are now
> gone from networking, which may or may not be the case: I saw IPX go but I
> can see AppleTalk still around; or that no sub-longword accesses are ever
> used in the relevant networking paths), I'm going to keep kernel emulation
> in v2, because what just used to be wrapped in an unaligned LDQ/STQ pair,
> which we trapped on and emulated, will now become an LDQ_L/STQ_C loop.
>
>  Do you happen to know what the situation is here?

I think networking ends up using 'get_unaligned()' properly for header
accesses these days for any of this.

If you don't, some architectures will literally silently give you
garbage back and not even fault.

Admittedly that's mainly some really broken old 32-bit ARM stuff and
hopefully it's all dead by now.

So unless you actually *see* the unaligned faults, I really think you
shouldn't emulate them.

And I'd like to know where they are if you do see them

             Linus
