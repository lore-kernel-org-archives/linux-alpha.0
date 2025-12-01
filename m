Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB21FE45D;
	Mon,  1 Dec 2025 06:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764571246; cv=none; b=A4bOggEfHwdHIe6T6JLlswaoS3gKXSibpRm2gKzLfAn+WNfw0GvVUc1ODkynjUF2FIp5lvJHUPB/HsIgtMgnPhnAuzQ1A1THPnUlK4AvI9NoYo7vVRXBSpHfsNba0KtyxronnImdR22sVDECwr4iXdCWnnSDrFmSTo6hofL1u0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764571246; c=relaxed/simple;
	bh=H6KTxQ5EbsdRV4dFNLDyZmxs8floJXjtGSSC/omdkdU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AM4IzFMo0q+CMTdYR7euQNSauZNaeYLqGvi3hRvEJXxIEaNdvuWFq3LBjho+ptzSaR2g1yujZJatBpG640Herp/Sfmj/f0OebfFGhlOChFKk4TYwuWt6tKXUaR4dJhHz0ygsRi9IxVhWPmOWkwGeL1vOzKe1tqNDTiFFjVzdfr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (2.8.3.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::382])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4C1273410D6;
	Mon, 01 Dec 2025 06:40:43 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,  Richard Henderson
 <richard.henderson@linaro.org>,  Matt Turner <mattst88@gmail.com>,  Stian
 Halseth <stian@itx.no>,  linux-alpha@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alpha: don't reference obsolete termio struct for TC*
 constants
In-Reply-To: <CA+=Fv5QeyBDLXazGFreV6F65912nu=eEAQGoU00aaUO_7emPqg@mail.gmail.com>
Organization: Gentoo
References: <99f1a93cf8cd4f0ece8611be2860677084663aac.1759359610.git.sam@gentoo.org>
	<alpine.DEB.2.21.2512010346580.36486@angie.orcam.me.uk>
	<871pleyhqc.fsf@gentoo.org>
	<CA+=Fv5QeyBDLXazGFreV6F65912nu=eEAQGoU00aaUO_7emPqg@mail.gmail.com>
User-Agent: mu4e 1.12.13; emacs 31.0.50
Date: Mon, 01 Dec 2025 06:40:40 +0000
Message-ID: <87seduwvpz.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Magnus Lindholm <linmag7@gmail.com> writes:

>>
>> Thanks, though I'd say I was more being gracious here and that it's not
>> strictly required to have them here at all.
>>
>> Anyway, Magnus, I can resend with just my Signed-off-by (and nothing
>> else) if you like, or can you do that in your tree?
>>
>> >
>> >   Maciej
>
>
> Hi, Thanks Maciej for pointing this out. Sam, lets send it out again
> that way Stian can add his Signed-off-by tag as well

Sure.

>
> Magnus
