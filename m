From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] include/asm/cmpxchg.h: Remove duplicate header
Date: Sat, 3 Nov 2018 00:28:41 +0530
Message-ID: <CAFqt6zYmBFQ7gDJJkYAhPzPYyLGsDqOdr8ctXmYbd7e9sv75xg@mail.gmail.com>
References: <20181102152637.GA3105@hp-pavilion-15-notebook-pc-brajeswar> <20181102182905.3klrdw4dxapeoiib@tower>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=LyxylQsEOAKO9YnrpN6j8Cv17Xvxh0WHRz+EZRQzaJA=;
        b=X7qyfqoqkp+N7mxKcSrgRg9XsAAOyEXsx/+dUdRFnIcRu8D4/jClPFxe3eDrt3L9/M
         VTsknkbeAzuLsVLMhNhh8Lei6M8UQEV58CLPlOOuTQpHLPyDtIPBwFAOPMaw5RqqunoJ
         nTbij41a5EEvZcuUziWtP2Dk7u/2mh00w24W3J/km13RykEGSQKqE+fsImQ3efyIb11e
         zyMn+EO6vOM2nzTgp3SRRBddUE3yrUUB88njAAnXoFowZT/Ozu5CLAyLiOwZ40Vg4T4F
         PZkXJ5A53YlBSTZT3T5UIyqAlS2jm2sC/0jsW2Pa38ekphLBYkSU5lL5U9EvSNZRChSA
         17EQ==
In-Reply-To: <20181102182905.3klrdw4dxapeoiib@tower>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mcree@orcon.net.nz, Brajeswar Ghosh <brajeswar.linux@gmail.com>, rth@twiddle.net, ink@jurassic.park.msu.ru, Matt Turner <mattst88@gmail.com>, parri.andrea@gmail.com, mingo@kernel.org, paulmck@linux.vnet.ibm.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Sabyasachi Gupta <sabyasachi.linux@gmail.com>

Hi Michael,

On Fri, Nov 2, 2018 at 11:59 PM Michael Cree <mcree@orcon.net.nz> wrote:
>
> On Fri, Nov 02, 2018 at 08:56:37PM +0530, Brajeswar Ghosh wrote:
> > Remove asm/xchg.h which is included more than once
> >
> > Signed-off-by: Brajeswar Ghosh <brajeswar.linux@gmail.com>
> > ---
> >  arch/alpha/include/asm/cmpxchg.h | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
> > index 6c7c39452471..bcbdac0744f9 100644
> > --- a/arch/alpha/include/asm/cmpxchg.h
> > +++ b/arch/alpha/include/asm/cmpxchg.h
> > @@ -36,7 +36,6 @@
> >  #undef ____cmpxchg
> >  #define ____xchg(type, args...)              __xchg ##type(args)
> >  #define ____cmpxchg(type, args...)   __cmpxchg ##type(args)
> > -#include <asm/xchg.h>
>
> It's amazing the number of times we get a patch to remove that.
>
> Instead of just automatically removing a second include of a
> header file, why don't you take a closer look to see what it
> actually does?

We run the static analyser "make includecheck" which list out files where
duplicate headers can be removed and based on that we thought to remove
from this file. Didn't understood about the existence of second include ??
