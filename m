From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Problems with SRM+bootp on old Alpha
Date: Sun, 8 Feb 2004 22:09:48 +0100
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040208210948.GU28571@lug-owl.de>
References: <Pine.LNX.4.58L.0401140251490.1499@saffroy.mds>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UEgmpZn7Z/frN9Sq"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58L.0401140251490.1499@saffroy.mds>
List-Id: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org


--UEgmpZn7Z/frN9Sq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2004-02-08 05:02:50 +0100, Jean-Marc Saffroy <junk42@free.fr>
wrote in message <Pine.LNX.4.58L.0401140251490.1499@saffroy.mds>:
> I am trying to boot 2.4.22 on an old AlphaStation 400 using SRM (latest
> version: 7.2-1) and bootp (the machine has neither a hard drive nor a
> floppy drive). After trying to boot a Debian image which would not work,
> I have decided to set up a cross gcc and build a bootp image by myself,
> but it failed similarly with "machine check while in PAL mode".

Uh...

Well, does that box have an floppy disk controller? If so, add a floppy
drive, a standard PC floppy will do. Also, you can try to add an
external SCSI CD-ROM drive.

> This seemed to be caused by the hack in start_kernel()
> (arch/alpha/boot/bootp.c) that copies the kernel to a higher address
> first, then to its final destination: I suspect it does not work on my
> machine, which has only 16MB of RAM, because the 4*KERNEL_SIZE offset is

That's a pretty small system, then. Maybe you'd first try to get some
more RAM...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--UEgmpZn7Z/frN9Sq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAJqWcHb1edYOZ4bsRAl9OAJ9xcWQCj4hWGjXag3gJOKatDaGTRgCfYH4f
XaImFUMHN2oazgSRSojWV40=
=EmHe
-----END PGP SIGNATURE-----

--UEgmpZn7Z/frN9Sq--
