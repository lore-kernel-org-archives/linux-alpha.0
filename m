From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: 2.4 kernels broken on Takara?
Date: Sun, 8 Feb 2004 22:14:55 +0100
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040208211454.GV28571@lug-owl.de>
References: <20040208103909.C25099@thebrain.conmicro.cx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EIrXVFSPgsocVIgL"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040208103909.C25099@thebrain.conmicro.cx>
List-Id: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org


--EIrXVFSPgsocVIgL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2004-02-08 10:39:09 -0600, Jay Maynard <jmaynard@conmicro.cx>
wrote in message <20040208103909.C25099@thebrain.conmicro.cx>:
> install. I've tried installing a Debian system, then a 2.4 kernel on top =
of
> that - but 2.4.18 and 2.4.24 prebuilt generic kernels, as well as a 2.4.24
> custom kernel built specifically for the Takara, all blow up with a kernel
> paging error during startup, right after the PCI bridges are detected. The
> 2.2.20 kernel iinstalled by Debian runs fine.

I remember there were problems with the PCI bridging code. Maybe you'd
try to give 2.6.x a shot...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--EIrXVFSPgsocVIgL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAJqbOHb1edYOZ4bsRAqLnAKCQbtDEJT39yZta7yjDQxJYMtxQdQCfREK7
FfdSh7puEj8uHBvZDeS/cmM=
=Hbjf
-----END PGP SIGNATURE-----

--EIrXVFSPgsocVIgL--
