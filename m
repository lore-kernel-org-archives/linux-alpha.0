Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849D4327C0D
	for <linux-alpha@vger.kernel.org>; Tue,  6 Jan 2026 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767703919; cv=none; b=fSRXzCMkZy2w28OJlYm4vgoMcw/9bbtBmO1rg1ZfnwHg9OsnyJvEEp4gusn9SopnYiENFMP2i4SwUPW7Pm3oqxM9IW3B4UhCmEHibkPE504XdPB5ZqNb9bT4Bhh5vbWxDsXLNcPsJaVvm2G/0gMNPlJ6ee9GxnqkFQcsUkmlmxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767703919; c=relaxed/simple;
	bh=prs8gjC2tzQBgqWci4QgTu9k1r1bYO7lE9IU/Kn/OR8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kt44ZhJbnwuTv5Jf2eN/6+fVSFmCPh7/ovDp5uV7BeP9aACGCNNjmt8Fa3fLbLZgPQut71u8JhkJvjnlU1n0n88N5GMIiBcT6Uq358wzSO87n+yYLq7xQlzRuXW6v8u1pyLLQ7Gt1hCkKrW4VhlSgbS1a+TUeb10mPrujMzANV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fizkw4Tf; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fizkw4Tf"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47d5c7a2f54so12358965e9.1
        for <linux-alpha@vger.kernel.org>; Tue, 06 Jan 2026 04:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767703913; x=1768308713; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xsT4usbspAuLjRoX9Zvkc98UvH2b0yQkPaftYv84D4o=;
        b=Fizkw4TfO8DkUgXaEy5Z44XrUthoVvTzG3bEkW2urFvzIRT5voN1trNEVcSr0eArr9
         Pyp4JaaEyqA9TI+LAQHkJbJ9SqfKDvh7E+WucKOMldj4lyRZ/g3nfEvn4AiSqWaIOpV9
         L5dTnTZ17P8AGyAJpibdSTYcuD5b2F3ZPTiWV88aZuUtQaWiXs1SEJimXw4jQ6xy4yX0
         /hejb+6SyLO2wItJwZjtgYcsAZFXi3fzQ9DLmxrLa6+uWaVo7g3FdjeYQS40wTX42yv8
         F6HOCFEyjTuFFm5zC1MNzR2CJcf6iapL+wcF8x5ExbGfnol1UKpyBOkO/f4733jBshHQ
         JeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767703913; x=1768308713;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xsT4usbspAuLjRoX9Zvkc98UvH2b0yQkPaftYv84D4o=;
        b=nT9J/+2TupiYZ5Yd39U1alaIpgnio3AXXd0JbfJAhhwpi6pfOkSE98BdRekpwNIMGW
         ATv5DbzWI9ly0iLY5L5614oW5l3S6D6aKHmWcB12TaL8CJYXHgSjkbeRuVB/a0g4V6cO
         ljTICE9AJclQXIbwlRa9wAUFdKdVu4wbG6qOspeuKE7JpSWSHThN4VQvC74wXfYaG1sV
         La2Jaef5b/B7PNviTraG3K9toyLuqToL0LGZZc7SyeiaUf1eGz1sJ4bgo2ffePOXpb9D
         APNexnFZ4XuzxDS6qRwfgYYnQjikmxLY9jPXSUNKrPM3SLyPnnNT1J/7jq7dx3C8U8eg
         fueA==
X-Forwarded-Encrypted: i=1; AJvYcCWYMH0e1JziXobvmfO3ZR6L9ykHQQd83F+iNP1AxYuo3oGWhYR6gdWKcyClkcMhGnpp1SQdjEk2cF5lQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHw1E4KAwVf6KLnyZmg4/fqeWeb9iKSOrnY4yiz7f1bf2u/6y1
	rF4w2ty/F90g1wvLuwXs2eX1IinVS1U+zEEKn1p0pZfC16sS0BLl4SyvaTXzi6avP7D1l9D4eka
	q7BqQFRt5ORno4B4tZg==
X-Google-Smtp-Source: AGHT+IG3HimmS8tgW4GY2wron0bO12GBXSVrxQ4BKNHos90Wwn9m7SbT5K/3H7Ao0w4qXUIF0pRAaTdapSCG7vU=
X-Received: from wmv18.prod.google.com ([2002:a05:600c:26d2:b0:475:dadb:c8f2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:81ca:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-47d7f41069bmr28735145e9.6.1767703913011;
 Tue, 06 Jan 2026 04:51:53 -0800 (PST)
Date: Tue, 6 Jan 2026 12:51:52 +0000
In-Reply-To: <20260106124326.GY3707891@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251231-rwonce-v1-0-702a10b85278@google.com> <20251231-rwonce-v1-3-702a10b85278@google.com>
 <20260106124326.GY3707891@noisy.programming.kicks-ass.net>
Message-ID: <aV0FaEjA7fe3NPAX@google.com>
Subject: Re: [PATCH 3/5] rust: sync: support using bool with READ_ONCE
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jan 06, 2026 at 01:43:26PM +0100, Peter Zijlstra wrote:
> On Wed, Dec 31, 2025 at 12:22:27PM +0000, Alice Ryhl wrote:
> > +/// Read an integer as a boolean once.
> > +///
> > +/// Returns `true` if the value behind the pointer is non-zero. Otherwise returns `false`.
> > +///
> > +/// # Safety
> > +///
> > +/// It must be safe to `READ_ONCE` the `ptr` with type `u8`.
> > +#[inline(always)]
> > +#[track_caller]
> > +unsafe fn read_once_bool(ptr: *const bool) -> bool {
> > +    // Implement `read_once_bool` in terms of `read_once_1`. The arch-specific logic is inside
> > +    // of `read_once_1`.
> > +    //
> > +    // SAFETY: It is safe to `READ_ONCE` the `ptr` with type `u8`.
> > +    let byte = unsafe { read_once_1(ptr.cast::<u8>()) };
> > +    byte != 0u8
> > +}
> 
> Does this hardcode that sizeof(_Bool) == 1? There are ABIs where this is
> not the case.

Hm, it hardcodes that the Rust type called bool is sizeof(_) == 1.
Presumably bindgen will not translate _Bool to bool when it appears in C
types on such platforms. But I don't really know - I have not looked
into this case.

Alice
