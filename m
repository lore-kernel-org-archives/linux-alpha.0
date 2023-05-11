From: Nhat Pham <nphamcs@gmail.com>
Subject: Re: [PATCH] cachestat: wire up cachestat for other architectures
Date: Thu, 11 May 2023 02:01:37 -0700
Message-ID: <CAKEwX=Pty0V0m+_00F1uWR1EXt8Gt35PYh-yUZEd-LQRSKgfGQ@mail.gmail.com>
References: <20230510195806.2902878-1-nphamcs@gmail.com> <CAMuHMdV=PNCb1VYfUkEb9rPwGVB=1tkwvm-XBqECyhHR4SNGKg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683795709; x=1686387709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KATKL5c9hHw7borFknSpolyvbkYiWwqKIKb81BIcugs=;
        b=LiA5aCThzGnNp7E+Ta+DAvVEwiclZpF791zLAUwx+Als8erWN8Yl7PpwtloKY7vfA7
         +VTsnl2KSlBmbyAImxRU3lG+IUT2Wqb5hUFCcAsZyEs/D1k9iAGqD79kt7aecJ/Cxj9r
         eR6nzEnIzjucsN/6A+1hNPz8FvRo+Kuj2ketbPBiwSj1JqzajAiKbzNVkW/c2RJBCR3k
         MZC8rrsOEhbdZrX91ntkakGdeHJHeYwEVqGe6cUOqDaw42N8TysvScbiMKu+APTP9eCY
         3fchxaSfDDqrX5GvKxMc/O6qbvizbF/orFqeAlT1EFH85PiOL82QGmIN8EQXMGf+kfzf
         4sBA==
In-Reply-To: <CAMuHMdV=PNCb1VYfUkEb9rPwGVB=1tkwvm-XBqECyhHR4SNGKg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, linux-api@vger.kernel.org, kernel-team@meta.com, linux-arch@vger.kernel.org, hannes@cmpxchg.org, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux@armlinux.org.uk, monstr@monstr.eu, tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, deller@gmx.de, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, chris@zankel.net, jcmvbkbc@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@li

On Thu, May 11, 2023 at 12:01=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Nat,
>
> On Wed, May 10, 2023 at 9:58=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wro=
te:
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
>
> Looking at the last addition of a syscall (commit 21b084fdf2a49ca1
> ("mm/mempolicy: wire up syscall set_mempolicy_home_node"), it looks
> like you forgot to update arm64 in compat mode? Or is that not needed?

It does look like I missed that! Thanks for the reminder. I'll send a fixle=
t
shortly...

Best,
Nhat

>
> >  arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
> >  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +
>
> For m68k:
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> >  arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
> >  arch/mips/kernel/syscalls/syscall_n32.tbl   | 1 +
> >  arch/mips/kernel/syscalls/syscall_n64.tbl   | 1 +
> >  arch/mips/kernel/syscalls/syscall_o32.tbl   | 1 +
> >  arch/parisc/kernel/syscalls/syscall.tbl     | 1 +
> >  arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +
> >  arch/s390/kernel/syscalls/syscall.tbl       | 1 +
> >  arch/sh/kernel/syscalls/syscall.tbl         | 1 +
> >  arch/sparc/kernel/syscalls/syscall.tbl      | 1 +
> >  arch/xtensa/kernel/syscalls/syscall.tbl     | 1 +
> >  14 files changed, 14 insertions(+)
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
