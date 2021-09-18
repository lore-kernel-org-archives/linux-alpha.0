From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Sat, 18 Sep 2021 13:46:10 -0700
Message-ID: <CAHk-=wjZukwHDpm6PUP=cFTi8wWQs6Z5Np7xv7SRphNqvm0FPw@mail.gmail.com>
References: <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com>
 <202109182026.18IKQLng003683@valdese.nms.ulrich-teichert.org>
Mime-Version: 1.0
Return-path: <linux-sparse-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EgyQSOoQGXbqZDY5vmTdmtdWclji1aa8k4Dg+pV0f0o=;
        b=SEpYwuptd5hG3QJm95kYyoOdykEPWmWM41H04iYKD9x+gej2hvZLmI9MuQSd8s9QNq
         BFtt8Khl1a0U7BIzOb2mMeUeYORXvw3f1yoKo69QHfJASnbgDxK63qWoaCvmswBFSfMk
         A/FZp+Rl5zIq56YhAZEa2tHT6K7SetPgVBSjc=
In-Reply-To: <202109182026.18IKQLng003683@valdese.nms.ulrich-teichert.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulrich Teichert <krypton@ulrich-teichert.org>
Cc: Michael Cree <mcree@orcon.net.nz>, Guenter Roeck <linux@roeck-us.net>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On Sat, Sep 18, 2021 at 1:26 PM Ulrich Teichert
<krypton@ulrich-teichert.org> wrote:
>
> >
> > (I forget which alpha I had. For some reason I want to think I had an
> > EISA machine and probably Jensen. Maybe upgraded to a 164 later?)
>
> Well, as this was way back in 1995, it was perhaps a Multia? Also
> named UDB, a small "booksize" model.

No, that came later. I had one of the very original ones.

I'm pretty sure it was that Jensen platform, but I'm too lazy to go
back and look.

> > Can you send me your Jensen config?
>
> Sure, attached here. I don't know if it helps - I can't tell you why I
> used 4.18-rc5 for it, that was in 2018... Oh man, I am spending too much
> time at work...

I ended up hacking something up which was enough to show the build
problems, and then some.

But your config shows _other_ errors with the IO functions, so I guess
I'll need to look at that one too.

There's clearly a reason that Jensen was marked BROKEN in the Kconfig,
the whole situation with the IO accessor functions on that platform is
a disaster.

              Linus
