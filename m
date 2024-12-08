Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F101E86E
	for <linux-alpha@vger.kernel.org>; Sun,  8 Dec 2024 23:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733700701; cv=none; b=Kk1NzhIuXfXWlkcXOeBrUJUpBOfOTCadT/MtJq08Era5pEqyPxY+XC4gixXtVQa2aqPLWEpRZn5svfNZGjh8WQIXdqPOlWgu04NkG6eOqkqolARJ7WjTTa9ZC+WpGZIdwte7aGO0fH3tx6hOBMa7DNifLWyp1YZXQjlgk925C5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733700701; c=relaxed/simple;
	bh=nh/8gO/gw2tTGDzbWdtB4uH2y0bnXT5SfmwsCxqaco0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CS1s75mnuBMFcXVK0SWJihUZIzIXPC2C//IaQ1iYA1XKeLeB5cVCdWZoiy2GGrneZ94PFKKVxLV3Tw4tgoXSkC72yxVuvV0kew8Wki8rruHho+GBUC/3fptUrwZz2C5Bok1TvPbO2kbDY3qQr69G0DMKarL0Cwi9r3t4BvSISo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=EVk/z41/; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="EVk/z41/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iSFOkyYx5E4wj4kxJCM7BBiXVEtzJ5/xR4uzy24zDRo=; t=1733700697; x=1734305497; 
	b=EVk/z41/Xa3Z4T0dav1DvWpRMEeKqensEgCqahcImjn+GpGR5wXbBvUXYrYMMWjpCso3qHogFn4
	OiZQ2+RW/lwJZJPMsauhYic/teOaIgudk91bIQrNab1DwUJuquonsQmNXsqt6+VEWQy2k7cpVn11k
	6bd4q/reFuNRwRXJe+qbpAuA1hjhhZ14C5na28AgPYJ3KMU7GaVIkLlFvUcNxmqOhZs7Bg8l2NM1q
	OXPsU2Vaf4/hWYpgFbu4cCu/bxiaTaoqhB64QtonI6H7irgKQdiTFNFyDdwDQPlEsL5F2xDHYMb2G
	+v81Mpyw3AiHCmS8NfsaSHtKZMvzVw0SNEyg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tKQkK-00000001clM-23Wd; Mon, 09 Dec 2024 00:31:28 +0100
Received: from p57bd9274.dip0.t-ipconnect.de ([87.189.146.116] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tKQkK-00000003KDN-19N1; Mon, 09 Dec 2024 00:31:28 +0100
Message-ID: <3926f510ba2d3069ff038cdae256ed5c8438ad19.camel@physik.fu-berlin.de>
Subject: Re: Kernel Oops on alpha with kernel version >=6.9.x
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Michael Cree <mcree@orcon.net.nz>, Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, "Maciej W.Rozycki" <macro@orcam.me.uk>
Date: Mon, 09 Dec 2024 00:31:27 +0100
In-Reply-To: <Z1YpKFQGtMWF3yy3@creeky>
References: 
	<51ce38fe2fa34ec79ad07a96feaea597af07bac7.camel@physik.fu-berlin.de>
	 <CA+=Fv5RaMF2ohojG+U0MG-dpLHS4x-Tc41+fOLZwrWqu7T0L0A@mail.gmail.com>
	 <CA+=Fv5QH1nUO1D1=Osqic6mNN6vLxiLqvNA4D9uAUgZA_w+7Tw@mail.gmail.com>
	 <0b338882a82c3f505407cb313b89a2c7f891d982.camel@physik.fu-berlin.de>
	 <CA+=Fv5RDcgm4YSX1AcpOgLvL=XXKyA=71ZasbJSc7+79Kh_Xpg@mail.gmail.com>
	 <d9330edfca0fb34c69a68c56924fa0b074b26d29.camel@physik.fu-berlin.de>
	 <CA+=Fv5T9nrQjGHOR+42tfgT723TJGgyVqBY7CwY4L-gYSoWTag@mail.gmail.com>
	 <c661a771a86267c158d7f2eba1494fe94350fb06.camel@physik.fu-berlin.de>
	 <CA+=Fv5Rxrwn0SEMgjufJcxSaB0_gOiKBjXuZnSKzgKakDHeCOw@mail.gmail.com>
	 <CA+=Fv5R+8y2hCq7p-xo5qZ0CyinR_0aAndUkoEAweCVs_95SMw@mail.gmail.com>
	 <Z1YpKFQGtMWF3yy3@creeky>
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

Hi Magnus and Michael,

On Mon, 2024-12-09 at 12:18 +1300, Michael Cree wrote:
> On Sun, Dec 08, 2024 at 10:39:30PM +0100, Magnus Lindholm wrote:
> > some updates:
> >=20
> > I've been building gcc from git and this is what I've seen so far:
> > (GCC) 14.2.1 20241208 does NOT work
> > (GCC) 15.0.0 20241208 (experimental): works!
> >=20
> > Seems like this bug gets fixed in the 15.x branch!
> > I need to find the commit that fixes this...
>=20
> Maybe, maybe not.  Building 6.11.11 with alpha-linux-gnu-gcc-9
> (Debian 9.3.0-22) fixed the null pointer access in the scsi
> subsystem, and finally I have a bootable system! (Tested on ES45.)
> But I now get a null pointer access when network driver loaded:
>=20
> [   34.501935] e100 0001:02:04.0 enP1p2s4: NIC Link is Up 100 Mbps Full D=
uplex
> [   40.692361] Unable to handle kernel paging request at virtual address =
0000000000000000
> [   40.799783] CPU 1=20
> [   40.799783] kworker/1:2(158): Oops -1

Maciej (CC'ed) is currently working on improving the Alpha backend in GCC a=
nd he would
need access to a real alpha machine to test his patches.

Would either of you be able to help him? I have taken my XP1000 out of stor=
age yesterday,
but unfortunately it won't power on at the moment as the power supply needs=
 to be serviced.

I have a 433au somewhere in my basement as well, but I haven't located it y=
et. But it would
also be better if Maciej could use a faster machine for his tests.

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
