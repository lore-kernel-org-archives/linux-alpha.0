From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Sat, 18 Sep 2021 10:28:28 -0700
Message-ID: <CAHk-=wixOnf0i1GwYqCT=ihx=QTfB248GOFu6SZQhd3w6mm3aA@mail.gmail.com>
References: <20210918095134.GA5001@tower> <202109181311.18IDBKQB005215@valdese.nms.ulrich-teichert.org>
 <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PPMj8VLwTy75eprkO41oC3JgAE7NDa67ow6tA6A6/r0=;
        b=cy1UQNMOS0XYpgCCs7UW1bRKopN5C73/mDGBe3xOEvU9Qfc5peAlSaAnDkUL4a5c+l
         T+T9VcGwQGkOsVeyqqcFOdpSy7FTSjlq6zJMH39qCslLX05iJqtLvtCekhr85+YjZU3Q
         mY8lX8VUfk8l+z37c+OMtnVi/VdXUVL9PCefk=
In-Reply-To: <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulrich Teichert <krypton@ulrich-teichert.org>
Cc: Michael Cree <mcree@orcon.net.nz>, Guenter Roeck <linux@roeck-us.net>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On Sat, Sep 18, 2021 at 10:04 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I do not see why you should be using that horrible __EXERN_INLINE. It
> will cause gcc to sometimes not inline at all, and not generate the
> out-of-line body either.

Yeah, that patch doesn't work at all with my cross-compiler, and only results in

  alpha-linux-gnu-ld: arch/alpha/kernel/sys_jensen.o:(.ref.data+0x58):
undefined reference to `jensen_ioread8'

because some of those 'extern inline' cases are never instantiated.

I'll look into it, we can make Jensen build again in case somebody
then gets the energy to see what causes it to not boot.

              Linus
