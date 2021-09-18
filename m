From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Sat, 18 Sep 2021 14:12:15 -0700
Message-ID: <CAHk-=whswL8vPtdVphebUwdDd2Y-9j2d8XAd35bB+mqrhc0YTA@mail.gmail.com>
References: <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com>
 <202109182026.18IKQLng003683@valdese.nms.ulrich-teichert.org> <CAHk-=wjZukwHDpm6PUP=cFTi8wWQs6Z5Np7xv7SRphNqvm0FPw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-sparse-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yVZJu4t/IugUGV+W6kU+ykKkbEaLVPP4RIQU42du5mE=;
        b=NO0esR917j83JwTOpZQWYClId3457L6NJIf6fJ7Evei4pDJ6w9tdhLXDN3IinOEvW+
         VMthkeYirKlrzLR7LCf4USQHGLJ9wmo5a/QkxpfY9+CPatz4XjsnDZX+q2dIqcXYIANe
         4/RbL5IIz9wKXWQ+bU6E9Y8mF2Wc3GAB8iq/w=
In-Reply-To: <CAHk-=wjZukwHDpm6PUP=cFTi8wWQs6Z5Np7xv7SRphNqvm0FPw@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulrich Teichert <krypton@ulrich-teichert.org>
Cc: Michael Cree <mcree@orcon.net.nz>, Guenter Roeck <linux@roeck-us.net>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On Sat, Sep 18, 2021 at 1:46 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But your config shows _other_ errors with the IO functions, so I guess
> I'll need to look at that one too.

Oh, and all those games with

   #define __EXTERN_INLINE
   #include <asm/io.h>
   #include <asm/jensen.h>
   #undef  __EXTERN_INLINE

don't actually work, because there's the usual multiple-inclusion
protection on top of asm/jensen.h:

   #ifndef __ALPHA_JENSEN_H
   #define __ALPHA_JENSEN_H

and this include of <asm/jensen.h> is entirely unused, because we
ended up getting the one *without* that empty __EXTERN_INLINE #define
from an earlier include of

  #include <linux/interrupt.h>

that caused asm/io.h and asm/jensen.h to be included earlier.

The *other* machine files know to do their includes at the top of the file.

But then I end up getting

     ERROR: modpost: "__udiv_qrnnd" [lib/mpi/mpi.ko] undefined!

because CONFIG_MATHEMU wasn't set and the crypto stuff wants the MPI code.

So there seems to be other alpha Kconfig issues in there, and they
aren't all actually Jensen-specific.

Oh well. I guess can fix things up, since I did get tthe
cross-compiler environment..

          Linus
