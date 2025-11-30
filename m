Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB27B27FB1C;
	Sun, 30 Nov 2025 16:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764521023; cv=none; b=ggGQKyjF7Pnt4pOhXqXMA/DJQwbCT+h4ft9l2sYjCG2+DXynXeR1YU2XlniRj4MMR8yYP2G0vz4SzKeEHuY1kl6Y50D7H6vyJT1tGRf8WOydEkXdeRTve9mvJMkPkDSyWrQevxRNK2LBDorFckrQsp6VS2FZhC/5wl/H38vaeJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764521023; c=relaxed/simple;
	bh=TEp6uPvGpzvvWaNwiaYamHslIOdjwDSQltKULtldaSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBPKuBQJ1SinpgX7U+byiRqY/mezvuptUmGu5uTQqvcpHhTbVFLP1bWvB6nNMnjkNb2hVDH2HcMgpGi4xoN29iAssmSkTs9Iy9NMZNqpCnITo7a/zkeV1HAL/U5Rc/X0UMaZyiyR8V/ALPd2totQpvKdEZuF5+ktWoxFlCvgSbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=HpNXuYeZ; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="HpNXuYeZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6TQMOQpqW8krGAHNp9tR8czsOrAsd6ZBsxnO6QRI/Ns=; b=HpNXuYeZo0kYZQOCGgq6FzNrRj
	JAyLOPcOzLE6pPZPH5OwI0lMoZpoNfRElK9IBD0C8ELiKmjaa8VFl6UQHry+OkV1hh9BD25mPrfs6
	Mb9B2Lpfwuty8QhaGjWlzAzHMy5YFP3CmRf6oVaR2+ZOVK+P5ssFA1J1sGrnYd1dh1YBPBuU7mRQf
	AE6ZwC8XWApOmAi+EOWX/jtHT7smdIbxCZYIbJpLji+DD3Ps0p+Us5YAvWQNae1A7w/qO8IJUB5Nd
	2Io+JAc8nsBDbjVHf4CYH8bbtN70dFeumER2EG8zrmAqTTrIYZWmvx2HjPd3kZEPK1rI65jSmsyqd
	LXsZDdYQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vPkWa-0000000AnW0-12ga;
	Sun, 30 Nov 2025 16:43:48 +0000
Date: Sun, 30 Nov 2025 16:43:48 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: david laight <david.laight@runbox.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-alpha@vger.kernel.org
Subject: Re: [RFC][alpha] saner vmalloc handling (was Re: [Bug report]
 hash_name() may cross page boundary and trigger sleep in RCU context)
Message-ID: <20251130164348.GV3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126185545.GC3538@ZenIV>
 <c375dd22-8b46-404b-b0c2-815dbd4c5ec8@huaweicloud.com>
 <20251129033728.GH3538@ZenIV>
 <20251130030146.GN3538@ZenIV>
 <20251130113213.40c8e7a0@pumpkin>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130113213.40c8e7a0@pumpkin>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sun, Nov 30, 2025 at 11:32:13AM +0000, david laight wrote:

> How difficult would it be to allocate the pte for the next 8GB on demand
> inside vmalloc(), and then propagate it to the per-task page tables.
> That is a path than can sleep, so being slow if it needs to synchronise
> with other cpu shouldn't matter - especially since it won't happen often.
> 
> That should be moderately generic code and would let the vmalloc limit
> be 'soft'; perhaps based on physical memory size, and even be raisable
> from a sysctl.

Considerable headache and pretty pointless, at that.  Note that >8G vmalloc
space on alpha had been racy all along (and known to be that); it was
basically "could we squeeze more out of khttpd" kind of fun.

Do we have realistic vmalloc-crazy loads with high fragmentation of vmalloc
space and total footprint worth bothering with that?
