From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH net-next v3] net: SO_RCVMARK socket option for SO_MARK
 with recvmsg()
Date: Thu, 28 Apr 2022 08:32:11 +0200
Message-ID: <20220428063211.4ndwg7xzudl7l7h7@pengutronix.de>
References: <202204270907.nUUrw3dS-lkp@intel.com>
 <20220427200259.2564-1-lnx.erin@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="twk6owb5igwqlcml"
Return-path: <sparclinux-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220427200259.2564-1-lnx.erin@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
To: Erin MacNeil <lnx.erin@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Oliver Hartkopp <socketcan@hartkopp.net>, Robin van der Gracht <robin@protonic.nl>, Oleksij Rempel <linux@rempel-privat.de>, kernel@pengutronix.de, Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Hide


--twk6owb5igwqlcml
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 27.04.2022 16:02:37, Erin MacNeil wrote:
> Adding a new socket option, SO_RCVMARK, to indicate that SO_MARK
> should be included in the ancillary data returned by recvmsg().
>=20
> Renamed the sock_recv_ts_and_drops() function to sock_recv_cmsgs().
>=20
> Signed-off-by: Erin MacNeil <lnx.erin@gmail.com>
> ---
>  net/can/bcm.c                           |  2 +-
>  net/can/j1939/socket.c                  |  2 +-
>  net/can/raw.c                           |  2 +-

For the net/can changes:

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--twk6owb5igwqlcml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmJqNOgACgkQrX5LkNig
010oWwf/YQtdMP9EhexK+DgW94m7NnyknIp9mL/PgS712H8tMgbdcesQGNCYJvag
mWhVZeGq5XI/oC3he0VDrAvI+i0WVRjj4ljyd3hVnL5o6Y0+0V2kV8Te5+/qHKqp
HG3KiLAkGO2LNKpoUXMVORu/+V4Mwl/oiggQbQ+tzAjZ4BIZ7fCHQVv39LSUDXAY
NrrZ8oF+gi5QTRhvbvQXUlskp2Idym5ND+QevTxOX5Uo3zUV5H7ERo0iwpIZwRJw
8/t1/a+pX6V8hgtHEgi8kmJOlw9AAWjiUFZY9ngresTMZL7pjyuz1cHTOaGt4Sve
Y5A7ifvkLmiO+EpPJ8FsaWn53qpmgQ==
=kyeH
-----END PGP SIGNATURE-----

--twk6owb5igwqlcml--
