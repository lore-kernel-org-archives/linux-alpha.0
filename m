From: Nhat Pham <nphamcs@gmail.com>
Subject: Re: [PATCH] cachestat: wire up cachestat for other architectures
Date: Thu, 11 May 2023 12:34:23 -0700
Message-ID: <CAKEwX=OHMaUzEG9hoMz20m9DnyFD4xC78KiNV1Qu0bUhkrYhAA@mail.gmail.com>
References: <20230510195806.2902878-1-nphamcs@gmail.com> <874joja6vz.fsf@mail.lhotse>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683833674; x=1686425674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkRg4aBIGd+Ujeyjhqn0VJEzJVlq0iY77Z11k0mAFFM=;
        b=D8VOr21Fczrl0K1COf0x4Ck7WHMsRogiYEEbrY2VpNny+n3MR+tJuDH09I9YAsS652
         swT6GvFknXTnMBZPWlOxHk2u05+SeKUhRFMH/ZtDMNfuFTmqhV28jtrPoFuIwQ/bqAzu
         JEHJCZ22+ejNPu9sQ5B4mFAObz8laeWoYTSRIa0MiOnPq0OszLg5zmMrWPnpqMS2qlwN
         5gjqnyxgdjPUMVEd0f/03my+5DYNfTma/sJ3vnrs+cTqKEwezFl9LOtEmPAD5vfhXfNX
         JrpZrTJ+uj1uIfEyrp6lAwR5J8sidiziH5Wld/lDfUFxzbjgvyiL15VatExShfnoJdEm
         /ImQ==
In-Reply-To: <874joja6vz.fsf@mail.lhotse>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, linux-api@vger.kernel.org, kernel-team@meta.com, linux-arch@vger.kernel.org, hannes@cmpxchg.org, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux@armlinux.org.uk, geert@linux-m68k.org, monstr@monstr.eu, tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, deller@gmx.de, npiggin@gmail.com, christophe.leroy@csgroup.eu, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, chris@zankel.net, jcmvbkbc@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, lin

On Wed, May 10, 2023 at 8:23=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Nhat Pham <nphamcs@gmail.com> writes:
> > cachestat is previously only wired in for x86 (and architectures using
> > the generic unistd.h table):
> >
> > https://lore.kernel.org/lkml/20230503013608.2431726-1-nphamcs@gmail.com=
/
> >
> > This patch wires cachestat in for all the other architectures.
> >
> > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> > ---
> >  arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
> >  arch/arm/tools/syscall.tbl                  | 1 +
> >  arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
> >  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +
> >  arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
> >  arch/mips/kernel/syscalls/syscall_n32.tbl   | 1 +
> >  arch/mips/kernel/syscalls/syscall_n64.tbl   | 1 +
> >  arch/mips/kernel/syscalls/syscall_o32.tbl   | 1 +
> >  arch/parisc/kernel/syscalls/syscall.tbl     | 1 +
> >  arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +
>
> With the change to the selftest (see my other mail), I tested this on
> powerpc and all tests pass.

Saw the change you proposed, Michael! It looks good to me.
Thanks for helping me make the selftest suite more robust :)

>
> Tested-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
>
> cheers
