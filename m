From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] fs: don't let getdents return bogus names
Date: Sun, 29 Jul 2018 13:37:55 +0200
Message-ID: <20180729113755.GB7333@amd>
References: <20180716194843.252772-1-jannh@google.com>
 <20180716195657.GO30522@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180716195657.GO30522@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Jann Horn <jannh@google.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-fsdevel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2018-07-16 20:56:57, Al Viro wrote:
> On Mon, Jul 16, 2018 at 09:48:43PM +0200, Jann Horn wrote:
> > When you e.g. run `find` on a directory for which getdents returns
> > "filenames" that contain slashes, `find` passes those "filenames" back =
to
> > the kernel, which then interprets them as paths. That could conceivably
> > cause userspace to do something bad when accessing something like an
> > untrusted USB stick, but I'm not aware of any specific example.
> >=20
> > Instead of returning bogus filenames to userspace, return -EUCLEAN.
>=20
> Because there's such a lot of userland code that expect and handles that
> error value...
>=20
> I'm not sure if this mitigation is actually better than "just return it
> as-is", TBH.

Well, userspace should handle errors.. it may not understand what this
particular error means, but that's still better than risking issues
with / in path....

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltdpxMACgkQMOfwapXb+vLXiwCgvna3Iw+Gbdg1U/GXNW0JeBwb
6GgAn1X3GXWcK1tPTRBGUd5bAnxB4dSI
=Io9+
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
