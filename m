Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739D52F8BF5
	for <linux-alpha@vger.kernel.org>; Mon,  8 Sep 2025 13:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757337847; cv=none; b=U+UuILf/AGxgaunKv7TejE1uvay0KdxK4bgKC8tEp46gVqPREvBzWnqM6m+NDkQ1cajHlWrftbgUFv0NJB2meSQB2pY3Qhk11yKKv8NBWJNq2dw55mRhUxnyrZWm1uz91GO7HkQU0UWBNu+z4HMIj04cPQTjJthnYEMJxbxiHYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757337847; c=relaxed/simple;
	bh=EPd83UltdMGvJmPx8SdONg4LzaYmS95mYdOCMO52T7s=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QG8mqmVx2x07nJ9IQrq9BAaqBEsg3/3kxewuHwK5GsArEf5ihvnkJvQQrH3voeHMmZxvkxrS0X94H6n36oSrsKZHWW7/jq+DEug3tJGZfsQ5l1GaHulrxiZezjh1m782qLFUDWj9+qonFFb4rTef9uexqkdb/P5etaisqY0fod0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wLfdSojr; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wLfdSojr"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757337832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EPd83UltdMGvJmPx8SdONg4LzaYmS95mYdOCMO52T7s=;
	b=wLfdSojr2Onwr2QVHTO6IRzsZ4wRt0qp54X2B4gao0AsAvEfSRXBAfuK5Uyi9ofzFBIlF0
	MuIajks6at1aYwOYpE/bVO2EAjhNgpCEOQvW34+J0y6z0zZdpRNpaJo3b5QKRBvIOOtN/z
	YlNkJAeS6KdKNo3MednL0G4CiJAVKIg=
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH RESEND] alpha: Replace strcpy() with strscpy() in
 setup_arch()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <CA+=Fv5QdP-qGjUXQZ4ig1RX=0zx5c11gdrvwT9gqXNqTTqSZvA@mail.gmail.com>
Date: Mon, 8 Sep 2025 15:23:40 +0200
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>,
 linux-hardening@vger.kernel.org,
 linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <99A381BA-47F7-410E-AC3C-D6EFA298DD5A@linux.dev>
References: <20250817231753.633899-1-thorsten.blum@linux.dev>
 <CA+=Fv5QdP-qGjUXQZ4ig1RX=0zx5c11gdrvwT9gqXNqTTqSZvA@mail.gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Magnus,

On 30. Aug 2025, at 21:11, Magnus Lindholm wrote:
> It can be a bit controversial to replace the platform specific string
> manipulation functions with a generic interface. On Alpha, there is =
nothing
> (at least to my knowledge) that indicates that strcpy is broken or =
used in
> an unsafe way and hence this patch doesn't really fix anything.
> In my opinion, I think this should be a NAK.

My patch doesn't fix anything, it simply replaces the deprecated
strcpy() with the safer strscpy(), without introducing any functional
changes.

I'm not sure whether the platform-specific strcpy() has any performance
benefits over the generic strscpy(), but setup_arch() is already using
strscpy() (converted from strlcpy() [1]) to copy the COMMAND_LINE string
to 'command_line'.

The current code feels unnecessarily inconsistent, with one line using
strscpy() and the next using the platform-specific strcpy().

Thanks,
Thorsten

[1] =
https://lore.kernel.org/all/20220818205936.6144-1-wsa+renesas@sang-enginee=
ring.com/

