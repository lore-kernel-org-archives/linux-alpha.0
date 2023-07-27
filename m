From: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v4 3/5] arch: Register fchmodat2, usually as syscall 452
Date: Fri, 28 Jul 2023 03:42:22 +1000
Message-ID: <20230727.174206-real.town.kosher.menu-lN1F8uSeAtB@cyphar.com>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion@kernel.org>
 <nbtxxotfsotuiepm7r4tegc4hy5qxe4dfjuqq7rm6qkkevooxh@4hacgjwit4or>
 <20230727-fangen-olympiade-85fcbdaf03d7@brauner>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y33k3lm4leglkjmq"
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyphar.com; s=MBO0001;
        t=1690479769;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=irvaKwjIRBfIMs3OM027g5G4TY2gjSeGrvplRFueXaU=;
        b=UZDWQCSlVrWdtqreCk6pJhl6N2mvEBs8l+J0GZXLAJ/i0AyNILAKr29Y2HzpDc9MHho6C5
        xVlOhswIJJkR5SSR4ws+giR/x20PVxaPyIM6O/iNQxvH7uAImdu2F/Zw48FGbEcZ6risS0
        REEAuKwEzxnqm3M6cQCiZqnNt+7AoEXIgN0iyVEXl/IgRzie92zZ+gVSh1Z8MCS6kWkRql
        HlKWkqhpMYcbmdMzT3dNoNMTNXKs91TI0m/a0jVKcoSIVgCZEWz4fVmF9rn+0qt15Qn/26
        OISfzUoTd6FBgoUSvJSBOFNpfsyBzgTQSL6tDQROyhhl2eKXxJMNtKy6plit+w==
Content-Disposition: inline
In-Reply-To: <20230727-fangen-olympiade-85fcbdaf03d7@brauner>
List-ID: <linux-alpha.vger.kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, Palmer Dabbelt <palmer@sifive.com>, James.Bottomley@hansenpartnership.com, acme@kernel.org, alexander.shishkin@linux.intel.com, axboe@kernel.dk, benh@kernel.crashing.org, borntraeger@de.ibm.com, bp@alien8.de, catalin.marinas@arm.com, christian@brauner.io, dalias@libc.org, davem@davemloft.net, deepa.kernel@gmail.com, deller@gmx.de, dhowells@redhat.com, fenghua.yu@intel.com, fweimer@redhat.com, geert@linux-m68k.org, glebfm@altlinux.org, gor@linux.ibm.com, hare@suse.com, hpa@zytor.com, ink@jurassic.park.msu.ru, jhogan@kernel.org, kim.phillips@arm.com, ldv@altlinux.org, linux-alpha@vger.kernel.


--y33k3lm4leglkjmq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023-07-27, Christian Brauner <brauner@kernel.org> wrote:
> On Wed, Jul 26, 2023 at 02:43:41AM +1000, Aleksa Sarai wrote:
> > On 2023-07-11, Alexey Gladkov <legion@kernel.org> wrote:
> > > From: Palmer Dabbelt <palmer@sifive.com>
> > >=20
> > > This registers the new fchmodat2 syscall in most places as nuber 452,
> > > with alpha being the exception where it's 562.  I found all these sit=
es
> > > by grepping for fspick, which I assume has found me everything.
> >=20
> > Shouldn't this patch be squashed with the patch that adds the syscall?
> > At least, that's how I've usually seen it done...
>=20
> Depends. Iirc, someone said they'd prefer for doing it in one patch
> in some circumstances on some system call we added years ago. But otoh,
> having the syscall wiring done separately makes it easy for arch
> maintainers to ack only the wiring up part. Both ways are valid imho.
> (cachestat() did it for x86 and then all the others separately. So
> really it seems a bit all over the place depending on the scenario.)

Fair enough!

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--y33k3lm4leglkjmq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS2TklVsp+j1GPyqQYol/rSt+lEbwUCZMKsfgAKCRAol/rSt+lE
b/FwAQChKTWhN1YMxOU/bLQz1S3i+RhA8DQHZpoCbh1FlOSYwAEAmOKfPG+e4zNA
VW75+QkpKlGw0rY3TfjxW8YkGfonXgo=
=/4Tp
-----END PGP SIGNATURE-----

--y33k3lm4leglkjmq--
