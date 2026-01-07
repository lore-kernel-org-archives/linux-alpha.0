Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822B31A704B
	for <linux-alpha@vger.kernel.org>; Wed,  7 Jan 2026 02:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767754355; cv=none; b=MKORCQ0hichPEQSmLw3NdOaMNlaxsJeRXeDdC7MOkFS+Wfww504CEV2e7+kkubvaT2Qhx3KfcWduj3C/XvIze5wfbnKeuqy5t5Ft/cJE3p1OiIvxFG0LASMU3NM5QkFIrkSHWEsGSf4TuihEiK/Ehn8B83XnIwye6XGZIMG3DUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767754355; c=relaxed/simple;
	bh=H2WSDowZ9Yd/XdfZEyaAlHFGYOxomJFEKMh7vrcocT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9rQPMtnkfQP+zz9TW99HTquVagQOuv3UocDFyGqmLd9Rropf9fgtDIAuuFvsxeRL6acVcDyOJPq+UnnihoqQteSwhxPnG0iFCIYc81VnXLLdiossKpy9pWK+pIoIlYJaKYXzS9geRCNAZkvA37JRbCh48KOt5oe5btGuZ/DoCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dS0MDic6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dS0MDic6"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0d6f647e2so20004025ad.1
        for <linux-alpha@vger.kernel.org>; Tue, 06 Jan 2026 18:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767754354; x=1768359154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yQRPN2bRGk3Fc8VecQayp5kHElaztK+y5PRLikB7fk=;
        b=dS0MDic6Q9J05cuhzL6EXxQUo25JNVSVoOVYu8EaMYYUBfUIcRZAOduAq+3wzN+GWi
         yFR2ekAb5MuOr0Lg9LjstqfQgarmcskUh9y7kjoOHlPs9XcBOQL3dRpsVOqOJKthDHwf
         A+Zyq5E0snoI6ETwHWaleLv5THAvR2EIJiLIPOV/gm5kq4eanPMMj1yZaE9ECRj62/4R
         vHRD893Kqt90F3b77s6kyjjfPpC/4ctXXdabun2+fCWXc6+kdYGgMlRYJLONyp1spYZg
         IkQW5HKyBP54f32KDTbWPfh6aiQdDB/YfDMrpFbPautJ0/ZSIFKfYIqBTJFQ9UFvxYj6
         iXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767754354; x=1768359154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/yQRPN2bRGk3Fc8VecQayp5kHElaztK+y5PRLikB7fk=;
        b=FoNsKVRo3HK2D/ZOgP7DY69KdgBGSh537lTQ/0DBTa8vhFaQ3qCSQhuxF47F4pwiJL
         KGWS+1P92LrkqRUO5E5GzmcLRjmI+1Rd+pzlsp0ivVSfCfvM0LcUvpOvctFfgiKP+P3d
         2AfyUhA+sD/2QSobCs3xB+Iz7AwlBIpt11Vw3vspWF8Bw3NtYlDFCyL0QwtUSUth75pT
         Dl8mRrGBvGWt9yK2vuO5vjzXjmsFY4CkZmLCERQ7kx3FL29uPD1K6lRKuu2k48jMelAK
         51ZK5crynnXivmtWXbZ7mOnHVQli1lSvKr/DHCQ53EBWO85Vb2FS0ZD72UirmEwb6t0J
         cdcA==
X-Forwarded-Encrypted: i=1; AJvYcCVfm/wd+NcFcPrH7RPb7HiC+Vx02H2dPGGh5d7s/BLfC8dBNngO4A6Y2xeOC6gh8hA9kzl68hV+DH+FYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxswv5c2JJub71bjC5fMZjISWwzm6EDi8pMzqaK7VRP+6p+EI7e
	iXPsW9qG6vk699/iuRsCB/f15z6IXrP2ZT23cbYxKB8FfkpfPqSTGcIXa9ScyaEh
X-Gm-Gg: AY/fxX7E3su9gkvatQWC71JJ0fvXj4eW9vZUTNpBtVgdbB/XK+N5hfxOwX4Yi02uasi
	undcqb6aDCeFptMjZqwAbZp8HEeGi37pTsH0oxiAunjgOhxi65CJw1wIVWSWC0ztUmJmckVajoF
	x7gargWjgNdOfOQ8sbaL27rKHIytlwN5trjlzwlkyul1URnbx1wa+kwmIOAViVQ5/oH1XECBSMb
	lLN0nSsmm88EZjASPVNxX0VG18Rd4wvVJMkd1MfCAOCERSCyjqJCYa5KEodgusWU9V8PqjlaVWA
	o1Ho/o3gOA8nARAF23wDKc0DT/7AFIoMyX7a+JAMaRwkXLcFzyV6iBuDoCJijTAyDbxBAvM1oN8
	fHgZhjOLgaD7QCRW7k/mfQpVeRmkKKy3NtjW9LyC7m9xEWyU2m0GdqZa5zf0HHeqHzd+KiD84pr
	2DQ2yq82mLDnrl8rgofXILCq1W5japv5QusSRMwdXao0l+TT2VPoGdoGXuBDK77opHTzdCwD+qT
	QwS4czFkk0ahz4=
X-Google-Smtp-Source: AGHT+IG5ln7HBmFkYUtgtCJWbHsit4QUg+m7/QlpcPikX3dXSHbBBf5OWyElnQmQUiI/+hz/5+QSXw==
X-Received: by 2002:a05:6214:590f:b0:890:2df9:c6a3 with SMTP id 6a1803df08f44-890842a264bmr12754276d6.50.1767748105800;
        Tue, 06 Jan 2026 17:08:25 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772346f8sm24105326d6.35.2026.01.06.17.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 17:08:25 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 81DA5F40068;
	Tue,  6 Jan 2026 20:08:24 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 06 Jan 2026 20:08:24 -0500
X-ME-Sender: <xms:CLJdad6yFd4A4SYS7HRq3AX_2t4vwARcYtnzkYULI0Q6RZEWrXA5dw>
    <xme:CLJdaW2yxe8cFxXbBevKWnpOTk5okqtJ488BEjNFkIZfsubfPBNLHedM91nuDnCpa
    _Lor5ns-hZIagmtrBODTYqyOYSlUr1AU-VfmEzVPUIMe0_VBC8A8eA>
X-ME-Received: <xmr:CLJdaXgDiFVsHGf2kB7EmEeO7fri4d-JS1CNBfT1yWhPp2V440ReWFp5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddujeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdeh
    tdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    peefvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhhuhgssggrrhgusehnvh
    hiughirgdrtghomhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtgho
    mhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegrrd
    hhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhujhhithgrrdht
    ohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtthhopehlhihuuggvsehrvgguhh
    grthdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhhitghhrg
    hrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:CLJdaRj6dhDVq8lxTc8HuDnERZb0ZcrKm75Ob5ByOTBCMMbT-xt8-w>
    <xmx:CLJdaTIi709hg2yhV8aB01YgGZ0-cshTZTMwVvNA6j5bcIDTXjSbWg>
    <xmx:CLJdaRhjE2LrxMqGD0j71yzr6022CSN7H5VH_V8JVg8dgxEh4cPfnw>
    <xmx:CLJdaXRCQvODOvo4irJon2oa1PJOB3MEAv3Bx2i8VY_lhxuGZqT5IQ>
    <xmx:CLJdaWY-ekMv9Tn3KnxmEGKAGEkIvGzwbd-tjpW-Bc2jbiPOwT55pxku>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jan 2026 20:08:23 -0500 (EST)
Date: Wed, 7 Jan 2026 09:08:21 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>, lyude@redhat.com,
	will@kernel.org, peterz@infradead.org, richard.henderson@linaro.org,
	mattst88@gmail.com, linmag7@gmail.com, catalin.marinas@arm.com,
	ojeda@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org,
	tmgross@umich.edu, dakr@kernel.org, mark.rutland@arm.com,
	frederic@kernel.org, tglx@linutronix.de, anna-maria@linutronix.de,
	jstultz@google.com, sboyd@kernel.org, viro@zeniv.linux.org.uk,
	brauner@kernel.org, jack@suse.cz, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of read_volatile
Message-ID: <aV2yBUW7W_dytCUG@tardis-2.local>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231-rwonce-v1-4-702a10b85278@google.com>
 <20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
 <L2dmGLLYJbusZn9axfRubM0hIOSTuny2cW3uyUhOVGvck7lQxTzDe0Xxf8Hw2cLxICT8kdmNAE74e-LV7YrReg==@protonmail.internalid>
 <20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
 <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
 <20260106152300.7fec3847.gary@garyguo.net>
 <aV1XxWbXwkdM_AdA@google.com>
 <4f3f87ad-62f0-4557-8371-123a2306f573@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f3f87ad-62f0-4557-8371-123a2306f573@nvidia.com>

On Tue, Jan 06, 2026 at 04:47:35PM -0800, John Hubbard wrote:
> On 1/6/26 10:43 AM, Alice Ryhl wrote:
> > On Tue, Jan 06, 2026 at 03:23:00PM +0000, Gary Guo wrote:
> >> On Tue, 06 Jan 2026 13:37:34 +0100
> >> Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >>
> >>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> >>>>
> >>>> Sorry, of course this should be:
> >>>>
> >>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
> >>>> +{
> >>>> +	return hrtimer_get_expires(timer);
> >>>> +}
> >>>>  
> >>>
> >>> This is a potentially racy read. As far as I recall, we determined that
> >>> using read_once is the proper way to handle the situation.
> >>>
> >>> I do not think it makes a difference that the read is done by C code.
> >>
> >> If that's the case I think the C code should be fixed by inserting the
> >> READ_ONCE?
> > 
> > I maintain my position that if this is what you recommend C code does,
> > it's confusing to not make the same recommendation for Rust abstractions
> > to the same thing.
> > 
> > After all, nothing is stopping you from calling atomic_read() in C too.
> > 
> 
> Hi Alice and everyone!
> 
> I'm having trouble fully understanding the latest reply, so maybe what
> I'm saying is actually what you just said.
> 
> Anyway, we should use READ_ONCE in both the C and Rust code. Relying
> on the compiler for that is no longer OK. We shouldn't be shy about
> fixing the C side (not that I think you have been, so far!).
> 

Agreed on most of it, except that we should be more explicit in Rust,
by using atomic_load[1] instead of READ_ONCE().

[1]: https://lore.kernel.org/rust-for-linux/aV0FxCRzXFrNLZik@tardis-2.local/

Regards,
Boqun

> thanks,
> -- 
> John Hubbard
> 
