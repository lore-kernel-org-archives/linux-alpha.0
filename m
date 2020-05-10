From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
Date: Sun, 10 May 2020 02:25:08 +0100 (BST)
Message-ID: <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mikulas Patocka <mpatocka@redhat.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

On Thu, 7 May 2020, Arnd Bergmann wrote:

> > Do you think that all the "in[bwl]" and "out[bwl]" macros on alpha should
> > be protected by two memory barriers, to emulate the x86 behavior?
> 
> That's what we do on some other architectures to emulate the non-posted
> behavior of out[bwl], as required by PCI. I can't think of any reasons to
> have a barrier before in[bwl], or after write[bwl], but we generally want
> one after out[bwl]

 Alpha is weakly ordered, also WRT MMIO.  The details are a bit obscure 
(and were discussed before in a previous iteration of these patches), but 
my understanding is multiple writes can be merged and writes can be 
reordered WRT reads, even on UP.  It's generally better for performance to 
have ordering barriers before MMIO operations rather than afterwards, 
unless a completion barrier is also required (e.g. for level-triggered 
interrupt acknowledgement).

 Currently we don't fully guarantee that `outX' won't be posted (from 
memory-barriers.txt):

" (*) inX(), outX():
[...]
        Device drivers may expect outX() to emit a non-posted write transaction
        that waits for a completion response from the I/O peripheral before
        returning. This is not guaranteed by all architectures and is therefore
        not part of the portable ordering semantics."

  Maciej


