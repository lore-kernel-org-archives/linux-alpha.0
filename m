From: Xu Wang <vulab@iscas.ac.cn>
Subject: [PATCH] arch: kernel: Replace sg++ with sg = sg_next(sg)
Date: Wed,  3 Jun 2020 02:31:59 +0000
Message-ID: <20200603023159.715-1-vulab@iscas.ac.cn>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Replace sg++ with sg = sg_next(sg).

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 arch/alpha/kernel/pci_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 7f1925a32c99..81037907268d 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -638,7 +638,7 @@ sg_fill(struct device *dev, struct scatterlist *leader, struct scatterlist *end,
 
 		while (sg+1 < end && (int) sg[1].dma_address == -1) {
 			size += sg[1].length;
-			sg++;
+			sg = sg_next(sg);
 		}
 
 		npages = iommu_num_pages(paddr, size, PAGE_SIZE);
-- 
2.17.1

