From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: compiling kernel for an alphaserver (VERY OLD ONE)
Date: Sat, 26 Apr 2003 17:58:24 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20030426155824.GV19139@lug-owl.de>
References: <1051322644.1967.55.camel@Gandalf> <yw1xel3p4pd8.fsf@zaphod.guide> <20030426123356.GU19139@lug-owl.de> <1051361649.1968.70.camel@Gandalf>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V1B6tgkYnQOXc079"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1051361649.1968.70.camel@Gandalf>
List-Id: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org


--V1B6tgkYnQOXc079
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-04-26 09:54:10 -0300, Alan Bort <333101@personal.net.py>
wrote in message <1051361649.1968.70.camel@Gandalf>:
> El s=E1b, 26 de 04 de 2003 a las 09:33, Jan-Benedict Glaw escribi=F3:
> > > Don't use 2.4.20 on Alpha, it has nasty bugs.  2.4.19 is fine, as are
> > > 2.4.21-pre1 and up.
> >=20
> > Or 2.5.x. I'm running them for quite some time on NoName, Miata and
> > Avanti with no problems at all.
> I'll try with 2.4.19 I think it is a little more tested... or at least I
> think it should

Then try 2.4.19. But I stand my word - 2.5.x is running quite well for
me. However, it's a bit challenging to get 2.5.x running (for the first
time) because some things are different. You've to use a new set of
module utilities (no longer modutils but module-init-tools) and some
things got modularized you may not expect to be modules. So if you miss
to load the keyboard modules (if you didn't compile it directly into
kernel image) you come up with basically no keyboard (or even with no
output to monitor:)

> > > > I've noted that the downloadable file is only 4 MB (a little less).=
.. is
> > > > that the FULL kernel???
> > >=20
> > > Is that already compiled?  My kernels usually end up around 1.5 MB in
> > > size, or ~2.7 MB uncompressed.
> > Maybe it contains loads of drivers. I think you can easily get a 4MB
> > uncompressed kernel image...
> The problem is that It's 4MB compressed WITH BZ2!

Wow, that's really big then. However, is any bootloader capable of
booting a .bz2 image? IIRC only ELF and gzip compressed ELF images are
supported (with aboot as well as with milo).

> [SNIP]
> >=20
> > I subscribe that. Alpha is _not_ i386, so some things _are_ different.
> > Please, do some reading (and asking) first, then eventually don't shoot
> > your foot.
> Of course... I'll odo as much resaerch as I do for ANY 'new' sthing I do
> on linux... but... will reading preapre me well for what I should
> expect???

Well, for a first-time alpha user, some things are really wired. First,
you maybo don't have to use well-known DOS-compatible partitions but BSD
partitions instead. Then you've got to get one of a set ot twe new boot
loaders to work properly. This includes to figure out how to interact
with them (how to pass kernel parameters or boot loader parameters from
SRM or from within AlphaBIOS, how to set environment variables there,
=2E..).

That are the most common nitpicks there, I think. However, you've got to
start learning about the boot process with every new platform you start
playing with. This said, HP-PA boxen are different, as well as Sparc
machines are another thing. ...and Amigas, Ataris and Macs are
different, too.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--V1B6tgkYnQOXc079
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+qqygHb1edYOZ4bsRAnpSAJ96zS8ajyFqFUQLim2bzY/aRWNkIgCfZD5j
LjDDqGnZcCv4Fkv3H3KJ8Bs=
=dK3/
-----END PGP SIGNATURE-----

--V1B6tgkYnQOXc079--
