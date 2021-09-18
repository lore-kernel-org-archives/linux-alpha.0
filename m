From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Sat, 18 Sep 2021 10:21:44 -0700
Message-ID: <CAHk-=wgj=fFDt6mkiOmRs7pdcYJSibqpVvwcG9_0rbVJEjBCsw@mail.gmail.com>
References: <20210918095134.GA5001@tower> <202109181311.18IDBKQB005215@valdese.nms.ulrich-teichert.org>
 <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com> <56956079-19c3-d67e-d3f-92e475c71f6b@tarent.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VJ9K4Ss0fO8sq3w3fi+s1XQy4Iv3mwXh4Uemm8nutng=;
        b=HtuwRZUCtjojC6VdTZELWNXgY00qcbptQey5+LTejhwWo5g8CMmknjSym9G74RH6Ma
         oPcVOCFM0bvoDz0JDWFOmLoHw2mzTecjQrEShzwr3fyltdeg/Yk3k9bXEJyFI8+DILmo
         Zn76QBbRztSInJyQGaDYETcYPmfh81XD1W72o=
In-Reply-To: <56956079-19c3-d67e-d3f-92e475c71f6b@tarent.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Thorsten Glaser <t.glaser@tarent.de>
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>, Michael Cree <mcree@orcon.net.nz>, Guenter Roeck <linux@roeck-us.net>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On Sat, Sep 18, 2021 at 10:17 AM Thorsten Glaser <t.glaser@tarent.de> wrote=
:
>
> Considering you can actually put ISA cards, 8 and 16 bit both,
> into EISA slots, I=E2=80=99d have assumed so. I don=E2=80=99t understand =
the
> =E2=80=9CEISA only=E2=80=9D question above.

Oh, it's so long since I had one of those machines I didn't even
remember that EISA took ISA cards too.

But yeah, there are also apparently PCI-based alpha machines with
actual ISA card slots.

            Linus
