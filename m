From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: compiling kernel for an alphaserver (VERY OLD ONE)
Date: Sat, 26 Apr 2003 14:33:57 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20030426123356.GU19139@lug-owl.de>
References: <1051322644.1967.55.camel@Gandalf> <yw1xel3p4pd8.fsf@zaphod.guide>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YDTWxoC2E3hrC6hC"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <yw1xel3p4pd8.fsf@zaphod.guide>
List-Id: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org


--YDTWxoC2E3hrC6hC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-04-26 10:47:15 +0200, M=E5ns Rullg=E5rd <mru@users.sourceforge=
.net>
wrote in message <yw1xel3p4pd8.fsf@zaphod.guide>:
> Alan Bort <333101@personal.net.py> writes:
>=20
> > Ok... here is the deal.
> >=20
> > I've read a couple tutorials on compiling kernel and stuff... but in
> > both my machines I have Mandrake 9.1 and a friend told me that it had
> > some compatibility issues with the new plain kernel... ANyway... the
> > problem is that I want to put the new kernel (not the latest, just
> > 2.4.20) on my Alphaserver200 Is that possible.. (I KNOW IT IS)...
>=20
> Don't use 2.4.20 on Alpha, it has nasty bugs.  2.4.19 is fine, as are
> 2.4.21-pre1 and up.

Or 2.5.x. I'm running them for quite some time on NoName, Miata and
Avanti with no problems at all.

> > Since Lilo is not an option... what happends if I missconfigure
> > something??? how do I boot to another kernel??? from the bios console???
>=20
> Have you read the aboot man pages.  On Alphas, aboot does what lilo
> does on PCs (approximately).

aboot (for SRM-based machines), or milo (which is for AlphaBIOS based
machines).

> > I've noted that the downloadable file is only 4 MB (a little less)... is
> > that the FULL kernel???
>=20
> Is that already compiled?  My kernels usually end up around 1.5 MB in
> size, or ~2.7 MB uncompressed.

Maybe it contains loads of drivers. I think you can easily get a 4MB
uncompressed kernel image...

> > I'm currently running RH7.0 on my alpha and It's an important machine in
> > my network... it's the router and the http/sendmail/ftp/etc server...
> >=20
> > I'd appreciate all the help you can give me here... I'm new to linux (at
> > least at this level) and I certainly never did somthing like this... I
> > don't want to screw THIS one... I'm already downloading RH9 that isn't
> > supposed to have any trouble with the not-mdified kernel... so I think I
> > can screw that one up a few times... also... it's an x86 intel... so
> > LILO works and I can boot to any kernel I want.
>=20
> Read about aboot.
>=20
> If you're new at this stuff, you WILL screw it up once or twice before
> you learn it.  That doesn't mean that you'll loose any data, of
> course.

I subscribe that. Alpha is _not_ i386, so some things _are_ different.
Please, do some reading (and asking) first, then eventually don't shoot
your foot.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--YDTWxoC2E3hrC6hC
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+qny0Hb1edYOZ4bsRAgFBAJ9C2nHxUF5FsM8L8uOEC5RSDJj1bwCcC7qN
A9iANxmIYesGHl+MgtGnITo=
=cx9x
-----END PGP SIGNATURE-----

--YDTWxoC2E3hrC6hC--
