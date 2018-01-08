From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: the patch "alpha/PCI: Replace pci_fixup_irqs()" breaks networking
Date: Mon, 8 Jan 2018 10:18:02 +0000
Message-ID: <20180108101802.GA20337@e107981-ln.cambridge.arm.com>
References: <alpine.LRH.2.02.1801021620520.4722@file01.intranet.prod.int.rdu2.redhat.com>
 <20180105112330.GA23999@e107981-ln.cambridge.arm.com>
 <alpine.LRH.2.02.1801051346030.14219@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.1801051346030.14219@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Meelis Roos <mroos@linux.ee>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On Fri, Jan 05, 2018 at 01:49:58PM -0500, Mikulas Patocka wrote:
> 
> 
> On Fri, 5 Jan 2018, Lorenzo Pieralisi wrote:
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
> > I reworked the patch, please let me know if it does fix the issue.
> > 
> > Thanks,
> > Lorenzo
> 
> Networking doesn't work, other interrupts work.
> 
> With this patch, /proc/interrupts shows one interrupt for the network card 
> (it used to be zero without this patch).

It is getting harder to understand what's going on, here's an
incremental patch with some logging, it would be ideal to add
a similar logging with a working kernel so that we can actually
compare the IRQ level registers programming, please test it
when you have time.

Patch here:

-- >8 --
diff --git a/arch/alpha/kernel/sys_sio.c b/arch/alpha/kernel/sys_sio.c
index 37bd6d9b8eb9..086f53a89dfc 100644
--- a/arch/alpha/kernel/sys_sio.c
+++ b/arch/alpha/kernel/sys_sio.c
@@ -102,6 +102,15 @@ sio_pci_route(void)
 				   alpha_mv.sys.sio.route_tab);
 }
 
+static bool sio_pci_dev_irq_needs_level(const struct pci_dev *dev)
+{
+	if ((dev->class >> 16 == PCI_BASE_CLASS_BRIDGE) &&
+	    (dev->class >> 8 != PCI_CLASS_BRIDGE_PCMCIA))
+		return false;
+
+	return true;
+}
+
 static unsigned int __init
 sio_collect_irq_levels(void)
 {
@@ -110,8 +119,7 @@ sio_collect_irq_levels(void)
 
 	/* Iterate through the devices, collecting IRQ levels.  */
 	for_each_pci_dev(dev) {
-		if ((dev->class >> 16 == PCI_BASE_CLASS_BRIDGE) &&
-		    (dev->class >> 8 != PCI_CLASS_BRIDGE_PCMCIA))
+		if (!sio_pci_dev_irq_needs_level(dev))
 			continue;
 
 		if (dev->irq)
@@ -120,8 +128,7 @@ sio_collect_irq_levels(void)
 	return level_bits;
 }
 
-static void __init
-sio_fixup_irq_levels(unsigned int level_bits)
+static void __sio_fixup_irq_levels(unsigned int level_bits, bool reset)
 {
 	unsigned int old_level_bits;
 
@@ -139,10 +146,21 @@ sio_fixup_irq_levels(unsigned int level_bits)
 	 */
 	old_level_bits = inb(0x4d0) | (inb(0x4d1) << 8);
 
-	level_bits |= (old_level_bits & 0x71ff);
+	if (reset)
+		old_level_bits &= 0x71ff;
+
+	level_bits |= old_level_bits;
 
 	outb((level_bits >> 0) & 0xff, 0x4d0);
 	outb((level_bits >> 8) & 0xff, 0x4d1);
+
+	pr_info("%s: level bits %ux\n", __func__, level_bits);
+}
+
+static inline void
+sio_fixup_irq_levels(unsigned int level_bits)
+{
+	__sio_fixup_irq_levels(level_bits, true);
 }
 
 static inline int
@@ -181,6 +199,11 @@ noname_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 	const long min_idsel = 6, max_idsel = 14, irqs_per_slot = 5;
 	int irq = COMMON_TABLE_LOOKUP, tmp;
 	tmp = __kernel_extbl(alpha_mv.sys.sio.route_tab, irq);
+
+	/* Fixup IRQ level if an actual IRQ mapping is detected */
+	if (sio_pci_dev_irq_needs_level(dev) && (irq >= 0 && tmp))
+		__sio_fixup_irq_levels(1 << tmp, false);
+
 	return irq >= 0 ? tmp : -1;
 }
 
-- 
2.15.0

