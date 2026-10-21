Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792603197;
	b=B6vKxbZ7tdw6v66mX8xIPuMyXfaHOFLQV+oc8gL4CARJnQ0kWzEmRISu8WvxoK3l2NYX
	 EmxVu1dJYj3sOg8rOMiF/Hzdcxj/X9QIc/aLXGEr2AOIpBppQ9HmvOWnhgTiUYBMUAdR8
	 Fu1SbKmrjFxnGKXGd8bxHfe+F7+33VkW5nXOVVfermJC3cxqzCWM4quWxqQphlzDOXgDt
	 T5MiWtTMLm200LUc4wHF3aIx63iM1A5SIjFCivYSoEgDMIHyS4RLTcrLGbAfZSRFkcTQC
	 GAoiOkOG+8uu/sSOkePOhZam2p3VG5sR+iVQlsPYZhTo2mVFBG+oP0KUCfyBj4nHFiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rZQSCO0jmNqdpTMGpjF3fAr9OJPsW9sB18ZGiGPGBrg=;
	b=d41MHDW2QgiBxtCUbp90CQ5D1tOnUkfXuyT8GxFcP/Fy0MKA9Iu2wEPHm5Xt6Hm0EIYs
	 woVcMo1VjPw2fEhVi5SIiV19TqyW5TeTlftFexpnFchJGNpviaO/jY8Zrf7BAAF09+sNZ
	 C0p8X5zUUei/o+KG0dPzxSdN/OcqQ40etOcaBDYL02Vwu8tSTHkIs1jPSwSREdNwDDTEU
	 fpsSFYrNDxP849d4gGCm2doSD7/V4gOg9YZyZsPU59eCT1u7rF+w8wy8JQe07UhDzv01H
	 yNKEbC93OchIfLJlZf7bMNKN4e+Gp2TFRDVyTBgHK/V21JZCgepQlNfWPiHIJquS6GA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSpIgQU7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E29606A31B
	for <linux-alpha@vger.kernel.org>; Wed, 21 Oct 2026 17:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1E29606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSpIgQU7
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b3f7763d88so1298050a12.2
        for <linux-alpha@vger.kernel.org>; Wed, 21 Oct 2026 10:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792603195; cv=none;
        d=google.com; s=arc-20260327;
        b=LoxMgZ18tFdUmTLLHsqnUVghhxSp+SaZ1ie6U13w2kHiQEaG72Vak1sVGg1sK57r1L
         27kuiSXEaCvqOUT9R5LXbK+HzVMY5xP12HllXTNYG3/4TTDWui40vyZX7mVx3Y7X2W97
         haguA1n3nifJX/xc2PciNqIzET6L0/IQfEizgi7Y0yOXZfiq5g+CmmubcNxiT36bpVFS
         edGci2S3MHf/CMHquWm6G61WriDgKro7AocRmGhF9Rxuyw+JA6noIMYpjzANo4jJOTkd
         2CUg3sqh5wovzrI5LBG6/xrccfAkwiv1X2sK4TSD5YcygJv8XmX4zQwqzwN6Fh3+ONLs
         TE5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rZQSCO0jmNqdpTMGpjF3fAr9OJPsW9sB18ZGiGPGBrg=;
        fh=jVUWZF1/OyJhcFIpih7noiVpdzPKtdoukhFcTCwUbXo=;
        b=luWLBvy6EeVbF3RQdqpRhdubF7k2MxQ9dPqPAp5eVBLEeyNJMefWD2BpsSpEIzBVls
         6/jgxYaeVaR/iHAgXu2SVgumTaiSufCP31AmH+IYIs40EUC83dG7ozA70gKeKBavMQPi
         WFKWCJMA9xN6IQE2wMlx72bHfXs4fYmFQSO2wIT89U+dg+pK9vwOLbtgWQSodo6fgFxU
         +ITEu0JBv+WEljMt6p4XNPo2R3TPD5dD4Fjp7QMEEPGGt3jJAYE3wl2v6la2hxLbbAdR
         oO7YdnJXkTK/E9bSlGfUwVojjV68/HE0sXzElT80tzOcuJxoDCOwyaQ1XebUSHCswU6w
         KB+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792603195; x=1793207995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rZQSCO0jmNqdpTMGpjF3fAr9OJPsW9sB18ZGiGPGBrg=;
        b=XSpIgQU7hdU09fMazwObHvogjqjSZ3OIyskS8UtvDxFMdtvT7cnYhWTK74yniPSKCB
         th4IsORL+04tF8Xg3GoDhta4j3+wnGrBrzV5LuTAp7AUNW2kSwcyEUF5FLBQ2E/5+lmm
         YFIUQamVMHHT6txLJtspFXcPdnuDHgpIRHoQ2rMboVvj/EwMV08S8mg3ZvfpFKTE3FJG
         hwffc+EnciHUtEWGehG0eF3pKBamN/o0fXrWUnX4JklWidrjJ4FQHctP+hLjKq47wCIz
         jsvXSoWJTVOvGwN1Azf2c7bkl6BnjXkHQyYNJ9e6RaYQpU+w9OvjokRCkpvtKf3bA+ch
         LNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603195; x=1793207995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rZQSCO0jmNqdpTMGpjF3fAr9OJPsW9sB18ZGiGPGBrg=;
        b=SjnhnKEph6WnvWItFRz+voRYpwuvA3z6HZSYDsL7iSGq4gCTcrT9vjVV3Cnu9lTGZa
         U3Oh7tUqzzAYN0FJrj8/Xl8NwyNChdBK4+lEXKY6eqh5EgRuLV3yF2YlXsj+EGSdRHnp
         /X/HPbdCopZTzTnGlmWsW/6fbXM3G/k2H0Ev9mNvxVYB0wjI//BZHiD8QtpipcQFwvzz
         FEfFLLvigD+O2dxit2P5/3JCejFhU9yDDJUM+mgvKaaYyNio/k3QdGIvQrU+aMVYjzzG
         kBBAT+t8XhdyYPDPDXEr0G3c1x8NwyALvarLtuWY7NLiFTrBO8LWdBunT//7OlC9nTz4
         mU+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxbD0nKvqUfPvbZxUpi9nhDatH6p+NgpmsmYgH9XVwNlMpgK/Y4LpNjYHBiWbBQumOJ2cfCokIqxfe2uw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJl+ILWE1YMB9VhkDHFb1opPdytCSFrVuv6DPgDDsOZ+8rK4BwD
	HQAOIQyWjEgemUJyNok4w+GskukNn3YfMwINFedYWsNauo/iZEPILhcnhCXi5AVMKDsWHJKE3L1
	th42iVLF1aNV8OyVwGn/j0I3iXQZKx6Q=
X-Gm-Gg: AYBFou1iqtI8BvBAoT37eJ9cClgfTqMLqGwLc3MdBO5PfBNTdv66UfO10nLCg5JYKDw
	Tfx10nCGIMR5ie6r5OIt2fj6mzXME99+xq/CT05EaUvF/Led0gFfyRMQj1SrqkZfillRYOtKOMZ
	RDJGkajCKVyChO1dUj55pEYS25+1mychN32sQJjz5d1JZsC8C3cG9FEpXr0UIPz9XuH/WtrIZJt
	HeeD5Jee9Y9s4FkNIHm0c0k65plFrC6uMzZCCyetAXbrPBId8VUJNiCy/HWuX9NvQ2PZ/fDMl5v
	p6lgCTGBKLw5hS9KEVidajARs+RVTYFLEtayYQQHuDgY5Wx17Un19uOxn2QR2wxi1SPyBC/svZ6
	msmxeMgY+vei+BAZ2pykv2ptDq/zmrfkOW2vWCSg17DgdFsPOLElFH/uV8r8BHhTo5bY=
X-Received: by 2002:a05:6402:3244:b0:6ac:87bc:8b16 with SMTP id
 4fb4d7f45d1cf-6b408ef36dbmr1446825a12.44.1792603195214; Wed, 21 Oct 2026
 10:19:55 -0700 (PDT)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-alpha-perf_reg_validate-v1-1-a8e8cc23ea7a@linutronix.de>
 <CA+=Fv5QWoVZqOR1uHTaE20XWBkXoVqbjTE6bF2iDvvJn6j5hfA@mail.gmail.com>
 <20261021134714-fbc85127-2188-4c7b-b472-ed719c520541@linutronix.de>
 <20261021153856.GR2823843@noisy.programming.kicks-ass.net> <20261021154346.GB409038@noisy.programming.kicks-ass.net>
In-Reply-To: <20261021154346.GB409038@noisy.programming.kicks-ass.net>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 21 Oct 2026 19:19:43 +0200
X-Gm-Features: AclHuK8PW19mk3nU8HATQHkT9wwoKx5rQe3hwQQpYZbB2M2jcT34h9RJZRWhnIg
Message-ID: <CA+=Fv5RYMAxXHYKGw_sHzhGxmPSYyFG=bTCXxo2100eDyZeh7Q@mail.gmail.com>
Subject: Re: [PATCH] alpha: add simd_enabled argument to perf_reg_validate()
To: Peter Zijlstra <peterz@infradead.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Wed, Oct 21, 2026 at 5:43=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Oct 21, 2026 at 05:38:56PM +0200, Peter Zijlstra wrote:
> > On Wed, Oct 21, 2026 at 01:49:35PM +0200, Thomas Wei=C3=9Fschuh wrote:
> > > Hi Magnus!
> > >
> > > On Wed, Oct 21, 2026 at 12:23:55PM +0200, Magnus Lindholm wrote:
> > > > On Wed, Oct 21, 2026 at 10:18=E2=80=AFAM Thomas Wei=C3=9Fschuh
> > > > <thomas.weissschuh@linutronix.de> wrote:
> > >
> > > (...)
> > >
> > > > Thanks for catching this. I reproduced the build failure on current
> > > > mainline and confirmed your fix with GENERIC SMP and DP264 UP build=
s.
> > > > Both also passed perf register validation and sampling tests in QEM=
U.
> > > >
> > > > Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> > > > Tested-by: Magnus Lindholm <linmag7@gmail.com>
> > >
> > > Thanks.
> > >
> > > > If you have a route for this patch upstream, please go ahead and ta=
ke it,
> > > > unless Linus would prefer to pick it up directly.
> > >
> > > I have no route upstream. I hope for Linus to pick it up.
> > > But if that does not happen, maybe you could send a PR.
> >
> > I can stick it in tip/perf/urgent if that helps :-)
>
> It should be there; please yell if I should drop it because someone else
> (alpha tree) wants it or something.

Thanks for picking this up. Going through tip/perf/urgent works for
me; I won't queue it separately in the Alpha tree.

Thanks,
Magnus
