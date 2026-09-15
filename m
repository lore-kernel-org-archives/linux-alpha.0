Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354294AA3F6
	for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2026 22:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789512919; cv=none; b=rcLngZ0UeMekHA2NehFa5S64wBdWbQyJibasKdAPLqqtBhbFe8UKpMrwmS2vok8tkceEVHYSb4uouEtZ22M7eQO4AilYkkoh3/Csm3LUnOanf095Fby/Ubsk2RMeqv6rzR0ggwy5C+OmqyukL2mYvWCMUGRAOsWUPPFloT7XjRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789512919; c=relaxed/simple;
	bh=ITz7hBythv5OWTbmQ9c4e1mzRPysX2+YTMbCrseTj6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGYo+fPq7jEKjY56gAJDlYnrvmY94wbQ81dMfGMLFsQ5gizK9qf4iMSr37fxQhjgETYxtVSizXneXDfsAFXy+YjJ8mFW5Xka+mqjQdCdiva2kpgYSmVuFx+PrfNhZGpVafgYnNrKICxLIzCUKQyCwrd5ZbLgu8Mb6C1li9naTkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BaFfwi/F; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BaFfwi/F"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so47401666b.3
        for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2026 15:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789512915; x=1790117715; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=BaFfwi/FmC47z34glvbnmfqjmeukTinCdWGIUUARv96HwNtEBsxjAmQILj2WtvkDcs
         RAnt6DOSSDkexGYooog6kRuo74XQFKWR0xPJ8Q3MdpCRUVv//jEECt9T5w0lJzIRTl89
         jINToeDPi+bnBhr33VW6dFtdyczuHmFXwfNu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789512915; x=1790117715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=NrLS/jMsrneL34OMzhf3gYjtSChuqTAU27yh1Q1Iu01erXvDK04KInlsJeqNKTy/lm
         6CwQf6BIOMw0RI7ZILiY0TGk8DzsLMKoF9pRmJwO7UfzvDXY87+1HBplLxxR+RyAWyY0
         6A9bnNiDbtWzVppVuXgQR4K8RNVuiLU/TlQDoEG+ko2/ZvD5hpgymjpbMS5SkqJ0QomR
         y2h9auz9kgaxhcCwiXKV58wKrSBLR674n4oQ6XwDBDB7XKU1i/2irLtGkEg6dzDtnQCC
         s8/DF3XVDNWQl0zrmlENmnjnGean7B486OK31SgZmbsHFUiPqHtc6St1Ct9Ad1OnZRV0
         bRpA==
X-Forwarded-Encrypted: i=1; AKwUvBzUDArSfbrSahAyfCXB5mhokEv0teHjAYCmmUiF4kmnZ86zPp9X7HtDjLx5KakklF2i+/DwBIF6/ttjrA==@vger.kernel.org
X-Gm-Message-State: AFuF++m9ZRTffvupcX8KjEn7skkd25a9HU6kTagzK7eUwtTLxoV9tdgA
	+oV5u/5v1d+AghN38g62oln+Jzx5jFUHjeaNyAkzqTQVnzlkPnDltBjO+RflQCXsis+la5opjz1
	eOlLi1Zy7UQ==
X-Gm-Gg: AYBFou2BdvEGrjDh5r4n4bzDihe+XREo2nW+qHaewWF7IHt3PB1BQLZLYmhcPUh3I0I
	yUr30s9OBFahkcZjhsdIMbMmWVAcJzV14CvXoe1fodqycm2oJ1RGSgVCiDXOOe/LRK/Qr1SzZL6
	jgdyd3yW8I/szswamFM7uzuUu5bMt5PN7Zt4LJPAxXl80LEH/LHHfHeKDoJnB9BCmIV8fleKds/
	YLPlDGqC2iwOZFS4a8VVyiIZBSDIs/jVuEtgpSADtk574MccWRYUzhyqOiAnqyXEcxjaycfVtDG
	2poIr091Q7wKsRmo2+dFHW7oFbP84pij51yL2aG+ekzZrh6oQHZ9ZKrTPbAGtcwQQXdnRBWYtui
	XqsGsvm2cAL4wfJApY0hCxB2GC3yOr+vzMCKrU0cK86zEU4YIkvaiY2oQMOSIJKAmdbhrxLryEu
	iqOgbo/3yWOOxvdyLlvo2i8KINRZiIMKTpgNUguIMsGy9mAzsk6mRhEUAFmvqHtashXVimTAK1Q
	ntk+2hkpRbHCB3N4NpFNt2frgdTWmNHZmi7Peq8vCyzRVUGAKHbTbe1618B
X-Received: by 2002:a17:906:478f:b0:c29:555e:bf2 with SMTP id a640c23a62f3a-c29e5308f0bmr7155866b.41.1789512915472;
        Tue, 15 Sep 2026 15:55:15 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de454d91sm33745566b.19.2026.09.15.15.55.14
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9adea43b6so509032a12.0
        for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzJPY1mnwLtONjmddYG4jX22mEXchcAcris1GYJQlnqv9QfLBEgVB+GgNgUq85WKxgfYrA20Cf3x2Knlw==@vger.kernel.org
X-Received: by 2002:a05:6402:5d1:b0:6a9:a6c0:e5ef with SMTP id
 4fb4d7f45d1cf-6aa2244ef06mr218172a12.37.1789512913950; Tue, 15 Sep 2026
 15:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com> <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
In-Reply-To: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 15:54:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
X-Gm-Features: AcwNN1Wx2MaYDtFtmeOlL6MnzYY7doY_FEPpziKatTBWbLOeKsjmritQ5JuAL3M
Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: rob.clark@oss.qualcomm.com
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 15:21, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> With fd's it is more than just about error rollback.. exposing an fd
> to userspace mid-way thru an ioctl is an easy security bug to write..

That isn't very common code. It's something that is done by a few
strange cases, and yes, those cases should just do it right.

But "those few cases should do it right" does not mean "make a whole
new subsystem for this thing that makes a simple "open" actually be
slower and stranger".

             Linus
