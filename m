Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DC42773D3
	for <linux-alpha@vger.kernel.org>; Sun, 30 Nov 2025 11:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764502355; cv=none; b=ktZFNDXWol4lqTVeYlYVKreqQ4GiOY0AxqxqdhtwKMsrz3KVvBpT7ZG2JSqkRUfae9kxeAQMK449ujateJzs1eF7qvw463oXihbGRUYqH4trEYp08Wuzvvr8iu8B9dKIndMxKWA3xRDSuSD/ddtc8vIMZ3KTuJ0ylX8jw0kiiAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764502355; c=relaxed/simple;
	bh=HMRbl/ozQsrYY90NlFmA5gVK8UM/03vWffeBhmrICqk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k1Kts9Jmqe/PJeKZN5TxGksqKAg9euFfE4rSBBsmbsAk5Z+OFLCN+Ojnq8CsQOFqC8L9Af88fRi08WCVhnzF1c5T0EMfNuj+kFxqshgBUtuB5Uto+HzBsFXeyo7Tz2+Ci5dMvFSrOzlgoIo8JmTWQjfeCdAhsar63Prbc4n4hfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=Fe+6TaUQ; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="Fe+6TaUQ"
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight@runbox.com>)
	id 1vPffG-004aJe-Ks; Sun, 30 Nov 2025 12:32:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
	bh=AOYHCzYNL4IW5t7SZZIqadgltwGQwxY9WRxQSDt5CGo=; b=Fe+6TaUQl1tgB7LkFOGd/TPUBb
	48vqLZdA+0z2SvwylZj6S40Jz9eB4MgI4piGqjaN/PaPOjdbaw+A8r1KJoQgf5w5recbeDL3zljbP
	rXGiao4q4/U2/zkDKODDKo3KqrnYXdF5aiIX7rOQnWJFM4NthXqLtaKpPBye/pql+cIkF7MaWHmno
	n0zEmVgdbHTA7zDrfI1Xorl3nIKMzbdZ80bLsbxAElzvMdqtfUpeUf3ppIOW1s++SAO4QFvL8WL66
	UhAGcNxz4CTA+j8BLsFcgia4ZT4di0iEjGb9csrlyu+k3beNl66A5JlDSUhHumDlBsWUh32+dJ5xf
	K9WUkOgA==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight@runbox.com>)
	id 1vPffF-0000ec-W2; Sun, 30 Nov 2025 12:32:26 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vPff5-0051X4-CY; Sun, 30 Nov 2025 12:32:15 +0100
Date: Sun, 30 Nov 2025 11:32:13 +0000
From: david laight <david.laight@runbox.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org
Subject: Re: [RFC][alpha] saner vmalloc handling (was Re: [Bug report]
 hash_name() may cross page boundary and trigger sleep in RCU context)
Message-ID: <20251130113213.40c8e7a0@pumpkin>
In-Reply-To: <20251130030146.GN3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
	<20251126185545.GC3538@ZenIV>
	<c375dd22-8b46-404b-b0c2-815dbd4c5ec8@huaweicloud.com>
	<20251129033728.GH3538@ZenIV>
	<20251130030146.GN3538@ZenIV>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Nov 2025 03:01:46 +0000
Al Viro <viro@zeniv.linux.org.uk> wrote:

> On Sat, Nov 29, 2025 at 03:37:28AM +0000, Al Viro wrote:
> 
> > AFAICS, 32bit arm is similar to 32bit x86 in that respect; propagation
> > is lazier, though - there arch_sync_kernel_mappings() bumps a counter
> > in init_mm and context switches use that to check if propagation needs
> > to be done.  No idea how well does that work on vfree() side of things -
> > hadn't looked into that rabbit hole...  
> 
> BTW, speaking of vmalloc space - does anybody object against sorting
> CONFIG_ALPHA_LARGE_VMALLOC out, so that we wouldn't need to mess
> with that in alpha page fault handler?
> 
> Basically, do what amd64 does - something along the lines of (untested)
> patch below.  Comments?

How difficult would it be to allocate the pte for the next 8GB on demand
inside vmalloc(), and then propagate it to the per-task page tables.
That is a path than can sleep, so being slow if it needs to synchronise
with other cpu shouldn't matter - especially since it won't happen often.

That should be moderately generic code and would let the vmalloc limit
be 'soft'; perhaps based on physical memory size, and even be raisable
from a sysctl.

Likely more use for very large x86-64 and arm-64 systems than alpha.

	David
