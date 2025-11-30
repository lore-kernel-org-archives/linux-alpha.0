Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66883213254;
	Sun, 30 Nov 2025 20:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764534771; cv=none; b=Bt4A179P9MHreUHnL8D8uyvwwoWA2baZFf+++OBJHRLw0FIp6SY9kDhmaDP18JHHd3uA+QryspCumOVhuyQP9pU6ep/lHD+txebQJP0DbxyUA7hp4tQD7GfAwtcmfSZdRWa06xbQBnvhQyMHfEq1FZyQWQlvPeX7g16NdQqZuOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764534771; c=relaxed/simple;
	bh=SG4laOmIYfaX0AulgAf4e+Z9d1ZTQsjEZOC+Us8Bu7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGOcPUCxgZyXPIy8tmYP/Vzj9sDbaVEUdT8Jbk8imgRlQduq5gXMSk/DMajQCF1fo0n6VA7M2LshR/2bQbp1syH3k5KZi3HNJi/SdaSpf55l0eK2HLI81JVetvzros0rADrcFCGFNddtKoo/9ygnVga4Guxb1ETFyVLgu0acskU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=ODsAOL0p; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="ODsAOL0p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SG4laOmIYfaX0AulgAf4e+Z9d1ZTQsjEZOC+Us8Bu7s=; b=ODsAOL0pgxUcMd5xFDQnqVBGul
	1txeQZrUZMLqGYQAxnqez8tYY0tANsGNWfSxQi2AgSBLa9ou9N1swildx7fWjPDZrsYrVz5WxNQfX
	SVza4ZDTyDpyaOos8uQ3e2deSVPjr1TDi+M03qexXYV5LQDo/yQw/exVaMBSADObuuC9ZgFvmQPta
	J7+1kI7Ntc9525z0MSCIXUbiR9ykmLzrpUIExeRGNNLOgAogK1omJWwxN6wkP79+QVG2R6bkLdqzm
	Woo8HOByXNeQxTyuqu5CZNg8y9U9kDlDn4D60JLMx7Uslawp+8Cpyr3nKT4bqdoFr379wq2o27LD/
	ZD+FMdWA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vPo6N-0000000F4H1-0jjX;
	Sun, 30 Nov 2025 20:32:59 +0000
Date: Sun, 30 Nov 2025 20:32:59 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: david laight <david.laight@runbox.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-alpha@vger.kernel.org
Subject: Re: [RFC][alpha] saner vmalloc handling (was Re: [Bug report]
 hash_name() may cross page boundary and trigger sleep in RCU context)
Message-ID: <20251130203259.GX3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126185545.GC3538@ZenIV>
 <c375dd22-8b46-404b-b0c2-815dbd4c5ec8@huaweicloud.com>
 <20251129033728.GH3538@ZenIV>
 <20251130030146.GN3538@ZenIV>
 <20251130113213.40c8e7a0@pumpkin>
 <20251130164348.GV3538@ZenIV>
 <20251130190331.40385ddc@pumpkin>
 <20251130203118.GW3538@ZenIV>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130203118.GW3538@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sun, Nov 30, 2025 at 08:31:18PM +0000, Al Viro wrote:
> It certainly can happen on x86 - two vmalloc(SZ_4M) in parallel

32bit x86, that is.

> will do just that, but with NUMA you can get it 64bit boxen
> as well.
