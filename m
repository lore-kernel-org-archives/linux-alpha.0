From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: compiling kernel for an alphaserver (VERY OLD ONE)
Date: Sat, 26 Apr 2003 18:02:21 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20030426160221.GW19139@lug-owl.de>
References: <1051322644.1967.55.camel@Gandalf> <yw1xel3p4pd8.fsf@zaphod.guide> <1051361328.1967.64.camel@Gandalf>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E6cJGRvJdK5HoYjj"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1051361328.1967.64.camel@Gandalf>
List-Id: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org


--E6cJGRvJdK5HoYjj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-04-26 09:48:48 -0300, Alan Bort <333101@personal.net.py>
wrote in message <1051361328.1967.64.camel@Gandalf>:
> El s=E1b, 26 de 04 de 2003 a las 05:47, M=E5ns Rullg=E5rd escribi=F3:
> > Alan Bort <333101@personal.net.py> writes:
> > > I've noted that the downloadable file is only 4 MB (a little less)...=
 is
> > > that the FULL kernel???
> >=20
> > Is that already compiled?  My kernels usually end up around 1.5 MB in
> > size, or ~2.7 MB uncompressed.
> well: 4,0M    patch-2.4.20.bz2
>=20
> that's what du patch-2.4.20.bz2 returns....

Showing this, it seems you're not really familiar with compiling a new
kernel at all. Maybe first start with building a kernel for a PeeCee.
Then, try to boot it.

Those patch files contain the difference from a complete kernel source
(version n-1) to version n. So patch-2.4.20 is capable of changing a
source tree containing 2.4.19 to 2.4.20. To use this patch, you'll also
need the full sources of its preceding version, here, this is
linux-2.4.19.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--E6cJGRvJdK5HoYjj
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+qq2NHb1edYOZ4bsRAsffAKCJjYCUrF91NHfzzSIOhCnoWchEcwCghPSa
LZY6fri+7UEZqFnnadfp0+4=
=xP78
-----END PGP SIGNATURE-----

--E6cJGRvJdK5HoYjj--
