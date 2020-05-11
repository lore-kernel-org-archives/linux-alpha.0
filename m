From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
Date: Mon, 11 May 2020 15:58:24 +0100 (BST)
Message-ID: <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-serial-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

On Sun, 10 May 2020, Mikulas Patocka wrote:

> > > That's what we do on some other architectures to emulate the non-posted
> > > behavior of out[bwl], as required by PCI. I can't think of any reasons to
> > > have a barrier before in[bwl], or after write[bwl], but we generally want
> > > one after out[bwl]
> > 
> >  Alpha is weakly ordered, also WRT MMIO.  The details are a bit obscure 
> > (and were discussed before in a previous iteration of these patches), but 
> > my understanding is multiple writes can be merged and writes can be 
> > reordered WRT reads, even on UP.  It's generally better for performance to 
> 
> We discussed it some times ago, and the conclusion was that reads and 
> writes to the same device are not reordered on Alpha. Reads and writes to 
> different devices or to memory may be reordered.

 Except that "device" in this context is a particular MMIO location; most 
peripherals span multiple locations, including the RTC and the UART in the 
Avanti line in particular.

> In these problematic cases, we only access serial port or real time clock 
> using a few ports (and these devices don't have DMA, so there's not any 
> interaction with memory) - so I conclude that it is timing problem and not 
> I/O reordering problem.

 Individual PCI port locations correspond to different MMIO locations, so 
yes, accesses to these can be reordered (merging won't happen due to the 
use of the sparse address space).

 As I noted using a small program to verify actual behaviour ought to 
reveal what the problem really is.  And /dev/mem can be mmapped for PCI 
port I/O access on Alpha (some X-servers do this), so it can be done even 
in the userland with a running system.

 And if timing is indeed the culprit, then I think it will be best fixed 
in the 82378IB southbridge, i.e.[1]:

"The I/O recovery mechanism in the SIO is used to add additional recovery 
delay between PCI originated 8-bit and 16-bit I/O cycles to the ISA Bus.  
The SIO automatically forces a minimum delay of four SYSCLKs between 
back-to-back 8 and 16 bit I/O cycles to the ISA Bus.  The delay is 
measured from the rising edge of the I/O command (IOR# or IOW#) to the 
falling edge of the next BALE.  If a delay of greater than four SYSCLKs is 
required, the ISA I/O Recovery Time Register can be programmed to increase 
the delay in increments of SYSCLKs.  Note that no additional delay is 
inserted for back-to-back I/O "sub cycles" generated as a result of byte 
assembly or disassembly.  This register defaults to 8 and 16-bit recovery 
enabled with two clocks added to the standard I/O recovery."

where it won't be causing unnecessary overhead for native PCI devices or 
indeed excessive one for ISA devices.  It might be interesting to note 
that later SIO versions like the 82378ZB increased the minimum to five 
SYSCLKs, so maybe a missing SYSCLK (that can still be inserted by suitably
programming the ICRT) is the source of the problem?

References:

[1] "82378IB System I/O (SIO)", April 1993, Intel Corporation, Order 
    Number: 290473-002, Section 4.1.17 "ICRT -- ISA Controller Recovery 
    Timer Register"

  Maciej


