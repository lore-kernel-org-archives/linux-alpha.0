From: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,full} with bitmap_weight_eq()
Date: Wed, 15 Dec 2021 09:45:30 -0800
Message-ID: <CAAH8bW-u5AsFTXUOJPRkF-6dk1LcL7PE0Tm+dUc9Ctb6JMy=tg@mail.gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com> <20211128035704.270739-3-yury.norov@gmail.com>
 <YaPGDOvBzhiRFcOP@qmqm.qmqm.pl> <CAAH8bW9-dbENFUrwPUQ-uJVVX_s=PWb2zpAJ8BqkV3vJE696mA@mail.gmail.com>
 <0ccb827de1164b2989d652bfb6f1bbab@AcuMS.aculab.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RLdWdHoT6O3wLXgWsRx2m2m62hSjV0BcJXlTjn5JUFY=;
        b=fVGVY8wqrxR8Y9FDXFtr4SE6iyR8BVVbZ5vgJ4y8dkqTnryOyAM1f7oIOnezuj4A6J
         xZUPr4yWMlNLYsHQ1fallxSJg8aU00+SwAnq0ijeJb6rpCasKd3VYye0HMu7Rz4Fmzli
         VTY7ooY+g0kHA+TAUoyyLgzX0mSn9ha1KmFllLdg51BzQBC+Mgmo9+XdPBjphX6Y4e34
         aHA3UHFWRC7Btex9u1tZiEFoYFee/G/WGm4rYd3nNUPqV0MpixQGc6Vx0PruHv6wejmQ
         Ow0n2j4fyu9ba9vCZKTh9cTJvx1bERx0Yn7rh5DuRA2QxMZuAeUzJXU06wIQ9Mevfcss
         WI7w==
In-Reply-To: <0ccb827de1164b2989d652bfb6f1bbab@AcuMS.aculab.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Laight <David.Laight@aculab.com>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>

On Wed, Dec 15, 2021 at 12:41 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Yury Norov
> > Sent: 14 December 2021 19:43
> ...
> >
> > I think that for long bitmaps the most time consuming operation is moving
> > data to L1, and for short bitmaps the difference between approaches is
> > barely measurable.
> >
> > But hweght_long on each iteration can't be more effective than the current
> > version. So, I'll drop this patch for v2 and keep things unchanged.
>
> Actually do bitmap_full/empty() calls make any sense at all?
> The result is stale since bitmaps are designed to do locked operations.
> If you have a lock covering the bitmap then you should be using
> something that uses non-locked accesses.
> Rightly or wrongly that isn't the bitmap api.

Are you talking about __{set,clear}_bit()?
include/asm-generic/bitops/non-atomic.h
