From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 01/10] locking/atomic: Add missing cast to try_cmpxchg()
 fallbacks
Date: Fri, 24 Mar 2023 16:14:22 +0000
Message-ID: <ZB3MR8lGbnea9ui6@FVFF77S0Q05N>
References: <20230305205628.27385-1-ubizjak@gmail.com>
 <20230305205628.27385-2-ubizjak@gmail.com>
 <ZB2v+avNt52ac/+w@FVFF77S0Q05N>
 <CAFULd4ZCgxDYnyy--qdgKoAo_y7MbNSaQdbdBFefnFuMoM2OYw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mips-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFULd4ZCgxDYnyy--qdgKoAo_y7MbNSaQdbdBFefnFuMoM2OYw@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>

On Fri, Mar 24, 2023 at 04:43:32PM +0100, Uros Bizjak wrote:
> On Fri, Mar 24, 2023 at 3:13=E2=80=AFPM Mark Rutland <mark.rutland@arm.co=
m> wrote:
> >
> > On Sun, Mar 05, 2023 at 09:56:19PM +0100, Uros Bizjak wrote:
> > > Cast _oldp to the type of _ptr to avoid incompatible-pointer-types wa=
rning.
> >
> > Can you give an example of where we are passing an incompatible pointer?
>=20
> An example is patch 10/10 from the series, which will fail without
> this fix when fallback code is used. We have:
>=20
> -       } while (local_cmpxchg(&rb->head, offset, head) !=3D offset);
> +       } while (!local_try_cmpxchg(&rb->head, &offset, head));
>=20
> where rb->head is defined as:
>=20
> typedef struct {
>    atomic_long_t a;
> } local_t;
>=20
> while offset is defined as 'unsigned long'.

Ok, but that's because we're doing the wrong thing to start with.

Since local_t is defined in terms of atomic_long_t, we should define the
generic local_try_cmpxchg() in terms of atomic_long_try_cmpxchg(). We'll st=
ill
have a mismatch between 'long *' and 'unsigned long *', but then we can fix
that in the callsite:

	while (!local_try_cmpxchg(&rb->head, &(long *)offset, head))

... which then won't silently mask issues elsewhere, and will be consistent
with all the other atomic APIs.

Thanks,
Mark.

>=20
> The assignment in existing try_cmpxchg template:
>=20
> typeof(*(_ptr)) *___op =3D (_oldp)
>=20
> will trigger an initialization from an incompatible pointer type error.
>=20
> Please note that x86 avoids this issue by a cast in its
> target-dependent definition:
>=20
> #define __raw_try_cmpxchg(_ptr, _pold, _new, size, lock)                \
> ({                                                                      \
>        bool success;                                                   \
>        __typeof__(_ptr) _old =3D (__typeof__(_ptr))(_pold);              \
>        __typeof__(*(_ptr)) __old =3D *_old;                              \
>        __typeof__(*(_ptr)) __new =3D (_new);                             \
>=20
> so, the warning/error will trigger only in the fallback code.
>=20
> > That sounds indicative of a bug in the caller, but maybe I'm missing so=
me
> > reason this is necessary due to some indirection.
> >
> > > Fixes: 29f006fdefe6 ("asm-generic/atomic: Add try_cmpxchg() fallbacks=
")
> >
> > I'm not sure that this needs a fixes tag. Does anything go wrong today,=
 or only
> > later in this series?
>=20
> The patch at [1] triggered a build error in posix_acl.c/__get.acl due
> to the same problem. The compilation for x86 target was OK, because
> x86 defines target-specific arch_try_cmpxchg, but the compilation
> broke for targets that revert to generic support. Please note that
> this specific problem was recently fixed in a different way [2], but
> the issue with the fallback remains.
>=20
> [1] https://lore.kernel.org/lkml/20220714173819.13312-1-ubizjak@gmail.com/
> [2] https://lore.kernel.org/lkml/20221201160103.76012-1-ubizjak@gmail.com/
>=20
> Uros.
