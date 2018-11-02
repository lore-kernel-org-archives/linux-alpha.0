From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] include/asm/cmpxchg.h: Remove duplicate header
Date: Sat, 3 Nov 2018 00:43:18 +0530
Message-ID: <CAFqt6zboDwTNUkvhRi2s=LUnqhvXoHtGQFkrUrW+2bCEb=5RRQ@mail.gmail.com>
References: <20181102152637.GA3105@hp-pavilion-15-notebook-pc-brajeswar>
 <20181102182905.3klrdw4dxapeoiib@tower> <CAFqt6zYmBFQ7gDJJkYAhPzPYyLGsDqOdr8ctXmYbd7e9sv75xg@mail.gmail.com>
 <CAEdQ38Fh99QmusGbEBi9TjUKQbQDX90pEaUC5Y=s-BL=RQ3o_A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EukwXm1V5NYg2ckA/hhEuwFZhmWjYxGuDHNjZCf6Ahg=;
        b=VOxMcp0ik+J7Bm1PEs/RqAr/L2JJJdGJtbwfTPNJiZp7go/s0xnKHCd3VtvDQf2Fp0
         8fr9qX2dhaYowxUTXtNbv1E0aplB9ENHwwdZrOHEM8K1t0iFbqiiJKzl9Zkx9PNPvRo5
         kCRhbAFcJMu2EbLqUSTY7IYRADWjLMeFJZNdso44yONHGJVLp3bXoj4yYB7aMFCGU3T6
         sarbO9P7Ijd9utUG5zYFcKi5C7aqSV0xCV0FAp8M+ZF/e8T1lowGXUbVIzIOenrWZX4D
         sdznmACPXWS2JNvNML67elV6SxRaAasslgcMh/iET+EC1x+sKqPSuGHQ6qvgCWlk7mUa
         j7UQ==
In-Reply-To: <CAEdQ38Fh99QmusGbEBi9TjUKQbQDX90pEaUC5Y=s-BL=RQ3o_A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: mcree@orcon.net.nz, Brajeswar Ghosh <brajeswar.linux@gmail.com>, rth@twiddle.net, ink@jurassic.park.msu.ru, parri.andrea@gmail.com, mingo@kernel.org, paulmck@linux.vnet.ibm.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Sabyasachi Gupta <sabyasachi.linux@gmail.com>

On Sat, Nov 3, 2018 at 12:31 AM Matt Turner <mattst88@gmail.com> wrote:
>
> On Fri, Nov 2, 2018 at 11:55 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
> > We run the static analyser "make includecheck" which list out files where
> > duplicate headers can be removed and based on that we thought to remove
> > from this file. Didn't understood about the existence of second include ??
>
>
> #define ____xchg(type, args...)         __xchg ## type ## _local(args)
> #define ____cmpxchg(type, args...)      __cmpxchg ## type ## _local(args)
> #include <asm/xchg.h>
> [snip]
> #undef ____xchg
> #undef ____cmpxchg
> #define ____xchg(type, args...)         __xchg ##type(args)
> #define ____cmpxchg(type, args...)      __cmpxchg ##type(args)
> #include <asm/xchg.h>
>
> asm/xchg.h has a comment at the top that says
>
> /*
>  * xchg/xchg_local and cmpxchg/cmpxchg_local share the same code
>  * except that local version do not have the expensive memory barrier.
>  * So this file is included twice from asm/cmpxchg.h.
>  */

Thanks Matt. Sorry for the noise.
Is there any way to exclude it from static analyser that someone else will
not do the same mistake in future ?
