Received: from smtp-1.orcon.net.nz (smtp-1.orcon.net.nz [60.234.4.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FC13EB0E1;
	Fri,  4 Sep 2026 20:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.234.4.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788555015; cv=none; b=njPfpsJQy8dxJfEHuWtK+NBgPDSXSJlqv5uOaE/jGLng8JQZYdshceXEmbNZFTkcIzG4Ur+0rDGkLqV4Ch1DyTh3UTp19f4Qz7leO47O2YZa8XgoUV6AAdIUq0FM8CT0GyVSFpHwxbyadqUjM+U7Fq3EWQ6sieL/81cv2Byq3F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788555015; c=relaxed/simple;
	bh=q3sT/7NLYSK+YosKu0lwb3CCp5iGf9nPr9gV2Dx4RhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdqIPT/CjuQqLGatHihLT9U83KhZB0P/8VrpEtWNsv5IAPq+iAod8wZhc5vUiTIfih6+LFDKz8Xlt1UkB7QF48WqWKfzQsBhogT54jYD/rjcBXu32ukUCnqd18zNk8PS/nARgWX7Fbag5xUYnh27H6tIfISKEawDaLcs7CHd4ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz; spf=pass smtp.mailfrom=orcon.net.nz; dkim=pass (2048-bit key) header.d=orcon.net.nz header.i=@orcon.net.nz header.b=myFvLMK2; arc=none smtp.client-ip=60.234.4.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orcon.net.nz header.i=@orcon.net.nz header.b="myFvLMK2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=orcon.net.nz; s=s1; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aucmUszGhwmkxiVnJXHQpW3iZUeWbNF56eQvXm/0nwE=; b=myFvLMK2N/QSJKZLcMpFUxdxMP
	K47tzFSkq1OKyEDNWyWAPBNLyx0xSH0IYD5hAfxcucvKZInSn5OCN1lD5zoWYOlfyHQ/HG3uqb6xX
	gC2VZNp6IcSvHZMggzyacfbAXVR/XkUfM5yWjBKSNlnbFhlmBZTld4fT7HCUF9Yl6Ukfa0YmP09Gj
	yeNUEJMq3Zt9gx1lpdtgLfnkfKXgLEX/Wq8qWTHQYK6+aFF82hG8zUhPsmzR9IoWJdropavu2rFLl
	ND38FvpjJfuwdkFasY8hyy3ywjBr04+2cYkqOG0yZA7HTuof5HPyLfQbvTZ5B+4noyUH/Jh3sPtoO
	bejMkbOQ==;
Received: from [121.99.247.178] (port=30429 helo=creeky)
	by smtp-1.orcon.net.nz with esmtpa (Exim 4.90_1)
	(envelope-from <mcree@orcon.net.nz>)
	id 1x2aZJ-0002HX-TQ; Sat, 05 Sep 2026 08:31:26 +1200
Date: Sat, 5 Sep 2026 08:31:20 +1200
From: Michael Cree <mcree@orcon.net.nz>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/24] alpha: select ARCH_HAS_UBSAN
Message-ID: <apsqmKw1pLmOXVgg@creeky>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org, linux-kernel@vger.kernel.org
References: <cover.1788277742.git.mattst88@gmail.com>
 <61175f9015771b6a6d78624579ecc180f57d17e9.1788277742.git.mattst88@gmail.com>
 <CA+=Fv5TYnwcDLPvwScOcGq-7CUSs2bDMqrYEj-Lhf4XfQ=yTzA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+=Fv5TYnwcDLPvwScOcGq-7CUSs2bDMqrYEj-Lhf4XfQ=yTzA@mail.gmail.com>
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --

On Wed, Sep 02, 2026 at 12:34:50AM +0200, Magnus Lindholm wrote:
> On Tue, Sep 1, 2026 at 5:50 PM Matt Turner <mattst88@gmail.com> wrote:
> >
> > GCC's undefined behavior sanitizer has no architecture-specific runtime
> > requirements. Enable it for Alpha to allow UBSAN instrumentation of the
> > kernel.
> >
> I tested this patch on top of my rebased Alpha GENERIC_ENTRY patch on an
> AlphaServer ES40. The kernel built and booted successfully with
> CONFIG_UBSAN=y, and the UBSAN instrumentation is active.

So have I, on an XP1000 and ES45.

> CONFIG_UBSAN_ALIGNMENT did expose a misaligned struct bucket_table
> allocation in lib/rhashtable.c. This appears to be a generic rhashtable
> allocation-alignment issue rather than an Alpha UBSAN problem.

But in my case the kernel vomited copious misaligned access reports,
so many that it took quite a few minutes to boot and I lost much of
the kernel log before disks were mounted.  A few examples that
were recorded later in the boot on the ES45:

Sep 03 21:12:36 electro kernel: UBSAN: misaligned-access in net/core/dev.c:1401:2
Sep 03 21:12:36 electro kernel: member access within misaligned address (____ptrval____) for type 'struct net_device'
Sep 03 21:12:36 electro kernel: which requires 64 byte alignment

Sep 03 21:12:36 electro kernel: UBSAN: misaligned-access in kernel/signal.c:4362:4
Sep 03 21:12:36 electro kernel: member access within misaligned address 0000000058e1e939 for type 'struct task_struct'
Sep 03 21:12:36 electro kernel: which requires 64 byte alignment

Sep 03 21:13:04 electro kernel: UBSAN: misaligned-access in drivers/net/ethernet/intel/e100.c:1941:36
Sep 03 21:13:04 electro kernel: member access within misaligned address 000000001c866fa6 for type 'struct rfd'
Sep 03 21:13:04 electro kernel: which requires 4 byte alignment

Interestingly "kernel unaligned acc" in /proc/cpuinfo remained at
zero, which really makes me wonder whether these reports are all
false-positives.

This kernel was cross-compiled with: "alpha-linux-gnu-gcc (Debian
14.2.0-19)"

Cheers,
Michael.
