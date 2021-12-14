From: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,full} with bitmap_weight_eq()
Date: Tue, 14 Dec 2021 11:43:09 -0800
Message-ID: <CAAH8bW9-dbENFUrwPUQ-uJVVX_s=PWb2zpAJ8BqkV3vJE696mA@mail.gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com> <20211128035704.270739-3-yury.norov@gmail.com>
 <YaPGDOvBzhiRFcOP@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LCilH12wWw0seUa3hiJyDy0VxFX2Q3bA7Y0HXIYHhF8=;
        b=mgUrMQhC4/CUdwucboxOLaDGWbb/3r/d8db3O9NgfZYUYEd6Zjz2nbba51SL7zLe8Y
         HoPx+IQ/X0fM2kJmgKk06iLEcvvTYlX2h8Als5lC5pEfulogO+sUqemRF4n6m2Eekf4w
         CtPoyJGaZ6slsRjff5y3xVucnMlyQBZjuB7TsLW/QfR5HbmU2eCSX+iDyn3uJA04puJa
         dF//PJEuj31ulpS82MggltzR4G2RUQnzjtNrp/7HOGpfHVW7cNQpoT3ypqVvpPJEUhsf
         QvGgSrM2kq5yWe5ythTOhC41utztrjpAcYlGjjw1vz9wzYdQhMtOLwSCYyXNwoJoZq7H
         sX/w==
In-Reply-To: <YaPGDOvBzhiRFcOP@qmqm.qmqm.pl>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <>

On Sun, Nov 28, 2021 at 10:10 AM Micha=C5=82 Miros=C5=82aw
<mirq-linux@rere.qmqm.pl> wrote:
>
> On Sat, Nov 27, 2021 at 07:56:57PM -0800, Yury Norov wrote:
> > Now as we have bitmap_weight_eq(), switch bitmap_full() and
> > bitmap_empty() to using it.
> >
> > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > ---
> >  include/linux/bitmap.h | 26 ++++++++++----------------
> >  1 file changed, 10 insertions(+), 16 deletions(-)
> >
> > diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> > index 996041f771c8..2d951e4dc814 100644
> > --- a/include/linux/bitmap.h
> > +++ b/include/linux/bitmap.h
> > @@ -386,22 +386,6 @@ static inline int bitmap_subset(const unsigned lon=
g *src1,
> >               return __bitmap_subset(src1, src2, nbits);
> >  }
> >
> > -static inline bool bitmap_empty(const unsigned long *src, unsigned nbi=
ts)
> > -{
> > -     if (small_const_nbits(nbits))
> > -             return ! (*src & BITMAP_LAST_WORD_MASK(nbits));
> > -
> > -     return find_first_bit(src, nbits) =3D=3D nbits;
> > -}
>
> Since this is supposed to be an optimization, I would go all the way and
> replace this with the trivial implementation instead:
>
> bool bitmap_empty(long *bits, size_t nbits)
> {
>         for (; nbits >=3D BITS_PER_LONG; ++bits, nbits -=3D BITS_PER_LONG=
)
>                 if (*bits)
>                         return false;
>
>         if (nbits && *bits & BITMAP_LAST_WORD_MASK(nbits))
>                 return false;
>
>         return true;
> }

This is what current implementations basically do, based on find_first_bit(=
).

I think that for long bitmaps the most time consuming operation is moving
data to L1, and for short bitmaps the difference between approaches is
barely measurable.

But hweght_long on each iteration can't be more effective than the current
version. So, I'll drop this patch for v2 and keep things unchanged.
