From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCHv2 RFC (repost) 16/16] alpha: drop pci_iomap/pci_iounmap from
 pci-noop.c
Date: Wed, 21 Dec 2011 18:30:27 +0200
Message-ID: <ef92d191e2ef1a69979aba62cf7643fcad646e82.1324484752.git.mst@redhat.com>
References: <cover.1324484752.git.mst@redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1324484752.git.mst@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Jenkins disables PCI so asm-generic provides inline
stubs for these, we don't need offline stubs as well.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 arch/alpha/kernel/pci-noop.c |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/arch/alpha/kernel/pci-noop.c b/arch/alpha/kernel/pci-noop.c
index 246100e..04eea48 100644
--- a/arch/alpha/kernel/pci-noop.c
+++ b/arch/alpha/kernel/pci-noop.c
@@ -185,15 +185,3 @@ struct dma_map_ops alpha_noop_ops = {
 
 struct dma_map_ops *dma_ops = &alpha_noop_ops;
 EXPORT_SYMBOL(dma_ops);
-
-void __iomem *pci_iomap(struct pci_dev *dev, int bar, unsigned long maxlen)
-{
-	return NULL;
-}
-
-void pci_iounmap(struct pci_dev *dev, void __iomem * addr)
-{
-}
-
-EXPORT_SYMBOL(pci_iomap);
-EXPORT_SYMBOL(pci_iounmap);
-- 
1.7.8.382.g3daff
