From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Subject: Re: [PATCH 7/9] lib/cpumask: add num_{possible,present,active}_cpus_{eq,gt,le}
Date: Sun, 28 Nov 2021 18:56:51 +0100
Message-ID: <CANBLGczYBaxES12eCurm6fELat0U-9+VbuKUG_Fea3iK6d9RVA@mail.gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com> <20211128035704.270739-8-yury.norov@gmail.com>
 <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com> <20211128174320.GA304543@lapt>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GIVU/9w51Ef2hg0ubArEuNU4cyYrytLI0Mp9d442l5g=;
        b=MOV5U2nrdRxFhWxyR7bOZpWlabqXOjxSoT999ssZl4Mq0S6JAhQfWyHw7OPilcdHmF
         6BGRpZnEpe8f9bpa77XQqQiPPBLd4gqEwap2s83tCamJXoetkbl6hCD0wkZTc5ZtL81/
         0oBwvtx8A8nEwcdqAvCz07X70fdDjUOrb88hgxJCEmCDBMTsfM8MgzFpsGuihBTo3i4/
         BO5H2USw15PhIR9jKFnq7EoAkCha2k8c7ry0hA6yyRozC0i3UkUk9dhKZX7Fdkb9vjGS
         8k1hfy+ikEeJEGfeYwNOOXgwgIH5nCo9f2fvYp5m9MjcvWjKnN995P4PSF7zBTJOShEa
         Axzw==
In-Reply-To: <20211128174320.GA304543@lapt>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yury Norov <yury.norov@gmail.com>
Cc: Joe Perches <joe@perches.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borisl

On Sun, 28 Nov 2021 at 18:43, Yury Norov <yury.norov@gmail.com> wrote:
> On Sun, Nov 28, 2021 at 09:07:52AM -0800, Joe Perches wrote:
> > On Sat, 2021-11-27 at 19:57 -0800, Yury Norov wrote:
> > > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> > > with one of new functions where appropriate. This allows num_*_cpus_*()
> > > to return earlier depending on the condition.
> > []
> > > diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> > []
> > > @@ -103,7 +103,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> > >      * if platform didn't set the present map already, do it now
> > >      * boot cpu is set to present already by init/main.c
> > >      */
> > > -   if (num_present_cpus() <= 1)
> > > +   if (num_present_cpus_le(2))
> > >             init_cpu_present(cpu_possible_mask);
> >
> > ?  is this supposed to be 2 or 1
>
> X <= 1 is the equivalent of X < 2.

Ah, then the function is confusing. Usually it's lt = less than and lt
= less than or equal. Same idea for gt vs ge.
