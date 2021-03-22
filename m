From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
Date: Mon, 22 Mar 2021 16:33:14 +0100
Message-ID: <20210322153314.GA3440@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
 <20210319175311.GW1463@shell.armlinux.org.uk> <20210322145403.GA30942@lst.de>
 <20210322151503.GX1463@shell.armlinux.org.uk> <20210322151823.GA2764@lst.de>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <20210322151823.GA2764@lst.de>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: Jens Axboe <axboe@kernel.dk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>

On Mon, Mar 22, 2021 at 04:18:23PM +0100, Christoph Hellwig wrote:
> On Mon, Mar 22, 2021 at 03:15:03PM +0000, Russell King - ARM Linux admin wrote:
> > It gets worse than that though - due to a change to remove
> > pcibios_min_io from the generic code, moving it into the ARM
> > architecture code, this has caused a regression that prevents the
> > legacy resources being registered against the bus resource. So even
> > if they are there, they cause probe failures. I haven't found a
> > reasonable way to solve this yet, but until there is, there is no
> > way that the PATA driver can be used as the "legacy mode" support
> > is effectively done via the PCI code assigning virtual IO port
> > resources.
> > 
> > I'm quite surprised that the CY82C693 even works on Alpha - I've
> > asked for a lspci for that last week but nothing has yet been
> > forthcoming from whoever responded to your patch for Alpha - so I
> > can't compare what I'm seeing with what's happening with Alpha.
> 
> That sounds like something we could fix with a quirk for function 2
> in the PCI resource assignment code.  Can you show what vendor and
> device ID function 2 has so that I could try to come up with one?

Something like this:


diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 953f15abc850ac..851918206c4f2d 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1855,7 +1855,7 @@ int pci_setup_device(struct pci_dev *dev)
 		 * addresses. These are not always echoed in BAR0-3, and
 		 * BAR0-3 in a few cases contain junk!
 		 */
-		if (class == PCI_CLASS_STORAGE_IDE) {
+		if (class == PCI_CLASS_STORAGE_IDE && !dev->no_legacy_ide_bars) {
 			u8 progif;
 			pci_read_config_byte(dev, PCI_CLASS_PROG, &progif);
 			if ((progif & 1) == 0) {
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 653660e3ba9ef1..c661462d894a5b 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5612,3 +5612,16 @@ static void apex_pci_fixup_class(struct pci_dev *pdev)
 }
 DECLARE_PCI_FIXUP_CLASS_HEADER(0x1ac1, 0x089a,
 			       PCI_CLASS_NOT_DEFINED, 8, apex_pci_fixup_class);
+
+/*
+ * CY82C693 splits the primary and secondar IDE channels over 2 functions, which
+ * causes the PCI resource assignment algorithm to assign the legacy IDE I/O
+ * regions to both of them.  Disable that assignment for function 2 here.
+ */
+static void quirk_cy82c693_legacy_resources(struct pci_dev *pdev)
+{
+	if (PCI_FUNC(pdev->devfn) == 2)
+		pdev->no_legacy_ide_bars = 1;
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_CONTAQ, PCI_DEVICE_ID_CONTAQ_82C693,
+		quirk_cy82c693_legacy_resources);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 86c799c97b7796..7ca3f5ebbfade7 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -453,6 +453,7 @@ struct pci_dev {
 	unsigned int	link_active_reporting:1;/* Device capable of reporting link active */
 	unsigned int	no_vf_scan:1;		/* Don't scan for VFs after IOV enablement */
 	unsigned int	no_command_memory:1;	/* No PCI_COMMAND_MEMORY */
+	unsigned int	no_legacy_ide_bars:1;	/* do not assign legacy IDE BARs */
 	pci_dev_flags_t dev_flags;
 	atomic_t	enable_cnt;	/* pci_enable_device has been called */
 
