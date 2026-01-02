Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491762BE032;
	Fri,  2 Jan 2026 17:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767376663; cv=none; b=u9IamHcGxtj7Pez3cS3ILeS03sL48t2hUStHH2kMfXilCPIa7VOkkXnYFFmG9G8p+7Iygcq4+DVkaCYaV0T4toB7WX3sFyHz5h99J+tB6EH6jhT3bqnjcKe9CkjTw/id0EJpNjlMZ1l94kFDI7z4uk3Q5fnLBPGzfIPmXEf8UtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767376663; c=relaxed/simple;
	bh=GiSbcKxrAmV0G+Kt+o12ogSk6FQxIlfii5A5KJVZzJE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oxM1dpANHRqPDX9sWC5P/TICAP6rX5DoPrytSFC4YWMXsl0lSw5jq5gp8jG/cChENI3WMwq0xXhv2R+6TyaZ4GwltHKztwDMSroakTpCf5vup+bEbizSg3fPbnUN3aWIBWCeyhRCsmqzxCI8xurQjuXKW+iZmGY4Fhs1PllmrwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=pgdO7ukh; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="pgdO7ukh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=RnWdCnZbwuJv7oBmonEXgzxHs6GfFVlPyl6oNqHN1EY=; t=1767376659;
	x=1767981459; b=pgdO7ukhDXsq46MEA68DF8Z9h4jsk0LY5veLS9DOpj+dHt0ZfUvnbLmDmGlkj
	/vNBzXmPE+3q9ZtM3qwENqgK5mU1ZI//cOCsLCXj6C+lAvbOEpvlfspEOi3hMxK2NLVuf+CmXEMEP
	ChsAigbvb3DWj4E4kRnBjz3Blm5+FL0jcI5L8sIDxluqlE2OM8l//q8+nbh+dzi85TDIR2yWUEnqk
	poj+1C9PjSvH6kaV1rOkKCknHaPINhoyC46TS97LKV7PJVzUDGajPqWC/IvQwOOF/Pz00AJ+UyKqo
	roelHmKFTx1py9FEdAviFGZOo9N5CDXD7imMDnT6cuUxJTkNFg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vbjOz-000000045qU-1Q9N; Fri, 02 Jan 2026 18:57:29 +0100
Received: from pd9f74064.dip0.t-ipconnect.de ([217.247.64.100] helo=[192.168.178.52])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vbjOz-00000001ccn-0Qb7; Fri, 02 Jan 2026 18:57:29 +0100
Message-ID: <63b2087350d6990f0e348a8028f006924363c5d0.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 0/1] alpha: fix user-space corruption during memory
 compaction
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	hch@infradead.org, macro@orcam.me.uk, mattst88@gmail.com, 
	richard.henderson@linaro.org, ink@unseen.parts, Michael Cree
 <mcree@orcon.net.nz>
Date: Fri, 02 Jan 2026 18:57:28 +0100
In-Reply-To: <20260102173603.18247-1-linmag7@gmail.com>
References: <20260102173603.18247-1-linmag7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Magnus,

On Fri, 2026-01-02 at 18:30 +0100, Magnus Lindholm wrote:
> This patch fixes long-standing user-space crashes on Alpha systems
> when memory compaction is enabled.
>=20
> Observed symptoms include:
>   - sporadic SIGSEGV in unrelated user programs
>   - glibc allocator failures (e.g. "unaligned tcache chunk detected")
>   - gcc "internal compiler error"
>   - heap corruption detected by malloc consistency checks
>=20
> The failures occur only when page migration / compaction is active
> and disappear when compaction is disabled. They affect both UP and
> SMP kernels and are not specific to a particular Alpha CPU model.

Wow, thanks for fixing this! This has been indeed a longstanding issue and
seeing it fixed would be great.

I'm CC'ing Michael Cree who has been observing the issue as well and could
help testing your series.

I'll try to test your series as well.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
