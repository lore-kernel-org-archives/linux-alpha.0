From: Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH v2 3/5] locking/arch: Wire up local_try_cmpxchg
Date: Wed, 12 Apr 2023 15:37:50 +0200
Message-ID: <CAFULd4aCNNcyQm3Av+KkWVXuU9Cb0G5H5cFmqVR_T5LwCW=YJA@mail.gmail.com>
References: <20230405141710.3551-1-ubizjak@gmail.com> <20230405141710.3551-4-ubizjak@gmail.com>
 <20230412113231.GA628377@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681306682; x=1683898682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWdLpuhyNb11g+2phf0ujfTe5bokf6y5zMA0DxQiBiA=;
        b=B/jjBNSTypcC+joaCW6KBpHZMJp0zGfpqOXg+zBPIJ4NWlwYrPSMxjdSJy75T7U+3W
         U3p3HotHjbkZlaRKmFC8qc1Afx6oeTJ5uQpH2hG5w6sceSXtWvhwqD0ty4GTJOrTqqUL
         idO/30jacGJYN69+SVScPsn3OHD9k8oRdDeFIGHLcMZu3eu8rF9Xwdo+4T1+slcDtYsU
         YH0NOP8VGLe82rREMYx2QH+7wkX8dWpsJjPbWWLufPzhXmFeBT9DiKG3mgcWZ9nD2lka
         J4Q7aWlsb6BWQEoFbqY6WJkyrIjqnRCGYJf4CUJlNWaYPJ0je3GRhXlmjShv2pC79kPd
         uijw==
In-Reply-To: <20230412113231.GA628377@hirez.programming.kicks-ass.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Jun Yi <yijun@loongson.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>

On Wed, Apr 12, 2023 at 1:33=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Apr 05, 2023 at 04:17:08PM +0200, Uros Bizjak wrote:
> > diff --git a/arch/powerpc/include/asm/local.h b/arch/powerpc/include/as=
m/local.h
> > index bc4bd19b7fc2..45492fb5bf22 100644
> > --- a/arch/powerpc/include/asm/local.h
> > +++ b/arch/powerpc/include/asm/local.h
> > @@ -90,6 +90,17 @@ static __inline__ long local_cmpxchg(local_t *l, lon=
g o, long n)
> >       return t;
> >  }
> >
> > +static __inline__ bool local_try_cmpxchg(local_t *l, long *po, long n)
> > +{
> > +     long o =3D *po, r;
> > +
> > +     r =3D local_cmpxchg(l, o, n);
> > +     if (unlikely(r !=3D o))
> > +             *po =3D r;
> > +
> > +     return likely(r =3D=3D o);
> > +}
> > +
>
> Why is the ppc one different from the rest? Why can't it use the
> try_cmpxchg_local() fallback and needs to have it open-coded?

Please note that ppc directly defines local_cmpxchg that bypasses
cmpxchg_local/arch_cmpxchg_local machinery. The patch takes the same
approach for local_try_cmpxchg, because fallbacks are using
arch_cmpxchg_local definitions.

PPC should be converted to use arch_cmpxchg_local (to also enable
instrumentation), but this is not the scope of the proposed patchset.

Uros.
