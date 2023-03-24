From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 01/10] locking/atomic: Add missing cast to try_cmpxchg()
 fallbacks
Date: Fri, 24 Mar 2023 16:32:52 +0000
Message-ID: <ZB3QtDYuWdpiD5qk@FVFF77S0Q05N>
References: <20230305205628.27385-1-ubizjak@gmail.com>
 <20230305205628.27385-2-ubizjak@gmail.com>
 <ZB2v+avNt52ac/+w@FVFF77S0Q05N>
 <CAFULd4ZCgxDYnyy--qdgKoAo_y7MbNSaQdbdBFefnFuMoM2OYw@mail.gmail.com>
 <ZB3MR8lGbnea9ui6@FVFF77S0Q05N>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mips-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ZB3MR8lGbnea9ui6@FVFF77S0Q05N>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>

On Fri, Mar 24, 2023 at 04:14:22PM +0000, Mark Rutland wrote:
> On Fri, Mar 24, 2023 at 04:43:32PM +0100, Uros Bizjak wrote:
> > On Fri, Mar 24, 2023 at 3:13=E2=80=AFPM Mark Rutland <mark.rutland@arm.=
com> wrote:
> > >
> > > On Sun, Mar 05, 2023 at 09:56:19PM +0100, Uros Bizjak wrote:
> > > > Cast _oldp to the type of _ptr to avoid incompatible-pointer-types =
warning.
> > >
> > > Can you give an example of where we are passing an incompatible point=
er?
> >=20
> > An example is patch 10/10 from the series, which will fail without
> > this fix when fallback code is used. We have:
> >=20
> > -       } while (local_cmpxchg(&rb->head, offset, head) !=3D offset);
> > +       } while (!local_try_cmpxchg(&rb->head, &offset, head));
> >=20
> > where rb->head is defined as:
> >=20
> > typedef struct {
> >    atomic_long_t a;
> > } local_t;
> >=20
> > while offset is defined as 'unsigned long'.
>=20
> Ok, but that's because we're doing the wrong thing to start with.
>=20
> Since local_t is defined in terms of atomic_long_t, we should define the
> generic local_try_cmpxchg() in terms of atomic_long_try_cmpxchg(). We'll =
still
> have a mismatch between 'long *' and 'unsigned long *', but then we can f=
ix
> that in the callsite:
>=20
> 	while (!local_try_cmpxchg(&rb->head, &(long *)offset, head))

Sorry, that should be:
=09
	while (!local_try_cmpxchg(&rb->head, (long *)&offset, head))

The fundamenalthing I'm trying to say is that the
atomic/atomic64/atomic_long/local/local64 APIs should be type-safe, and for
their try_cmpxchg() implementations, the type signature should be:

	${atomictype}_try_cmpxchg(${atomictype} *ptr, ${inttype} *old, ${inttype} =
new)

Thanks,
Mark.
