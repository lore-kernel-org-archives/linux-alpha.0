Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E0D413791
	for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2026 16:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488173; cv=none; b=haJ6Bub/FiSw/iTr91LLqatekKLGUohoki38R9XGe/TMTOsEMrzoZtnyfyOHFgAmgtcyeVYUjsW6LTZqCdjqHneL3Q5fJLVJcq393ZefX/d5QpFeZJb156tSQh5GYhQ5/mRgd2jC6nnBDFABKcgvUviiflG1YPU9+5YqWbomcWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488173; c=relaxed/simple;
	bh=TaD3IKHcoZf0PQ+wUUh3mHvOgYZf6uXYuUZRFHNcE+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQ8TgDXGal2I/32dEWR4T4Nua0yI1MhcYsqUelFSQuBo63IVDRp6rXZ182yuDwXs1r9ZAV1PNTHTwr+PtnckffOctOXUKwIirV/TNq83v5m1VQTYA4W5ycKtqx4zh4ajcMr6emjSDUW5JjrhvWleZXM5R86zteoSxsIbS0u9LXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BFXUvnb1; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BFXUvnb1"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c264788fd58so553976966b.1
        for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2026 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789488168; x=1790092968; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=BFXUvnb1JnJx+yuqE+j5wfSl2ZM8MiW4xh1e5xG66mN4x4NUif6uaoe3Ufy/2FTMhP
         08Snb5/KOn2uSnVgBzlCVZuYFyrrS5hk3U5SooA8DWoGumB2s8a20cGbW4GErVK8aVmh
         vQH4rhSbo67FBZvj0mY4M1GfjAlLgVbCm92cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488168; x=1790092968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=wknnw15EWK8wQW8GH7BMkiSrMSOoG4SQpaVn1KfMqof8YRVig6vtXk7JY1eMf7fDPh
         4riUaGvg23uhBoA3Abx6ou7XEbHne1cmaa9leiXq8Nu7vVXWpmgzgGWabOFGod6TErDZ
         nfLdZ5IClif3xUNaKxuNec2gChlenTo1XyCKpBiA9Dvu4Xu7TCRh+8TYFu1H3YN5YZWr
         p5QItPBstqBD1zTeeoHcD3EBoXlNhGn3fzG6taK/47/wgaahwNaCnX50TEGbWxsMtdlb
         JI+YrECA1hmmpB7vJpczrXts1OyBntnC7T74ivXAPmpVAA8BLXIWPXbWIlic5PC8WLmc
         2PCg==
X-Forwarded-Encrypted: i=1; AKwUvBzwXQjK5qUGXqvS5xSlmr9iIjYTgEue5h7eibUdt9MWXKVUQ4js4ljSM6RX9zlFG0GlgTDKLk1yAxXteA==@vger.kernel.org
X-Gm-Message-State: AFuF++k2mINyn9v0u/8p32aB1+ZZnSH2zIIUdflOHnkvEvPaJGs0fCGJ
	WKoPxMxhTjGCk8YQ0KP/dNGOE1AkXDExJ//kumbZXRsK5aZLvVWdymQGQJBBFsMQGGeEs6dagiz
	3gynRN8A=
X-Gm-Gg: AYBFou3bzdK83/OUYlemYZkpmcJ+47RtW8TEq0aW7uxQmJV6ptMBh31NWn5pKiPXosj
	c80QX93/ZnDKcqgbbf6qAHWH7y5bypPvQILvpDKzc+s/P16voZoD0K8TfcjbLAJNr6ZJWcqDOe9
	dUdV89JQOratrgtnOB2oHw/cKOFWYWTFrVaWJ+x0C9cgLSce5uvRT/cJSDugiJR0GmSARhv8WgF
	wNpRmsNM0/U2Jn6+Qe6cPprjtRzBelRYf2l7XQtADWDf+YJNygj+b528Ro8fYt3qxA1FBFA7nni
	cgqU4ejlvoeSdow1lpcbM357ApEqulJiAPXHjCKizgvGJYuxiNdNS8HQGmezracl4aaGqn8pkFj
	DaaRox8W9ZA78wtZnNAkgscm9tuuYaORBxj1pau1H2YIzrFaPnOJcRli73ETlTd3SM/Y0YueULf
	+maIKcPDl7gs9V9KZZukjiHbEbjh8eZJtp8g8PwpaW0378eg41hQy2m/wlnhqFNaCkNbrjMRysg
	sN23QZga0vmRwXyrfwh46jfrF/1lgkM24J8c4zOLNppzniJ
X-Received: by 2002:a17:907:9285:b0:c25:ee92:2d0d with SMTP id a640c23a62f3a-c29b84dfb01mr546451066b.9.1789488168330;
        Tue, 15 Sep 2026 09:02:48 -0700 (PDT)
Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com. [74.125.228.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de48af2asm617966b.26.2026.09.15.09.02.48
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:02:48 -0700 (PDT)
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6aa053900f5so2031584a12.1
        for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2026 09:02:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw6V4Oaf5LvDX49kMU9/HQ8xhfbmj/ExbWejAXQUj7LVolgId0jhjq7diBIUOAnww2VuecsrRGcD357kQ==@vger.kernel.org
X-Received: by 2002:a17:907:cd0d:b0:c29:439b:d5c1 with SMTP id
 a640c23a62f3a-c29b86141b9mr553591866b.16.1789488168046; Tue, 15 Sep 2026
 09:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 09:02:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
X-Gm-Features: AcwNN1WK06t9f9BcKFBIanysXcyUXK4eRICuH4x14s60AdlpF6ijCATIYaYAAvQ
Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
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

On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wrote:
>
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

Honestly, I am *not* a fan. At all.

I think this adds complexity rather than removing it.

The diffstat tells a story:

>  106 files changed, 962 insertions(+), 861 deletions(-)

in how this adds a hundred lines more than it deletes.

But to make things worse, it adds them in bad places: low-level
architecture assembly code.

Those extra lines are *not* making complicated code simpler. Quite the
reverse. They are taking fairly straightforward "just deal with errors
with normal cleanup in the place where it makes sense" and makes the
*straightforward* case simpler, while making the big picture more
complicated and subtle, and adding new code to places that are not
simple and just blindly do somethign that makes no sense in that
context.

IOW: it's more code, and it's more abstraction, and it DOES NOT HELP.

And yes, most of the well-maintained modern platforms (read: x86 and
arm64) use the generic infrastructure and they don't show that
low-level asm effect. So for those cases, it's mainly just  that added
conceptual complexity and a new odd rule - and makes a *successful*
system call go through that "extra work" and indirection phase that it
didn't use to go through.

So it just spreads out the work, and moves it to a less obvious place.

All for the very questionable advantage that you can now randomly add
a file descriptor without the few lines of fairly straightforward
rollback.

IOW, I do not see a single real upside to this, and I see immediate
downsides to it, and a more abstract complicated machinery.

I do *not* see why we woudl want to make this be a "every system call
exit" kind of thing. If there are places that think it's complicated
to do, they could have *their* local little stack of fd's pending. Why
force it onto the low-level system call entry for every system call
when there are only a small handful of actual real cases (the vfs
itself, and random ioctl's by odd driver subsystems).

              Linus
