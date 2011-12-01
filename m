From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH-RFC] alpha: drop pci_iomap/pci_iounmap from pci-noop.c
Date: Thu, 1 Dec 2011 14:42:10 +0200
Message-ID: <20111201124210.GA13258@redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

I notice that io.h on alpha pulls in asm-generic/iomap.h.
This header includes these bits:

#ifdef CONFIG_PCI
/* Create a virtual mapping cookie for a PCI BAR (memory or IO) */
struct pci_dev;
extern void __iomem *pci_iomap(struct pci_dev *dev, int bar, unsigned
ong max);
extern void pci_iounmap(struct pci_dev *dev, void __iomem *);
#else
struct pci_dev;
static inline void __iomem *pci_iomap(struct pci_dev *dev, int bar,
nsigned long max)
{
       return NULL;
}
static inline void pci_iounmap(struct pci_dev *dev, void __iomem *addr)
{ }
#endif

#endif


Thus if PCI is not selected we get pci_iomap and pci_iounmap
stubbed out with inline functions. However, on the Jenkins architecture,
arch/alpha/kernel/pci-noop.c is compiled, which includes
offline versions of same stubs. Since Jenkins disables PCI,
I wonder how does this compile - won't the two definitions
conflict?

It's possible that the ones in arch/alpha/kernel/pci-noop.c
can just be removed, and that the conflict is avoided by luck
and the offline functions are never used.
If true, would the following (untested) patch be the right thing to do?

Feedback from someone who has the tools to build the Jenkins
config would also be appreciated.

Thanks!

-->
alpha: drop pci_iomap/pci_iounmap from pci-noop.c

Jenkins disables PCI so asm-generic provides inline
stubs for these, we don't need offline stubs as well.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

---

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
MST
