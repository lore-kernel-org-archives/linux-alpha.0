From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 3/5] locking/arch: Wire up local_try_cmpxchg
Date: Wed, 12 Apr 2023 15:40:42 +0200
Message-ID: <20230412134042.GA629004@hirez.programming.kicks-ass.net>
References: <20230405141710.3551-1-ubizjak@gmail.com>
 <20230405141710.3551-4-ubizjak@gmail.com>
 <20230412113231.GA628377@hirez.programming.kicks-ass.net>
 <CAFULd4aCNNcyQm3Av+KkWVXuU9Cb0G5H5cFmqVR_T5LwCW=YJA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=DH15/SxDiYPBLclQ56VREuISrrW5j0LDqpqQq7OVNTI=; b=fwo5YyaVDrgsSL1EW2eG6ZifCn
        nQARtc5HebgVz/+GdbkxT/HPewsrSDhvVH8ViRA5L7yR3WDbC9DmPggQPMdj2YU5JTreQzgfcwIKm
        QRIAf1XdE4vAZHL0z+gNAmTMcU5KaoOQ2EOMGd9NlHIdVOmX12t8zqrCTXjMvpovvMKsp/zSSW2QL
        wq1adFoxn9YV53iWVnsLJEs7kK5kS/Iud8T75kNNVd8EGfzTkIbD/mdTwGc/j8gZRy4ze+jaUhHxc
        USHi7FYvDd+KVHT4eWYOpwNhRzG3lGIjcuJBHNZ/qmCUUEBKnMbL9FzU4jNUAL2z3AnG8l+wY3m+A
        6p0qEndQ==;
Content-Disposition: inline
In-Reply-To: <CAFULd4aCNNcyQm3Av+KkWVXuU9Cb0G5H5cFmqVR_T5LwCW=YJA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Jun Yi <yijun@loongson.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>

On Wed, Apr 12, 2023 at 03:37:50PM +0200, Uros Bizjak wrote:
> On Wed, Apr 12, 2023 at 1:33=E2=80=AFPM Peter Zijlstra <peterz@infradead.=
org> wrote:
> >
> > On Wed, Apr 05, 2023 at 04:17:08PM +0200, Uros Bizjak wrote:
> > > diff --git a/arch/powerpc/include/asm/local.h b/arch/powerpc/include/=
asm/local.h
> > > index bc4bd19b7fc2..45492fb5bf22 100644
> > > --- a/arch/powerpc/include/asm/local.h
> > > +++ b/arch/powerpc/include/asm/local.h
> > > @@ -90,6 +90,17 @@ static __inline__ long local_cmpxchg(local_t *l, l=
ong o, long n)
> > >       return t;
> > >  }
> > >
> > > +static __inline__ bool local_try_cmpxchg(local_t *l, long *po, long =
n)
> > > +{
> > > +     long o =3D *po, r;
> > > +
> > > +     r =3D local_cmpxchg(l, o, n);
> > > +     if (unlikely(r !=3D o))
> > > +             *po =3D r;
> > > +
> > > +     return likely(r =3D=3D o);
> > > +}
> > > +
> >
> > Why is the ppc one different from the rest? Why can't it use the
> > try_cmpxchg_local() fallback and needs to have it open-coded?
>=20
> Please note that ppc directly defines local_cmpxchg that bypasses
> cmpxchg_local/arch_cmpxchg_local machinery. The patch takes the same
> approach for local_try_cmpxchg, because fallbacks are using
> arch_cmpxchg_local definitions.
>=20
> PPC should be converted to use arch_cmpxchg_local (to also enable
> instrumentation), but this is not the scope of the proposed patchset.

Ah indeed. Thanks!
