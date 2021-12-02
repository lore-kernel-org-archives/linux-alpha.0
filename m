From: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
Date: Wed, 1 Dec 2021 16:31:40 -0800
Message-ID: <20211202003140.GA430494@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <YaPEfZ0t9UFGwpml@qmqm.qmqm.pl>
 <20211129063839.GA338729@lapt>
 <3CD9ECD8-901E-497B-9AE1-0DDB02346892@rere.qmqm.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UYmHlVbMSQbQAn62a50WlYWlw5WYikEw/HKO8MU8o20=;
        b=d9ufFBZIjBeCnfJhxkhOJHR4U6gA3sYY5/+OartHrmtyqhNuwpEH+tfc93YA7tEDao
         yOKDodcNFRle3eMMLCg2FH/Tcgr7cW593yntXLl1utZLUJtVShRNQEOc9NvEo4hEL1rm
         L2l6bxTExKPSRmbnMRKqIcZhoOpd63W1ZKagDrFCRbYIcYvSgN+CxBxrwTxGRSsHeVKf
         UXZK5TS9EbCKBOwmJzZ51FgzKmkah4fU/bnP1hNtNTskTK6qjluwzPEk7uWUTAkKCdZ1
         XxzA5TtEBQPg9PU9R4bStLW9Ne4zdJoIM+RpRwYI7AmQcqEYlTEIoOnEsCuvtTzXmNFj
         00eA==
Content-Disposition: inline
In-Reply-To: <3CD9ECD8-901E-497B-9AE1-0DDB02346892@rere.qmqm.pl>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Russell King <linux@armlinux.org.uk>, Amitkumar Karwar <amitkarwar@gmail.com>, Alexey Klimov <aklimov@redhat.com>, linux-alpha@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>, Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, Andrew Lunn <andrew@lunn.ch>, Andi Kleen <ak@linux.intel.com>, Tejun Heo <tj@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Anup Patel <anup.patel@wdc.c>

On Mon, Nov 29, 2021 at 04:34:07PM +0000, Michał Mirosław wrote:
> Dnia 29 listopada 2021 06:38:39 UTC, Yury Norov <yury.norov@gmail.com> napisał/a:
> >On Sun, Nov 28, 2021 at 07:03:41PM +0100, mirq-test@rere.qmqm.pl wrote:
> >> On Sat, Nov 27, 2021 at 07:56:55PM -0800, Yury Norov wrote:
> >> > In many cases people use bitmap_weight()-based functions like this:
> >> > 
> >> > 	if (num_present_cpus() > 1)
> >> > 		do_something();
> >> > 
> >> > This may take considerable amount of time on many-cpus machines because
> >> > num_present_cpus() will traverse every word of underlying cpumask
> >> > unconditionally.
> >> > 
> >> > We can significantly improve on it for many real cases if stop traversing
> >> > the mask as soon as we count present cpus to any number greater than 1:
> >> > 
> >> > 	if (num_present_cpus_gt(1))
> >> > 		do_something();
> >> > 
> >> > To implement this idea, the series adds bitmap_weight_{eq,gt,le}
> >> > functions together with corresponding wrappers in cpumask and nodemask.
> >> 
> >> Having slept on it I have more structured thoughts:
> >> 
> >> First, I like substituting bitmap_empty/full where possible - I think
> >> the change stands on its own, so could be split and sent as is.
> >
> >Ok, I can do it.
> >
> >> I don't like the proposed API very much. One problem is that it hides
> >> the comparison operator and makes call sites less readable:
> >> 
> >> 	bitmap_weight(...) > N
> >> 
> >> becomes:
> >> 
> >> 	bitmap_weight_gt(..., N)
> >> 
> >> and:
> >> 	bitmap_weight(...) <= N
> >> 
> >> becomes:
> >> 
> >> 	bitmap_weight_lt(..., N+1)
> >> or:
> >> 	!bitmap_weight_gt(..., N)
> >> 
> >> I'd rather see something resembling memcmp() API that's known enough
> >> to be easier to grasp. For above examples:
> >> 
> >> 	bitmap_weight_cmp(..., N) > 0
> >> 	bitmap_weight_cmp(..., N) <= 0
> >> 	...
> >
> >bitmap_weight_cmp() cannot be efficient. Consider this example:
> >
> >bitmap_weight_lt(1000 0000 0000 0000, 1) == false
> >                 ^
> >                 stop here
> >
> >bitmap_weight_cmp(1000 0000 0000 0000, 1) == 0
> >                                 ^
> >                                 stop here
> >
> >I agree that '_gt' is less verbose than '>', but the advantage of 
> >'_gt' over '>' is proportional to length of bitmap, and it means
> >that this API should exist.
> 
> Thank you for the example. Indeed, for less-than to be efficient here you would need to replace
>  bitmap_weight_cmp(..., N) < 0
> with
>  bitmap_weight_cmp(..., N-1) <= 0

Indeed, thanks for pointing to it.
 
> It would still be more readable, I think.

To be honest, I'm not sure that
        bitmap_weight_cmp(..., N-1) <= 0
would be an obvious replacement for the original
        bitmap_weight(...) < N
comparing to 
        bitmap_weight_lt(..., N)

I think the best thing I can do is to add bitmap_weight_cmp() as
you suggested, and turn lt and others to be wrappers on it. This
will let people choose a better function in each case.

I also think that for v2 it would be better to drop the conversion
for short bitmaps, except for switching to bitmap_empty(), because
in that case readability wins over performance; if no objections. 

Thanks,
Yury
