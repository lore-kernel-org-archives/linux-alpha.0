From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
Date: Sun, 10 May 2020 14:50:19 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-serial-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589136627;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Cd3Jfs8EnoOBARqHsab26N+nO44V0jD1QCdQOQFYJ/U=;
        b=MhprYwlXyowMB9dQALZuQrDwnD4Qp7Z+pFTj9z2i1P5xrmy/eqxCC3mU2kIfnVkcP0G7I9
        x2T1rrHO9uMfKdCRtsHgkil4IHK3JMEvW3WW7SlcD75Sxs6R5Fkmt/XlBAKo8o5oyvMMbF
        kDtwIO7M6zRWqQAU7MHu/dLKsqzTAM0=
In-Reply-To: <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org>
Sender: linux-serial-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org



On Sun, 10 May 2020, Maciej W. Rozycki wrote:

> On Thu, 7 May 2020, Arnd Bergmann wrote:
> 
> > > Do you think that all the "in[bwl]" and "out[bwl]" macros on alpha should
> > > be protected by two memory barriers, to emulate the x86 behavior?
> > 
> > That's what we do on some other architectures to emulate the non-posted
> > behavior of out[bwl], as required by PCI. I can't think of any reasons to
> > have a barrier before in[bwl], or after write[bwl], but we generally want
> > one after out[bwl]
> 
>  Alpha is weakly ordered, also WRT MMIO.  The details are a bit obscure 
> (and were discussed before in a previous iteration of these patches), but 
> my understanding is multiple writes can be merged and writes can be 
> reordered WRT reads, even on UP.  It's generally better for performance to 

We discussed it some times ago, and the conclusion was that reads and 
writes to the same device are not reordered on Alpha. Reads and writes to 
different devices or to memory may be reordered.

In these problematic cases, we only access serial port or real time clock 
using a few ports (and these devices don't have DMA, so there's not any 
interaction with memory) - so I conclude that it is timing problem and not 
I/O reordering problem.

> have ordering barriers before MMIO operations rather than afterwards, 
> unless a completion barrier is also required (e.g. for level-triggered 
> interrupt acknowledgement).
> 
>  Currently we don't fully guarantee that `outX' won't be posted (from 
> memory-barriers.txt):
> 
> " (*) inX(), outX():
> [...]
>         Device drivers may expect outX() to emit a non-posted write transaction
>         that waits for a completion response from the I/O peripheral before
>         returning. This is not guaranteed by all architectures and is therefore
>         not part of the portable ordering semantics."
> 
>   Maciej

Mikulas

