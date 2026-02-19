Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8FE328B4E;
	Thu, 19 Feb 2026 23:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771542424; cv=none; b=kpFludo4dS5ICr9I8xnhfuYyfYKB3ngsqxk59zFEnr5FYRnCPIDU2VKHODNHIHq6RQHwxX+UPf280QU7yqSwzrURHEXUxufDqHoFrQB0AraXjlKK2WtJdsC0eSPb5tBxEEOIkGCbef55CWcEgQVPHouATopduzV0rUP8FjwSKGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771542424; c=relaxed/simple;
	bh=xsI0s6FNFFPpvVYAT/uhP4XWeVCL+X8mORQNizMUO6Y=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BTIFqdAbfbf+9jZwY3cf30jr2E7N+kPEtrh7pCjykA2wrIsS8RATUE2RLm25/f++at0mFoPXBonqFnjvWJnAk9T3Ar8Aln0Bxf8EcljNAm2mGGLf/oACn+OgoWZCI1oxJPeOyRmzUKJoOL7ZuZCRFk0wUwbCXnoNeZsgeugXBJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=pEGR71Ga; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="pEGR71Ga"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=OvfvVq+4rzmQ+KD8tPq8v+UgsshfuMshmtv8dgdEFQk=; t=1771542421;
	x=1772147221; b=pEGR71GaSrGytk5BY4Jltj2Yggzr+PMEJSaO0gmh8kqdKujlg46dKulz3fw/j
	bmamU/zmVhCaHHDGV6sok8Kn+pCeFruaYFB2MBNZ3HiJt7jnGF+yj0hk6p98/BAL2MVVh/ZFzUgUa
	VfH2h8ZbzOJrVmYw4pDCE70UvND1U5USv37t3gJrBqWRPhxE5rIX5NbzLLTRCPWOh+csSuUYyXaN8
	NDhi1gMNyS8ItPHBYdTodAdfRJXMlfx/kabQwUVcHpEwMGBip2oxNm2vNFRx/EvTYZk8td6D6brBo
	YwaQdUcJouiq01FeZ3HveW9leq8tjq0wZtT08aSMXTqOlE96fw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vtD6h-00000001fDn-2Sso; Fri, 20 Feb 2026 00:06:51 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vtD6h-00000000Nez-1GxE; Fri, 20 Feb 2026 00:06:51 +0100
Message-ID: <bb4b7c070951103dec13d39a0a675e547ab711f9.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 1/1] alpha: add support for SECCOMP and SECCOMP_FILTER
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Michael Cree <mcree@orcon.net.nz>, Magnus Lindholm <linmag7@gmail.com>, 
	richard.henderson@linaro.org, mattst88@gmail.com, macro@orcam.me.uk, 
	macro@redhat.com, ink@unseen.parts, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, kees@kernel.org
Date: Fri, 20 Feb 2026 00:06:50 +0100
In-Reply-To: <aZeT6DcS8u1Qbq58@creeky>
References: <20260205133049.526-1-linmag7@gmail.com>
	 <20260205133049.526-2-linmag7@gmail.com>
	 <14bcd6dd3475d97b030ecb7044646f1b10d3205f.camel@physik.fu-berlin.de>
	 <CA+=Fv5SPxzvJ3OCwfawOtUkBNmHJF=CS_9_m=a7QoHCn5UbUvA@mail.gmail.com>
	 <aZeT6DcS8u1Qbq58@creeky>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Michael,

On Fri, 2026-02-20 at 11:51 +1300, Michael Cree wrote:
> On Thu, Feb 19, 2026 at 10:10:38PM +0100, Magnus Lindholm wrote:
> > >=20
> > > Thanks so much for working on this! Alpha and SPARC are the last two =
architectures
> > > in Debian that are missing full support for SECCOMP filter. Great to =
see that Alpha
> > > is now being worked on.
> > >=20
> > > FWIW, I haven't tested your patches yet, but I think you should also =
update the
> > > documentation in Documentation/features/seccomp/seccomp-filter/arch-s=
upport.txt.
> > >=20
> >=20
> > Thanks for taking a look! I'll put out a v2 of this patch, including
> > an update to the
> > documentation.
> >=20
> > > I will try to add support for Alpha in libseccomp over the weekend to=
 test your patch.
> > >=20
> >=20
> > Btw. I've tested your libseccomp with updated alpha support, real nice =
progress
>=20
> Where is this updated libseccomp?  I would like to test it too.

See: https://github.com/glaubitz/libseccomp/tree/alpha-support

Had some issues with updating syscalls.csv though, see: https://github.com/=
seccomp/libseccomp/issues/480

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
