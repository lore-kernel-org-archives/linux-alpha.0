From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: compiling kernel for an alphaserver (VERY OLD ONE)
Date: Sat, 26 Apr 2003 22:51:48 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20030426205148.GZ19139@lug-owl.de>
References: <1051365623.1967.79.camel@Gandalf> <002201c30c2b$f5300d80$1011a8c0@roadrunner>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oFGQ2VdWvpciDCpb"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <002201c30c2b$f5300d80$1011a8c0@roadrunner>
List-Id: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org


--oFGQ2VdWvpciDCpb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-04-26 21:42:15 +0200, Oliver Pitzeier <o.pitzeier@uptime.at>
wrote in message <002201c30c2b$f5300d80$1011a8c0@roadrunner>:
> Alan Bort wrote:
> > > > > > I've noted that the downloadable file is only 4 MB (a little=20
> > > > > > less)... is that the FULL kernel???
> > > > >=20
> > > > > Is that already compiled?  My kernels usually end up=20
> > > > > around 1.5 MB=20
> > > > > in size, or ~2.7 MB uncompressed.
> > > > well: 4,0M    patch-2.4.20.bz2
> > > >=20
> > > > that's what du patch-2.4.20.bz2 returns....
> > >=20
> > > That's the patch (i.e. difference) from 2.4.19 to 2.4.20.  The full=
=20
> > > source is called linux-2.4.20.tar.bz2, but remember that 2.4.20 is=20
> > > broken.
> >
> > Well. On kernel.org, in the main page there is a link to THAT=20
> > kernel... I could searcho for the full ~.19 version... but...=20
> > how big is it??? cause my /boot partition is about 12 MB..=20
> > the Image will be smalller than that... won't it???
>=20
> wget http://kernel.org/pub/linux/kernel/v2.4/patch-2.4.19.bz2
                                               ^^^^^^^^^^^^^^^^
> tar xfvj linux-2.4.19.tar.bz2; \
           ^^^^^^^^^^^^^^^^^^^^
> cd linux-2.4.19; \
> make menuconfig; \
> make dep; make; \
> make modules;
>=20
> Maybe that helps?

Maybe a little, but there's an obvious bug:)

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--oFGQ2VdWvpciDCpb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+qvFkHb1edYOZ4bsRAiNSAJ92D0emJHZaRx35jcU+kL5wwatINwCfZO4S
E9NEMuY88dcEoBlCN5z5Fkk=
=N3WB
-----END PGP SIGNATURE-----

--oFGQ2VdWvpciDCpb--
