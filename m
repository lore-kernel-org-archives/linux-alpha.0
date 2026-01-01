Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C93623D7F4
	for <linux-alpha@vger.kernel.org>; Thu,  1 Jan 2026 00:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767228827; cv=none; b=Lmn0S+kE0QOsGEBsQ/MtjAtg+jJdnqgesJTOIl+kdReiytAN6ka9Vek7Shqlw944clf5cno8IVaVw6pG8CasUizKa8IOmnLYVYqeRSTE6BGA7XTYKVwIOg1kIHaE2V/irRx/C6YfanYG6XCASnpY5GQUPvMPzmOVXy0tfVwZNgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767228827; c=relaxed/simple;
	bh=FJxmCTvLM25zFfWpcNP5yBD/9nFfmtlGgUOBfBuzQiM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lo+mIzhp9DcJP6aDWfyDBMp/aelNyJA5kRrvnbpo0vH6bEoQ7/xHDrSepSfvr/ZK93LHMEO9yG9jJrLu0I8cAcvsnjKou22xyJMzjti/n/0CGdTQbeYrR6pphBhO3fdU2u2Y7JGjbhkiMcLgDtcGzrBdTZ4qN9DlpTGI2JZGC6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iJvmc6iA; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iJvmc6iA"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b7ff8a27466so1281302066b.3
        for <linux-alpha@vger.kernel.org>; Wed, 31 Dec 2025 16:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767228821; x=1767833621; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ALybukQ368MxKZuRBiA6l9FsoHeskqo5LiIi7UTqkwI=;
        b=iJvmc6iAlq+AGWwQlMfFpUv590zRrBmK9KHqa/L+nel4mOmog6irZk1MSKC7Z2r19y
         rT8zEbz4u7YdtSJkKJcmltsqALqK+hrSYeB7E48uQM8gugOrXeCxGhousoIe5uyCxnQZ
         2+YwvXiL1iRtvRt2RBjS3JfLHtn97je52gO5gazY1dQvKNsvphb6H9qD0UKtUnHcGJsQ
         md1zNznurxGuorqpsB21pNxmyx84nhAiTnDOQcP8TdUkSZN6IZt/RUV2iu0UjrUXB61V
         DsZYu+AG9Jb4apwuHJa8OznjSivAOVrbOZgEm96FRa1/ptCViI4sdMnn4j9y/3EJyl5o
         CxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767228821; x=1767833621;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALybukQ368MxKZuRBiA6l9FsoHeskqo5LiIi7UTqkwI=;
        b=mOH0ePzqltXXMsFLhLt7FUEvGeG8w91CKGLeOhn4wayA61y1PphbNlbVjFRE1mJRJH
         4iEGWVP+cQ9fn7YK6R0V6/igThi4wfImRgVHE2BWtxEL/HF2VY7Ts3+kRrn0dZD51lsX
         CXN5Ysnyhzu6Wnm+A2mLCRQmKLMzyyJy04rXmpe3HHluTQG5nE4TjxbyUJlNQ5Z//cvF
         TkCvdyTeWXMGVgtl22ynxmUZw0vOCCselgyGKBC74VseQAZLodZ7xnyt8OFm7gmGuBQz
         KuIuiTxbDtO3f7KdZ5ty6NbOz5ZR23ib84Xzg/roUlaxL1VJy039vEhZrK+weeCNOdQW
         YD7A==
X-Forwarded-Encrypted: i=1; AJvYcCUfESRn757BXH2n0deBRfJ2X0xonwlzNSM+aejF9dt+/w3Si+eQyCshDHIoSxWCZgqCvII0MZWHD+vvlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuuPV7/wxQ1ttfIF2i95363XkRZTmP+JQZ3ZCkm6wqkEmxF4DB
	g6qGIXBXkhzTTU3RpcCXAzfgsJ+L6kZacYPWhe9nd7pHoOGFtlkLE4XilipfQP+vCJyQAZ6cVWB
	Cw/kZ9X8ZqGqe752yhQ==
X-Google-Smtp-Source: AGHT+IEWmy8RAXCgqnhUehDWXxrrCi36bifjxhWe3kp7T+r3sxEL7vClkSWEcaAst8kVOoT68CYG7PpgofIxyHk=
X-Received: from ejcul5.prod.google.com ([2002:a17:907:ca85:b0:b7f:fed7:3bc2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f23:b0:b76:6020:ed2b with SMTP id a640c23a62f3a-b80371970a2mr3724571266b.45.1767228820647;
 Wed, 31 Dec 2025 16:53:40 -0800 (PST)
Date: Thu, 1 Jan 2026 00:53:39 +0000
In-Reply-To: <20251231151216.23446b64.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251231-rwonce-v1-0-702a10b85278@google.com> <20251231151216.23446b64.gary@garyguo.net>
Message-ID: <aVXFk0L-FegoVJpC@google.com>
Subject: Re: [PATCH 0/5] Add READ_ONCE and WRITE_ONCE to Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, 
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

On Wed, Dec 31, 2025 at 03:12:16PM +0000, Gary Guo wrote:
> On Wed, 31 Dec 2025 12:22:24 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > There are currently a few places in the kernel where we use volatile
> > reads when we really should be using `READ_ONCE`. To make it possible to
> > replace these with proper `READ_ONCE` calls, introduce a Rust version of
> > `READ_ONCE`.
> > 
> > A new config option CONFIG_ARCH_USE_CUSTOM_READ_ONCE is introduced so
> > that Rust is able to use conditional compilation to implement READ_ONCE
> > in terms of either a volatile read, or by calling into a C helper
> > function, depending on the architecture.
> > 
> > This series is intended to be merged through ATOMIC INFRASTRUCTURE.
> 
> Hi Alice,
> 
> I would prefer not to expose the READ_ONCE/WRITE_ONCE functions, at
> least not with their atomic semantics.
> 
> Both callsites that you have converted should be using
> 
> 	Atomic::from_ptr().load(Relaxed)
> 
> Please refer to the documentation of `Atomic` about this. Fujita has a
> series that expand the type to u8/u16 if you need narrower accesses.

Why? If we say that we're using the LKMM, then it seems confusing to not
have a READ_ONCE() for cases where we interact with C code, and that C
code documents that READ_ONCE() should be used.

Alice
