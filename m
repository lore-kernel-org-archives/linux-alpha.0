From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] [alpha] Add minimal support for software performance
 events.
Date: Sun, 8 Nov 2009 13:27:39 +0100
Message-ID: <20091108122739.GD11372@elte.hu>
References: <1256545926-6972-1-git-send-email-mcree@orcon.net.nz>
 <20091026084854.GA26990@elte.hu>
 <4AE6AAD3.3000102@orcon.net.nz>
 <20091108122226.GC11372@elte.hu>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091108122226.GC11372@elte.hu>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>


* Ingo Molnar <mingo@elte.hu> wrote:

> 
> * Michael Cree <mcree@orcon.net.nz> wrote:
> 
> > > Should be done not by removing the stack-protector build 
> > > unconditionally - but by auto-testing whether stackprotector is 
> > > supported by GCC and using it if yes.
> > 
> > Revised patch attached.  It includes a test that the compiler doesn't 
> > bomb out with -fstack-protector-all and only adds the option to CFLAGS 
> > if ok.  But I have had to put the test below the definition of the 
> > macro CC.  This has the side effect of separating the addition of 
> > -fstack-protector-all from the main definitions of CFLAGS and 
> > ALL_CFLAGS, and is not ideal in my opinion.  The patch also removes 
> > -Wcast-align (I forgot to say that in the commit message of the 
> > patch).
> 
> Nice, i'll queue this up for Linus.
> 
> Your S-O-B line was missing from this second patch - i presume you 
> intended it to be included, right?

Mind resending the patch against latest -tip?

  http://people.redhat.com/mingo/tip.git/README

There's been other changes in this area so your patch does not apply 
anymore.

	Ingo
