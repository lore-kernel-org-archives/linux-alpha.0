From: Kurt Garloff <kurt@garloff.de>
Subject: Re: AS500/266 trouble
Date: Wed, 12 Jun 2002 02:08:20 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20020612000820.GF11833@gum01m.etpnet.phys.tue.nl>
References: <wrpvg8s5jyd.fsf@hina.wild-wind.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhtSGe8h3+lMyY1M"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <wrpvg8s5jyd.fsf@hina.wild-wind.fr.eu.org>
List-Id: <linux-alpha.vger.kernel.org>
To: Marc Zyngier <mzyngier@freesurf.fr>
Cc: Linux Alpha list <linux-alpha@vger.kernel.org>


--zhtSGe8h3+lMyY1M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marc,

On Sun, Jun 09, 2002 at 09:30:02PM +0200, Marc Zyngier wrote:
> I just bought myself an AS500/333,

I had gotten mine for free :-)

> and suffered from the problems you
> described in your email to linux-alpha on 4/15/2002.
>=20
> Did you finally solve this problem ?

No.

> If not, could you give this
> simple patch a spin ? It solved all PCI problems on my system.

Indeed, with your patch, the machine happily boots, i.e. the QLogic
ISP 1020 finally works again.
THANKS!

But ...

> Also, if you compile your kernel for Alcor, do you manage to get any
> ISA interrupt ? I can only get them if I compile for generic...

=2E.. I did not get the floppy driver to work. Not with an Alcor SRM kernel
nor with generic.

Regards,
--=20
Kurt Garloff                   <kurt@garloff.de>         [Eindhoven, NL]
Physics: Plasma simulations    <K.Garloff@TUE.NL>     [TU Eindhoven, NL]
Linux: SCSI, Security          <garloff@suse.de>    [SuSE Nuernberg, DE]
 (See mail header or public key servers for PGP2 and GPG public keys.)

--zhtSGe8h3+lMyY1M
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9BpDyxmLh6hyYd04RAo1rAKCvsarJhtIs7dLOyIhnpgvC8aZx+ACgoPjv
MSbQKVfLTTIlOf1+O6x8HB0=
=T0K5
-----END PGP SIGNATURE-----

--zhtSGe8h3+lMyY1M--
