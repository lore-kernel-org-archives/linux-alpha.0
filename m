From: Meelis Roos <mroos@linux.ee>
Subject: Re: the patch "alpha/PCI: Replace pci_fixup_irqs()" breaks
 networking
Date: Wed, 3 Jan 2018 21:50:42 +0200 (EET)
Message-ID: <alpine.LRH.2.21.1801032149040.12580@math.ut.ee>
References: <alpine.LRH.2.02.1801021620520.4722@file01.intranet.prod.int.rdu2.redhat.com> <20180103145533.GA7848@e107981-ln.cambridge.arm.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20180103145533.GA7848@e107981-ln.cambridge.arm.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Mikulas Patocka <mpatocka@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

> I suspect we ought to map IRQs early in this platform so that we are
> able to detect how platform code should set them up.

SIO is used in multiple alpha platforms - should this patch work on all 
of them?

> 
> Thanks,
> Lorenzo
> 
> -- >8 --
> diff --git a/arch/alpha/kernel/sys_sio.c b/arch/alpha/kernel/sys_sio.c
> index 37bd6d9b8eb9..407ab603e9b1 100644
> --- a/arch/alpha/kernel/sys_sio.c
> +++ b/arch/alpha/kernel/sys_sio.c
> @@ -114,6 +114,8 @@ sio_collect_irq_levels(void)
>  		    (dev->class >> 8 != PCI_CLASS_BRIDGE_PCMCIA))
>  			continue;
>  
> +		pci_assign_irq(dev);
> +
>  		if (dev->irq)
>  			level_bits |= (1 << dev->irq);
>  	}
> 

-- 
Meelis Roos (mroos@ut.ee)      http://www.cs.ut.ee/~mroos/
