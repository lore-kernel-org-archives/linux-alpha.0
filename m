From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH mm-unstable v1 20/20] mm: rename FOLL_FORCE to FOLL_PTRACE
Date: Fri, 18 Nov 2022 14:29:02 -0800
Message-ID: <202211181427.4D1C3132FE@keescook>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-21-david@redhat.com>
 <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
 <Y3dnzgwJpjTQXI9y@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Return-path: <sparclinux-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UbBsvDU//DL6nEBTfVogOGw4gtrIt5cEgoWU7wg0yqE=;
        b=An8R27hBelrmHfCbOWIi0CQbpB+FbdUKZd/K74OWA+t1inv8v4494buerQXpAbVoQ/
         hawXo5IWqwOaOJXIlgQJ62nY4aZ8mzIQL8T0sN5QawgAa8EGZw3klOrzN/KXycM8ohn1
         PnwiDQNXHvwQENzmlhMaoO6BFIxzwB92hREPE=
Content-Disposition: inline
In-Reply-To: <Y3dnzgwJpjTQXI9y@hirez.programming.kicks-ass.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>

On Fri, Nov 18, 2022 at 12:09:02PM +0100, Peter Zijlstra wrote:
> On Wed, Nov 16, 2022 at 10:16:34AM -0800, Linus Torvalds wrote:
> > Following the history of it is a big of a mess, because there's a
> > number of renamings and re-organizations, but it seems to go back to
> > 2007 and commit b6a2fea39318 ("mm: variable length argument support").
> 
> I went back and read parts of the discussions with Ollie, and the
> .force=1 thing just magically appeared one day when we were sending
> work-in-progress patches back and forth without mention of where it came
> from :-/
> 
> And I certainly can't remember now..
> 
> Looking at it now, I have the same reaction as both you and Kees had, it
> seems entirely superflous. So I'm all for trying to remove it.

Thanks for digging through the history! I've pushed the change to -next:
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/execve&id=cd57e443831d8eeb083c7165bce195d886e216d4

-- 
Kees Cook
