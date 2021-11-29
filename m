From: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
Date: Sun, 28 Nov 2021 22:38:39 -0800
Message-ID: <20211129063839.GA338729@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <YaPEfZ0t9UFGwpml@qmqm.qmqm.pl>
Mime-Version: 1.0
Return-path: <linux-crypto-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GW7wD7qKvROu8z9xZL5o2Gh9JvMEXrXNdc/d8bAaPNs=;
        b=Ximtyy9D6hF34jeHkx2abhxO2fEDksv5f5qJu4CbvoNWokti3yxmfDL3L7TYPRNI1N
         nLBExnAtE1kHxfW3UuSIcTZjpfdkrYaWw77PtYlgHprrRWmhg8onSirLlPaay6tbmdGV
         QOolCDulR6Tk/EKA2Gv8Xlb2VKcWxKtuMIpV9m8bP/Y2OIkRrwh1D8Uy/bj62ViSMN2l
         ZvGgVYwmHud/XyWXGXVdXp5Qsb6Tf/NpieRKvdWwCGOCaqCRU7xxjxP8pUys/Y0my6pK
         DI87mJm/+MqXPnLUnP7Gv+O+UoGKFiXftZWbYzOV5qGvrEcopuUsleS20idOc1qycgZd
         CJ3A==
Content-Disposition: inline
In-Reply-To: <YaPEfZ0t9UFGwpml@qmqm.qmqm.pl>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mirq-test@rere.qmqm.pl
Cc: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>

On Sun, Nov 28, 2021 at 07:03:41PM +0100, mirq-test@rere.qmqm.pl wrote:
> On Sat, Nov 27, 2021 at 07:56:55PM -0800, Yury Norov wrote:
> > In many cases people use bitmap_weight()-based functions like this:
> > 
> > 	if (num_present_cpus() > 1)
> > 		do_something();
> > 
> > This may take considerable amount of time on many-cpus machines because
> > num_present_cpus() will traverse every word of underlying cpumask
> > unconditionally.
> > 
> > We can significantly improve on it for many real cases if stop traversing
> > the mask as soon as we count present cpus to any number greater than 1:
> > 
> > 	if (num_present_cpus_gt(1))
> > 		do_something();
> > 
> > To implement this idea, the series adds bitmap_weight_{eq,gt,le}
> > functions together with corresponding wrappers in cpumask and nodemask.
> 
> Having slept on it I have more structured thoughts:
> 
> First, I like substituting bitmap_empty/full where possible - I think
> the change stands on its own, so could be split and sent as is.

Ok, I can do it.

> I don't like the proposed API very much. One problem is that it hides
> the comparison operator and makes call sites less readable:
> 
> 	bitmap_weight(...) > N
> 
> becomes:
> 
> 	bitmap_weight_gt(..., N)
> 
> and:
> 	bitmap_weight(...) <= N
> 
> becomes:
> 
> 	bitmap_weight_lt(..., N+1)
> or:
> 	!bitmap_weight_gt(..., N)
> 
> I'd rather see something resembling memcmp() API that's known enough
> to be easier to grasp. For above examples:
> 
> 	bitmap_weight_cmp(..., N) > 0
> 	bitmap_weight_cmp(..., N) <= 0
> 	...

bitmap_weight_cmp() cannot be efficient. Consider this example:

bitmap_weight_lt(1000 0000 0000 0000, 1) == false
                 ^
                 stop here

bitmap_weight_cmp(1000 0000 0000 0000, 1) == 0
                                 ^
                                 stop here

I agree that '_gt' is less verbose than '>', but the advantage of 
'_gt' over '>' is proportional to length of bitmap, and it means
that this API should exist.

> This would also make the implementation easier in not having to
> copy and paste the code three times. Could also use a simple
> optimization reducing code size:

In the next version I'll reduce code duplication like this:

bool bitmap_eq(..., N);
bool bitmap_ge(..., N);

#define bitmap_weight_gt(..., N)  bitmap_weight_ge(..., N + 1)
#define bitmap_weight_lt(..., N) !bitmap_weight_ge(..., N)
#define bitmap_weight_le(..., N) !bitmap_weight_gt(..., N)

Thanks,
Yury
