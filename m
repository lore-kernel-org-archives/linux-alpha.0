Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7DB34AB1C
	for <linux-alpha@vger.kernel.org>; Wed, 21 Jan 2026 02:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962967; cv=none; b=rOhwm/OVykfrYUYon48w6Me7rPjXlEBI+5Fgsbmkm4kVEjoSNULasAyHjOUpImpLhIBouiApbJeZl8KDjcELL3D0v+SxgXW+2rBTGvKP6lMH/A0XhD2UxDxcRWOW3Ri7+5Rp0UF0uxis8Lv+53WqkjiZ9LqDGicjGp3io4kDZhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962967; c=relaxed/simple;
	bh=YycTiJrPuZ50XWbU+aKf4d35PZCgfYUN6bofn1fuMIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ll5vGsxvTqhO5AsNdVSX4ZvK+l+nprzL08ZMBcuxOPdh71mCZCUjsQ9tQLcUlkuThgRZZulvJUWsGu6PVCopidVKR8SlVqgr00ZjjKiEZO/srU4ff/IlS4vqVa6veEBqJXzvi3dq2+htnSkZo99rLjAZakEWbZbRTOhv9I0M/O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFG7GbaX; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFG7GbaX"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50150bc7731so91131961cf.1
        for <linux-alpha@vger.kernel.org>; Tue, 20 Jan 2026 18:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768962965; x=1769567765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SYWzQFciEmh1FoU8deqlPVu+NRiIm4WLmRuTDTk8Qc=;
        b=JFG7GbaXUsu+XpBda6ejQwKkgpItAodncz0FgMIQ5Him6P8tGfTXFXddNEJE2BdUee
         soewo8BZOnZTd6O+Qt6NsKau+wdq4r4mbAC3RDr/2cxHcsotWu2S6YTvskrHL8dYdG8H
         +AnkSBOlkjh+NR7TI4l3nwBziS9Fr8khZqRaHLK6UNYl88wDfQ7FdYuI45m3YaWEe64s
         hlBSU1j8TemTdLtLQPhJ+X/fS3PnaOq9trNQ5BKmwVAi5zJMAa1Dl0LLtzZzzwn6eU2S
         pYDcuDnHJRXcjw2/QhZOLl0Gatsq1rqy03sUPHafnYskTWr3jh3t9z/JrajuoafWzraf
         jqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768962965; x=1769567765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/SYWzQFciEmh1FoU8deqlPVu+NRiIm4WLmRuTDTk8Qc=;
        b=CKLfH2DHxd+JMEUDx1s7EBYhlKbyLJmU0DSJAqPEJS3aUIFR7KW6094zy88eGbx/FS
         gVN8gTQW1u9UmKJFh5iOkZmJYcKGrgxJKRCpeCSb2GjcSBxE1ZR5xJcR4EHpyAK/pQpR
         XT0EGi8j7DHhuTz9W1oTITY2BPdYZPkwlyO22LySQrF0gN2pARbTvs/gZllJi73Dc94t
         Mj2oZz8a9DDac15FjoC4zpCsYyvQUu+zD3TuDvZzhaSo/kdzB88hQUjz9cua118PhIYR
         W6UWj5+IGDxId5ldGGfUUdmYmSu44HhtjKhK2kgl4C8OSuvZ5pvTjU69rhRfIOyp+Ifr
         mLzw==
X-Forwarded-Encrypted: i=1; AJvYcCVIPbD3yt+GxHK5VTem2elNufHPOEzJWgVWtWoQFhxSARL6pfcGgfKZLxtjKHYht72ksHlI+KmKr/nYnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Ril3Tu1lkqs9mMzqAKZeNFJP1JDpIm1XUiTbjycJjaHvfdMR
	WNUNFs5NkMs9pLR4ScO8BDot0nox6f4pj7Tj8Q2zxXf74mNufSlunydrWOW5pGEZ
X-Gm-Gg: AZuq6aIEwd49Qffd5TwzILU5Eox8+X/aKll43BJmOQ+j3UIY/eY9knGKBiGNb69zaqb
	6SiqhyZs3MSdc0LYY/lo3pWqpNr0CRE5EN49RXQ4mJwKHB5AH2jRIcYolyAwRalOu8u0qh6/1YK
	+XliRgyERLoSY/PQm/x5DrjYPC4wKFZrODY4H1T1FeQW08Yvcdqdnq0cq/YroNvJFWBtLHeTaaZ
	ez8Vu58AZD0g/ku2qrRBihMosjd1nwQ74pmlOAsLTjnqgNQNx6aDSeGCmy5bsUe5+8fwR3KzG7N
	vheTLiOl//NkSFbVuu3P1YH9Jaf0ZpIIPLARBIlrhDQfRM5BCIkNK9RavozW1S5Zfg8M9W1ELd2
	Njn8cpGOgldbFsKZAoFuzmxg1Pf2ZIgzdCOQTlyGcpu/zKHOkR9fhWdbvUPbcirncWsMnSC/9HM
	BtlRDnkAUwaIVQvS1yskpccJdgmFMMYLvkRDqH2XAxWR7ybH7rS8i8bwTmuP/XVH2k804z1F9yk
	G2muiwRnyYttHM=
X-Received: by 2002:ac8:5e11:0:b0:4f4:d298:b47c with SMTP id d75a77b69052e-502a1e07becmr238961631cf.28.1768956457813;
        Tue, 20 Jan 2026 16:47:37 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7269277sm1143950785a.43.2026.01.20.16.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 16:47:37 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9A38FF40070;
	Tue, 20 Jan 2026 19:47:35 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 20 Jan 2026 19:47:35 -0500
X-ME-Sender: <xms:JyJwaYlxHCp2CJ9XJSkRGaNnnIfTr2CPMTk66aaLjJ8NL6geKbHEUw>
    <xme:JyJwaRhQ9tHsguPZdsm-gbfKNoOqdj5C8VQgEuisf9r5GzaMoP2vysuiFdK_z8pcP
    CA7y6EHL1cipec_t9rcLTiDCO2FTJ6nC5Bj3OiUnyymky8qMw>
X-ME-Received: <xmr:JyJwaV_rVlfR2KnChLT6z56C5W8d7hPExZS6zuXoB_umworfTbmKYIBO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedukeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepfedupdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifih
    hllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggv
    rggurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinh
    grrhhordhorhhgpdhrtghpthhtohepmhgrthhtshhtkeeksehgmhgrihhlrdgtohhmpdhr
    tghpthhtoheplhhinhhmrghgjeesghhmrghilhdrtghomhdprhgtphhtthhopegtrghtrg
    hlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:JyJwacqvDrVFqbB_v4DJpp2xCk2xPwPBG4Rn1gtnHnXEeTrMnP9C3w>
    <xmx:JyJwabOpMOAo0DJprIqW5L36k5blht_hBf_QHlx2Zajjf827IyzHMQ>
    <xmx:JyJwaYS3LHXmxS1ssanGpUtdI6D3bsmNrDFB6F0TIJxUOa-6eu6UrQ>
    <xmx:JyJwaY8YbtMT8-V977xDI_zpwzJy6oddKb6ufhLgJ-XTerrF5SxqaQ>
    <xmx:JyJwacoE8g49BcHFirTruH_zNcwaBTLPwisaymIERtlin-fIU4ZLuRjF>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jan 2026 19:47:34 -0500 (EST)
Date: Wed, 21 Jan 2026 08:47:32 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,	Magnus Lindholm <linmag7@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
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
Subject: Re: [PATCH 5/5] rust: fs: use READ_ONCE instead of read_volatile
Message-ID: <aXAiJPPrlzNld3Mu@tardis-2.local>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231-rwonce-v1-5-702a10b85278@google.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231-rwonce-v1-5-702a10b85278@google.com>

On Wed, Dec 31, 2025 at 12:22:29PM +0000, Alice Ryhl wrote:
> Using `READ_ONCE` is the correct way to read the `f_flags` field.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/fs/file.rs | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
> index 23ee689bd2400565223181645157d832a836589f..6b07f08e7012f512e53743266096ce0076d29e1c 100644
> --- a/rust/kernel/fs/file.rs
> +++ b/rust/kernel/fs/file.rs
> @@ -335,12 +335,8 @@ pub fn cred(&self) -> &Credential {
>      /// The flags are a combination of the constants in [`flags`].
>      #[inline]
>      pub fn flags(&self) -> u32 {
> -        // This `read_volatile` is intended to correspond to a READ_ONCE call.
> -        //
> -        // SAFETY: The file is valid because the shared reference guarantees a nonzero refcount.
> -        //
> -        // FIXME(read_once): Replace with `read_once` when available on the Rust side.
> -        unsafe { core::ptr::addr_of!((*self.as_ptr()).f_flags).read_volatile() }
> +        // SAFETY: The `f_flags` field of `struct file` is readable with `READ_ONCE`.
> +        unsafe { kernel::sync::READ_ONCE(&raw const (*self.as_ptr()).f_flags) }

Not a question directly to this patch, but for FS folks: I see we read
and write `f_flags` normally (i.e. without *_ONCE() or any atomic), and
I don't see any synchronization between these read and write (maybe I'm
missing something?), if read and write can happen at the same time, it's
data race. So I assume we must have some assumption on the atomicity of
these accesses to `f_flags`, could you may share or confirm this? Thanks

Regards,
Boqun

>      }
>  }
>  
> 
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 
