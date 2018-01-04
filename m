From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: the patch "alpha/PCI: Replace pci_fixup_irqs()" breaks networking
Date: Thu, 4 Jan 2018 10:58:22 +0000
Message-ID: <20180104105822.GB9230@red-moon>
References: <alpine.LRH.2.02.1801021620520.4722@file01.intranet.prod.int.rdu2.redhat.com>
 <20180103145533.GA7848@e107981-ln.cambridge.arm.com>
 <alpine.LRH.2.02.1801031402470.28965@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.1801031402470.28965@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Meelis Roos <mroos@linux.ee>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On Wed, Jan 03, 2018 at 02:03:11PM -0500, Mikulas Patocka wrote:
> 
> 
> On Wed, 3 Jan 2018, Lorenzo Pieralisi wrote:
> 
> > On Tue, Jan 02, 2018 at 04:32:45PM -0500, Mikulas Patocka wrote:
> > > Hi
> > > 
> > > The patch 0e4c2eeb758a91e68b9eaf7a4bee9bd5ed97ff2b ("alpha/PCI: Replace 
> > > pci_fixup_irqs() call with host bridge IRQ mapping hooks") breaks 
> > > networking on Alpha for me. I have an Alpha Avanti server with tulip 
> > > network card.
> > > 
> > > The patch 0e4c2eeb breaks it so that I get MCE when the network card 
> > > driver is loaded. The patch 814eae59 fixes the MCE, the system boot 
> > > completes, but the network card doesn't receive any interrupts (and soon 
> > > it reports warning about timeout on tx queue). All kernels in the 4.14 
> > > branch have this bug.
> > 
> > Can you check if this patch fixes the issue please ?
> > 
> > I suspect we ought to map IRQs early in this platform so that we are
> > able to detect how platform code should set them up.
> > 
> > Thanks,
> > Lorenzo
> > 
> > -- >8 --
> > diff --git a/arch/alpha/kernel/sys_sio.c b/arch/alpha/kernel/sys_sio.c
> > index 37bd6d9b8eb9..407ab603e9b1 100644
> > --- a/arch/alpha/kernel/sys_sio.c
> > +++ b/arch/alpha/kernel/sys_sio.c
> > @@ -114,6 +114,8 @@ sio_collect_irq_levels(void)
> >  		    (dev->class >> 8 != PCI_CLASS_BRIDGE_PCMCIA))
> >  			continue;
> >  
> > +		pci_assign_irq(dev);
> > +
> >  		if (dev->irq)
> >  			level_bits |= (1 << dev->irq);
> >  	}
> 
> This patch fixes the bug.

Ok, so it looks like my understanding was right. pci_assign_irq() is
not supposed to be used in arch code; I think I can rework

noname_map_irq()

to update the level_bits (ie sio_fixup_irq_levels()) just for the IRQ
that is being mapped but I need help testing it.

Thanks for the prompt testing.

Lorenzo
