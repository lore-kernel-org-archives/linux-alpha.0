From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH v5] alpha: fix memory barriers so that they conform to
 the specification
Date: Tue, 26 May 2020 10:48:49 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005261044440.29117@file01.intranet.prod.int.rdu2.redhat.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org> <20200513144128.GA16995@mail.rc.ru> <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com> <20200523151027.GA10128@mail.rc.ru> <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com> <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005251500420.21168@redsun52.ssa.fujisawa.hgst.com> <alpine.LRH.2.02.2005251149540.4135@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005251729110.21168@redsun52.ssa.fujisawa.hgst.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590504536;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xWwJiUsJG20AvcJrLo/c6ON/28FY1NfWMttlezYEwqU=;
        b=JF9m8e71m/4yDdbIi+iY7SN3sx0qIEklDaXh/9EKkY8bLq06+JydEL//P6tiqB/YEir40e
        yJzFUzZxNZ+yUP7JGYhRDBxIC97Wnz8ndxkcIOlUWYozjJmXJpX5ytAP6xAv+22dKq+Lg7
        7jC9MNrfMJBIyIkReFJDzttvJX02iPA=
In-Reply-To: <alpine.LFD.2.21.2005251729110.21168@redsun52.ssa.fujisawa.hgst.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@wdc.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "Maciej W. Rozycki" <macro@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org



On Mon, 25 May 2020, Maciej W. Rozycki wrote:

> On Mon, 25 May 2020, Mikulas Patocka wrote:
> 
> > > > The functions __raw_read* are already extern inline, so the compiler will 
> > > > inline/noinline them depending on the macros trivial_io_bw and 
> > > > trivial_io_lq - so we can just call them from read*_relaxed without 
> > > > repeating the extern inline pattern.
> > > 
> > >  The whole point of this peculiar arrangement for cooked accessors is to 
> > > avoid having barriers inserted inline around out-of-line calls to raw 
> > > accessors,
> > 
> > I see, but why do we want to avoid that? Linux kernel has no binary 
> > compatibility, so it doesn't matter if the barriers are inlined in the 
> > drivers or not.
> 
>  It does matter as it expands code unnecessarily (at all call sites), as I 
> noted in the original review.  This has nothing to do with compatibility.
> 
> > Anyway, I've sent a next version of the patch that makes read*_relaxed 
> > extern inline.
> 
>  Thanks, I'll have a look.  And now that you have this update, please run 
> `size' on ALPHA_GENERIC `vmlinux', preferably monolithic, to see what the 
> difference is between `read*_relaxed' handlers `static inline' and keyed 
> with `*trivial_rw_*'.
> 
>   Maciej

The patch with static inline:
   text    data     bss     dec     hex filename
124207762       75953010        5426432 205587204       c410304 vmlinux

The patch with extern inline:
   text    data     bss     dec     hex filename
124184422       75953474        5426432 205564328       c40a9a8 vmlinux

(I've sent version 7 of the patch because I misnamed the "write_relaxed" 
function in version 6).

Mikulas

