Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5289615C13F
	for <linux-alpha@vger.kernel.org>; Wed, 23 Oct 2024 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729675041; cv=none; b=Zkdw75zmN6pS5VttBJ0JJfHDiMZwo4CVsGZqy2OqAgBuuEIJxMfjFK0DlIYpcnOg4ncnO6rxy6dp9ArR5GSas2U0x+bLoPXCvfgQHgh1OiB0D3XCh6zrAG5Os+MLMLAbxZk4V4D8GpUgMXdNHi6SC1Jy0+ZS2ulwC3iwCsxnNVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729675041; c=relaxed/simple;
	bh=wtB++VIztt5HrzVDtGHAG03WXfiePjTR9YlbhZgm7nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xg1LfQ8aUuqshYbxf0/pezNv8IboEGrBwUri3v4E9lcmMiy/9Iqg8ukLiBMGu0Tlwfq3JJUvR+Wc9a/5GvsxhvAuNw670IdhMlh5TXJs5W4a6XbyjoWsT/buY1pxwjBmmXqCvE5QieHig/tY7ILBI35f1tsbZfi6vOtI+I1w4kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cDl5N70k; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cDl5N70k"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so65391601fa.0
        for <linux-alpha@vger.kernel.org>; Wed, 23 Oct 2024 02:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729675036; x=1730279836; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wtB++VIztt5HrzVDtGHAG03WXfiePjTR9YlbhZgm7nk=;
        b=cDl5N70kW4qZ92fU3zt9XzrqqbmPXBPAR1397nRyl8QFe2280rQWAEVMnPnOEXfzyr
         CQpf7IerO4IQRmZyROB25M4v5cD3bVyixJ5PzTMGla2pzMQVv5VW8hzCmXOsF4t6ALCC
         DEIP6658YoISqPJGBgq3GUyOdtkIAl56f80J0yMCifAAEvXP5xKzmLelybI1sYAr5O7y
         jU6Qsij7SkfqYVzwMcn1rxlneUor0LXCkfbq8yH1mYfKkHgAwtzAJVjtE/PR9q02FFi4
         8/JCQU8rMY8y2ILwvD+NB30kGipYxS5zfVYnZCAGbf1HjbASG4cyELEU9wcnJRsI8mU2
         80/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675036; x=1730279836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtB++VIztt5HrzVDtGHAG03WXfiePjTR9YlbhZgm7nk=;
        b=H1uWfvqSed/5mrRuHKOG4sq8l5P+8O9GpS6FIlANPzQXUnBRPWKRXkW4SjNkK7hZii
         g4LHXFGPac5kxB0rEgAz6u0MedF7pxOTaOFlpNsF1z/f2vpudL7V/3IK2fznoU3bnbj4
         yBtWzNDAMggnCtLrX31nRPxj3nJzKCMODGwrocH+CZTVwWKev0EVxbbtrA+ZWxTBpYzU
         s7VRH6fVsHcH3AUR2Tovte7DVYRbz0oRW0ZO6VzeXdXycAkomdGrcawbS0sVQ9nijEWc
         cHezjXFu/Uqhe62hQUjIwvDPNrmN8kCsqnx+ky/sF/X9lDxdhoACrGM1/+cKK9P0rOZ0
         2NJw==
X-Forwarded-Encrypted: i=1; AJvYcCW+7q/hmOy98gD05TBu+FUY6wmvIusJhR8JMJXG3MQsJNvJaszrWgvF6WvBuBFpBuuoC4CScdQFMZUbiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+XFVS2OnWtLNOKnFVrzzmoljHp3f9k73aJEEAn3OWJlnGw8QK
	KfeHGEAwZGCaNZXsZcWvar3e67zsR2XMPEizTsRjKpqR3WmE+Y5CccDlNxrgdER7BbPb7Myd4Pp
	fBk8B970z0hAgYukfW8Qs2UFC31HnYEp2RE/3
X-Google-Smtp-Source: AGHT+IFvkPWDLHQT3Gtx5JJGGOJecwZ7B/rbkd7cgrlXZ9fP+lFzPxCiaYSOPYzYujteUjqgXjdomewJxB+DT79mLAc=
X-Received: by 2002:a2e:a9a6:0:b0:2fb:565a:d93c with SMTP id
 38308e7fff4ca-2fc9d33a85emr9429421fa.1.1729675036276; Wed, 23 Oct 2024
 02:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87a5eysmj1.fsf@mid.deneb.enyo.de> <20241023062417.3862170-1-dvyukov@google.com>
 <8471d7b1-576b-41a6-91fb-1c9baae8c540@redhat.com> <5a3d3bc8-60db-46d0-b689-9aeabcdb8eab@lucifer.local>
 <CACT4Y+ZE9Zco7KaQoT50aooXCHxhz2N_psTAFtT+ZrH14Si7aw@mail.gmail.com> <b1df934e-7012-4523-a513-d3d1536b7f72@suse.cz>
In-Reply-To: <b1df934e-7012-4523-a513-d3d1536b7f72@suse.cz>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 23 Oct 2024 11:17:05 +0200
Message-ID: <CACT4Y+Z=fjoOxn8NY8kYJd2CC1SkmjkmAmqSzJbQiU04G=BEvw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] implement lightweight guard pages
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, fw@deneb.enyo.de, 
	James.Bottomley@hansenpartnership.com, Liam.Howlett@oracle.com, 
	akpm@linux-foundation.org, arnd@arndb.de, brauner@kernel.org, 
	chris@zankel.net, deller@gmx.de, hch@infradead.org, ink@jurassic.park.msu.ru, 
	jannh@google.com, jcmvbkbc@gmail.com, jeffxu@chromium.org, 
	jhubbard@nvidia.com, linux-alpha@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-parisc@vger.kernel.org, mattst88@gmail.com, 
	muchun.song@linux.dev, paulmck@kernel.org, richard.henderson@linaro.org, 
	shuah@kernel.org, sidhartha.kumar@oracle.com, surenb@google.com, 
	tsbogend@alpha.franken.de, willy@infradead.org, elver@google.com, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 11:06, Vlastimil Babka <vbabka@suse.cz> wrote:
>
> On 10/23/24 10:56, Dmitry Vyukov wrote:
> >>
> >> Overall while I sympathise with this, it feels dangerous and a pretty major
> >> change, because there'll be something somewhere that will break because it
> >> expects faults to be swallowed that we no longer do swallow.
> >>
> >> So I'd say it'd be something we should defer, but of course it's a highly
> >> user-facing change so how easy that would be I don't know.
> >>
> >> But I definitely don't think a 'introduce the ability to do cheap PROT_NONE
> >> guards' series is the place to also fundmentally change how user access
> >> page faults are handled within the kernel :)
> >
> > Will delivering signals on kernel access be a backwards compatible
> > change? Or will we need a different API? MADV_GUARD_POISON_KERNEL?
> > It's just somewhat painful to detect/update all userspace if we add
> > this feature in future. Can we say signal delivery on kernel accesses
> > is unspecified?
>
> Would adding signal delivery to guard PTEs only help enough the ASAN etc
> usecase? Wouldn't it be instead possible to add some prctl to opt-in the
> whole ASANized process to deliver all existing segfaults as signals instead
> of -EFAULT ?

ASAN per se does not need this (it does not use page protection).
However, if you mean bug detection tools in general, then, yes, that's
what I had in mind.
There are also things like stack guard pages in libc that would
benefit from that as well.

But I observed that some libraries intentionally use EFAULT to probe
for memory readability, i.e. use some cheap syscall to probe memory
before reading it. So changing behavior globally may not work.
