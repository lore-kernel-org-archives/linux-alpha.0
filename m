From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] alpha: move from strlcpy with unused retval to strscpy
Date: Fri, 19 Aug 2022 07:37:53 +0200
Message-ID: <Yv8hsfcAw6e81/9z@shikoro>
References: <20220818205936.6144-1-wsa+renesas@sang-engineering.com>
 <f2cef25c1e092fc3e9f7312b85762b487d67e3ff.camel@perches.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+0EvJTlwXes98vU8"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=2i8A+LVscnYpQHktS7f8chswupM7
        ErtT1tFRnUWj9nc=; b=j2rezBiZZFT5cVTlwaxwohfIebxK/Irha9EiFt5iDV3J
        QZ9MrD8RZcc2ceT0KLr9n8bJS7ANGt9hiFcd6NbelFVRvNaVNslD++wTZaCtXOjN
        UhNTa2gOHQrBvjoshS4yGFoej3axcERd0MLAcImZNlGI/FYKZ5dVpVafD4PP2z4=
Content-Disposition: inline
In-Reply-To: <f2cef25c1e092fc3e9f7312b85762b487d67e3ff.camel@perches.com>
List-ID: <linux-alpha.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>


--+0EvJTlwXes98vU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Joe,

Glad you like this series.

> Last time I posted a coccinelle script for strlcpy->strscpy conversions
> with unused returns, there were several variants that were not converted.
>=20
> https://lore.kernel.org/cocci/a3279a5772b2e49b57890cd75e97360b82890798.ca=
mel@perches.com/T/#m502108bfe0cc6a41d499a4c1b55d5f5db1423465
>=20
> Did you post the script you used?

First version here, very similar to yours:

https://lore.kernel.org/all/YvhXzarjOLEJ8nsW@shikoro/

The final version has another rule to add missing parens to the argument
of a sizeof operator:

@ main @
@@
- strlcpy
+ strscpy
  (...);

// make sure sizeof always has parens. Isomorphs will remove existing ones =
if present before.
@ add_parens depends on main @
expression dst, src, E;
@@
  strscpy(dst, src,
- sizeof(E)
+ sizeof(E)
  );

Like your try, some header files are missing. I guess Julia's remarks
about that from the thread above will fix this as well. However, since
there are the instances left where the return value of strlcpy is used
anyhow, I left those for manual fixing.

Thanks,

   Wolfram


--+0EvJTlwXes98vU8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL/IagACgkQFA3kzBSg
KbZ4bBAAtCAayZZEvY/5fFPQh9vSpDnUsyS8afDbdoda/YODOYY5nW3hellYABBq
a9UwbGhTMrvaCmXtGwfHYhBIO4lfC09soDIsS0U7eXnaRSinIQagcFKrhEz1RtrG
bsAgvtbdi86J6HcXrvSvNhcyMpdVP+uuqnUFcxZ5dRodj9iLgL+7FdULwLYf/tVL
QvCuemqbBFZAZahi12ietf7QU/Gwa1sdi0XjGAFenForM8hzmrxvMn1XtbHZCanF
1fh6UqfiU2FfYbbW6UV7mC5oUi3b5bEYETBuvwDNro4T2qR0YtVIjNXwNL3bhCLL
qWHvefktDpHeVrT/d3a8LqxG2y2vt+Dh02not4ujpzxE89ho7G9I+IxAnhSkzdWJ
JgZM+ZmsJLhn+VycTOTXhcHPRLjLpsKeYPeZA/r0gtjlszCfqWHnW6V1gs1S7C4q
a4SUgtYQE9rMsc2iU139hx0xM+EPJ/+BK2MvX2lOo0lqh3lWhIJJIHShgMN5mAe3
kOm/TxWQhi3E92PBf1Wej9V2cNhT17hTGdHiLeQDuhvAof1Nq70zKsTr3PvcPEH7
uNWjVBswaRu63+1dvOKpkotaq5olmN2Z53GLfE3F/3fETOvMwmoXXYiKLO53X1Dm
5mkmdONae6hMLN1l0OBILsHF7DHyh1k5JZ0ul05TWm8LfYVYvsw=
=oP1x
-----END PGP SIGNATURE-----

--+0EvJTlwXes98vU8--
