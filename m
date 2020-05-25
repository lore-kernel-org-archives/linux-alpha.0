From: "Maciej W. Rozycki" <macro@wdc.com>
Subject: Re: [PATCH v5] alpha: fix memory barriers so that they conform to
 the specification
Date: Mon, 25 May 2020 15:45:31 +0100 (BST)
Message-ID: <alpine.LFD.2.21.2005251500420.21168@redsun52.ssa.fujisawa.hgst.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org> <20200513144128.GA16995@mail.rc.ru> <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com> <20200523151027.GA10128@mail.rc.ru> <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com> <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1590417938; x=1621953938;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=heIo5A4IO3cNxiqHtxUzg7NOrGQvQTfWj+kPMVcqALs=;
  b=OYnWLOI/VIPZOxk5MazGB2RZ60fH2rFVgQskHTn6WsF3RSSJl/FfUv5u
   76OnxHCvO+hkN15Zafb6EW0w42NDlc0dhJVVIoEr+8gDo6tBfse+zkw5+
   IrapNO68sBpFjM+Fht1eqX223v8yDybScP17FD9jj9TbdIdgSYg1efMrD
   C0NMbigVX7akTMJ8TgxjMPmmmlULGQ1lQtTk+W8pA+NprP0oEliwgAjYg
   Yd4oQU+JTMs3JJ7G0YGRs0BY3W2KRhLATymhkHbGJLfAv0+d4ijyrQjKd
   2Miqm7WwN+RiXdmFP64BGFxIWtxHvJvCYnmrl2I7gZvWnVVEDc0CtB4kQ
   w==;
In-Reply-To: <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "Maciej W. Rozycki" <macro@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

On Mon, 25 May 2020, Mikulas Patocka wrote:

> >  Please observe that changing the `*_relaxed' entry points from merely 
> > aliasing the corresponding `__raw_*' handlers to more elaborate code 
> > sequences (though indeed slightly only, but still) makes the situation 
> > analogous to one we have with the ordinary MMIO accessor entry points.  
> > Those regular entry points have been made `extern inline' and wrapped 
> > into:
> > 
> > #if IO_CONCAT(__IO_PREFIX,trivial_rw_bw) == 1
> > 
> > and:
> > 
> > #if IO_CONCAT(__IO_PREFIX,trivial_rw_lq) == 1
> > 
> > respectively, with corresponding out-of-line entry points available, so 
> > that there is no extra inline code produced where the call to the relevant 
> > MMIO accessor is going to end up with an actual function call, as this 
> > would not help performance in any way and would expand code unnecessarily 
> > at all call sites.
> > 
> >  Therefore I suggest that your new `static inline' functions follow the 
> > pattern, perhaps by grouping them with the corresponding ordinary accessor 
> > functions in arch/alpha/include/asm/io.h within the relevant existing 
> > #ifdef, and then by making them `extern inline' and providing out-of-line 
> > implementations in arch/alpha/kernel/io.c, with the individual symbols 
> > exported.  Within arch/alpha/kernel/io.c the compiler will still inline 
> > code as it sees fit as it already does, e.g. `__raw_readq' might get 
> > inlined in `readq' if it turns out cheaper than arranging for an actual 
> > call, including all the stack frame preparation for `ra' preservation; 
> > it's less likely with say `writeq' which probably always ends with a tail 
> > call to `__raw_writeq' as no stack frame is required in that case.
> > 
> >  That for the read accessors.
> 
> I think that making the read*_relaxed functions extern inline just causes 
> source code bloat with no practical gain - if we make them extern inline, 
> we would need two implementations (one in the include file, the other in 
> the C file) - and it is not good practice to duplicate code.

 We do that already with the existing accessors, and while I agree the 
duplication is a bit unfortunate and could be solved with some macro 
hackery so that there is a single version in arch/alpha/include/asm/io.h 
that gets pasted to produce out-of-line copies in arch/alpha/kernel/io.c.  
That would be good having across all the accessors, but that is not 
relevant to the regression discussed here and therefore I do not request 
that you make such a clean-up as a part of this series.

> The functions __raw_read* are already extern inline, so the compiler will 
> inline/noinline them depending on the macros trivial_io_bw and 
> trivial_io_lq - so we can just call them from read*_relaxed without 
> repeating the extern inline pattern.

 The whole point of this peculiar arrangement for cooked accessors is to 
avoid having barriers inserted inline around out-of-line calls to raw 
accessors, and therefore I maintain that we need to have the arrangement 
applied consistently across all the cooked accessors.  Since you're 
creating new distinct cooked accessors (by making their names no longer 
alias to existing cooked accessors), they need to follow the pattern.

 NB this arrangement was added back in 2.6.9-rc3, with:

ChangeSet@1.1939.5.8, 2004-09-22 22:40:06-07:00, rth@kanga.twiddle.home
  [ALPHA] Implement new ioread interface.

I believe.  I don't know if any further details or discussion around that 
can be chased, but Richard might be able to chime in.

  Maciej
