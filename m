Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695592BE7DF;
	Sun, 30 Nov 2025 19:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764529432; cv=none; b=WJsRYQEimjtkrroFM5tD7fquAJDunnf7NK0e0idJK5B8ZfkICRuf+VxzxfOFCysD7ChCrhNBfBIjIvImYi/bYlLsIR8jk2h1/ssM7ml1H3eu2zxOSNAgNwFbHfu2fgmfIjPr/SouDV2rMYGHBkTlrFhbUVA30Ah+fzTSnzG/id8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764529432; c=relaxed/simple;
	bh=u0dUx9/aNTb02LA18XIeov846vNrPfxmTjLee6l4aAc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YI2j3HnP3S6vNEHe3d6Hdw45sZytJfIMaxEhe1ciC72rTsxfwyXSBml3AhBmwRuvcrzDQRszWFUsnW9AozyH7TZ9mS3pLGEHcXV7kLvaWNSGqby1lmCsAIw1QpGV3sZAZjfWwT5ha8DCJwfdk7RdPXc4QV5PGPADnIMkt+FRqDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=oWx5KVdS; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="oWx5KVdS"
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight@runbox.com>)
	id 1vPmhz-005OE4-Uv; Sun, 30 Nov 2025 20:03:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
	bh=CcobmzCVZzKsalDG7iII3Z5e85MNaCA1h/c5e6HyJFE=; b=oWx5KVdShvtRvg50cH+3h0Z72F
	i8zUjkrXdY1GXaP37WvXdsFKPiSuH2ZejGVU3ridQvXDXUbjDoH6PWuFkPviLkPTjGbbzGw2lMr0P
	54NtxGg0C0dJNmNuLPtbOgIrVcQJIgMV20g8myfNSMCBLlu6VOASgeEfPC9KbD8csTP3OdUWYIZJ8
	BWKKjaABTm1bifHy0rM8R75vkEr6oQ0XV9k5dINLEO9GrEZbJG/QLPIr6jLN6gwdDAZA30EJWwMyE
	Vn57MU4NG4wbNWBsDp2PJ9EddQOioF1ExU9dUJjktx1dvZrsV3HZ7l24okhtHLZEuwP3s4pxAUx4N
	Gdz3RiVw==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight@runbox.com>)
	id 1vPmhz-0003YS-8t; Sun, 30 Nov 2025 20:03:43 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vPmhs-005yEm-EM; Sun, 30 Nov 2025 20:03:36 +0100
Date: Sun, 30 Nov 2025 19:03:31 +0000
From: david laight <david.laight@runbox.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org
Subject: Re: [RFC][alpha] saner vmalloc handling (was Re: [Bug report]
 hash_name() may cross page boundary and trigger sleep in RCU context)
Message-ID: <20251130190331.40385ddc@pumpkin>
In-Reply-To: <20251130164348.GV3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
	<20251126185545.GC3538@ZenIV>
	<c375dd22-8b46-404b-b0c2-815dbd4c5ec8@huaweicloud.com>
	<20251129033728.GH3538@ZenIV>
	<20251130030146.GN3538@ZenIV>
	<20251130113213.40c8e7a0@pumpkin>
	<20251130164348.GV3538@ZenIV>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Nov 2025 16:43:48 +0000
Al Viro <viro@zeniv.linux.org.uk> wrote:

> On Sun, Nov 30, 2025 at 11:32:13AM +0000, david laight wrote:
> 
> > How difficult would it be to allocate the pte for the next 8GB on demand
> > inside vmalloc(), and then propagate it to the per-task page tables.
> > That is a path than can sleep, so being slow if it needs to synchronise
> > with other cpu shouldn't matter - especially since it won't happen often.
> > 
> > That should be moderately generic code and would let the vmalloc limit
> > be 'soft'; perhaps based on physical memory size, and even be raisable
> > from a sysctl.  
> 
> Considerable headache and pretty pointless, at that.  Note that >8G vmalloc
> space on alpha had been racy all along (and known to be that); it was
> basically "could we squeeze more out of khttpd" kind of fun.
> 
> Do we have realistic vmalloc-crazy loads with high fragmentation of vmalloc
> space and total footprint worth bothering with that?
> 

I doubt it matters for alpha - I suspect you could just nuke ALPHA_LARGE_VMALLOC.
At a guess it was written way back when the biggest/fastest systems you could
get were alpha.

I was more thinking about about modern 64 bits systems where you might want
to run a distro kernel on systems with relatively small amounts of RAM and
others with 100s of cpu and multi TB of RAM.
I can well image workloads for the latter that might run out of vmalloc space.
In some situations even getting a command line parameter in can be hard,
so you might want it to be a systcl - even if changing that is what does the
update.
(Doing the updates in the page fault handler definitely sounds like a recipe
for disaster.)

Note that I've not looked at where amd64 gets the limit for mem_init().
Maybe it tries to 'guess' the correct value for the system.
But it is likely to be workload related - so allocating 8K for every 8G
of physical memory (one option) may be wasteful.

	David
