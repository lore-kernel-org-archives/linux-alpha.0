Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9212239BA0
	for <linux-alpha@vger.kernel.org>; Wed, 11 Dec 2024 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733913734; cv=none; b=ZfiTY+x7L3iZXVIMCb3xOSBdf9f6JlmSBeUkn4waWKuI6haW94rDxS2SY4w0iAK6wJsDCn5yOsRe9gy7Bm+msGj6TO6vGS6Rc0DAKQeo4IjzaoowZlskz543T3H6hsC1amhEKZeoou1KD4/QeAYKi7pNPkDQFrpc5Me+YF6kGiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733913734; c=relaxed/simple;
	bh=FPLwP94tvfnaOZZuqTW2n9DL0W6ejE+gSlaVu74MKTI=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=OzGMJrSz8u6/K+RAVauh65ypFjjfwuYPX53P7ijWBYY47h4TGZu9w5I/cV2F8Fy97E0mpTXimmGpzAfUmlz1iYbTM5+O7dPv6thVPyyc5me97rVVXsV+Eoh1u8ZomAT0N47/eybSwsNdWiAr2ddpGbh+qN1yJFm9GbbKFLr2loY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=L2s9w0pg; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="L2s9w0pg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g1YgB9/RaFivOGMDw1FVKg3LqVjQMbEYv5f1CbxCsOs=; t=1733913729; x=1734518529; 
	b=L2s9w0pgYzumLlISnZZkdaIekqFdzDkeDsVIpgYJ5jNhtonZRofKDBMIKAqRe+3GuZMOqWwzvcL
	sG1SYKWi/vuXeOX7qQG0P51nTmUUdE+JSJwPtQaZ28bIvb1AZyCROKmomkDZIRCV2wDFKuU3gm/3C
	CnYsijK71tkSm7vbSQuif30pg5mM1cmHpXcAmyC6+o4D/Df5s9xGQ/h6ar74d8n9zx8h19CdeTtHl
	uYfk1CbW2bj3h/FfQ3H/SZSnRDibig3FyQsGFx+941zV5N0wGjxWcA8vFOVIM37xqFKK0O96tLm4T
	1jo9HltLjCQUJ01QxLQ81tVW+9vPi4pAcwVQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tLKAJ-00000003aZG-0bcf; Wed, 11 Dec 2024 11:41:59 +0100
Received: from p57bd9274.dip0.t-ipconnect.de ([87.189.146.116] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tLKAI-00000000Rze-3u8o; Wed, 11 Dec 2024 11:41:59 +0100
Message-ID: <28c6fc52d40d53200f411355f988cb7eb7e93269.camel@physik.fu-berlin.de>
Subject: Main issues on Alpha that need attention
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: "Maciej W.Rozycki" <macro@orcam.me.uk>
Cc: Magnus Lindholm <linmag7@gmail.com>, Michael Cree <mcree@orcon.net.nz>, 
 Richard Henderson	 <rth@gcc.gnu.org>, Matt Turner <mattst88@gmail.com>, Sam
 James <sam@gentoo.org>,  linux-alpha <linux-alpha@vger.kernel.org>
Date: Wed, 11 Dec 2024 11:41:58 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Maciej,

since you are planning to work on the Alpha backend in GCC, I would briefly=
 like
to summarize the most pressing issues with GCC on Alpha and the toolchain.

First and foremost, the most important task is of course converting the Alp=
ha backend
in GCC to LRA [1]. I have already played around switching the backend to LR=
A [2] and
ran into an issue with the M2 compiler [3] as well as with non-BWX targets =
[4] which
I have already reported. Thus, besides your patches to address data races w=
ith
sub-longword accesses [5], the issues above need to be addressed as well.

Outside GCC, there is still an issue with SMP on Alpha [6] which may or may=
 not be a
result of miscompiled code. I have not been able to track the origin of thi=
s SMP
bug down yet.

Finally, there is currently an issue with the mold linker which caused the =
upstream
maintainer to drop support for Alpha [7]. He argues that one of the main pr=
oblems is
that there is no psABI document [8] available for Alpha which documents the=
 ELF ABI.

Maybe Richard Henderson knows more about this. I have a contact at HP which=
 I am trying
to reach and ask him whether he can find anything in the archives with rega=
rds to that.

If anyone knows any other issues that need to be worked on Alpha, please le=
t me know.

Thanks,
Adrian

> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D66207
> [2] https://gcc.gnu.org/pipermail/gcc-patches/2024-October/665484.html
> [3] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D117184
> [4] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D117185
> [5] https://gcc.gnu.org/pipermail/gcc-patches/2024-November/669217.html
> [6] https://bugzilla.kernel.org/show_bug.cgi?id=3D213143
> [7] https://github.com/rui314/mold/commit/3711ddb95e23c12991f6b8c7bfeba4f=
1421d19d4
> [8] https://uclibc.org/specs.html

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
