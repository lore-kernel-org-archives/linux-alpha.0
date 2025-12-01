Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366D44C6E;
	Mon,  1 Dec 2025 04:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764561602; cv=none; b=D5GcNftIQaZH5DFZX4n+oXU9Z/e/CRtsGJ5PpNGbQIrXtFEkvkqbXVhKcCSL7bR9UI6SMLJJ3e2fzeQ9OoVNj0T8Yo8iXE23QYvLeBu1um8omFopqufypVImvGhBThJfzKw3wV04x+mLE8UAVF8I/KivNLJjs7Agf2wNuMtfxYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764561602; c=relaxed/simple;
	bh=q8OmWj+cGs4hpesLRdDPlKRwhG3LYL13ddtt3+1/IjU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MEN+2Q0DvLdo6sfTpyqSTLH6yH51EEKmUK8V2V3L4F3jYDKG3jH8ZZWUMgp+MH7Pqi43R8cmMsNBC07ZhQUHarDVN2keCEGiDO70sXDEw8FdePeWhMRh5wgiqU1IN2vaklkDF34u6xV5qC8QArtyAww8Mh41/pBkUG1H446Ww9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (2.8.3.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::382])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2C868340E18;
	Mon, 01 Dec 2025 03:59:59 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Richard Henderson <richard.henderson@linaro.org>,  Matt Turner
 <mattst88@gmail.com>,  Stian Halseth <stian@itx.no>,  Magnus Lindholm
 <linmag7@gmail.com>,  linux-alpha@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alpha: don't reference obsolete termio struct for TC*
 constants
In-Reply-To: <alpine.DEB.2.21.2512010346580.36486@angie.orcam.me.uk>
Organization: Gentoo
References: <99f1a93cf8cd4f0ece8611be2860677084663aac.1759359610.git.sam@gentoo.org>
	<alpine.DEB.2.21.2512010346580.36486@angie.orcam.me.uk>
User-Agent: mu4e 1.12.13; emacs 31.0.50
Date: Mon, 01 Dec 2025 03:59:55 +0000
Message-ID: <871pleyhqc.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Maciej W. Rozycki" <macro@orcam.me.uk> writes:

> On Thu, 2 Oct 2025, Sam James wrote:
>
>> Similar in nature to ab107276607af90b13a5994997e19b7b9731e251. glibc-2.42
>> drops the legacy termio struct, but the ioctls.h header still defines some
>> TC* constants in terms of termio (via sizeof). Hardcode the values instead.
>> 
>> This fixes building Python for example, which falls over like:
>>   ./Modules/termios.c:1119:16: error: invalid application of 'sizeof' to incomplete type 'struct termio'
>> 
>> Link: https://bugs.gentoo.org/961769
>> Link: https://bugs.gentoo.org/962600
>> Co-authored-by: Stian Halseth <stian@itx.no>
>> Co-authored-by: Magnus Lindholm <linmag7@gmail.com>
>> Signed-off-by: Sam James <sam@gentoo.org>
>
>  FWIW, the documented tag for co-authors is Co-developed-by: and you're 
> supposed to collect corresponding Signed-off-by: tags from each of them 
> too.  Cf. <Documentation/process/submitting-patches.rst> and the examples 
> there.

Thanks, though I'd say I was more being gracious here and that it's not
strictly required to have them here at all.

Anyway, Magnus, I can resend with just my Signed-off-by (and nothing
else) if you like, or can you do that in your tree?

>
>   Maciej
