From: Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/3] scsi: BusLogic remove bus_to_virt
Date: Fri, 17 Jun 2022 14:57:49 +0200
Message-ID: <20220617125750.728590-3-arnd@kernel.org>
References: <20220617125750.728590-1-arnd@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 336CA612E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDB0D605A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A117605A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFE40612E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655470691;
 bh=rNm86lHtdCfu2hQjLvtPm7z28Z3EUdsosPvVob2uK6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ygkdf/zmdk71Eb66/cIYABaIOydmHLb3jlIiJJptXcoAXufQUr7tMhsRsDheMPdqH
 e5ISxCjZXTcX2qiIvNdBEqXlzWuz8zHsn9AWHWWu8jPURpKbbjdmESq0vjmndUGCcy
 DQBV4ioVojLmkogSB/lPkKgwp8LeVczpRMkUlBmkhxN8O9sUoXeOf40ucejA3cNd35
 900omwI5Kek+tndhSBesQTJZErc3Y3T5GS60URdgKDhTpbd5D1XhrVgrJDmhzSFxeN
 K9FpTujgf4rZlaLsXk5SKGKqVVgFUGo3uAZjKQsfVpjYpXBp+WF8b477RootiIo8D4
 B7PEYAt29rg5g==
In-Reply-To: <20220617125750.728590-1-arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Miquel van Smoorenburg <mikevs-qWit8jRvyhWsTnJN9+BGXg@public.gmane.org>, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "Maciej W . Rozycki" <macro-fOkVWZO6G+f10XsdtD+oqA@public.gmane.org>, linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org, Denis Efremov <efremov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Mark Salyzyn <salyzyn-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Matt Wang <wwentao-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Khalid Aziz <khalid-21RPF02GE+GXwddmVfQv5g@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

The BusLogic driver is the last remaining driver that relies on the
deprecated bus_to_virt() function, which in turn only works on a few
architectures, and is incompatible with both swiotlb and iommu support.

Before commit 391e2f25601e ("[SCSI] BusLogic: Port driver to 64-bit."),
the driver had a dependency on x86-32, presumably because of this
problem. However, the change introduced another bug that made it still
impossible to use the driver on any 64-bit machine.

This was in turn fixed in commit 56f396146af2 ("scsi: BusLogic: Fix
64-bit system enumeration error for Buslogic"), 8 years later, which
shows that there are not a lot of users.

Maciej is still using the driver on 32-bit hardware, and Khalid mentioned
that the driver works with the device emulation used in VirtualBox
and VMware. Both of those only emulate it for Windows 2000 and older
operating systems that did not ship with the better LSI logic driver.

Do a minimum fix that searches through the list of descriptors to find
one that matches the bus address. This is clearly as inefficient as
was indicated in the code comment about the lack of a bus_to_virt()
replacement. A better fix would likely involve changing out the entire
descriptor allocation for a simpler one, but that would be much
more invasive.

Cc: Maciej W. Rozycki <macro-fOkVWZO6G+f10XsdtD+oqA@public.gmane.org>
Cc: Matt Wang <wwentao-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Cc: Khalid Aziz <khalid-21RPF02GE+GXwddmVfQv5g@public.gmane.org>
Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 drivers/scsi/BusLogic.c | 27 ++++++++++++++++-----------
 drivers/scsi/Kconfig    |  2 +-
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
index a897c8f914cf..d057abfcdd5c 100644
--- a/drivers/scsi/BusLogic.c
+++ b/drivers/scsi/BusLogic.c
@@ -2515,12 +2515,26 @@ static int blogic_resultcode(struct blogic_adapter *adapter,
 	return (hoststatus << 16) | tgt_status;
 }
 
+/*
+ * turn the dma address from an inbox into a ccb pointer
+ * This is rather inefficient.
+ */
+static struct blogic_ccb *
+blogic_inbox_to_ccb(struct blogic_adapter *adapter, struct blogic_inbox *inbox)
+{
+	struct blogic_ccb *ccb;
+
+	for (ccb = adapter->all_ccbs; ccb; ccb = ccb->next_all)
+		if (inbox->ccb == ccb->dma_handle)
+			break;
+
+	return ccb;
+}
 
 /*
   blogic_scan_inbox scans the Incoming Mailboxes saving any
   Incoming Mailbox entries for completion processing.
 */
-
 static void blogic_scan_inbox(struct blogic_adapter *adapter)
 {
 	/*
@@ -2540,16 +2554,7 @@ static void blogic_scan_inbox(struct blogic_adapter *adapter)
 	enum blogic_cmplt_code comp_code;
 
 	while ((comp_code = next_inbox->comp_code) != BLOGIC_INBOX_FREE) {
-		/*
-		   We are only allowed to do this because we limit our
-		   architectures we run on to machines where bus_to_virt(
-		   actually works.  There *needs* to be a dma_addr_to_virt()
-		   in the new PCI DMA mapping interface to replace
-		   bus_to_virt() or else this code is going to become very
-		   innefficient.
-		 */
-		struct blogic_ccb *ccb =
-			(struct blogic_ccb *) bus_to_virt(next_inbox->ccb);
+		struct blogic_ccb *ccb = blogic_inbox_to_ccb(adapter, adapter->next_inbox);
 		if (comp_code != BLOGIC_CMD_NOTFOUND) {
 			if (ccb->status == BLOGIC_CCB_ACTIVE ||
 					ccb->status == BLOGIC_CCB_RESET) {
diff --git a/drivers/scsi/Kconfig b/drivers/scsi/Kconfig
index cf75588a2587..56bdc08d0b77 100644
--- a/drivers/scsi/Kconfig
+++ b/drivers/scsi/Kconfig
@@ -513,7 +513,7 @@ config SCSI_HPTIOP
 
 config SCSI_BUSLOGIC
 	tristate "BusLogic SCSI support"
-	depends on PCI && SCSI && VIRT_TO_BUS
+	depends on PCI && SCSI
 	help
 	  This is support for BusLogic MultiMaster and FlashPoint SCSI Host
 	  Adapters. Consult the SCSI-HOWTO, available from
-- 
2.29.2
