From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH 2/2 v4] alpha: add a delay before serial port read
Date: Sun, 10 May 2020 01:13:43 +0100 (BST)
Message-ID: <alpine.LFD.2.21.2005100020530.487915@eddie.linux-mips.org>
References: <alpine.LRH.2.02.2005060721450.25338@file01.intranet.prod.int.rdu2.redhat.com> <20200506114711.GB3024358@kroah.com> <alpine.LRH.2.02.2005061122440.16395@file01.intranet.prod.int.rdu2.redhat.com> <20200506154938.GA3537174@kroah.com>
 <alpine.LRH.2.02.2005061152300.16395@file01.intranet.prod.int.rdu2.redhat.com> <20200506160823.GA3559699@kroah.com> <alpine.LRH.2.02.2005061245500.18599@file01.intranet.prod.int.rdu2.redhat.com> <20200506174528.GB3711921@kroah.com>
 <alpine.LRH.2.02.2005070407010.5006@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.2005070407010.5006@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-serial-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

On Thu, 7 May 2020, Mikulas Patocka wrote:

> > > I've created this patch that adds a global macro/variable 
> > > serial_port_needs_delay. I've also deleted UPQ_DELAY_BEFORE_READ and test 
> > > serial_port_needs_delay directly in io_serial_in, so that the compiler 
> > > will optimize it out on non-alpha architectures.
> > 
> > That's not good, what about systems with hundreds of serial ports?
> 
> I doubt that someone will conect hundreds of serial ports to such an old 
> alpha machine :)

 It would be good if PCI serial ports (on add-on cards) were unaffected.

> > > > But, there is no other way to detect this based on hardware
> > > > signatures/types instead?  That is usually the best way to do it, right?
> > > 
> > > It's hard to detect Alpha without using '#ifdef CONFIG_ALPHA' :) The ISA 
> > > serial port hardware is simple, so I think that you can't distinguish it 
> > > just based on its behavior.
> > 
> > The ISA serial port hardware does not have a unique vendor/product id
> > somewhere?  Some other sort of definition that we can use to determine
> > exactly what type of system we are running on?
> 
> AFAIK it doesn't. You can only distinguish 8250, 16550 and 16550A - but 
> not the vendor.

 You might be able to handle it as a platform device.  It's an onboard 
peripheral after all and wired permanently subject to further run-time 
configuration.

 Otherwise it's a generic off-the-shelf pre-LPC-bus PC Super I/O chip.  
Even if we can detect it it'll be there on some x86 machine.  And the 
issue is a problem that may well be anywhere between the CPU, the 
northbridge, the southbridge and the Super I/O, and the weak MMIO ordering 
of the Alpha CPU does not help narrowing it down.

 Let me see...  It's an NS PC87332 piece.  For Avanti technical spec see: 
<https://manx-docs.org/collections/mds-199909/cd1/alpha/pcdsatia.pdf> and 
for the National Semiconductor piece search for "PC87332.pdf" (no direct 
link, but you can download it indirectly):

2.5.8 SuperI/O Identification Register
(SID, Index = 08h)
The SID Register is accessed, like the other configuration
registers, through the Index Register.  This read-only register
is used to identify the PC87332 device.
  7    6    5    4    3    2    1    0
  0    0    0    1    X    X    X    X    Super I/O Identification
                                                      Reg. (SID)
                                                    Index = 08h

I'm not sure how reliable the uniqueness of the four bits in the SID 
register is across various PC Super I/O chips.  I doubt that the chip has 
any observable issues with our serial driver on x86 systems though.

 I'm not sure if the situation is fully understood here, but we have a 
regression and a working solution now is better than a perfect one in the
unspecified future.  We can always improve once we get to the bottom of 
the issue.

 I'm in lockdown away from my Alpha machine, but I can try verifying the 
solution, also with PCI/e serial ports once I am out of lockdown and back 
the right home sometime.

  Maciej


