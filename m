Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C99225EF87
	for <linux-alpha@vger.kernel.org>; Thu,  1 Jan 2026 01:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767230024; cv=none; b=qZ83kER4VQUR0S31eal0QHfsoAebH83zjlT8W9wx+eyUCTceLjQOPNaN4xkLSJhJmGQ6l1jvrFZiysDUvSnIm9/V+C+x4ZnNLfrQQM925asggnmU4SAf+vP6Gm1WtgR/GqrUWVb0tEaRr6+LlADFgtf+4X5NZ8qJPcdAfCodvlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767230024; c=relaxed/simple;
	bh=WW9T6v83YpHrdRU6GxDyOasG1bC9q4PJavZbqVhfXcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjBnzgoIFutHz1lU6ZMQjTKjPtkk0mLzd9VpE/dYn7AGRTrJnLjvWLi/y+fGGLvQEQnBngiS1P1YOrYykibzC1PVdcx+gco/lK7wTZew9+wqVxaFCejcA9WveB5pQI4WU9UVUMPjtlPgN0As7tSLYk5OVOEHH+Zziv8U1g7I+LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9cdXSKs; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9cdXSKs"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ee05b2b1beso123260211cf.2
        for <linux-alpha@vger.kernel.org>; Wed, 31 Dec 2025 17:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767230022; x=1767834822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrjRP9q8c0tglfIoe+XxWLIY8X9nzFBO0FXW5gpQW5g=;
        b=d9cdXSKsyXys4TH9A/im43O8vTr1JMNwjD3BQoEyqz0w27o2T4KBXY40DPOYIwCnr7
         xt8hspRhtt7vmhioknSbw8uZhGM5L7P5LC0kj7YoqATfjDG2v8px/0tD8atxQoZvoEaX
         pF5HlLcoT+bUd9pUruVUtubGGVwtRpKpLHZcD4IoTFcus2WelSOepVom2i8BIG4aELOj
         uduQAe0tIdPGfaLkGEOkS4JUki2cf98vtAKOT6EB37/I+B5EliUgAxTm8BSX5W17rnBK
         6aFm0go7pC4qbaYo4ph9GV1luuAfZJzdh4t0MapZSHNB2ncn+NEDh+Am3B5+mAlr08Lu
         TlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767230022; x=1767834822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IrjRP9q8c0tglfIoe+XxWLIY8X9nzFBO0FXW5gpQW5g=;
        b=Zjv5nV1UGFKzGP4myqdHvqNQZY6kzR7rQ6C5+PiPGZH6Zt3cH6+Vb3rwP1CSeWJqBw
         4/7vDcchiKMRIbU8fa9XaXCinSCdo/xlMX/hPmYltTJa0SHdnJQFRh1j5a0lAhRnuAEh
         ISIah/FYXyRR9Q/DuN1Lnm6aFGnwhHLrL2/I+RbBmZxMTyLIIRS3Maqdb7770eBJ2uxS
         aTMOG2E+37K/WvGw0uFdRonPbRIxYOx5QeFmTO70zHKZZcW2YtaqTldEEbgBERcK8+FE
         AfQgNR2rMeYmOfEBk9/esPfQJkJ5TiCQQZrBdnxMgLcCFnpHJGFi1RaXExsxFgHwGq4F
         tlcw==
X-Forwarded-Encrypted: i=1; AJvYcCW6b2imFjxOBjVgxlWciUVkfZAOTIrDmmDNVKICKqGJJlANtgX0D/1dvXSm5TWg9Qf3Fi/JmJOV69x98w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwV4beAHha4KjqAFaoq3hdAIlwAvV+n4yB7y8th5xLbK3Rus/h+
	/Fph8h2e42KBxXA55sgQAa6c0jqyhgxD0MK/BKzZlFBeSHzYgBFidy0C
X-Gm-Gg: AY/fxX5JfOBoe2a6MPmgHeb9VvxQH5y6bLpwKmJRWlwpmee9zWSQIDkDwU6x3yYuyfe
	Ip2zjuAuy76zPNqnLWGG+wpKkuMVGCn5egMN+olvEwvv9tZz50ubNjjayAGkakzBh4RWZcfG88A
	cxGumOKJZPGS8MkmMo5hO/aLkpJhA8vvEWwz4NLzJ36iUDjO3+uu7rrqTmAhE0yMJMnZG15Jdil
	o7nkClP6adZndXLr7XFrTTHjotHKXi1Qo8sBkCZJPH0o7F2DWgpCRy/nM+sinEbftVE74NZ3OZa
	qCIEj6S2X+U7LcoNmICMd8sUwpMIXRrz5XVVDaQx9wTiJPSHcujhSjqlTT9tcQko1eqhluGHE4k
	+bQbUXROWBsrPygQyU4/bYglv/3DAguchptnZNjuMjzIWZQS+w0AnO8CnRRkXrIRejNF/jjOl8P
	uR8mBF7wsvvQFqAYR0snM3CDFdNfzSgtUVED7oJyFEVYDluQ0CihDmUlikmZN/m4irtXh0G3qHL
	osU1srp+xSnQLY=
X-Google-Smtp-Source: AGHT+IGqbWQCQzh9nbyhwAaF7d7/2+0PkqXfRpFE3/XyT4YpnYVUp5bmjdZmquhjJvald9WQ52Pa+Q==
X-Received: by 2002:a05:622a:4295:b0:4ee:bff:7fbf with SMTP id d75a77b69052e-4f4abcf6ad2mr546707501cf.4.1767230022154;
        Wed, 31 Dec 2025 17:13:42 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac65344bsm270256121cf.28.2025.12.31.17.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 17:13:41 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id E4468F40068;
	Wed, 31 Dec 2025 20:13:40 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 31 Dec 2025 20:13:40 -0500
X-ME-Sender: <xms:RMpVadPHBw4HBWMphwZq1pgT5fJC3CPbmHQdu9lumn0k_7tYA_K5Zw>
    <xme:RMpVaebD7MRte1FUx824DzyNRDhFHHs5jKY1c49B8N_xNeevq0B9BQWiJqISO_B39
    gw_jYgNYPWjNbzD3VMqTucRL2adjXPXpe_QWRduAlkODRVoIHm-JQ>
X-ME-Received: <xmr:RMpVae68p8xT8IdkM28rMzPeCmKXgzEK_Fu8NZtRu9S-Y5HsM8UQOPoHTAc0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekgeegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopeefvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepghgrrh
    ihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehprghulhhmtghksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgu
    rdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdprhgtphhtthhopehmrghtthhsth
    ekkeesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnmhgrghejsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomh
X-ME-Proxy: <xmx:RMpVaVBbBnEmsQiqDEJQI5Vp0m45h3JWVi6J1Pr1FKmD2fDWfoTQfQ>
    <xmx:RMpVad6o7wE9nCfGGPHsTn7JE1D5TdpllKBohOy44er65HeDGb9yTw>
    <xmx:RMpVacLbQ_HpVXpiYbyGWy8IQvxsGN4hN7_-_vbGrAjs-x6Qe3tfAw>
    <xmx:RMpVaZyYzNE9MuelcekvFHC5-yl3HGyzOTwnMf1gpdHCRpnXK7Rjsw>
    <xmx:RMpVaUG0QewaINsxwC5mQQPkaOvDexnwM1B5CSPYFOpTguWdmMUW_fdb>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Dec 2025 20:13:39 -0500 (EST)
Date: Thu, 1 Jan 2026 09:13:35 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,	Magnus Lindholm <linmag7@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,	Danilo Krummrich <dakr@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,	Lyude Paul <lyude@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	rust-for-linux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 0/5] Add READ_ONCE and WRITE_ONCE to Rust
Message-ID: <aVXKP8vQ6uAxtazT@tardis-2.local>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231151216.23446b64.gary@garyguo.net>
 <aVXFk0L-FegoVJpC@google.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVXFk0L-FegoVJpC@google.com>

On Thu, Jan 01, 2026 at 12:53:39AM +0000, Alice Ryhl wrote:
> On Wed, Dec 31, 2025 at 03:12:16PM +0000, Gary Guo wrote:
> > On Wed, 31 Dec 2025 12:22:24 +0000
> > Alice Ryhl <aliceryhl@google.com> wrote:
> > 
> > > There are currently a few places in the kernel where we use volatile
> > > reads when we really should be using `READ_ONCE`. To make it possible to
> > > replace these with proper `READ_ONCE` calls, introduce a Rust version of
> > > `READ_ONCE`.
> > > 
> > > A new config option CONFIG_ARCH_USE_CUSTOM_READ_ONCE is introduced so
> > > that Rust is able to use conditional compilation to implement READ_ONCE
> > > in terms of either a volatile read, or by calling into a C helper
> > > function, depending on the architecture.
> > > 
> > > This series is intended to be merged through ATOMIC INFRASTRUCTURE.
> > 
> > Hi Alice,
> > 
> > I would prefer not to expose the READ_ONCE/WRITE_ONCE functions, at
> > least not with their atomic semantics.
> > 
> > Both callsites that you have converted should be using
> > 
> > 	Atomic::from_ptr().load(Relaxed)
> > 
> > Please refer to the documentation of `Atomic` about this. Fujita has a
> > series that expand the type to u8/u16 if you need narrower accesses.
> 
> Why? If we say that we're using the LKMM, then it seems confusing to not
> have a READ_ONCE() for cases where we interact with C code, and that C
> code documents that READ_ONCE() should be used.
> 

The problem of READ_ONCE() and WRITE_ONCE() is that the semantics is
complicated. Sometimes they are used for atomicity, sometimes they are
used for preventing data race. So yes, we are using LKMM in Rust as
well, but whenever possible, we need to clarify the intentation of the
API, using Atomic::from_ptr().load(Relaxed) helps on that front.

IMO, READ_ONCE()/WRITE_ONCE() is like a "band aid" solution to a few
problems, having it would prevent us from developing a more clear view
for concurrent programming.

Regards,
Boqun

> Alice
