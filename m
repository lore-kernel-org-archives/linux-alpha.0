From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: the patch "alpha/PCI: Replace pci_fixup_irqs()" breaks networking
Date: Thu, 4 Jan 2018 18:49:37 +0000
Message-ID: <20180104184937.GA14113@red-moon>
References: <alpine.LRH.2.02.1801021620520.4722@file01.intranet.prod.int.rdu2.redhat.com>
 <20180104121755.GA26416@e107981-ln.cambridge.arm.com>
 <alpine.LRH.2.02.1801041306090.22191@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.1801041306090.22191@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Meelis Roos <mroos@linux.ee>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On Thu, Jan 04, 2018 at 01:06:56PM -0500, Mikulas Patocka wrote:
> 
> 
> On Thu, 4 Jan 2018, Lorenzo Pieralisi wrote:
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
> > I have reworked the sio code so that now the IRQ level is set upon IRQ
> > mapping; patch below - it needs thorough testing since I can't test on
> > alpha and I do not have in-depth knowledge of alpha platform code.
> > 
> > Please let me know if it fixes the issues.
> > 
> > Thanks !
> 
> The IDE controller doesn't receive any interrupts with this patch.

Ok - I think I see why, we are getting there, I will send you another
patch tomorrow.

Thanks,
Lorenzo

> Mikulas
> 
> > -- >8 --
> > diff --git a/arch/alpha/kernel/sys_sio.c b/arch/alpha/kernel/sys_sio.c
> > index 37bd6d9b8eb9..e91518b6010d 100644
> > --- a/arch/alpha/kernel/sys_sio.c
> > +++ b/arch/alpha/kernel/sys_sio.c
> > @@ -102,44 +102,48 @@ sio_pci_route(void)
> >  				   alpha_mv.sys.sio.route_tab);
> >  }
> >  
> > -static unsigned int __init
> > -sio_collect_irq_levels(void)
> > +static bool sio_pci_dev_irq_needs_level(const struct pci_dev *dev)
> >  {
> > -	unsigned int level_bits = 0;
> > -	struct pci_dev *dev = NULL;
> > +	if ((dev->class >> 16 == PCI_BASE_CLASS_BRIDGE) &&
> > +	    (dev->class >> 8 != PCI_CLASS_BRIDGE_PCMCIA))
> > +		return false;
> >  
> > -	/* Iterate through the devices, collecting IRQ levels.  */
> > -	for_each_pci_dev(dev) {
> > -		if ((dev->class >> 16 == PCI_BASE_CLASS_BRIDGE) &&
> > -		    (dev->class >> 8 != PCI_CLASS_BRIDGE_PCMCIA))
> > -			continue;
> > +	return true;
> > +}
> >  
> > -		if (dev->irq)
> > -			level_bits |= (1 << dev->irq);
> > -	}
> > -	return level_bits;
> > +static void sio_fixup_irq_level(unsigned int irq)
> > +{
> > +	unsigned int level_bits;
> > +
> > +	/*
> > +	 * Now, make PCI interrupt level sensitive.
> > +	 * Notice: these registers must be accessed byte-wise. inw()/outw()
> > +	 * don't work.
> > +	 */
> > +	level_bits = inb(0x4d0) | (inb(0x4d1) << 8);
> > +
> > +	level_bits |= (1 << irq);
> > +
> > +	outb((level_bits >> 0) & 0xff, 0x4d0);
> > +	outb((level_bits >> 8) & 0xff, 0x4d1);
> >  }
> >  
> > -static void __init
> > -sio_fixup_irq_levels(unsigned int level_bits)
> > +static void __init sio_reset_irq_levels(void)
> >  {
> > -	unsigned int old_level_bits;
> > +	unsigned int level_bits;
> >  
> >  	/*
> > -	 * Now, make all PCI interrupts level sensitive.  Notice:
> > -	 * these registers must be accessed byte-wise.  inw()/outw()
> > +	 * Notice: these registers must be accessed byte-wise. inw()/outw()
> >  	 * don't work.
> >  	 *
> > -	 * Make sure to turn off any level bits set for IRQs 9,10,11,15,
> > -	 *  so that the only bits getting set are for devices actually found.
> > +	 * Make sure to turn off any level bits set for IRQs 9,10,11,15.
> >  	 * Note that we do preserve the remainder of the bits, which we hope
> > -	 *  will be set correctly by ARC/SRM.
> > +	 * will be set correctly by ARC/SRM.
> >  	 *
> > -	 * Note: we at least preserve any level-set bits on AlphaBook1
> >  	 */
> > -	old_level_bits = inb(0x4d0) | (inb(0x4d1) << 8);
> > +	level_bits = inb(0x4d0) | (inb(0x4d1) << 8);
> >  
> > -	level_bits |= (old_level_bits & 0x71ff);
> > +	level_bits &= 0x71ff;
> >  
> >  	outb((level_bits >> 0) & 0xff, 0x4d0);
> >  	outb((level_bits >> 8) & 0xff, 0x4d1);
> > @@ -181,6 +185,11 @@ noname_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
> >  	const long min_idsel = 6, max_idsel = 14, irqs_per_slot = 5;
> >  	int irq = COMMON_TABLE_LOOKUP, tmp;
> >  	tmp = __kernel_extbl(alpha_mv.sys.sio.route_tab, irq);
> > +
> > +	/* Fixup IRQ level if an actual IRQ mapping is detected */
> > +	if (sio_pci_dev_irq_needs_level(dev) && irq > 0)
> > +		sio_fixup_irq_level(irq);
> > +
> >  	return irq >= 0 ? tmp : -1;
> >  }
> >  
> > @@ -208,7 +217,7 @@ noname_init_pci(void)
> >  {
> >  	common_init_pci();
> >  	sio_pci_route();
> > -	sio_fixup_irq_levels(sio_collect_irq_levels());
> > +	sio_reset_irq_levels();
> >  
> >  	if (pc873xx_probe() == -1) {
> >  		printk(KERN_ERR "Probing for PC873xx Super IO chip failed.\n");
> > @@ -271,8 +280,8 @@ alphabook1_init_pci(void)
> >                  }
> >  	}
> >  
> > -	/* Do not set *ANY* level triggers for AlphaBook1. */
> > -	sio_fixup_irq_levels(0);
> > +	/* Reset level triggers for AlphaBook1. */
> > +	sio_reset_irq_levels();
> >  
> >  	/* Make sure that register PR1 indicates 1Mb mem */
> >  	outb(0x0f, 0x3ce); orig = inb(0x3cf);   /* read PR5  */
> > 
