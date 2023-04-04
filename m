From: Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH 01/10] locking/atomic: Add missing cast to try_cmpxchg() fallbacks
Date: Tue, 4 Apr 2023 15:23:09 +0200
Message-ID: <CAFULd4ZypxQULgq-MYgzsYd8k_BV0aH0eRhggX3MHWCgvKW=Bg@mail.gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com> <20230305205628.27385-2-ubizjak@gmail.com>
 <ZB2v+avNt52ac/+w@FVFF77S0Q05N> <CAFULd4ZCgxDYnyy--qdgKoAo_y7MbNSaQdbdBFefnFuMoM2OYw@mail.gmail.com>
 <ZB3MR8lGbnea9ui6@FVFF77S0Q05N> <ZB3QtDYuWdpiD5qk@FVFF77S0Q05N>
 <CAFULd4aFUF5k=QJD8tDp4qzm2iBF7=rNvp1SJWrg44X5hTFxtQ@mail.gmail.com>
 <ZCqoRNU8EJhKJVEu@FVFF77S0Q05N> <CAFULd4ZUnbtDYXBBbuTJnq9wLSf5cZTc=hUPxg6-8KRNA7YVeQ@mail.gmail.com>
 <ZCwj19okhYNRN8er@FVFF77S0Q05N.cambridge.arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680614601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVV5FfyLXKvr30JASXaFzrtmOvguU/pSGwBivgkkCt8=;
        b=CxCzEj2L7VIhJL6LkhpoeSyjitfjUIwxyK7WygTAvIMrtL8sNfxriP0xlU7D62WQoz
         JS8ax3M/Eesvd5oi0sr1H03A3xMMSSa82fhef9qRDqrlsouM+KCZqqtCxNs6kzj4t5Ub
         F7DDt5YscrWWbseYb3G5W9hFZRpZsQPXo27yv0jzn2w9mDA1ooRuDwc7z6znLG2Vi+Bi
         tq4rA2ZMQA51NCQ7Ksdo8VwWalrmJJS5r9RCMSPpRrKxpS4no0h4o3ze6IAi22w6AMMd
         0et5DLzt+KCxhgyjPFDLnq1TYfArzjvJxF3PKXuT3UfUffLUWpYKI/WE/kzz1oDnvdpX
         Etng==
In-Reply-To: <ZCwj19okhYNRN8er@FVFF77S0Q05N.cambridge.arm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>

On Tue, Apr 4, 2023 at 3:19=E2=80=AFPM Mark Rutland <mark.rutland@arm.com> =
wrote:
>
> On Tue, Apr 04, 2023 at 02:24:38PM +0200, Uros Bizjak wrote:
> > On Mon, Apr 3, 2023 at 12:19=E2=80=AFPM Mark Rutland <mark.rutland@arm.=
com> wrote:
> > >
> > > On Sun, Mar 26, 2023 at 09:28:38PM +0200, Uros Bizjak wrote:
> > > > On Fri, Mar 24, 2023 at 5:33=E2=80=AFPM Mark Rutland <mark.rutland@=
arm.com> wrote:
> > > > >
> > > > > On Fri, Mar 24, 2023 at 04:14:22PM +0000, Mark Rutland wrote:
> > > > > > On Fri, Mar 24, 2023 at 04:43:32PM +0100, Uros Bizjak wrote:
> > > > > > > On Fri, Mar 24, 2023 at 3:13=E2=80=AFPM Mark Rutland <mark.ru=
tland@arm.com> wrote:
> > > > > > > >
> > > > > > > > On Sun, Mar 05, 2023 at 09:56:19PM +0100, Uros Bizjak wrote=
:
> > > > > > > > > Cast _oldp to the type of _ptr to avoid incompatible-poin=
ter-types warning.
> > > > > > > >
> > > > > > > > Can you give an example of where we are passing an incompat=
ible pointer?
> > > > > > >
> > > > > > > An example is patch 10/10 from the series, which will fail wi=
thout
> > > > > > > this fix when fallback code is used. We have:
> > > > > > >
> > > > > > > -       } while (local_cmpxchg(&rb->head, offset, head) !=3D =
offset);
> > > > > > > +       } while (!local_try_cmpxchg(&rb->head, &offset, head)=
);
> > > > > > >
> > > > > > > where rb->head is defined as:
> > > > > > >
> > > > > > > typedef struct {
> > > > > > >    atomic_long_t a;
> > > > > > > } local_t;
> > > > > > >
> > > > > > > while offset is defined as 'unsigned long'.
> > > > > >
> > > > > > Ok, but that's because we're doing the wrong thing to start wit=
h.
> > > > > >
> > > > > > Since local_t is defined in terms of atomic_long_t, we should d=
efine the
> > > > > > generic local_try_cmpxchg() in terms of atomic_long_try_cmpxchg=
(). We'll still
> > > > > > have a mismatch between 'long *' and 'unsigned long *', but the=
n we can fix
> > > > > > that in the callsite:
> > > > > >
> > > > > >       while (!local_try_cmpxchg(&rb->head, &(long *)offset, hea=
d))
> > > > >
> > > > > Sorry, that should be:
> > > > >
> > > > >         while (!local_try_cmpxchg(&rb->head, (long *)&offset, hea=
d))
> > > >
> > > > The fallbacks are a bit more complicated than above, and are differ=
ent
> > > > from atomic_try_cmpxchg.
> > > >
> > > > Please note in patch 2/10, the falbacks when arch_try_cmpxchg_local
> > > > are not defined call arch_cmpxchg_local. Also in patch 2/10,
> > > > try_cmpxchg_local is introduced, where it calls
> > > > arch_try_cmpxchg_local. Targets (and generic code) simply define (e=
.g.
> > > > :
> > > >
> > > > #define local_cmpxchg(l, o, n) \
> > > >        (cmpxchg_local(&((l)->a.counter), (o), (n)))
> > > > +#define local_try_cmpxchg(l, po, n) \
> > > > +       (try_cmpxchg_local(&((l)->a.counter), (po), (n)))
> > > >
> > > > which is part of the local_t API. Targets should either define all
> > > > these #defines, or none. There are no partial fallbacks as is the c=
ase
> > > > with atomic_t.
> > >
> > > Whether or not there are fallbacks is immaterial.
> > >
> > > In those cases, architectures can just as easily write C wrappers, e.=
g.
> > >
> > > long local_cmpxchg(local_t *l, long old, long new)
> > > {
> > >         return cmpxchg_local(&l->a.counter, old, new);
> > > }
> > >
> > > long local_try_cmpxchg(local_t *l, long *old, long new)
> > > {
> > >         return try_cmpxchg_local(&l->a.counter, old, new);
> > > }
> >
> > Please find attached the complete prototype patch that implements the
> > above suggestion.
> >
> > The patch includes:
> > - implementation of instrumented try_cmpxchg{,64}_local definitions
> > - corresponding arch_try_cmpxchg{,64}_local fallback definitions
> > - generic local{,64}_try_cmpxchg (and local{,64}_cmpxchg) C wrappers
> >
> > - x86 specific local_try_cmpxchg (and local_cmpxchg) C wrappers
> > - x86 specific arch_try_cmpxchg_local definition
> >
> > - kernel/events/ring_buffer.c change to test local_try_cmpxchg
> > implementation and illustrate the transition
> > - arch/x86/events/core.c change to test local64_try_cmpxchg
> > implementation and illustrate the transition
> >
> > The definition of atomic_long_t is different for 64-bit and 32-bit
> > targets (s64 vs int), so target specific C wrappers have to use
> > different casts to account for this difference.
> >
> > Uros.
>
> Thanks for this!
>
> FWIW, the patch (inline below) looks good to me.

Thanks, I will prepare a patch series for submission later today.

Uros.
