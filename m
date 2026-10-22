Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792652816;
	b=ZwrqDb548sWYoPS6mZ5VnD1To+uDQyAfznmX2VhGaAtdvj0fF8N2BOAJ/L5AHPbOWQKM
	 +HDnqtSEPuWsZqaszQd0bYrKyacAhLQlMy2Eg3BLKjonKLRZ1umsHlGKkqUNu2gJbFnl/
	 fBIiuaLJhkq8NzTM6D/FfkCidlx6hbn2+zMWtdUBBYhWf5bEvnrE324KSJKRzgVW9HbT7
	 8fPdx+ijyVqxTiYsP9WPR+8XA/aXdL7zSqjBg6hYuDstYYwiVCB50WF1JtnQhCibqjHgx
	 UNRzDB6a55hNdPZ8HUQ0AeuKotW3zgbi4u2s/yoll/P4Qykq5MUB3jFrJtyqoXzIKJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792652816;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=IWdxLZaYsDNgDj0jH9McHZgLp8BzW4HZfhXZHG8IFMk=;
	b=Nus2H1AeTE1V1hgItm4oO5zs8V+Tko7F4AA+p/rWcc0St7TwZzv0zWF3DcyeTponNkIF
	 J7CmFZekfanLJscOFYVnRJu6XLImWPyENWDYGRZhDWd8Rdj3V82EdOZqUIMlhEGZJbZ1l
	 9x91aadHiu5SrZSJFIdb1VcNCCrjq1FNejwc1MMx4aCythXxoPPT+qpUGxOcZvoF1GyZR
	 83cG7h4czipEAnBwoJkBAEH3lrQWoQFBlVpXQEnQopjJFTLeQt65tJsImECfhF4mc2cPM
	 I+ij3ac6ikhDQUdSEFrlvlxISUJFn+UPCnhWswmz7o2MYNdnTj8T8M7UVvO1qby4FSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="r5Qd/NO7";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=JWUlppBh;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10ED606A319;
	Thu, 22 Oct 2026 07:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10ED606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=r5Qd/NO7;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=JWUlppBh
Date: Thu, 22 Oct 2026 09:06:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792652814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IWdxLZaYsDNgDj0jH9McHZgLp8BzW4HZfhXZHG8IFMk=;
	b=r5Qd/NO7hGLpF6A02pgTOem2+YDLGpSj+v/Jnlw9A0C/932bSpXyNUN7e7ZK18lNYOkEoX
	VMbQhWEh/ZbAETgb4/TXwslE897XqUIHGfhynsf3QGrYltIkQWBhPWWj2o7YJ7t3uftqLj
	Epz+yRG8IWBmbX1uHkvXj8t5GslIUySrkLI0CK0Fnr+IRTlaucQOkHwnKzzn2gsZFnFDBq
	A46hq5cxXU5P9EsaWOoQjE8xCPZENb5jM1XdFChrPSOdBBYZmuEek8wRB7IQKe3r+4eOFi
	2lI85ogcBcdNDjGcX1yKlwcuAM+Ry8D1oxvFjQTUHjHNiwqziQJ0+96RxpaOGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792652814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IWdxLZaYsDNgDj0jH9McHZgLp8BzW4HZfhXZHG8IFMk=;
	b=JWUlppBhQzdw7tw5wraLqKDZ1rB/HAuHKph9XNc0UPAJHpvwnzI+c7OU6lD97KLvS1Jtwk
	4ganGunH1Bv9J1Bw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Magnus Lindholm <linmag7@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alpha: add simd_enabled argument to perf_reg_validate()
Message-ID: <20261022090320-7d0ee286-23bf-42c9-9a61-bf9e50c52a6d@linutronix.de>
References: <20261021-alpha-perf_reg_validate-v1-1-a8e8cc23ea7a@linutronix.de>
 <CA+=Fv5QWoVZqOR1uHTaE20XWBkXoVqbjTE6bF2iDvvJn6j5hfA@mail.gmail.com>
 <20261021134714-fbc85127-2188-4c7b-b472-ed719c520541@linutronix.de>
 <20261021153856.GR2823843@noisy.programming.kicks-ass.net>
 <215dc157-8cbc-4c84-857f-d372c1ce922b@linux.intel.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <215dc157-8cbc-4c84-857f-d372c1ce922b@linux.intel.com>

On Thu, Oct 22, 2026 at 07:53:22AM +0800, Mi, Dapeng wrote:
> On 10/21/2026 11:38 PM, Peter Zijlstra wrote:
> > On Wed, Oct 21, 2026 at 01:49:35PM +0200, Thomas Weißschuh wrote:
> >> On Wed, Oct 21, 2026 at 12:23:55PM +0200, Magnus Lindholm wrote:
> >>> On Wed, Oct 21, 2026 at 10:18 AM Thomas Weißschuh
> >>> <thomas.weissschuh@linutronix.de> wrote:
> >> (...)
> >>
> >>> Thanks for catching this. I reproduced the build failure on current
> >>> mainline and confirmed your fix with GENERIC SMP and DP264 UP builds.
> >>> Both also passed perf register validation and sampling tests in QEMU.
> >>>
> >>> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> >>> Tested-by: Magnus Lindholm <linmag7@gmail.com>
> >> Thanks.
> >>
> >>> If you have a route for this patch upstream, please go ahead and take it,
> >>> unless Linus would prefer to pick it up directly.
> >> I have no route upstream. I hope for Linus to pick it up.
> >> But if that does not happen, maybe you could send a PR.
> > I can stick it in tip/perf/urgent if that helps :-) I'm the one merging
> > the broken patch in the first place I suppose :/
> >
> >> How this issue made it past -next would also be interesting to know.
> > Yeah this; normally I get robots screaming at me for things like this.
> 
> It looks the issue is caused by the merging order. When the patch series
> "Support SIMD/eGPRs/SSP registers sampling for perf" gets queued, the alpha
> patches which adds alpha specific perf_reg_validate() variant is still not
> merged, so the robot didn't find this issue. Thanks.

The robot should have tested the post-merge state in -next.
It turns out that the alpha tree was not part of -next this cycle [0].
It is being rectified for the next cycle, so everything is fine.

Also thanks to Peter for queuing the fix.

[0] https://lore.kernel.org/lkml/20261021185857.GB2608581@ax162/


Thomas
