From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 1/6] pata_cypress: add a module option to disable BM-DMA
Date: Wed, 16 Jun 2021 15:46:53 +0200
Message-ID: <20210616134658.1471835-2-hch@lst.de>
References: <20210616134658.1471835-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=hz+UUrM8ElLAj/iJo+DmppsdBvwZ+F/R3vYoPMFC1v0=; b=HIXR7KJRvzBTx1oAaTOhFmEuQe
        7CrxkQC18XDjnkjby7ybaNzflCoG6u6dQhmFAZo0KG7x2b39Uuv+A32AODZB2lArcUjcu+qbWHefe
        n81gkVEX4j8vD6cP+WCo3Y76nSvHTwJlVPORP90hsMlal4lckKPFG1aJpU5uw1LKUWLsEEaKymzxW
        5SF3TSiQnWUILvnEhwlbu7/aKNZ7ukSi+paqcn2zBgJ03rW+AbDWf+Y09zkefOPw9sIP5kIlJycer
        GeLGcS0yRcv5hzlgsxqhLHTk4eroIDW0ZMQneIeIyZF5e3pNUT20Cy+7/oP+m/xsKs2KR3goQdRow
        br23u7wQ==;
In-Reply-To: <20210616134658.1471835-1-hch@lst.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, Linus Torvalds <torvalds@linux-foundation.org>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org

Multiple users report that they need to disable DMA on this driver,
so provide an option to do so without affecting all of libata.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/ata/pata_cypress.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/pata_cypress.c b/drivers/ata/pata_cypress.c
index e1486fe298ae..5b3a7a8ebef6 100644
--- a/drivers/ata/pata_cypress.c
+++ b/drivers/ata/pata_cypress.c
@@ -41,6 +41,10 @@ enum {
 	CY82_INDEX_TIMEOUT	= 0x32
 };
 
+static bool enable_dma = true;
+module_param(enable_dma, bool, 0);
+MODULE_PARM_DESC(enable_dma, "Enable bus master DMA operations");
+
 /**
  *	cy82c693_set_piomode	-	set initial PIO mode data
  *	@ap: ATA interface
@@ -124,14 +128,16 @@ static struct ata_port_operations cy82c693_port_ops = {
 
 static int cy82c693_init_one(struct pci_dev *pdev, const struct pci_device_id *id)
 {
-	static const struct ata_port_info info = {
+	static struct ata_port_info info = {
 		.flags = ATA_FLAG_SLAVE_POSS,
 		.pio_mask = ATA_PIO4,
-		.mwdma_mask = ATA_MWDMA2,
 		.port_ops = &cy82c693_port_ops
 	};
 	const struct ata_port_info *ppi[] = { &info, &ata_dummy_port_info };
 
+	if (enable_dma)
+		info.mwdma_mask = ATA_MWDMA2;
+
 	/* Devfn 1 is the ATA primary. The secondary is magic and on devfn2.
 	   For the moment we don't handle the secondary. FIXME */
 
-- 
2.30.2

