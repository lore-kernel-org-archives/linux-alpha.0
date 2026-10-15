Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDFD3EFFA6;
	Thu, 15 Oct 2026 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070823; cv=none; b=XFYBViGlmuNalpKMPHJCRvPz9WgZQjooaAyqyGxDNCMIta9nVG0sTfCea0k0gRQHVd3Z3OCY1oOoK73gfwoOacFM7MurlVJgZ9eYjIgP2D/XlIy6JPpHGTrwFAxGO1n8TE69jxM9o4ucqPO6C3xNi4tnmqebhMIFNnziJdI+ZHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070823; c=relaxed/simple;
	bh=WCH8AVPhg0R0i85ofrTQyfn7PCgK8q6NtszsWCcyKZ4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PaXd58lqr1lN8XFofFnlg9xiD85eWzHH1otApt+ranUr0w4BrJcUzQwV596NgkPNs84Q82JzZW5dDGYJRZNvqQLtW8/6LdiaVFTHB/xPqhV5O9z2i8iUAVj1tt+KuiTSwnQ+3BB9N1uim7Tp/Qgt13VCf+bjE0A+iI7jZRGLFnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=MYyX9uzU; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="MYyX9uzU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=wjcXwLdqO17kx7rAsA/NTIghNiFMSN+eA5stlsuCCj8=; t=1792070819;
	x=1792675619; b=MYyX9uzUWnGeIs300OQRT83wTUBVRtkmv3CQFHq6voCUrwYZGjBN7BhY0d0Ut
	dnMvSsHnnaBQYf+g0QXSsDd+MRFEVT2OiFXUkoL6L+eFe0E9ksh2ulTUH6gFWs/VUfWDR79OxeJYA
	HZ84PMldxv1ccYKof3ZgbY95G11uzXXcaAucQG+2oHXFeSC7dxgBTYRuOOOhI6Jy84TzCJX2BJq6M
	dn0s3ZuhBHsSl302a0H1FT/yclSGdza5VGxXfcMjsWAddJWQpNpFfvMcxHPvmmuqca0u7rQMAy46v
	46SYJGyptNNUwcydW9pgr7MBLqoF+LtLwwsz3QTIz7gCA+8ipg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.100)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1xHLU0-00000000fH4-0ZeM; Thu, 15 Oct 2026 15:26:56 +0200
Received: from p5b13a90a.dip0.t-ipconnect.de ([91.19.169.10] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.100)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1xHLTz-000000048of-3PFl; Thu, 15 Oct 2026 15:26:56 +0200
Message-ID: <3a8312daad335c9cc7efdc497155af7c8a32af83.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 0/3] alpha: self-extracting compressed kernel images
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, Matt Turner <mattst88@gmail.com>
Cc: Lasse Collin <lasse.collin@tukaani.org>, Richard Henderson	
 <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, Nick
 Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>,
 linux-kernel@vger.kernel.org, 	linux-alpha@vger.kernel.org
Date: Thu, 15 Oct 2026 15:26:55 +0200
In-Reply-To: <alpine.DEB.2.21.2610120106400.55767@angie.orcam.me.uk>
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
	 <alpine.DEB.2.21.2610120106400.55767@angie.orcam.me.uk>
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

On Thu, 2026-10-15 at 14:09 +0100, Maciej W. Rozycki wrote:
> On Sat, 12 Sep 2026, Matt Turner wrote:
>=20
> > The SRM netboot path (bootpz.c) has its own boot protocol and keeps
> > using gzip.
>=20
>  Reminds me to dust off and upstream patches for making an image suitable=
=20
> for netbooting via MOP, which is the only protocol supported by all SRM=
=20
> revisions, since earlier ones lack BOOTP/TFTP handling, such as with one =
I=20
> have in one of my Alpha systems.

Please do so. ;-) And maybe help getting the LRA port for GCC done.

>  There's also a fix I already posted for cross-compilation support that i=
s=20
> required to avoid relying on a.out support in the build machine, which ma=
y=20
> not be there; I've come up with a better way to handle that and will shar=
e=20
> the outcome hopefully sometime soon.

aboot is also not cross-buildable and also needs some tweaking:

https://github.com/alphalinux/aboot/issues/5

>  Thank you for your ongoing maintenance effort overall.

Yes, Matt and Magnus are doing a great job bringing alpha back into shape!

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
