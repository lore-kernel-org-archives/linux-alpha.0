From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Discrepancy between comments for sched_find_first_bit
Date: Fri, 2 Apr 2010 22:16:48 +0200
Message-ID: <20100402201648.GA15498@elte.hu>
References: <b4198de61003282037p502e9fbfi62123088b9d73923@mail.gmail.com>
 <1269858302.12097.272.camel@laptop>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1269858302.12097.272.camel@laptop>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Matt Turner <mattst88@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Sun, 2010-03-28 at 23:37 -0400, Matt Turner wrote:
> > include/asm-generic/bitops/sched.h says
> > /*
> >  * Every architecture must define this function. It's the fastest
> >  * way of searching a 100-bit bitmap.  It's guaranteed that at least
> >  * one of the 100 bits is cleared.
> >  */
> > 
> > arch/alpha/include/asm/bitops.h says
> > /*
> >  * Every architecture must define this function. It's the fastest
> >  * way of searching a 140-bit bitmap where the first 100 bits are
> >  * unlikely to be set. It's guaranteed that at least one of the 140
> >  * bits is set.
> >  */
> > 
> > Is the guarantee that one of the first 100-bits set (and that the last
> > 40 are useless?), or 140-bits? If it's just the first 100 bits we care
> > about, then the alpha version needs to be fixed.
> > 
> > I'm just checking this out, because gcc produces horrendous code for
> > sched_find_first_bit on alpha. I rewrote it in assembly and it's
> > better than 4 times faster.
> > 
> > Also, is it even worth optimizing that function? It looks like it's
> > only used in kernel/sched_rt.c.
> 
> (might help if you CC the scheduler people on scheduler functions :-)
> 
> Right, so it used to be 140 bits with the old O(1) scheduler, currently
> (as you noted) sched_rt is the only user left and will therefore only
> care about the first 100 bits.
> 
> As it stands I think it might still make sense to optimize this as for
> rt loads it still on a hot path.
> 
> As to the 100 vs 140 length, would it really make much of difference to
> shorten the implementation to 100? If not I'd leave it at 140.
> 
> Ingo, any comments?

I guess getting below the 128 bits boundary would shave an instruction and a 
branch off or so?

	Ingo
