From: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Date: Fri, 28 Jul 2023 03:12:24 +1000
Message-ID: <20230727.041348-imposing.uptake.velvet.nylon-712tDwzCAbCCoSGx@cyphar.com>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
 <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
 <ZMEjlDNJkFpYERr1@example.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mzzk664uqt7bucoa"
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyphar.com; s=MBO0001;
        t=1690477981;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=r4xS4z3m09mcDhbG2vSNuCuAOWPT6oLsRQePsTlsExg=;
        b=wphgglIyp+usBR0fNyl85KtqD+TvcRheXCarcC9+q/rC2O/c19YVrPmD3yxd6P5zNkRAgn
        ap1J1ewuz2/88KROo01hnaKnZ4/JhylWNhiBSxQ81mAbQ2FpPaPd18Eeg5JBsnXEACuOVL
        kxHc79dCNTAe95YgGNhXV08fsF9k1vsOGv6GUB2QE5SFFlSOWEvhyRbKLtNFmt5GQKNj3u
        IN6dDugiyIaBjBJ+ymRyuAdQFshGsVMUm52bzNxGOPYfWT6GeKADooVM0YYFrrgU4Aio3h
        BRZYiw4NU+t71y0ghqPQ5R5qkpDibTPetLXyyMi4+J3mphGiAC1Gb+WOSRyIbQ==
Content-Disposition: inline
In-Reply-To: <ZMEjlDNJkFpYERr1@example.org>
List-ID: <linux-alpha.vger.kernel.org>
To: Alexey Gladkov <legion@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, James.Bottomley@hansenpartnership.com, acme@kernel.org, alexander.shishkin@linux.intel.com, axboe@kernel.dk, benh@kernel.crashing.org, borntraeger@de.ibm.com, bp@alien8.de, catalin.marinas@arm.com, christian@brauner.io, dalias@libc.org, davem@davemloft.net, deepa.kernel@gmail.com, deller@gmx.de, dhowells@redhat.com, fenghua.yu@intel.com, fweimer@redhat.com, geert@linux-m68k.org, glebfm@altlinux.org, gor@linux.ibm.com, hare@suse.com, hpa@zytor.com, ink@jurassic.park.msu.ru, jhogan@kernel.org, kim.phillips@arm.com, ldv@altlinux.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-m68k@lists.li


--mzzk664uqt7bucoa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023-07-26, Alexey Gladkov <legion@kernel.org> wrote:
> On Wed, Jul 26, 2023 at 02:36:25AM +1000, Aleksa Sarai wrote:
> > On 2023-07-11, Alexey Gladkov <legion@kernel.org> wrote:
> > > On the userspace side fchmodat(3) is implemented as a wrapper
> > > function which implements the POSIX-specified interface. This
> > > interface differs from the underlying kernel system call, which does =
not
> > > have a flags argument. Most implementations require procfs [1][2].
> > >=20
> > > There doesn't appear to be a good userspace workaround for this issue
> > > but the implementation in the kernel is pretty straight-forward.
> > >=20
> > > The new fchmodat2() syscall allows to pass the AT_SYMLINK_NOFOLLOW fl=
ag,
> > > unlike existing fchmodat.
> > >=20
> > > [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsysdeps/un=
ix/sysv/linux/fchmodat.c;h=3D17eca54051ee28ba1ec3f9aed170a62630959143;hb=3D=
a492b1e5ef7ab50c6fdd4e4e9879ea5569ab0a6c#l35
> > > [2] https://git.musl-libc.org/cgit/musl/tree/src/stat/fchmodat.c?id=
=3D718f363bc2067b6487900eddc9180c84e7739f80#n28
> > >=20
> > > Co-developed-by: Palmer Dabbelt <palmer@sifive.com>
> > > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > >  fs/open.c                | 18 ++++++++++++++----
> > >  include/linux/syscalls.h |  2 ++
> > >  2 files changed, 16 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/fs/open.c b/fs/open.c
> > > index 0c55c8e7f837..39a7939f0d00 100644
> > > --- a/fs/open.c
> > > +++ b/fs/open.c
> > > @@ -671,11 +671,11 @@ SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode=
_t, mode)
> > >  	return err;
> > >  }
> > > =20
> > > -static int do_fchmodat(int dfd, const char __user *filename, umode_t=
 mode)
> > > +static int do_fchmodat(int dfd, const char __user *filename, umode_t=
 mode, int lookup_flags)
> >=20
> > I think it'd be much neater to do the conversion of AT_ flags here and
> > pass 0 as a flags argument for all of the wrappers (this is how most of
> > the other xyz(), fxyz(), fxyzat() syscall wrappers are done IIRC).
>=20
> I just addressed the Al Viro's suggestion.
>=20
> https://lore.kernel.org/lkml/20190717014802.GS17978@ZenIV.linux.org.uk/

I think Al misspoke, because he also said "pass it 0 as an extra
argument", but you actually have to pass LOOKUP_FOLLOW from the
wrappers. If you look at how faccessat2 and faccessat are implemented,
it follows the behaviour I described.

> > >  {
> > >  	struct path path;
> > >  	int error;
> > > -	unsigned int lookup_flags =3D LOOKUP_FOLLOW;
> > > +
> > >  retry:
> > >  	error =3D user_path_at(dfd, filename, lookup_flags, &path);
> > >  	if (!error) {
> > > @@ -689,15 +689,25 @@ static int do_fchmodat(int dfd, const char __us=
er *filename, umode_t mode)
> > >  	return error;
> > >  }
> > > =20
> > > +SYSCALL_DEFINE4(fchmodat2, int, dfd, const char __user *, filename,
> > > +		umode_t, mode, int, flags)
> > > +{
> > > +	if (unlikely(flags & ~AT_SYMLINK_NOFOLLOW))
> > > +		return -EINVAL;
> >=20
> > We almost certainly want to support AT_EMPTY_PATH at the same time.
> > Otherwise userspace will still need to go through /proc when trying to
> > chmod a file handle they have.
>=20
> I'm not sure I understand. Can you explain what you mean?

You should add support for AT_EMPTY_PATH (LOOKUP_EMPTY) as well as
AT_SYMLINK_NOFOLLOW. It would only require something like:

	unsigned int lookup_flags =3D LOOKUP_FOLLOW;

	if (flags & ~(AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW))
		return -EINVAL;

	if (flags & AT_EMPTY_PATH)
		lookup_flags |=3D LOOKUP_EMPTY;
	if (flags & AT_SYMLINK_NOFOLLOW)
		lookup_flags &=3D ~LOOKUP_FOLLOW;

	/* ... */

This would be effectively equivalent to fchmod(fd, mode). (I was wrong
when I said this wasn't already possible -- I forgot about fchmod(2).)

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--mzzk664uqt7bucoa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS2TklVsp+j1GPyqQYol/rSt+lEbwUCZMKleAAKCRAol/rSt+lE
bym9AQDqgQyuOeexUTCKq/tyT2Gt8n1mt1PGm55hdeFxmQCD1AD+NkISNEOp7Oej
qTsMPEIGWvfGX/MWtUS2thZbT2WvjA4=
=+qOC
-----END PGP SIGNATURE-----

--mzzk664uqt7bucoa--
