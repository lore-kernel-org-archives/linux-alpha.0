Received: from smtp-3.orcon.net.nz (smtp-3.orcon.net.nz [60.234.4.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78F62E6CAB;
	Thu, 19 Feb 2026 23:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.234.4.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771543088; cv=none; b=aveRc6yU9SYHHjpP15NFjQIg5y64SbZOpUvjTKaNiGnZ+NFIfNoByY9TDsEXhGB5NhcBFQ6iKPRCU0vSvlbNKsDo7aIIzr/t65lKLv2j9xGfW0BRczbSgELKggNzuQ139EckWPeNqijYR8s5SsUl1SXkxT/MS+FHMvDcVdpxlfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771543088; c=relaxed/simple;
	bh=Lq5B60TlQprADFuVhO0Bq/rarb2VpXfwiKluKTH9VOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYwkUply+n0HlU3qw8jZEznfOfm3+3FRuhQJS4zsC1lkmK3KYs+QdKsrv3MkuT9n9f4BqvjQ8iQRBdItdY32Wff40aMxJxS/7mW3Cq6P20jNs0zi65knI0pKBwvGQgfqrjgm8KV5e/YMevv8lGHggMkUUa08MV/NbeVHlmT+0nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz; spf=pass smtp.mailfrom=orcon.net.nz; arc=none smtp.client-ip=60.234.4.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orcon.net.nz
Received: from [121.99.247.178] (port=59140 helo=creeky)
	by smtp-3.orcon.net.nz with esmtpa (Exim 4.90_1)
	(envelope-from <mcree@orcon.net.nz>)
	id 1vtCrl-0002UB-0W; Fri, 20 Feb 2026 11:51:25 +1300
Date: Fri, 20 Feb 2026 11:51:20 +1300
From: Michael Cree <mcree@orcon.net.nz>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	richard.henderson@linaro.org, mattst88@gmail.com, macro@orcam.me.uk,
	macro@redhat.com, ink@unseen.parts, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, kees@kernel.org
Subject: Re: [PATCH 1/1] alpha: add support for SECCOMP and SECCOMP_FILTER
Message-ID: <aZeT6DcS8u1Qbq58@creeky>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
	Magnus Lindholm <linmag7@gmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	richard.henderson@linaro.org, mattst88@gmail.com, macro@orcam.me.uk,
	macro@redhat.com, ink@unseen.parts, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, kees@kernel.org
References: <20260205133049.526-1-linmag7@gmail.com>
 <20260205133049.526-2-linmag7@gmail.com>
 <14bcd6dd3475d97b030ecb7044646f1b10d3205f.camel@physik.fu-berlin.de>
 <CA+=Fv5SPxzvJ3OCwfawOtUkBNmHJF=CS_9_m=a7QoHCn5UbUvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+=Fv5SPxzvJ3OCwfawOtUkBNmHJF=CS_9_m=a7QoHCn5UbUvA@mail.gmail.com>
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --

On Thu, Feb 19, 2026 at 10:10:38PM +0100, Magnus Lindholm wrote:
> >
> > Thanks so much for working on this! Alpha and SPARC are the last two architectures
> > in Debian that are missing full support for SECCOMP filter. Great to see that Alpha
> > is now being worked on.
> >
> > FWIW, I haven't tested your patches yet, but I think you should also update the
> > documentation in Documentation/features/seccomp/seccomp-filter/arch-support.txt.
> >
> 
> Thanks for taking a look! I'll put out a v2 of this patch, including
> an update to the
> documentation.
> 
> > I will try to add support for Alpha in libseccomp over the weekend to test your patch.
> >
> 
> Btw. I've tested your libseccomp with updated alpha support, real nice progress

Where is this updated libseccomp?  I would like to test it too.

Cheers
Michael.
