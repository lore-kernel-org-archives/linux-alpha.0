From: Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] mm: fix typos in comments
Date: Fri, 18 Mar 2022 12:15:14 +0100 (CET)
Message-ID: <alpine.DEB.2.22.394.2203181215040.2686@hadrien>
References: <20220318103729.157574-19-Julia.Lawall@inria.fr> <176f485c00e3c6c03ff794dc47f23702fc592a4f.camel@perches.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gTrHSaows6P5rC0BqhyXnWLtvk2vll7NYVs5JyeogtQ=;
  b=AY7tGrinlq3iYyC0wIS7teWB69QYqXAZfuCQXbHqrL5FSEQe2HFFCCV7
   AbI7/YmIN3Utb3MR/Ylryb1zqwNja2ZtfwbsUHO25d2M5pnZvgZYHg2Fz
   5rzMvl4Q7Ci77KfuyRoJtsZM1ukbhVp5zVFR2yH4O0/ggF0ddErfHmivT
   0=;
In-Reply-To: <176f485c00e3c6c03ff794dc47f23702fc592a4f.camel@perches.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, Richard Henderson <rth@twiddle.net>, kernel-janitors@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org



On Fri, 18 Mar 2022, Joe Perches wrote:

> On Fri, 2022-03-18 at 11:37 +0100, Julia Lawall wrote:
> > Various spelling mistakes in comments.
> []
> > diff --git a/arch/alpha/kernel/sys_eiger.c b/arch/alpha/kernel/sys_eiger.c
> []
> > @@ -148,7 +148,7 @@ eiger_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
> >
> >  	/* The SRM console has already calculated out the IRQ value's for
> >  	   option cards. As this works lets just read in the value already
> > -	   set and change it to a useable value by Linux.
> > +	   set and change it to a usable value by Linux.
>
> generally accepted alternative spelling.
>
> https://www.dictionary.com/browse/useable

OK, thanks.

julia
