From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: the patch "alpha/PCI: Replace pci_fixup_irqs()" breaks networking
Date: Wed, 3 Jan 2018 10:38:37 +0000
Message-ID: <20180103103837.GA22612@e107981-ln.cambridge.arm.com>
References: <alpine.LRH.2.02.1801021620520.4722@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.21.1801022353530.25029@math.ut.ee>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.21.1801022353530.25029@math.ut.ee>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Meelis Roos <mroos@ut.ee>
Cc: Mikulas Patocka <mpatocka@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On Tue, Jan 02, 2018 at 11:54:47PM +0200, Meelis Roos wrote:
> > The patch 0e4c2eeb758a91e68b9eaf7a4bee9bd5ed97ff2b ("alpha/PCI: Replace 
> > pci_fixup_irqs() call with host bridge IRQ mapping hooks") breaks 
> > networking on Alpha for me. I have an Alpha Avanti server with tulip 
> > network card.
> 
> Matbe the map is wrong for Avanti? Is there some way to check that?

I think the problem is in noname_init_pci(), that, AFAICS, in order to set-up
the IRQ level, it requires IRQ mapping to be carried out. Joy.

See:

sio_fixup_irq_levels()

and in particular

sio_collect_irq_levels()

Does this horrid hack help (to understand where the problem is - how to
fix it that's another story) ? Compile tested only.

-- >8 --
diff --git a/arch/alpha/kernel/sys_sio.c b/arch/alpha/kernel/sys_sio.c
index 37bd6d9b8eb9..ca090307ff54 100644
--- a/arch/alpha/kernel/sys_sio.c
+++ b/arch/alpha/kernel/sys_sio.c
@@ -120,7 +120,7 @@ sio_collect_irq_levels(void)
 	return level_bits;
 }
 
-static void __init
+static void
 sio_fixup_irq_levels(unsigned int level_bits)
 {
 	unsigned int old_level_bits;
@@ -181,6 +181,14 @@ noname_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 	const long min_idsel = 6, max_idsel = 14, irqs_per_slot = 5;
 	int irq = COMMON_TABLE_LOOKUP, tmp;
 	tmp = __kernel_extbl(alpha_mv.sys.sio.route_tab, irq);
+
+	if ((dev->class >> 16 != PCI_BASE_CLASS_BRIDGE) ||
+		    (dev->class >> 8 == PCI_CLASS_BRIDGE_PCMCIA)) {
+
+		if (irq >= 0)
+			sio_fixup_irq_levels(1 << tmp);
+	}
+
 	return irq >= 0 ? tmp : -1;
 }
 
