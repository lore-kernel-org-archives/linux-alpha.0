Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C191B4A013F;
	Thu, 15 Oct 2026 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072594; cv=none; b=mDoVBlqVMh3A/AqHq09Kvfua15Ut1Yrxy7fgcQIt0XwqxIkbr/aGoRQWOZRWkkJXdyEtrPqonYThYxQ3cXfbEMchTdxHAQA68natE+dgmsddnx39lxZpF/i+TYhmH1/34MuTgc6ZqGAV2Yt8CzUeATs6A3yCPxWkRVSMAjjRxR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072594; c=relaxed/simple;
	bh=cZInJwt3I1Vz51nYszD9oJKFR4xZNAD0JZYGc9csw/k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OLUPxNvwTSEg/HNh0mK9aZmK8LLw3ytn8uYUPkUGHRTertguu4WaliM7TO10yZAUJLWz9Nbqx57XfnKnYMuQsln+TQ6aIHbqNy/KUdCU4e8MaAMHy6GveWCUdrvNuRkOIF73X0/OFV/6nKSV0Cal0nTs+sH0wolZfgSdEwlIyZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=kIPcpLsL; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="kIPcpLsL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=hyeYQUg0kCG8rtzMOcp0V29L6yI/OwoMh+F4fpMdMiE=; t=1792072592;
	x=1792677392; b=kIPcpLsLcaDxm95BAw5O5vt4coLT1oR8Q7+TAUkXG/8bQ3q4MVdXpa3PjUZ+a
	9Vy/HvUjRT2MEu5VWCW71JE3/lsTwM7K4EfqPfiaUpafUxdssEJ/jdPfpBsjzMQjQ7G9BQVz19H6l
	F/STZjCi/kkMQdc7sBWRPRWy3WR5mh07INmNXNhWW0SFgSxO4Ugcwm0KwvxRdnPZqsnItpoU5QTL0
	oRwvXYs8t/JLC/SU2b8p2Wcyd77kQsf6MJ7B7TVag5tBJEGP+grnAx3dq4Pl9XTRrHT4bXdeJL94p
	YZeSfwzU9T6AP0cdYzMfKhjk10+JVQbxK08UGH4BRp7/JULSIg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.100)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1xHLwb-00000000qf8-309p; Thu, 15 Oct 2026 15:56:29 +0200
Received: from p5b13a90a.dip0.t-ipconnect.de ([91.19.169.10] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.100)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1xHLwb-0000000035H-234o; Thu, 15 Oct 2026 15:56:29 +0200
Message-ID: <b08109cb3f685126f4414f68a8a48e5f6eb4e1d8.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 0/3] alpha: self-extracting compressed kernel images
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Matt Turner
 <mattst88@gmail.com>,  Lasse Collin <lasse.collin@tukaani.org>, Richard
 Henderson <richard.henderson@linaro.org>, Nick Terrell	 <terrelln@fb.com>,
 David Sterba <dsterba@suse.com>, 	linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org
Date: Thu, 15 Oct 2026 15:56:28 +0200
In-Reply-To: <CA+=Fv5RS6tyB28U1b-OJFLkwFLLA6r57amPCsfuMpc4ZQ9JZNA@mail.gmail.com>
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
	 <alpine.DEB.2.21.2610120106400.55767@angie.orcam.me.uk>
	 <3a8312daad335c9cc7efdc497155af7c8a32af83.camel@physik.fu-berlin.de>
	 <CA+=Fv5RS6tyB28U1b-OJFLkwFLLA6r57amPCsfuMpc4ZQ9JZNA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Magnus,

On Thu, 2026-10-15 at 15:37 +0200, Magnus Lindholm wrote:
> On Thu, Oct 15, 2026 at 3:26=E2=80=AFPM John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> >=20
> > On Thu, 2026-10-15 at 14:09 +0100, Maciej W. Rozycki wrote:
> > > On Sat, 12 Sep 2026, Matt Turner wrote:
> > >=20
> > > > The SRM netboot path (bootpz.c) has its own boot protocol and keeps
> > > > using gzip.
> > >=20
> > >  Reminds me to dust off and upstream patches for making an image suit=
able
> > > for netbooting via MOP, which is the only protocol supported by all S=
RM
> > > revisions, since earlier ones lack BOOTP/TFTP handling, such as with =
one I
> > > have in one of my Alpha systems.
> >=20
> > Please do so. ;-) And maybe help getting the LRA port for GCC done.
> >=20
> > >  There's also a fix I already posted for cross-compilation support th=
at is
> > > required to avoid relying on a.out support in the build machine, whic=
h may
> > > not be there; I've come up with a better way to handle that and will =
share
> > > the outcome hopefully sometime soon.
> >=20
> > aboot is also not cross-buildable and also needs some tweaking:
> >=20
> > https://github.com/alphalinux/aboot/issues/5
> >=20
>=20
> I think I fixed cross-building a while back
>=20
> https://github.com/linmag7/aboot/commits/crossbuild

Oh, I see and Matt also landed quite a number of patches. I should look int=
o
updating the aboot package in Debian then. Thanks a lot for the hard work!

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
