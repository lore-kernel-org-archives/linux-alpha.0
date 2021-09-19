From: Dave Taht <dave.taht@gmail.com>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Sun, 19 Sep 2021 08:13:32 -0700
Message-ID: <CAA93jw6gK9_PMa_BtabkqyZLT4Vb+x4gsADT7vU+75bucnvrAQ@mail.gmail.com>
References: <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com>
 <202109182026.18IKQLng003683@valdese.nms.ulrich-teichert.org> <CAHk-=wh-=tMO9iCA4v+WgPSd+Gbowe5kptwo+okahihnO2fAOA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sparse-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vbpoc8nlnfHxnI+l9mWkkIGQVWPI3MGONh3p7LPE7MI=;
        b=VM30cLMK8vCJPnDOrNVJVLKgaM108XQCUD2FUTn/7VOT0R6gTL8DYA/S/xiXNWm3y1
         AayprkuIsnStSNKMVtZw9+Rz5oK+ArUk7DLq906so7hRzOsWC3/sVc+Y/QqCm7iMprv0
         U8iDp/brT1ry6/RqaBObVVPa+OTrlnZw899bln5L0UtucSwwW92pgbh7X8PHCkukvBsU
         Quk23h8w4lJ1Qf+KMkotX488eh7zOcdVmMAns5HQucqLfUTR4GVZTRA7nVMXWqRUo/Z+
         urYeOW/Bh4ymu4grYu4TS/06TjUcAi4d6pUyQGoYzPKqLYLROPr7FwkTthR//Myx8lT1
         4/IQ==
In-Reply-To: <CAHk-=wh-=tMO9iCA4v+WgPSd+Gbowe5kptwo+okahihnO2fAOA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>, Michael Cree <mcree@orcon.net.nz>, Guenter Roeck <linux@roeck-us.net>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On Sun, Sep 19, 2021 at 8:01 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>
> Oh well. I have an odd love-hate relationship with alpha.
>
> I think it's one of the worst architectures ever designed (memory
> ordering is completely broken, and the lack of byte operations in the
> original specs were a big reason for the initial problems and eventual
> failure).
>
> But at the same time, I really did enjoy it back in the day, and it
> _was_ the first port I did, and the first truly integrated kernel
> architecture (the original Linux m68k port that preceded it was a
> "hack up and replace" job rather than "integrate")

As a side note, I loved the Alpha, too. Compared to the VMS port
I was too often working on in the 90s, having Linux run on it was
a joy, and for years I used my remaining older alpha boxes as
firewalls, trusting in the oddity of the architecture to resist
various and sundry attacks.

I retired the last one well over a decade back.

RIP.

>
>            Linus



--=20
Fixing Starlink's Latencies: https://www.youtube.com/watch?v=3Dc9gLo6Xrwgw

Dave T=C3=A4ht CEO, TekLibre, LLC
