From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
Date: Thu, 7 May 2020 11:45:17 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005071139070.15191@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588866323;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/daEl7QxmW21/ESdHqGOKb3WVBCWcYtg8+aouN3jlf4=;
        b=Warc4Oil3NSgs17LyJQcGrN8AdawRS8Q8olcX5R3hbYf6hDxDZ5bELMwCW1+tTSghb+v/4
        +B/GeebijzaQkKX23fyJl/sbGL/yMk7bIoMssLN+WVIOQGD1Gbyz9Vr3ScvL6Va6gFGMzg
        Jtltgdl2T7b9aGE8qO56k4cXHu6AsMU=
In-Reply-To: <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org



On Thu, 7 May 2020, Arnd Bergmann wrote:

> On Thu, May 7, 2020 at 4:09 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> > On Thu, 7 May 2020, Arnd Bergmann wrote:
> > > On Thu, May 7, 2020 at 10:06 AM Mikulas Patocka <mpatocka@redhat.com> wrote:
> > >
> > > Are you sure that it is in fact the timing that is important here and not
> > > a barrier? I see that inb() is written in terms of readb(), but the
> > > barrier requirements for I/O space are a bit different from those
> > > on PCI memory space.
> >
> > The "in" and "out" instructions are serializing on x86. But alpha doesn't
> > have dedicated instructions for accessing ports.
> >
> > Do you think that all the "in[bwl]" and "out[bwl]" macros on alpha should
> > be protected by two memory barriers, to emulate the x86 behavior?
> 
> That's what we do on some other architectures to emulate the non-posted
> behavior of out[bwl], as required by PCI. I can't think of any reasons to
> have a barrier before in[bwl], or after write[bwl], but we generally want
> one after out[bwl]

Yes - so we can add a barrier after out[bwl]. It also fixes the serial 
port issue, so we no longer need the serial driver patch for Greg.

> > > In the example you gave first, there is a an outb_p() followed by inb_p().
> > > These are normally serialized by the bus, but I/O space also has the
> > > requirement that an outb() completes before we get to the next
> > > instruction (non-posted write), while writeb() is generally posted and
> > > only needs a barrier before the write rather than both before and after
> > > like outb.
> >
> > I think that the fact that "writeb" is posted is exactly the problem - it
> > gets posted, the processor goes on, sends "readb" and they arrive
> > back-to-back to the ISA bus. The ISA bus device doesn't like back-to-back
> > accesses and locks up.
> >
> > Anyway - you can change the "ndelay()" function in this patch to "mb()" -
> > "mb()" will provide long enough delay that it fixes this bug.
> 
> My preference would be to have whatever makes most sense in theory
> and also fixes the problem. If there is some documentation that
> says you need a certain amount of time between accesses regardless
> of the barriers, then that is fine. I do wonder if there is anything
> enforcing the "rpcc" in _delay() to come after the store if there is no
> barrier between the two, otherwise the delay method still seems
> unreliable.

I measured ndelay - and the overhead of the instruction rpcc is already 
very high. ndelay(1) takes 300ns.

> The barrier after the store at least makes sense to me based on
> the theory, both with and without a delay in outb_p().
> 
>       Arnd

Mikulas

