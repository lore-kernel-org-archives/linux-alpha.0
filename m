From: Kurt Garloff <garloff@suse.de>
Subject: Re: kernel compile problems (tulip / tulip_old) + more
Date: Tue, 20 Aug 2002 14:23:48 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20020820122348.GC26667@nbkurt.etpnet.phys.tue.nl>
References: <200208201009.28318.bullet.train@ntlworld.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200208201009.28318.bullet.train@ntlworld.com>
List-Id: <linux-alpha.vger.kernel.org>
To: SA <bullet.train@ntlworld.com>
Cc: linux-alpha@vger.kernel.org


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2002 at 10:09:28AM +0100, SA wrote:
> I need to recompile the kernel to include osf partition support, however
> it fails to compile because of a conflict between the tulip driver and the
> tulip_old driver - (some errors below) - in the config menus I can only f=
ind=20
> an option relating to the tulip driver (I have a tulip network card). Any
> ideas ?=20

Compile one or both of them as modules.

Regards,
--=20
Kurt Garloff  <garloff@suse.de>                          Eindhoven, NL
GPG key: See mail header, key servers         Linux kernel development
SuSE Linux AG, Nuernberg, DE                            SCSI, Security

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9YjTTxmLh6hyYd04RAkTEAJ9jKhRHLvvy6uV7t/yQvbrdw5CMPQCcC3TM
rTCZGS8KJKD+Uxcp5y6EiIA=
=d/RX
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--
