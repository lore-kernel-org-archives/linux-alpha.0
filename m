From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH mm-unstable v1 20/20] mm: rename FOLL_FORCE to FOLL_PTRACE
Date: Fri, 18 Nov 2022 12:09:02 +0100
Message-ID: <Y3dnzgwJpjTQXI9y@hirez.programming.kicks-ass.net>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-21-david@redhat.com>
 <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=EfRO0ptxO3+ypU2KxCKexp96MUHxMRW8bunXh9MGsDQ=; b=LDGBrfajYbkT9xph6b6097Xb/c
        syw/S6y4TG1cS360/nd6d+c79/tEze+2e0txBMIoIcDriZE8lsPhASFA+NSJ8eg8EVkJO2kPb4qlI
        t0uGnwKkqKm3kAMzV9dozjGsuBQAveUb/UOZDYoK75AExM4rxBzbgukAnzxUTKevVJRGZPyPEIYWw
        gSP3hqrNt8ek+/8tR8KcdqQYYDbVJVIGKeEUat+AOQu3Lb7Rqyh8OcjxgSig6/MAUk9wvWAe8ysnQ
        uQjyqr2Z5/P12vcorm9ew0TUB/Z1OlxqyFa9I2mva2wnFCskZFBF8h9xXwfF4ZV+daEJb09cWUoJB
        0tx5p2IQ==;
Content-Disposition: inline
In-Reply-To: <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Greg Kroah-Hartman <gregkh>

On Wed, Nov 16, 2022 at 10:16:34AM -0800, Linus Torvalds wrote:
> Following the history of it is a big of a mess, because there's a
> number of renamings and re-organizations, but it seems to go back to
> 2007 and commit b6a2fea39318 ("mm: variable length argument support").

I went back and read parts of the discussions with Ollie, and the
.force=1 thing just magically appeared one day when we were sending
work-in-progress patches back and forth without mention of where it came
from :-/

And I certainly can't remember now..

Looking at it now, I have the same reaction as both you and Kees had, it
seems entirely superflous. So I'm all for trying to remove it.
