Received: from minute.unseen.parts (minute.unseen.parts [139.162.151.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7C81A9F97;
	Sat,  3 Jan 2026 14:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.151.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767449744; cv=none; b=D8pnth2Q0X1DZh9xIF/JyMgCgJxrwLkjjCL7nlj6YZT2dJ+ZA6AB6C1i923B00Xd01PFjBaHYgqIO4sfKMYPP3WEoz633CS3mxiS/qajHdbNHpTQjXlEmgr9AtkxOUlth9ChDsHtMFuNJv7wPjiEEQE1I51vrq39f5RbE0SarXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767449744; c=relaxed/simple;
	bh=QvsVwSMRdsX+MCxsA/cz8KFjmPGS+l504gw2Xw2ym4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Js/mVZIRnoIeOvMN0In1XzL5mRO4jNoUD//i4URefmLXKT5L+EetFotrafa/PlBbRq3wKvyv77z2wAyVhZ1PfuCWopxU/A0G+++gKlAbxywUq3FoGxF2/8UANwCrNuYYeBPom77KCQMpezM1gVzCjT71AoC5GDtn3kymmzr6Oj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts; spf=pass smtp.mailfrom=unseen.parts; dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b=OTKAKXCT; arc=none smtp.client-ip=139.162.151.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unseen.parts
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b="OTKAKXCT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=unseen.parts; s=sig; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oFRapdrqehBk/CXxycay7Vxr++XsNT2zax+iMTWzwZs=; b=OTKAKXCTmwJ2xakKXYq5rCL05H
	ptTJsLP+bprRrq+jdA03J7ap81TgCXTZ+sWOx4Eu4/ywXlr8+dNp7wPxXjC5aqdjVhihfGgt9KAzq
	siicX9c2ANnkFzKZIhsJZGe2cussYa+ss26p3FNV8RJLIME3xfut8zTnQ8wPC6BU5D/l5gGGJd9FG
	W30HJTIqdwP1R+9Mw1zWIwpYBggYZGoXNtYZYI5LuJhh3KzNxvanzbgQ1z0CjTNeogC7k38bvuq5t
	7X9PlRYrP/RhDXbl+e7Z+TpcbgYm7lB/8qUeWyhP/6rBg3CzlBYmwxh7ki35cjekRvEIR4IxIutVJ
	3FoTpRGw==;
Received: from minute.unseen.parts ([139.162.151.61]:60270 helo=minute)
	by minute.unseen.parts with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <ink@unseen.parts>)
	id 1vc1t3-0004Ld-3C;
	Sat, 03 Jan 2026 14:41:45 +0100
Date: Sat, 3 Jan 2026 14:41:44 +0100
From: Ivan Kokshaysky <ink@unseen.parts>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	hch@infradead.org, macro@orcam.me.uk, glaubitz@physik.fu-berlin.de,
	mattst88@gmail.com, richard.henderson@linaro.org
Subject: Re: [PATCH 1/1] alpha: fix user-space corruption during memory
 compaction
Message-ID: <aVkcmDm1z5PGZNg6@minute>
References: <20260102173603.18247-1-linmag7@gmail.com>
 <20260102173603.18247-2-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102173603.18247-2-linmag7@gmail.com>

On Fri, Jan 02, 2026 at 06:30:43PM +0100, Magnus Lindholm wrote:
> Alpha systems can suffer sporadic user-space crashes and heap
> corruption when memory compaction is enabled.
> 
> Symptoms include SIGSEGV, glibc allocator failures (e.g. "unaligned
> tcache chunk"), and compiler internal errors. The failures disappear
> when compaction is disabled or when using global TLB invalidation.
> 
> The root cause is insufficient TLB shootdown during page migration.
> Alpha relies on ASN-based MM context rollover for instruction cache
> coherency, but this alone is not sufficient to prevent stale data or
> instruction translations from surviving migration.
> 
> Fix this by introducing a migration-specific helper that combines:
>   - MM context invalidation (ASN rollover),
>   - immediate per-CPU TLB invalidation (TBI),
>   - synchronous cross-CPU shootdown when required.
> 
> The helper is used only by migration/compaction paths to avoid changing
> global TLB semantics.
> 
> Additionally, update flush_tlb_other(), pte_clear(), to use
> READ_ONCE()/WRITE_ONCE() for correct SMP memory ordering.
> 
> This fixes observed crashes on both UP and SMP Alpha systems.
> 
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>

Impressive work! Spot on, I guess.

Reviewed-by: Ivan Kokshaysky <ink@unseen.parts>

Ivan.
