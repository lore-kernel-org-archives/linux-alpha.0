Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583378;
	b=GbwZMSgGkbcYKGlRcFGEH24vLb+G1VFz0DrD26recBbgNhaxd/UfpB1oJ/V4G/C/7f09
	 jF5phlgoe2fPXZWYipDVHfBYglNZWkRZOcq+f+RJ97pa5BvCOuciaTUGF+g37XzMhMYvD
	 niYA/OaBKSnPsTc/XOxoOSNnRd1gWdsrLzU6QPSG4/kbSBl+8GwaK75ld5WCV7/sKtXSN
	 kxGYb/PzNAdEGj3x6DUZS+/j5TJ+91YzryDK+MuwUpMj/17PfV0FTI0J5n+vZo01w0gUI
	 Y0VLXWp24AguoFLR498VBq31akn9HPtO0ZC7lVk8bGPSQme0tkJdtnvB41taoIVN1lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583378;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=AmpVsMr+ASY3eGYOhHlzxMzPnMU2EnlGE2ggeD3Et1Q=;
	b=SeM+FNdo7HU8rARu+uNPC0PNWQ1ifW4rhxkeL6EHZPtaH0DQlOLjdZt3eXma4QTP3SHj
	 LFBwGSRJ5JpKHeAVtz0EqeuNqUpJ8KjSxH6kA/F0VacEhGkwLY/jBilbcoZgroLtvqRSc
	 LF0Qf2EgnJMibki1DQZF6WiZ4QaWCu/yuw1q7igXPS9UaTTkM2KtQ5anKBn6rSyWK/q41
	 0m71mbNjFa8DFaikjAqVHJNRl5TQY6CeOStji+NPdIjWxvLAbdLTgwrrwZlKToBSvoBQ2
	 Xx/89Xd7wpifjJlzSWPikq6mEEwqeuWARoNHRPBhm7bnxKFb//gorLzZlHsPICJRvAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jrdFCmP1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eusuXO6X;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF4A606A31B;
	Wed, 21 Oct 2026 11:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF4A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jrdFCmP1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eusuXO6X
Date: Wed, 21 Oct 2026 13:49:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792583376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AmpVsMr+ASY3eGYOhHlzxMzPnMU2EnlGE2ggeD3Et1Q=;
	b=jrdFCmP1kiiX49prHGymNqPWhRBp8R57+ELQGXhcPG1lEwPv3EvoliOsazv73bb5QkNl/D
	nXWzEon/0ZnT/LA2GqAuZeYpDRqgulEFZHqC5NHUU8si4opWuy/3tP0sVcTUYvv6laZDwM
	mVuQmEaKaa/gCX5j/aQ7eL1o4SehREyVq7H4yPvZqqW6+9l0orNAbdvFOyAyW+6mHTra+E
	R9WCN1fcnoXLVhsOvKBc2OVFhnpB9QUS3A9TFgwQxILCq9JddTRhTD8bkyqm/ioAskba0F
	7NWW+80BtWDzeWCS6ssEyCqHqaW8K3IdAYYIeQIpLCdWdFyA2WZqiP7smASRmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792583376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AmpVsMr+ASY3eGYOhHlzxMzPnMU2EnlGE2ggeD3Et1Q=;
	b=eusuXO6XPNTbgTGpfZbsLsPm1vTb6YCllSjaouLIRelj1vJHuxUnPW46QN+V28qOcnDwqW
	vvmt5i2XfLEBhRAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: [PATCH] alpha: add simd_enabled argument to perf_reg_validate()
Message-ID: <20261021134714-fbc85127-2188-4c7b-b472-ed719c520541@linutronix.de>
References: <20261021-alpha-perf_reg_validate-v1-1-a8e8cc23ea7a@linutronix.de>
 <CA+=Fv5QWoVZqOR1uHTaE20XWBkXoVqbjTE6bF2iDvvJn6j5hfA@mail.gmail.com>
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
In-Reply-To: <CA+=Fv5QWoVZqOR1uHTaE20XWBkXoVqbjTE6bF2iDvvJn6j5hfA@mail.gmail.com>

Hi Magnus!

On Wed, Oct 21, 2026 at 12:23:55PM +0200, Magnus Lindholm wrote:
> On Wed, Oct 21, 2026 at 10:18 AM Thomas Weißschuh
> <thomas.weissschuh@linutronix.de> wrote:

(...)

> Thanks for catching this. I reproduced the build failure on current
> mainline and confirmed your fix with GENERIC SMP and DP264 UP builds.
> Both also passed perf register validation and sampling tests in QEMU.
> 
> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> Tested-by: Magnus Lindholm <linmag7@gmail.com>

Thanks.

> If you have a route for this patch upstream, please go ahead and take it,
> unless Linus would prefer to pick it up directly.

I have no route upstream. I hope for Linus to pick it up.
But if that does not happen, maybe you could send a PR.

How this issue made it past -next would also be interesting to know.


Thomas
