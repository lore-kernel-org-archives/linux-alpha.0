Received: from smtp-1.orcon.net.nz (smtp-1.orcon.net.nz [60.234.4.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79BB225760;
	Tue, 20 Jan 2026 08:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.234.4.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768897617; cv=none; b=hOtOWOer8IGc7wOwZXKFyPNn4Vf4HRIvrYLqsJ+DnZE61Z0kFkyDYmKIeB3s6nrs6J6F5QpiZJQ+gObnPvz8x81dCD1nzp0pyYqcErixfAvZkoi/ow67ZXUjJ3a8eJMOcUq3woDxeYZ3aSCVHDePIJ37mA/diuzUX51JLQzMN70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768897617; c=relaxed/simple;
	bh=yQHkV2QVx6UKOIXkpiHTYa9Np87EJzgjALhFPd1miL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4P8X580VS20lBz56KSVpXKGGqilGvIspRR/7cQpf27V2Ab8tRq3fNEA2Pe5ej5E/2oY8XcUWBkqYsxT71rIwcHbuihg8qEswf/pzTdn80F/6elWhnRa00ncIcJouv2205goKvi1iTellW834R04rV7r5xUwK+m4qKZj+fZGgTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz; spf=pass smtp.mailfrom=orcon.net.nz; arc=none smtp.client-ip=60.234.4.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orcon.net.nz
Received: from [121.99.247.178] (port=65143 helo=creeky)
	by smtp-1.orcon.net.nz with esmtpa (Exim 4.90_1)
	(envelope-from <mcree@orcon.net.nz>)
	id 1vi6PF-00086n-Sm; Tue, 20 Jan 2026 20:44:06 +1300
Date: Tue, 20 Jan 2026 20:44:00 +1300
From: Michael Cree <mcree@orcon.net.nz>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Magnus Lindholm <linmag7@gmail.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, hch@infradead.org, macro@orcam.me.uk,
	mattst88@gmail.com, richard.henderson@linaro.org, ink@unseen.parts
Subject: Re: [PATCH 0/1] alpha: fix user-space corruption during memory
 compaction
Message-ID: <aW8yQMNTNEfxu6Fn@creeky>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Magnus Lindholm <linmag7@gmail.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, hch@infradead.org, macro@orcam.me.uk,
	mattst88@gmail.com, richard.henderson@linaro.org, ink@unseen.parts
References: <20260102173603.18247-1-linmag7@gmail.com>
 <63b2087350d6990f0e348a8028f006924363c5d0.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63b2087350d6990f0e348a8028f006924363c5d0.camel@physik.fu-berlin.de>
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --

On Fri, Jan 02, 2026 at 06:57:28PM +0100, John Paul Adrian Glaubitz wrote:
> Hi Magnus,
> 
> On Fri, 2026-01-02 at 18:30 +0100, Magnus Lindholm wrote:
> > This patch fixes long-standing user-space crashes on Alpha systems
> > when memory compaction is enabled.
> > 
> > Observed symptoms include:
> >   - sporadic SIGSEGV in unrelated user programs
> >   - glibc allocator failures (e.g. "unaligned tcache chunk detected")
> >   - gcc "internal compiler error"
> >   - heap corruption detected by malloc consistency checks
> > 
> > The failures occur only when page migration / compaction is active
> > and disappear when compaction is disabled. They affect both UP and
> > SMP kernels and are not specific to a particular Alpha CPU model.
> 
> Wow, thanks for fixing this! This has been indeed a longstanding issue and
> seeing it fixed would be great.
> 
> I'm CC'ing Michael Cree who has been observing the issue as well and could
> help testing your series.

I've successfully run a 6.18.3 kernel with this patch and
CONFIG_COMPACTION on for almost four days on an XP1000 without
any problem. I would normally see one of the observed problems
described above within a day, and certainly within two days, when
running with a bad kernel, so this is looking good.

Feel free to add:

Tested-by: Michael Cree <mcree@orcon.net.nz>

Cheers,
Michael.
