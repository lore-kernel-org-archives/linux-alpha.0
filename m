From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH v4] alpha: add a barrier after outb, outw and outl
Date: Sun, 10 May 2020 02:27:10 +0100 (BST)
Message-ID: <alpine.LFD.2.21.2005100153470.487915@eddie.linux-mips.org>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LRH.2.02.2005071145250.15191@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a3SBg=w72KVgGUGAUcmU-6RxrQW=mnYf8vmFjBL5jbDpg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3SBg=w72KVgGUGAUcmU-6RxrQW=mnYf8vmFjBL5jbDpg@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mikulas Patocka <mpatocka@redhat.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

On Thu, 7 May 2020, Arnd Bergmann wrote:

> > The patch 92d7223a74235054f2aa7227d207d9c57f84dca0 ("alpha: io: reorder
> > barriers to guarantee writeX() and iowriteX() ordering #2") broke boot on
> > the Alpha Avanti platform.
> >
> > The patch changes timing between accesses to the ISA bus, in particular,
> > it reduces the time between "write" access and a subsequent "read" access.
> >
> > This causes lock-up when accessing the real time clock and serial ports.
> >
> > This patch fixes the bug by adding a memory barrier after the functions
> > that access the ISA ports - outb, outw, outl. The barrier causes that
> > there is some delay between the write to an IO port and a subsequent read.

 There is no delay guarantee, just an in-order completion guarantee:

#define mb()	__asm__ __volatile__("mb": : :"memory")

MB is a hardware memory barrier instruction.

> Based on your earlier explanations, I would mention here that the barrier
> avoids the back-to-back I/O instructions on the bus that seem to be causing
> the problem. As I understand it (having very little alpha specific knowledge),
> they should prevent them by design. However if you are sure it's just the
> added delay rather than any actual barrier effect, that would also be worth
> pointing out.

 Alpha is weakly ordered, also WRT MMIO.  Writing a simple test program to 
poke directly (e.g. using `ioremap' and then inline asm on the location 
obtained) at RTC and UART registers would be a good way to determine what 
is really going on here.

  Maciej


