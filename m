Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A3E219319;
	Sun, 30 Nov 2025 20:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764534674; cv=none; b=J/Q3ae9Wo+PjCCm1Y9atBLhIFsmqO18q9Wl7MWcbTi1A09qiklQvM19cawCIZGZ0FX5XNGy29peW+MjtmIao13UaK5ZcVHsnQsle8jUVlHjHghCmadRE6w1eP8jRqSjNOiXTo21V/0jJL9cBCd/UuxugzPOnKzWXGHGCp6Mwc38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764534674; c=relaxed/simple;
	bh=BoIo9kFUPP0IAhQRuoXbhI3ELG9xtqL1YwhXrqDefos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8wMc//5lNchzIf+hpgAr6qqnTiYGYpuQCiOeBZ4tBim54pXr2BiKx7IIBc2NAUojI/7+Y7/3hmXNYXndzw5NInaKRLQvNI1KNZbVQCYE4FDJE8eCwoXFrT23y+AcPaqL+UEYojEF25oh3yBxWnS+wnVYKiPVhTyWiwWZlSUjdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=bCdapMnY; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="bCdapMnY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PzGIbtyf4uypqKnERTUX+BxAGcXLaiND7k9n/IPFZIk=; b=bCdapMnYT5uevbv4N0JalnY/Dt
	6jOLcg+QfJj6cOpH8DdtSQpY3KWu9OyjzGVEf4f0QiOauvmo8dRZOmQ14zLlAjuGoYhY4z7ovKsd3
	guBykyMIIqW9XVb/5/OxhdpEqc/2WEV3HuvV4/q8tqRX+ilxweQEpFr26czhzABAHHOBL+QL98Sjs
	H0JpKxUi16TotiVWYyjyHqoIfr8H2fWw4GcsiFx7ZUiMFYa7kQ/muhLXbVeI/J6w3AI/qEu5rj46K
	+Szxejg03Z+8MYhnTD/jpCzhmjxu5qmwApZhsSze41DmZWWFsZo9xRSnTwUyuGBPHWjITZaXjbSI2
	FivLok6Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vPo4k-0000000F1yA-2jlj;
	Sun, 30 Nov 2025 20:31:18 +0000
Date: Sun, 30 Nov 2025 20:31:18 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: david laight <david.laight@runbox.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-alpha@vger.kernel.org
Subject: Re: [RFC][alpha] saner vmalloc handling (was Re: [Bug report]
 hash_name() may cross page boundary and trigger sleep in RCU context)
Message-ID: <20251130203118.GW3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126185545.GC3538@ZenIV>
 <c375dd22-8b46-404b-b0c2-815dbd4c5ec8@huaweicloud.com>
 <20251129033728.GH3538@ZenIV>
 <20251130030146.GN3538@ZenIV>
 <20251130113213.40c8e7a0@pumpkin>
 <20251130164348.GV3538@ZenIV>
 <20251130190331.40385ddc@pumpkin>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130190331.40385ddc@pumpkin>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sun, Nov 30, 2025 at 07:03:31PM +0000, david laight wrote:

> (Doing the updates in the page fault handler definitely sounds like a recipe
> for disaster.)

See the comments in arch/x86/mm/fault.c regarding the need to do it in
#PF on i386.  Basically, you have

CPU1: does vmalloc(), needs to grab a new slot in top-level table.
Updates the page table tree for init_mm (rooted at swapper_pg_dir).
Starts propagating that change to other threads.

CPU2: does vmalloc(), which grabs another address in the range
covered by the same slot.  It works with the same page table tree,
so it sees that slot already occupied, inserts a new page reference
into the page table hanging off it.  No top-level changes to
propagate, so it returns the address it has grabbed to the caller.

CPU2: caller of vmalloc() dereferences the returned object.
If propagation from CPU1 has not reached the top-level page table
CPU2 is using, the top-level slot is empty and MMU of CPU2 raises
#PF.

BTW, it might be possible for two parallel allocations to grab two
areas, each requiring grabbing its own top-level slot ;-/
It certainly can happen on x86 - two vmalloc(SZ_4M) in parallel
will do just that, but with NUMA you can get it 64bit boxen
as well.

So simple generation count on root page table won't solve it either...
