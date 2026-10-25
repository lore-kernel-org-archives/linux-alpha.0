Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792963417;
	b=Bzbw0ntsMVlFlKFsbbeJkfiiQELsppjkPq5ZR7rYufyiSjsxTup/r6AzA0Vo6hjdH0Xg
	 DzxuPRxsG/0/qZG9X2GZ1Spv6/q9FLVv3uVm3IQepUhWCVY0D35o0ufv3gwAaTB85jsZ9
	 uUbsFN1ceVuZDZC2J2IpNoBn+Ifdv3bbPE9k0kwcsaradWR+FeRzbzSc9Z4aJs0vVrbFe
	 HfTleUdZd1Vv2vVitxvl83Ok18synRLD+nnKRgszRTu+pHXlNF5hmpjwweu3faICXwBn+
	 GbNZKe5Rz3fIqzhln/Pwsrk4ULkW5AXZVRUs45JDw6onj+Y3u08X9aeUz/6qWn3lOqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792963417;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-Original-Sender:
	 X-Originating-IP:X-ZEDAT-Hint;
	bh=kvsReDb1yu77SIToXXCZrJewGJEJwD+B5h3we0C+/1o=;
	b=PtmlyPu//iPa7UDBzo+5gSnW+MVak4j8dsTJKLJcQv/7Y3+K6cQONKZD6/Lo09dtaaDF
	 Jm/yiK/8hZcE14QvIv0Zd4B6EegukGQ71iMvrV6hDG2zmX+nup1FLiC09A+VYd34laAFs
	 jMG53vrvxbfRbHwh/Hx6N4rjdybcBKmMwOOeFojSQIjl5HKqDxkMDQXinn7UgaqSmzleT
	 s1LN3vmp0tlPCtdLiaaXU8WwdRhnzE3QdXdgh6SRgAVc827aHm3oXwoeBaQisIObBtZnz
	 YBIgvDedE1ZOhXOUpqn77yrjA/3edEO8ldkRq3RasmpWfGAkch2K1wAnGKn5g+rFqXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=physik.fu-berlin.de;
	spf=pass smtp.mailfrom=zedat.fu-berlin.de;
	dkim=pass header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=mPeobhC1;
	arc=none smtp.remote-ip=130.133.4.66
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D063606A31A
	for <linux-alpha@vger.kernel.org>; Sun, 25 Oct 2026 21:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D063606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=mPeobhC1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=kvsReDb1yu77SIToXXCZrJewGJEJwD+B5h3we0C+/1o=; t=1792963415;
	x=1793568215; b=mPeobhC1h0CBNt7rcuaO8rj0bLrS+gD2z6h/ixYJxO8K4YBZTVbwVGY0/C36s
	lxU+AAbsyD4TNrnBAMkH1R6gr/b+1pOQe0BaMGuXZaghEG01s2t6dSZLjZXSZE6Zk4x39BnqeeWN9
	S8LrrztugHnp9XVKpaaNO86EEwHZJToIOpf2sRJzftCGXb88Kul3A+50rOiGwqXX49XBlrTI4mwgj
	sLhEA3bKqcvarw7IBFdWmhiKsgQVzqN/pPhwKvwaFaRO/QGMIHBQDtCMQQSLAse9zJpizzp2bstPW
	eVUlOMiUSCKhFhwbRtn4VIAoW1Bd/IW+mLtO2eKNZZ3jRLp/5Q==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.100)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1xL5gi-00000000f48-32Hi; Sun, 25 Oct 2026 22:23:32 +0100
Received: from p5b13a90a.dip0.t-ipconnect.de ([91.19.169.10] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.100)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1xL5gi-00000001uQK-24Uz; Sun, 25 Oct 2026 22:23:32 +0100
Message-ID: <fb652fa753ac027924ea6626f23f99da3661d09a.camel@physik.fu-berlin.de>
Subject: Re: alphalinux.org has a wiki again
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Date: Sun, 25 Oct 2026 22:23:31 +0100
In-Reply-To: <20261025171857.8ed673bb5900@gmail.com>
References: <20261025171857.8ed673bb5900@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Matt,

On Sun, 2026-10-25 at 17:18 -0400, Matt Turner wrote:
> alphalinux.org has a wiki again: https://alphalinux.org/

Great job, thanks a lot!

> The old MediaWiki install was lost in 2012 when the server died
> without a backup. The new one runs on DokuWiki, and its content is
> kept in git at https://github.com/alphalinux/alphalinux.org-wiki-content

I assume you already checked the Internet Archive (archive.org) for
anything to recover, haven't you?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
