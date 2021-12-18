From: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 01/17] all: don't use bitmap_weight() where possible
Date: Sat, 18 Dec 2021 15:28:29 -0800
Message-ID: <CAAH8bW9uWW+t5TvkMt_e-sKp71hiLpXhXeuGuSZPK-3kds-GgQ@mail.gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
 <20211218212014.1315894-2-yury.norov@gmail.com> <Yb5dmqlYd3owtH29@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pIYxkiGisug+VVJYFtmCG20TylNRXB8zO8kw91s3wyc=;
        b=TIuyQXz6oo8PN+yMbImlC2c2rmmoCdLu5CdlQlReccXapNNMDZyLSkZvnzlgZ9AIdV
         6+qzntuQo5gBX86FaZFlCIaH4FCNC7RUVw367F08QPEjoiFWXa2CV6SAzISHS5RZPpY/
         QbkHqa0fdrihFEuRX0X/GeMy6P75DvnBsKWfABXcb5D5/2zTgkKaV4VEiJSuyy+zBwcd
         zNIVzererH+Fx7ZEOWvTBpmd3THvXh1KHtzsLHvjMiIPuGFGIqMdZbyjf9H7vLYP6+7J
         cQ/P2vAafsI3DEFtzgX9UWRj1ZmCeXy01hG6ih9PN1N9Tz70SEQsg8aJQpCrrbXl1cqP
         QppQ==
In-Reply-To: <Yb5dmqlYd3owtH29@qmqm.qmqm.pl>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <>

On Sat, Dec 18, 2021 at 2:16 PM Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.=
qmqm.pl> wrote:
>
> On Sat, Dec 18, 2021 at 01:19:57PM -0800, Yury Norov wrote:
> > Don't call bitmap_weight() if the following code can get by
> > without it.
> >
> > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > ---
> >  drivers/net/dsa/b53/b53_common.c           | 6 +-----
> >  drivers/net/ethernet/broadcom/bcmsysport.c | 6 +-----
> >  drivers/thermal/intel/intel_powerclamp.c   | 9 +++------
> >  3 files changed, 5 insertions(+), 16 deletions(-)
> [...]
>
> Looks good,

Does it mean Acked-by, Reviewed-by, or something else?

> but I think this needs to be split per subsystem.

What you ask breaks rules:

Documentation/process/submitting-patches.rst:

Separate each **logical change** into a separate patch.

For example, if your changes include both bug fixes and performance
enhancements for a single driver, separate those changes into two
or more patches.  If your changes include an API update, and a new
driver which uses that new API, separate those into two patches.

On the other hand, if you make a single change to numerous files,
group those changes into a single patch.  Thus a single logical change
is contained within a single patch.

This is not a dead rule, refer for example the 96d4f267e40f9 ("Remove
'type' argument from access_ok() functioin.")

Or this: https://lkml.org/lkml/2021/6/14/1736

Thanks,
Yury
