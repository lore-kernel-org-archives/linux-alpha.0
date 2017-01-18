From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [PATCH 4/4] alpha: Move two assignments for the variable "res"
 in srm_env_proc_write()
Date: Wed, 18 Jan 2017 14:14:29 +0100
Message-ID: <20170118131429.GA12614@lug-owl.de>
References: <de76a580-c693-f422-ad78-d87bafd42bf3@users.sourceforge.net>
 <986573fa-e636-f864-14dc-5e65a31b454e@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <986573fa-e636-f864-14dc-5e65a31b454e@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-alpha@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Richard Henderson <rth@twiddle.net>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-01-18 12:50:17 +0100, SF Markus Elfring <elfring@users.sourcef=
orge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Jan 2017 12:08:44 +0100
>=20
> A local variable was set to an error code in two cases before a concrete
> error situation was detected. Thus move the corresponding assignment into
> an if branch to indicate a software failure there.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Acked-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>

MfG, JBG

--=20
      Jan-Benedict Glaw      jbglaw@lug-owl.de              +49-172-7608481
Signature of:            http://www.chiark.greenend.org.uk/~sgtatham/bugs.h=
tml
the second  :

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlh/ajUACgkQHb1edYOZ4btr9ACeOYcsgk9UkisSQZbnI6/Qxn8O
J5MAnjEHIg5BWUJV7jgL/Hp5uUqNuFI4
=GqLd
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
