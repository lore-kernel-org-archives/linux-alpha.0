From: Sergei Trofimovich <slyich@gmail.com>
Subject: Re: [PATCH] Alpha: unbreak osf_setsysinfo(SSI_NVPAIRS,
 [SSIN_UACPROC, UAC_SIGBUS])
Date: Fri, 12 Aug 2011 12:59:03 +0300
Message-ID: <20110812125903.01e7bdf0@sf.home>
References: <1313076314-6111-1-git-send-email-slyich@gmail.com>
	<4E44D46A.1070007@orcon.net.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/.d.sIlLhOKWmhzpsCq9YWSJ"; protocol="application/pgp-signature"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=date:from:to:cc:subject:message-id:in-reply-to:references:x-mailer
         :mime-version:content-type;
        bh=Pd5vs5TqXgdL29g5AiP7bNubRlLq07eKqGURLAiqgpA=;
        b=O+Z7RAIfysPX8/RwpM81vnUNi+SrPMcuUem4lPjp9FeUx1Qii8R0x29bQHH7Yl5anj
         59w2KGID6ycD8tpCaZapbaa0uUHk/tZNTIuEHDUVhJd1m5RVojmCR0Xpj6KbFQDgkvIg
         B9q29OnNaYDbm4Rbb1os6G+GqWhATXamAjIL0=
In-Reply-To: <4E44D46A.1070007@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com

--Sig_/.d.sIlLhOKWmhzpsCq9YWSJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

> > Was broken by
> >> commit 745dd2405e281d96c0a449103bdf6a895048f28c
> >> Author: Michael Cree <mcree@orcon.net.nz>
>=20
> Bollocks.

Ugh, my apologies! Didn't intend to insult you.
I failed to read your changelog (and patch) properly.
Now I see The a583f1b54249b was the first in flag skew.

I'll build alpha toolchain / qemu root and will try to cook
nicer patch with compile-time safety checks.

Sorry.

--=20

  Sergei

--Sig_/.d.sIlLhOKWmhzpsCq9YWSJ
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk5E+XIACgkQcaHudmEf86oSewCfX86rS5atV1T0nODe02cqWX9v
NHkAn28dSWCBtAt1hjIhcQwCbOVPdOX9
=+IoH
-----END PGP SIGNATURE-----

--Sig_/.d.sIlLhOKWmhzpsCq9YWSJ--
