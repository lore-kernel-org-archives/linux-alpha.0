Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96F1DDD7
	for <linux-alpha@vger.kernel.org>; Thu, 30 May 2024 01:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717031351; cv=none; b=AunIIJiD55C6Qy3sEAcZmzj3q15kVPv6Ckjyr71VLXedEcza9Vx+bI8HFywDnoMfF1S95S+aBJR2FVI317yDteVNBayWQ5VZSyap5s8CScA4NO7/kRfiedERZTckzbVFoPShwz2WqYDcaQQoRUV2neyMsc7uWmBLcQ2LgrHo7uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717031351; c=relaxed/simple;
	bh=r1WLIYqwEcFl1zxpSruq17uincpEIe2QAM/Tkg8t+yY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IlStD9oFrcKhzM+ewqMu7eL4pSQ/VyUgZbNq6npxx7J3rDla9KuAxATCgGi9qT47zt2dxshD64ZdG9vBPuKd2GGWJVMvoQk4KO/MwlF6s0kg31vlssFaUVZgTQwU1HZg6SdlMwzbFfQKN3whMUP2CibybfedlJwv0gyUuswbuhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DIUV9itN; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DIUV9itN"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-572c65cea55so555729a12.0
        for <linux-alpha@vger.kernel.org>; Wed, 29 May 2024 18:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1717031348; x=1717636148; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pc8AzCw2itqlchY2iNLylrW0HG92I3q/DnK9Zsb7BQY=;
        b=DIUV9itNhbg8EfKLtpnHuKH1pEUDR/trubtVF2Pcu4Z2lDAl5gF9rVTS+Ts6Kk8+Eq
         0PnNYawFbqcd7oo1KeIFL9Mq7uc98o7+69ELep2M+FKQDxUE7PHC0gPRNrOdoflb4CyU
         dJkWdqUo/ovPZPD+gjAyrYMac6zoBKYhanCvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717031348; x=1717636148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pc8AzCw2itqlchY2iNLylrW0HG92I3q/DnK9Zsb7BQY=;
        b=BNNp59QdpnV0oWGAuD/g2eF08IaW4+EC7m9xdqKKexgaZ4u8mECZPeoZsLNcrD0Z7c
         Qh+9PilbSgv4/PYkcjgOoYeAIUzFuFgtQN0Dt+dQohvEycRPpzBwaYEeiT2/m+RsiR2K
         JA619EGmXUB9HHIR05NN/AUqBt3E2/Sk9Ap6vEOTbiM276bJfmZyoCZMB41Lb6PiaD9b
         zk6DM91IvbpmYcwJv/zd7QTbjz7/6EJYp6wQPdty2wPNX7u7CJzn2pSdyrcr9m7RLNdx
         gitVWtoVIBZFEQHwQR0egUfcsjWRq6j/yt25wg22y2lWK9LnbPt8PyzgUBjyFks7ilFO
         t8iw==
X-Forwarded-Encrypted: i=1; AJvYcCWKpbNT2tQvQUH5DagCbb+B+TuI78HWMuIot9yIBsdY2jhV1Ee3W7dQd8qfDKAY9K7x55QOsKmAijU9/9yFaydW15oMWReN0CNpeS8=
X-Gm-Message-State: AOJu0YxnkFPzcDTvf27EkWDIVd6FglWFELwDHIfZsCkuCaWiMVojzyue
	Kz98HXou3Vcuz09JLxl5jlmpssdZsE4poKG+KKflrnQIK5u73hGXFlBobhZ0kmYDKK+1b/PRF1u
	Ct13Prg==
X-Google-Smtp-Source: AGHT+IF+j0ELNW7YizMfiHOdDIyPnWB++IvR5pzdDTFtlhvH9yrsoLkRHhg3trDgzsKG6XnsIVngxQ==
X-Received: by 2002:a50:ab5b:0:b0:579:db1a:558f with SMTP id 4fb4d7f45d1cf-57a19f5d6dfmr333976a12.7.1717031347752;
        Wed, 29 May 2024 18:09:07 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578524bb86bsm8715318a12.97.2024.05.29.18.09.07
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 18:09:07 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6269885572so97169166b.1
        for <linux-alpha@vger.kernel.org>; Wed, 29 May 2024 18:09:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXccSb8udmXBLvIlcSuGZVnja/0EOqMpJuxXRoO2VU/PhVHDqoC7pJrxD2a6GxK7Zytt7DjSf94YKG6hLFrwv5k76J5UKSYQLDH9a0=
X-Received: by 2002:a17:906:cb90:b0:a5c:dce0:9f4e with SMTP id
 a640c23a62f3a-a65f0bd7b2bmr31381166b.28.1717031346663; Wed, 29 May 2024
 18:09:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503081125.67990-1-arnd@kernel.org> <272a909522f2790a30b9a8be73ab7145bf06d486.camel@physik.fu-berlin.de>
 <alpine.DEB.2.21.2405280041550.23854@angie.orcam.me.uk> <aa397ad5-a08a-48a1-a9c0-75cfd5f6a3a5@paulmck-laptop>
 <alpine.DEB.2.21.2405291432450.23854@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2405291432450.23854@angie.orcam.me.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 29 May 2024 18:08:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7WfDSfunEXmCqDnH+55gumjhDar-KO_=66ziuP33piw@mail.gmail.com>
Message-ID: <CAHk-=wi7WfDSfunEXmCqDnH+55gumjhDar-KO_=66ziuP33piw@mail.gmail.com>
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

On Wed, 29 May 2024 at 11:50, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
>              The only difference here is that with
> hardware read-modify-write operations atomicity for sub-word accesses is
> guaranteed by the ISA, however for software read-modify-write it has to be
> explictly coded using the usual load-locked/store-conditional sequence in
> a loop.

I have some bad news for you: the old alpha CPU's not only screwed up
the byte/word design, they _also_ screwed up the
load-locked/store-conditional.

You'd think that LL/SC would be done at a cacheline level, like any
sane person would do.

But no.

The 21064 actually did atomicity with an external pin on the bus, the
same way people used to do before caches even existed.

Yes, it has an internal L1 D$, but it is a write-through cache, and
clearly things like cache coherency weren't designed for. In fact,
LL/SC is even documented to not work in the external L2 cache
("Bcache" - don't ask me why the odd naming).

So LL/SC on the 21064 literally works on external memory.

Quoting the reference manual:

  "A.6 Load Locked and Store Conditional
  The 21064 provides the ability to perform locked memory accesses through
  the LDxL (Load_Locked) and STxC (Store_Conditional) cycle command pair.
  The LDxL command forces the 21064 to bypass the Bcache and request data
  directly from the external memory interface. The memory interface logic must
  set a special interlock flag as it returns the data, and may
optionally keep the
  locked address"

End result: a LL/SC pair is very very slow. It was incredibly slow
even for the time. I had benchmarks, I can't recall them, but I'd like
to say "hundreds of cycles". Maybe thousands.

So actual reliable byte operations are not realistically possible on
the early alpha CPU's. You can do them with LL/SC, sure, but
performance would be so horrendously bad that it would be just sad.

The 21064A had some "fast lock" mode which allows the data from the
LDQ_L to come from the Bcache. So it still isn't exactly fast, and it
still didn't work at CPU core speeds, but at least it worked with the
external cache.

Compilers will generate the sequence that DEC specified, which isn't
thread-safe.

In fact, it's worse than "not thread safe". It's not even safe on UP
with interrupts, or even signals in user space.

It's one of those "technically valid POSIX", since there's
"sig_atomic_t" and if you do any concurrent signal stuff you're
supposed to only use that type. But it's another of those "Yeah, you'd
better make sure your structure members are either 'int' or bigger, or
never accessed from signals or interrupts, or they might clobber
nearby values".

           Linus
