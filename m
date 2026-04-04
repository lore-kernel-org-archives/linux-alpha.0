Received: from smtp-2.orcon.net.nz (smtp-2.orcon.net.nz [60.234.4.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE64D17736;
	Sat,  4 Apr 2026 01:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.234.4.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775267561; cv=none; b=jjJ2GBuCoRo9ZBwDTnbRHhcN86AeypDtKkWLknekW9yK3wKsTy746TrRWSlUhVwmnLPpozEgIjGIPDKKflfTLOLVpwCWyJ3pyugPmya3nwbTiN0iOgU3LS2c23ASeXE5ogu/PpIDB+LtGfO6OQZ8Xp+6bs3y+7X+h8enKeWYXC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775267561; c=relaxed/simple;
	bh=vFPecpLdEX4b/QcwytR03KKL2k3x6B8TGsXEuHAEb6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iu6jC3MYD+wHHvekvBKMtS9NyGNElj3RPVFqdGU8xnS9vWe/EIFErtDy48w+X3NkEn59tv1UOBL5/sQwiY9ZloA9Cw4mEiNFFG8S/Ew4+s7uuxWIIsRxdH/wVkKReDqNpsxf1Ubop5tg+Q9vULz7N7dNb104XY+KXVvE1YMbH4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz; spf=pass smtp.mailfrom=orcon.net.nz; dkim=pass (2048-bit key) header.d=orcon.net.nz header.i=@orcon.net.nz header.b=mA7MDk7+; arc=none smtp.client-ip=60.234.4.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orcon.net.nz header.i=@orcon.net.nz header.b="mA7MDk7+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=orcon.net.nz; s=s1; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xwOBfy1/uO6y9VN5Adr/oFgn1RRflcvLWkZWSww4kxQ=; b=mA7MDk7+onHa1xQdBaiIKAtxmN
	7OtIVuS6GuHwJs8A/oxSGlNkQcbrhNjKKXoxUv9FisxsWdmmzQgxGRZdREtX0HBw8lKHQm71CA3xs
	DLkaqcm63WDIss737o92mi4CNtqe9dqB2GjbJgbYNTnZu2K0GkWGtIqRPcyiIgpaOqiTO6McJnAaF
	CNylISqoqi9+aupaA6K1Gt56/COO7QBNbKHVYO8I+kvY3JHGEjYyKy/kubkFfdRU1Ox9dLn+ZSd1x
	zCMallXruXHYe+Yzt57sZn173r0TY06To+BemP4HZ5+Ih9ln3uiBOn5hZ9JdEl5NuTZMYa99uRr+1
	vcdi2kMQ==;
Received: from [121.99.247.178] (port=26452 helo=creeky)
	by smtp-2.orcon.net.nz with esmtpa (Exim 4.90_1)
	(envelope-from <mcree@orcon.net.nz>)
	id 1w8pvv-0002aN-Am; Sat, 04 Apr 2026 14:36:19 +1300
Date: Sat, 4 Apr 2026 14:36:14 +1300
From: Michael Cree <mcree@orcon.net.nz>
To: Matt Turner <mattst88@gmail.com>
Cc: Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alpha: Add ARCH_HAS_PTE_SPECIAL support
Message-ID: <adBrDoaNR8O8_hbG@creeky>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260403150048.488266-1-mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403150048.488266-1-mattst88@gmail.com>
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --

Hi Matt,

On Fri, Apr 03, 2026 at 11:00:48AM -0400, Matt Turner wrote:
> Add _PAGE_SPECIAL using bit 19 (0x80000), which is unused in the Alpha
> PTE layout. This enables pte_special()/pte_mkspecial() for marking PTEs
> that are not backed by struct page (VDSO mappings, zero page,
> io_remap_pfn_range, etc.).
> 
> Include _PAGE_SPECIAL in _PAGE_CHG_MASK so it is preserved across
> pte_modify() calls.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig               | 1 +
>  arch/alpha/include/asm/pgtable.h | 5 ++++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index a5feb98cc088..a29788e588ee 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -8,6 +8,7 @@ config ALPHA
>  	select ARCH_HAS_FAST_MULTIPLIER
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
> +	select ARCH_HAS_PTE_SPECIAL
>  	select ARCH_HAS_UBSAN
>  	select ARCH_MIGHT_HAVE_PC_PARPORT
>  	select ARCH_MIGHT_HAVE_PC_SERIO

On what kernel does this patch apply?  My master branch has none of:

ARCH_HAS_FAST_MULTIPLIER
ARCH_HAS_GCOV_PROFILE_ALL
ARCH_HAS_UBSAN

and they don't seem to be added at all in the other patches you sent.

Cheers,
Michael.

