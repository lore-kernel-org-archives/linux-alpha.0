Received: from smtp-3.orcon.net.nz (smtp-3.orcon.net.nz [60.234.4.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB42C212566;
	Sun, 14 Jun 2026 02:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.234.4.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781403756; cv=none; b=pneDK++dFgQduP56ms4v/V2JadbwtoK8IiZJSageRzpQEWc6Vnqeu/GF0/Mgz7RJNMi6Z3lC8nV2IgecxTGnrUcj+GG3t3I7NmCeLltgIhf7uay2p9/LPwms584H44LoXFJWoMZtV6SfyCMiAP5GtXS6qCI1RangUl5uWRqHzDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781403756; c=relaxed/simple;
	bh=v/+NupT1tX8UuyPxdFZ6ESTy3ZuqZcSbCDJ6JvaDy5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3Sg/IuDefzcqVjJ7MtU3PF9e8OXbYsCKr0IxLsUApalSYFAFwrT4OlFe/OFIKM8WscqwABUgSeHVbpqRgDJe/TXHbDvJ5qAM7qDt8K8Ovn7yP7F6SheMyOiYrE3f+XbXnGnZq1TG+u4rqoEp0RjYexVcJsWZBZoiQ0ds92tEVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz; spf=pass smtp.mailfrom=orcon.net.nz; dkim=pass (2048-bit key) header.d=orcon.net.nz header.i=@orcon.net.nz header.b=jyQ6ZAyW; arc=none smtp.client-ip=60.234.4.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orcon.net.nz header.i=@orcon.net.nz header.b="jyQ6ZAyW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=orcon.net.nz; s=s1; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Fv/T+krM1NU6y0WWahYchqiFV5uKIKb1LnSrxym/Wnw=; b=jyQ6ZAyW1eZnZvTTIf3lhurfRa
	cerVS2vXpGwSTSdEBAOiaVzwvF9VjzYh594kR0Q2Yf2wVKlMYMBbgxj3y8itJ2/GEXOmI81YmB05K
	jTIoQFL44WH/SprQzhfnBwy/5Jri1xr9KOo4OLnjmFo1SvqIi2NQwCuPB0Ew7AE4eAbQRQ25uPyju
	/k8JTCFVaII6jYLDXscK+96yCAvZe873Fumtyg/diY/WXXgjw1tLmLCM7pmBE4+/Z//dLI2qUC+CW
	PNCyxYqg72Cw0odRk1AeDRx0qaL7fQhKZTjn6My3sfK2m/79rKpuCi2vcC8u7kasuEMKyGA4JRP9v
	pBYRhxmQ==;
Received: from [121.99.247.178] (port=58657 helo=creeky)
	by smtp-3.orcon.net.nz with esmtpa (Exim 4.90_1)
	(envelope-from <mcree@orcon.net.nz>)
	id 1wYZoR-0005R7-BA; Sun, 14 Jun 2026 13:38:59 +1200
Date: Sun, 14 Jun 2026 13:38:54 +1200
From: Michael Cree <mcree@orcon.net.nz>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, mattst88@gmail.com,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	glaubitz@physik.fu-berlin.de, ink@unseen.parts, macro@orcam.me.uk
Subject: Re: [PATCH v3 0/8] alpha: enable generic entry infrastructure
Message-ID: <ai4GLtp1Iaqz_aVK@creeky>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
	Magnus Lindholm <linmag7@gmail.com>, richard.henderson@linaro.org,
	mattst88@gmail.com, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de,
	ink@unseen.parts, macro@orcam.me.uk
References: <20260612203006.2265557-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612203006.2265557-1-linmag7@gmail.com>
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --

On Fri, Jun 12, 2026 at 10:26:48PM +0200, Magnus Lindholm wrote:
> This series moves Alpha closer to the common architecture infrastructure
> and enables GENERIC_ENTRY and GENERIC_IRQ_ENTRY. This is v3 of this patch
> series, please see below for changes since v1 and v2.

I am seeing sporadic Xorg crashes with this patchset applied to a 7.0
stable series kernel, usually within a minute of logging into the
desktop. The rest of system keeps running fine and there are no
messsages in the kernel log.  I am testing on an XP1000 with Radeon
HD4350 graphics card.  The same kernel without this patchset works
fine -- no Xorg crashes.  Indeed, it has been playing the dulcet
tones of Pink Floyd through my sound system for the last hour without
a problem.

Example Xorg backtrace follows.  In this case it is a fp exception
but sometimes it is a segfault:

[   307.748] (EE) 
[   307.748] (EE) Backtrace:
[   307.750] (EE) 0: /usr/lib/xorg/Xorg (xorg_backtrace+0x7c) [0x12022b3dc]
[   307.750] (EE) 1: /usr/lib/xorg/Xorg (0x120000000+0x230ae8) [0x120230ae8]
[   307.751] (EE) 2: /usr/lib/alpha-linux-gnu/libc.so.6.1 (0x20000720000+0x49e70) [0x20000769e70]
[   307.753] (EE) 3: /usr/lib/alpha-linux-gnu/libc.so.6.1 (0x20000720000+0x1a02e0) [0x200008c02e0]
[   307.753] (EE) 4: /usr/lib/alpha-linux-gnu/libpixman-1.so.0 (pixman_sample_ceil_y+0xbc) [0x200003472fc]
[   307.755] (EE) 5: /usr/lib/alpha-linux-gnu/libpixman-1.so.0 (pixman_rasterize_trapezoid+0xec) [0x20000347abc]
[   307.755] (EE) 6: /usr/lib/xorg/modules/libglamoregl.so (0x20003d30000+0x6c5bc) [0x20003d9c5bc]
[   307.755] (EE) 7: /usr/lib/xorg/Xorg (CompositeTrapezoids+0xb0) [0x12016a290]
[   307.756] (EE) 8: /usr/lib/xorg/Xorg (0x120000000+0x16fa04) [0x12016fa04]
[   307.758] (EE) 9: /usr/lib/xorg/Xorg (0x120000000+0x16a6c8) [0x12016a6c8]
[   307.758] (EE) 10: /usr/lib/xorg/Xorg (0x120000000+0x58578) [0x120058578]
[   307.758] (EE) 11: /usr/lib/xorg/Xorg (0x120000000+0x5d978) [0x12005d978]
[   307.760] (EE) 12: /usr/lib/xorg/Xorg (0x120000000+0x3f9b8) [0x12003f9b8]
[   307.762] (EE) 13: /usr/lib/alpha-linux-gnu/libc.so.6.1 (0x20000720000+0x2e490) [0x2000074e490]
[   307.763] (EE) 14: /usr/lib/alpha-linux-gnu/libc.so.6.1 (__libc_start_main+0xc4) [0x2000074e5d4]
[   307.763] (EE) 15: /usr/lib/xorg/Xorg (__start+0x38) [0x12003fa08]
[   307.763] (EE) 
[   307.765] (EE) Floating point exception at address 0x200008c02e0
[   307.765] (EE) 
Fatal server error:
[   307.765] (EE) Caught signal 8 (Floating point exception). Server aborting

Cheers,
Michael.
