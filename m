Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597143;
	b=ayl9AHUsg+U8G9akxTSJGQn6hzYILF6Bxx3py+7YDXU60GjioAoqEFrHHxHy2/UJqeC+
	 SzC3ADZalNJowlvMewujPWEHOyonrXFqeOvNts0AKClJ2dEMZXfvkwLbFSEI1Onr+tNZJ
	 slHIUzh4nVJN5mUPIhmllRk17RB+9C++Y/OJDpnzsiYDEW9gJZXy8R2NMhkIAYEa9yEr4
	 UaeO3uBBwizTOWyy/Mk+eTL3HHWBwME/3HlU0dIFFeKnbzjdku1uHVWXYD3kpc5zfrwsS
	 pLm/4R6Vydj359g9QxhkICbIqQTJ1QQXd1uX+vomVSH9DhRC2gwcJo/p103Jqej3mDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597143;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=XGBx0ovf+jnJmhB+IqTbU1kl9AeZ5LqNvVMjzHQnu/k=;
	b=k9RQa8X0boTHlWNDomV5AqP5NIjCdGASw7XXJrSKiFI8uzH5evtFLhfgjsFAFQqFbewm
	 LvqdpW6xGr0AKdnfQaSfEGuBgaKaQ3Bd+YFpZFFKBfiTKqbCD9NHAcJ0/k8Chhq2qVAUF
	 KXqlZ1P8H5KE3UUglq0+MK3NB1A67dQU11X/mdIK16ExvKz6qFitC0OciCI4evCrJHDRd
	 NTzd6XOY4tqhvWpdaOI2JFjR95181nVa7ILF+TzTtX0luloppWIqZk9sTmrnO826fx990
	 EF/o7GI72qZ/ST9BFNbYbK0obb7oMHNSwbabHtx0xXya/w/mF1HuU+kCNnDMgYe0UCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Ap7r22m1;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CA8606A31A;
	Wed, 21 Oct 2026 15:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9CA8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Ap7r22m1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XGBx0ovf+jnJmhB+IqTbU1kl9AeZ5LqNvVMjzHQnu/k=; b=Ap7r22m1oufLq89HeQe/FRzz3Z
	nyGs3aAkZVG14I+igprO/Dbd6jE+WBT6vj7d7Ih4eOf+jdnrzGmew2Js922cJ/qqZ6znXcvdf/Ndh
	wF7rDYdhFgROY+I/r+7ozsWEU3sN3fBVU5hX2+HFjUslZgffgGOci5i6BU0mgirJU62tZba/c8lpI
	z8pLHcPYmSaUlZV3fAxLOJX+GxMlGb1EQS+CBx6+7Sjb1s/uydR3bg4sHVpZRpFwJn1xPqXETPZZx
	zw7m7NrcoOe5MygHY+qx21z10FfUnJnLG9HjH9R7DhN44DsyRZ+GCXznnVtS5QlGdLt0F9Px7xD41
	rrmAWDCQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYP3-0000000AF8l-3TNo;
	Wed, 21 Oct 2026 15:38:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B4C553007A4; Wed, 21 Oct 2026 17:38:56 +0200 (CEST)
Date: Wed, 21 Oct 2026 17:38:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Magnus Lindholm <linmag7@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Subject: Re: [PATCH] alpha: add simd_enabled argument to perf_reg_validate()
Message-ID: <20261021153856.GR2823843@noisy.programming.kicks-ass.net>
References: <20261021-alpha-perf_reg_validate-v1-1-a8e8cc23ea7a@linutronix.de>
 <CA+=Fv5QWoVZqOR1uHTaE20XWBkXoVqbjTE6bF2iDvvJn6j5hfA@mail.gmail.com>
 <20261021134714-fbc85127-2188-4c7b-b472-ed719c520541@linutronix.de>
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
In-Reply-To: <20261021134714-fbc85127-2188-4c7b-b472-ed719c520541@linutronix.de>

On Wed, Oct 21, 2026 at 01:49:35PM +0200, Thomas Weißschuh wrote:
> Hi Magnus!
> 
> On Wed, Oct 21, 2026 at 12:23:55PM +0200, Magnus Lindholm wrote:
> > On Wed, Oct 21, 2026 at 10:18 AM Thomas Weißschuh
> > <thomas.weissschuh@linutronix.de> wrote:
> 
> (...)
> 
> > Thanks for catching this. I reproduced the build failure on current
> > mainline and confirmed your fix with GENERIC SMP and DP264 UP builds.
> > Both also passed perf register validation and sampling tests in QEMU.
> > 
> > Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> > Tested-by: Magnus Lindholm <linmag7@gmail.com>
> 
> Thanks.
> 
> > If you have a route for this patch upstream, please go ahead and take it,
> > unless Linus would prefer to pick it up directly.
> 
> I have no route upstream. I hope for Linus to pick it up.
> But if that does not happen, maybe you could send a PR.

I can stick it in tip/perf/urgent if that helps :-) I'm the one merging
the broken patch in the first place I suppose :/

> How this issue made it past -next would also be interesting to know.

Yeah this; normally I get robots screaming at me for things like this.
