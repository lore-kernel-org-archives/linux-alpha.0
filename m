From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 2/2] alpha: Make sys_getxpid() call do_getppid()
Date: Sun, 26 Sep 2010 23:34:27 +0100
Message-ID: <1285540467.2697.584.camel@localhost>
References: <1285513774.2697.255.camel@localhost>
	 <1285513991.2697.262.camel@localhost>
	 <20100926222828.GA19804@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-0MjdmYMA5HuhEPCqNIFP"
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20100926222828.GA19804@ZenIV.linux.org.uk>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org


--=-0MjdmYMA5HuhEPCqNIFP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2010-09-26 at 23:28 +0100, Al Viro wrote:
[...]
> I planned to hold it back until the merge window, since it's not a bugfix=
,
> but with that one... what the hell, might as well do it.  Less asm glue
> is a Good Thing(tm).
>=20
> One problem with your patch, though:
>=20
> ; git grep do_getppid
> ;
>=20
> IOW, which tree is that against?

The previous patch
<http://article.gmane.org/gmane.linux.ports.alpha/1165>, which I don't
intend to go into 2.6.36.

Ben.

--=20
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.

--=-0MjdmYMA5HuhEPCqNIFP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIVAwUATJ/Kbue/yOyVhhEJAQISsg//eVKe0VVmGMB5F/KBFa4nzUfOh8EESSVO
ZxNPeMf+j4LzLEbnpp4OStIdWuW93gFdKHjAcMrfbYrCsLUHQ1BJu3B7Z8apSUZy
f6wt90/gj7jb27GOXvGyJtqU/ZnBAT82M9iEM0raYv2FLK2mQP3F3TnDBXLizo+3
M3MnTEbA6TYBVFzevU5La9USwghLDo7wz1jaC7RvuG30PQsTfZONpK74CjTpaR9e
rysq6L9Hhm/N9SJoyxe/WMxyS67LHQvzbFguBLU0SplVUZ3q+CkuouIff3bfeJlf
8uSMR+vdh34btAcklGGd1y/BtLJOiv4rKL7yf6QtRxcjKvwJuLVJJ7RvSbSQtN9W
WAnj0SkkjOVar6dRpeUTdhJ5dA/feW/VtlYpFfKzcpdor4kRxb5FDj4kldjUnY9A
LCwTLG6DQcGKgpFdJU4LwVP9Hcppz2GY7/wCQ01qnRcbrUlecFjt5ZL6EFIGZAt2
cJqPE35ydHz3i7OtsjvH1sJrwwMvmfqqL7D/n3C3u57XXm7RMNNlrWTUerJoCZlQ
SckWgzbxWGMG4GVE9iBu06Wc4HU7BINvcDIG4XTV+dpfMGDzevVqIHQ8LxfMDo/S
AEeDvUK8/fz7kuN0guwrWPVZT0O9uuEHyXbb5NTLvJWSAczSspiSJedwv4tlFDm2
w4HXxd/71/U=
=2QJo
-----END PGP SIGNATURE-----

--=-0MjdmYMA5HuhEPCqNIFP--
