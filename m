From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: XLT366 Memory Compatiblity...
Date: Tue, 8 Jun 2004 20:03:35 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040608180335.GJ20632@lug-owl.de>
References: <Pine.LNX.4.21.0406080536550.13212-100000@magellan.rkirkpat.net> <20040608125250.GD20632@lug-owl.de> <20040608175612.B31492@Marvin.DL8BCU.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mFr8Z+3zTwyh716F"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040608175612.B31492@Marvin.DL8BCU.ampr.org>
List-Id: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org, Ryan Kirkpatrick <linux@rkirkpat.net>


--mFr8Z+3zTwyh716F
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-06-08 17:56:12 +0000, Thorsten Kranzkowski <dl8bcu@dl8bcu.de>
wrote in message <20040608175612.B31492@Marvin.DL8BCU.ampr.org>:
> On Tue, Jun 08, 2004 at 02:52:50PM +0200, Jan-Benedict Glaw wrote:
> > On Tue, 2004-06-08 05:46:54 -0600, Ryan Kirkpatrick <linux@rkirkpat.net>
> > wrote in message <Pine.LNX.4.21.0406080536550.13212-100000@magellan.rki=
rkpat.net>:
> > > One XLT366 is able to post AlpahBIOS with either four or eight of the=
se
> > > SIMMs installed, and the memory count is either 256MB or 512MB
> > > respectively. Yet, when I boot Linux, I get an endless stream of ECC
> > > errors and corrections, slowing the system down so badly Linux is nev=
er
> > > able to fully boot. AlphaBIOS version is 5.66.
> >=20
> > ...but ECC requires more than one:)
> >=20
> > > Lastly, I tested them in a Sparc LX (which also takes 72pin parity
> > > SIMMs). I installed the maximum of six SIMMs (384MB), and it was able=
 to
> > > see the maximum 96MB it supports. Furthermore it was able to boot and=
 run
> > > Linux without issue. It appears that as long as the SIMMs are not ful=
ly
> > > utilized they work fine. When fully utilized, they just don't work.
> >=20
> > As I said, parity !=3D ECC.
>=20
> well he said 36 chips which equals 4 bit ECC per 32 bit word.

Or one bit per byte... *digging up some RAM* Ah, these do have 10 or 20
chips, so that's 2 bits per byte (which I expected).

> | Thorsten Kranzkowski        Internet: dl8bcu@dl8bcu.de                 =
     |
> | Mobile: ++49 170 1876134       Snail: Kiebitzstr. 14, 49324 Melle, Germ=
any  |
> | Ampr: dl8bcu@db0lj.#rpl.deu.eu, dl8bcu@marvin.dl8bcu.ampr.org [44.130.8=
=2E19] |

Melle? Not all that far away:) I'm from H=F6rste (near Halle/Westf.).

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--mFr8Z+3zTwyh716F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAxf93Hb1edYOZ4bsRAlF1AJ9ZOwQenkX/Ghokupdj2jep+FhaeQCeLaiG
Lwh2QI8C8sKQ3vtxWZnqywI=
=L5NF
-----END PGP SIGNATURE-----

--mFr8Z+3zTwyh716F--
