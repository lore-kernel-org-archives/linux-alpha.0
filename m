From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: XLT366 Memory Compatiblity...
Date: Tue, 8 Jun 2004 14:52:50 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040608125250.GD20632@lug-owl.de>
References: <Pine.LNX.4.21.0406080536550.13212-100000@magellan.rkirkpat.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E85kR+oOWHQEz0yT"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0406080536550.13212-100000@magellan.rkirkpat.net>
List-Id: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org


--E85kR+oOWHQEz0yT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-06-08 05:46:54 -0600, Ryan Kirkpatrick <linux@rkirkpat.net>
wrote in message <Pine.LNX.4.21.0406080536550.13212-100000@magellan.rkirkpa=
t.net>:
> 16Mbit in size. The SIMMs are parity (from the chip count). There is also

So they have an extra parity bit...

> a sticker on one of chips that has '3163667/23BT S023039 64MB'. I was told
> they came out of a Compaq Proliant server (don't know the model). All of
> this seems to indicate they _should_ be compatible with the XLTs.
>=20
> One XLT366 is able to post AlpahBIOS with either four or eight of these
> SIMMs installed, and the memory count is either 256MB or 512MB
> respectively. Yet, when I boot Linux, I get an endless stream of ECC
> errors and corrections, slowing the system down so badly Linux is never
> able to fully boot. AlphaBIOS version is 5.66.

=2E..but ECC requires more than one:)

> Lastly, I tested them in a Sparc LX (which also takes 72pin parity
> SIMMs). I installed the maximum of six SIMMs (384MB), and it was able to
> see the maximum 96MB it supports. Furthermore it was able to boot and run
> Linux without issue. It appears that as long as the SIMMs are not fully
> utilized they work fine. When fully utilized, they just don't work.

As I said, parity !=3D ECC.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--E85kR+oOWHQEz0yT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAxbaiHb1edYOZ4bsRAjhuAJ9VWupZXkUS+gWgIlkx/kdrcqBlpACffmbr
BQnAbm5X7i3zxbv8DvkhGns=
=Dmqz
-----END PGP SIGNATURE-----

--E85kR+oOWHQEz0yT--
