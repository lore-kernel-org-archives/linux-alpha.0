From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: 2.4 kernels broken on Takara?
Date: Mon, 9 Feb 2004 10:02:59 +0100
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040209090259.GA28571@lug-owl.de>
References: <20040208103909.C25099@thebrain.conmicro.cx> <20040208211454.GV28571@lug-owl.de> <20040208175312.A26586@thebrain.conmicro.cx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0q9y5TNQq+E02vJE"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040208175312.A26586@thebrain.conmicro.cx>
List-Id: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org


--0q9y5TNQq+E02vJE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2004-02-08 17:53:12 -0600, Jay Maynard <jmaynard@conmicro.cx>
wrote in message <20040208175312.A26586@thebrain.conmicro.cx>:
> On Sun, Feb 08, 2004 at 10:14:55PM +0100, Jan-Benedict Glaw wrote:
> > On Sun, 2004-02-08 10:39:09 -0600, Jay Maynard <jmaynard@conmicro.cx>
> > wrote in message <20040208103909.C25099@thebrain.conmicro.cx>:
> > > install. I've tried installing a Debian system, then a 2.4 kernel on =
top of
> > > that - but 2.4.18 and 2.4.24 prebuilt generic kernels, as well as a 2=
=2E4.24
> > > custom kernel built specifically for the Takara, all blow up with a k=
ernel
> > > paging error during startup, right after the PCI bridges are detected=
=2E The
> > > 2.2.20 kernel iinstalled by Debian runs fine.
> > I remember there were problems with the PCI bridging code. Maybe you'd
> > try to give 2.6.x a shot...
>=20
> No luck, although I got a little better look at the error messages. I've
> retyped them here:
>=20
> PCI: Bus 2, bridge: 0000:00:14.0
>   IO window: 8000-8fff
>   MEM window: 02400000-037fffff
>   PREFETCH window: 02200000-022fffff
> PCI: Setting latency timer of device 0000:00:13.0 to 64
> Unable to handle kernel paging request at virtual address 0000000000000040

0x40 means that there (most probably) was an access to some struct by a
pointer. If this is a "normal" struct containing ints and pointers, it's
most probably access to the 9th structure element.

> swapper(1): Oops 0
> pc =3D [<fffffc00004eecf0>]  ra =3D [<fffffc00004eecc8>]  ps =3D 0000    =
Not tainted
> [register dump here]

This is the interesting part. Get the value of "pc" and those from the
stack printout which start with "fffffc" and decode them with the
matching System.map file (you'll find that in /boot). The values printed
on screen are typically a bit larger than those in the System.map file,
so search for the largest address line in that file which is still
smaller than what you've found on screen.

> Trace:fffffc0000310124 fffffc00003151e8
> Code: 261dfff1 401f0000 a4410038 2c810078 20210078 22107a7c <a0420040>
> 488100c4
> Kernel panic: Attempted to kill init!
>=20
> This is with the generic Debian 2.6.0 kernel. Now what?

Decode the oops. That'll exactly tell where it happened.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--0q9y5TNQq+E02vJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAJ0zDHb1edYOZ4bsRAgvCAJ9w/VM1DyfcTIYk4eh1/xBJe/3hXQCePg82
HvZcf1ICnbSUgu2CHKJ0FsU=
=fpwl
-----END PGP SIGNATURE-----

--0q9y5TNQq+E02vJE--
