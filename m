Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597432;
	b=XF1/9t+Mxafquy/DBhPdK+/eVakaPZ93T4vN804S5H+5M71wYv5p5pMaMX43+MfLp7pp
	 ZtbDtgfD2DvB3OEfm6madIhhqtATFB6yJG4wzZBBZ7BLw8RB7lnGTZldV90rmarbB5fkc
	 1szKERnzNQrIMWGmg/FCqP+zDPcl2q7xRcncl8bmEsd6XSwdaAxY0Zajxk3Tdf/18ipMJ
	 rLZt1lWJfWNU9chFIoeir3xgTqEJqZVb/J9OuzsEKuofbSqu933S7f5XL54Hb4u0ziP93
	 u8mmtWY1vaLpj60ONIRayGsM/qLu8kRCRGjD8VByTjrT0q86z14cmOSelHVBrFwf2+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597432;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Mt0WBoV47pXZ+uJC8zcyZLqoKPPKYbS3NlaepKAD56A=;
	b=yixulrtc1Y34xfrN4qo17J9HoUc3i5ITZYp8YzEKHLXOkdcC/lRu6vkdhEmDTcK2a028
	 Bcb6YxRF6hrGVWFx7JO8UvDnAW2IhLAnDsco6iOQmAS9ufL9wLcx16q8V6ZdDkaT0b95o
	 b2Z7327H5a4c1DVqYbN1DYRx5fJgD4anCLeM4DSs2i1mjqtaLvtm3TlUuS/9Y0CBZKCBI
	 +bKXjvnOXp3bAHI1kuDgohN/bS7af75OUfklTsUBPLbjHKs1u6Vdvvg1ZnqPOoeb9pap6
	 x+z4rYZafSBEqdqkWBDoFdi6DBwbrS+KZGtNHtat/3KXsC4MAB92nWxDLLmmQcMIAbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=nwSGQU36;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A494060A6F64;
	Wed, 21 Oct 2026 15:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A494060A6F64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=nwSGQU36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Mt0WBoV47pXZ+uJC8zcyZLqoKPPKYbS3NlaepKAD56A=; b=nwSGQU36vn9e3dSr1DihZhynEq
	jiPXV3SmjppPne5JQGzN4uFytkTLXYSNLmY+lLV+lWTqJqvwbgMxq0I9Xf7dm9wFPfjQiIh7XBWrS
	TmRYVMGDMWXyOlMXzbVZCoQqnKiU/15DbfAoyCkMkbsBGxoTw2z5X7j3oXlDtpE65Q8kjXbH6keIj
	eBFf9I2X0qjEpe5MSWvUzuWtzpUopcv5AadtADi9agMkiDjniF21/oVbjcSBhVQM8SnCK5vv2+xZn
	51shtfeZIJBnnWupUKQLn+6UaDoRiaLpuO6zJ2ndrBKqYBdCORZ4KUXe1YuSwjkCMu9muKfFo0Z60
	G6XleQWQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJYTj-00000005yG9-0ohA;
	Wed, 21 Oct 2026 15:43:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1D4223007A4; Wed, 21 Oct 2026 17:43:46 +0200 (CEST)
Date: Wed, 21 Oct 2026 17:43:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Magnus Lindholm <linmag7@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Subject: Re: [PATCH] alpha: add simd_enabled argument to perf_reg_validate()
Message-ID: <20261021154346.GB409038@noisy.programming.kicks-ass.net>
References: <20261021-alpha-perf_reg_validate-v1-1-a8e8cc23ea7a@linutronix.de>
 <CA+=Fv5QWoVZqOR1uHTaE20XWBkXoVqbjTE6bF2iDvvJn6j5hfA@mail.gmail.com>
 <20261021134714-fbc85127-2188-4c7b-b472-ed719c520541@linutronix.de>
 <20261021153856.GR2823843@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261021153856.GR2823843@noisy.programming.kicks-ass.net>

On Wed, Oct 21, 2026 at 05:38:56PM +0200, Peter Zijlstra wrote:
> On Wed, Oct 21, 2026 at 01:49:35PM +0200, Thomas Weißschuh wrote:
> > Hi Magnus!
> > 
> > On Wed, Oct 21, 2026 at 12:23:55PM +0200, Magnus Lindholm wrote:
> > > On Wed, Oct 21, 2026 at 10:18 AM Thomas Weißschuh
> > > <thomas.weissschuh@linutronix.de> wrote:
> > 
> > (...)
> > 
> > > Thanks for catching this. I reproduced the build failure on current
> > > mainline and confirmed your fix with GENERIC SMP and DP264 UP builds.
> > > Both also passed perf register validation and sampling tests in QEMU.
> > > 
> > > Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> > > Tested-by: Magnus Lindholm <linmag7@gmail.com>
> > 
> > Thanks.
> > 
> > > If you have a route for this patch upstream, please go ahead and take it,
> > > unless Linus would prefer to pick it up directly.
> > 
> > I have no route upstream. I hope for Linus to pick it up.
> > But if that does not happen, maybe you could send a PR.
> 
> I can stick it in tip/perf/urgent if that helps :-) 

It should be there; please yell if I should drop it because someone else
(alpha tree) wants it or something.
