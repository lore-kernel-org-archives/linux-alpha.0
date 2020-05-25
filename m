From: "Maciej W. Rozycki" <macro@wdc.com>
Subject: Re: [PATCH v5] alpha: fix memory barriers so that they conform to
 the specification
Date: Mon, 25 May 2020 17:39:14 +0100 (BST)
Message-ID: <alpine.LFD.2.21.2005251729110.21168@redsun52.ssa.fujisawa.hgst.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org> <20200513144128.GA16995@mail.rc.ru>
 <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com> <20200523151027.GA10128@mail.rc.ru>
 <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005251500420.21168@redsun52.ssa.fujisawa.hgst.com> <alpine.LRH.2.02.2005251149540.4135@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1590424760; x=1621960760;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HjJ4fGKEInmzonc7zQeX2eEbQNJ3W01PKn/mnbplM8o=;
  b=VWjWo/Z2Fy56/QEiit5MK2l2mrSsYsOFw0HZVVTAQ6qC3Xe93AXye9D2
   i0vfoZOgBoRPpNXfjAz9lIUOzZQSF9vBLmvJF5XvqBKvZGsAcd1pGxyYw
   0eNZsaAIvMWJjVud/Z99AhT5wc+Qg9sSX0ZXo8CFhVpK7pAX/vJNek2CM
   rhkBNVSeGI6Je0IAWgnl+AYlk8s5g0HPQbEAXT5NzIL/r7r2A/Jtm14HU
   3zSYfAMH7xJsEb+yGgRofrK5nSTeDa/C+60HTOyvX4N417UyPPIFMxd0y
   CpNGbLTpZhoaApc8brIVDH20doQxXgQoW60IdeT7NqbOA5v/9yN76LdmH
   Q==;
In-Reply-To: <alpine.LRH.2.02.2005251149540.4135@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "Maciej W. Rozycki" <macro@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

On Mon, 25 May 2020, Mikulas Patocka wrote:

> > > The functions __raw_read* are already extern inline, so the compiler will 
> > > inline/noinline them depending on the macros trivial_io_bw and 
> > > trivial_io_lq - so we can just call them from read*_relaxed without 
> > > repeating the extern inline pattern.
> > 
> >  The whole point of this peculiar arrangement for cooked accessors is to 
> > avoid having barriers inserted inline around out-of-line calls to raw 
> > accessors,
> 
> I see, but why do we want to avoid that? Linux kernel has no binary 
> compatibility, so it doesn't matter if the barriers are inlined in the 
> drivers or not.

 It does matter as it expands code unnecessarily (at all call sites), as I 
noted in the original review.  This has nothing to do with compatibility.

> Anyway, I've sent a next version of the patch that makes read*_relaxed 
> extern inline.

 Thanks, I'll have a look.  And now that you have this update, please run 
`size' on ALPHA_GENERIC `vmlinux', preferably monolithic, to see what the 
difference is between `read*_relaxed' handlers `static inline' and keyed 
with `*trivial_rw_*'.

  Maciej
