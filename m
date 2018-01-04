From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: the patch "alpha/PCI: Replace pci_fixup_irqs()" breaks networking
Date: Thu, 4 Jan 2018 11:00:57 +0000
Message-ID: <20180104110057.GC9230@red-moon>
References: <alpine.LRH.2.02.1801021620520.4722@file01.intranet.prod.int.rdu2.redhat.com>
 <20180103145533.GA7848@e107981-ln.cambridge.arm.com>
 <alpine.LRH.2.21.1801032149040.12580@math.ut.ee>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.21.1801032149040.12580@math.ut.ee>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Meelis Roos <mroos@linux.ee>
Cc: Mikulas Patocka <mpatocka@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On Wed, Jan 03, 2018 at 09:50:42PM +0200, Meelis Roos wrote:
> > I suspect we ought to map IRQs early in this platform so that we are
> > able to detect how platform code should set them up.
> 
> SIO is used in multiple alpha platforms - should this patch work on all 
> of them?

This patch does nothing but assigning the IRQ earlier, as I said
in another thread I will modify it to make it simpler and avoid
relying on pci_assign_irq() - it was just to understand if my
assumption was right.

Lorenzo

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
> > 
> 
> -- 
> Meelis Roos (mroos@ut.ee)      http://www.cs.ut.ee/~mroos/
