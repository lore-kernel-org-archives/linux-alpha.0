From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] alpha: Implement "current_stack_pointer"
Date: Sun, 26 Feb 2023 21:46:07 +1100
Message-ID: <20230226214607.59ac22b2@canb.auug.org.au>
References: <20220224060558.1856804-1-keescook@chromium.org>
        <CAEdQ38Fg=Au5=BbyTHiEO+GaivheCe6hPBjcZhjgALxn4503Mg@mail.gmail.com>
        <29763841-bdaa-4a4b-aa0e-5e1b3935317d@app.fastmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oSZx5=AKndJNoGljDYvlgrZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1677408372;
        bh=Qf69gqalS+erSQr23jCazSB1VxuPBCS5Msd8dRmHN5g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UFP+HN0CMDRK+bUKltreDR7LVG151tcmDKU/KgtmM7N4invGBuiQz0o6X567n0nMl
         LaS0eHTaTcIxn12ao00/qFC3HADENwtzemxbnFCwPBtXJ7+WcQXqSCYTZAdm+KI9t2
         HYrQNvHO+BF0HeowFpSAiyCmgRZHm9fkGDGHZf93lt0A9cgCXwJ1e7WFWBuQRQAnGh
         EzMOr3ROTfMi2APzPUT2WnkokqLnsBMUc81Iw1gWX3thcgMxGBqyfuM1nYcIfAxiSt
         q07hRHx44S2EShs1+AOA1jGd3bWgvr49UeJEL+xGNzutjXOvIkQhxsOFDZjqhhqVU2
         VPKkyBSXi8Gtw==
In-Reply-To: <29763841-bdaa-4a4b-aa0e-5e1b3935317d@app.fastmail.com>
List-ID: <linux-alpha.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/oSZx5=AKndJNoGljDYvlgrZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Sun, 26 Feb 2023 11:24:13 +0100 "Arnd Bergmann" <arnd@arndb.de> wrote:
>
> On Sun, Feb 26, 2023, at 03:08, Matt Turner wrote:
> >
> > Thanks for the patch! This was included in my pull request today and
> > is now upstream in Linus' tree. =20
>=20
> [trimming Cc list for hijacked thread]
>=20
> Hi Matt,
>=20
> I remember that Stephen Rothwell mentioned he dropped a couple of
> architecture trees from linux-next due to long inactivity, and I
> see that none of your branches are included any more. Should
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git/log/?h=
=3Dfor-linus
>=20
> or the (currently empty) alpha-next branch be added back there?

There has never been an alpha branch in linux-next.

I would welcome one, however ;-)
--=20
Cheers,
Stephen Rothwell

--Sig_/oSZx5=AKndJNoGljDYvlgrZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmP7OG8ACgkQAVBC80lX
0Gwl9gf6A6wzfVk3CbJvPQR/zksvj1uYtWMzL5VncjHOnvqoo+/PBEytPoCVOAu0
R9XVVULKy7Q03rTJFIOtwQYPtwip8Wjp3zP3EvyGTGG5VRgscPgEQo3pD/lXojBy
adw4ndru+1QKm19tLbKWSHGDKM2FkO8WNT6y42movf9NTE2yGkDJIf8LuCoaNmUy
Q4mIUlrfc42ZOk1qLfMgekyRtHR+rh8Hgt4eIkjAprJ00qoro/X9vYXwJGmkhU+9
GmEgNuRjWY4a74akiDENqztix9xfkrfxVFAra1vyvrwNYUuLlP2zHSNznBNFWCan
8zOWvzk3FK97ris0QskLxyNzDmq0nw==
=AQxy
-----END PGP SIGNATURE-----

--Sig_/oSZx5=AKndJNoGljDYvlgrZ--
