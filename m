From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: compiling kernel for an alphaserver (VERY OLD ONE)
Date: Sat, 26 Apr 2003 18:05:33 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20030426160533.GX19139@lug-owl.de>
References: <1051322644.1967.55.camel@Gandalf> <yw1xel3p4pd8.fsf@zaphod.guide> <1051361328.1967.64.camel@Gandalf> <yw1xof2t2wnn.fsf@zaphod.guide> <1051365623.1967.79.camel@Gandalf>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O2v8LnVIcZ+EDjcF"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1051365623.1967.79.camel@Gandalf>
List-Id: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org


--O2v8LnVIcZ+EDjcF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-04-26 11:00:23 -0300, Alan Bort <333101@personal.net.py>
wrote in message <1051365623.1967.79.camel@Gandalf>:
> El s=E1b, 26 de 04 de 2003 a las 10:52, M=E5ns Rullg=E5rd escribi=F3:
> > Alan Bort <333101@personal.net.py> writes:
> >=20
> > > > > I've noted that the downloadable file is only 4 MB (a little less=
)... is
> > > > > that the FULL kernel???
> > > >=20
> > > > Is that already compiled?  My kernels usually end up around 1.5 MB =
in
> > > > size, or ~2.7 MB uncompressed.
> > > well: 4,0M    patch-2.4.20.bz2
> > >=20
> > > that's what du patch-2.4.20.bz2 returns....
> >=20
> > That's the patch (i.e. difference) from 2.4.19 to 2.4.20.  The full
> > source is called linux-2.4.20.tar.bz2, but remember that 2.4.20 is
> > broken.
> Well. On kernel.org, in the main page there is a link to THAT kernel...
> I could searcho for the full ~.19 version... but... how big is it???
> cause my /boot partition is about 12 MB.. the Image will be smalller
> than that... won't it???

First, you download _source code_. This is about a 25MB compressed file
containing about 120MB of sources. Then, you've got to configure and
build these sources. The resulting binary file is the kernel image to
boot of about 1.5 .. 3 MB size (comressed with gzip). This file can be
booted through aboot or milo.

> here is the cat of /proc/version:
>=20
> Linux version 2.4.3-12 (root@george.devel.redhat.com) (gcc version 2.96
> 20000731 (Red Hat Linux 7.1 2.96-85)) #1 Fri Jun 8 13:20:17 EDT 2001
>=20
> Oh, BTW.. I can't seem to get the system time corretly... though I don't
> care... heheh. For some things I need it to be right or I'll get

These early 2.4.x kernel contain a bug wrt. time handling on boot-up. I
fixed that some time later IIRC.

> something like WARNING the file has a modification time in the future.

# date -s '....'

will fix it, possibly as well as installing ntpdate and ntpd.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--O2v8LnVIcZ+EDjcF
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD4DBQE+qq5NHb1edYOZ4bsRAt7mAJiAHniKoaoSGERb8zcxftLfthhnAJ9pzRw/
7lE1PiDyZcrQTj54fBXg7Q==
=3vGb
-----END PGP SIGNATURE-----

--O2v8LnVIcZ+EDjcF--
