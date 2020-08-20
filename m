From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [RFT][PATCH 2/7] alpha: Avoid overflow at boundary_size
Date: Thu, 20 Aug 2020 16:20:04 -0700
Message-ID: <20200820232004.23761-1-nicoleotsuka@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ZXOK8pT3fKKSH66fLd/ANhE16k3B7ecJU+M0aFuQDuk=;
        b=qpsfXubPDJihER5wJZOPYs+cWT7z853AUN308jcd1qrMwVVN1ppn2JPnhxap5VBAwC
         lO23Wq+2ue+gXY2jpb42ihcMtxSb79Z4g0/jPfAcW5+oIzBs4mkidh2bX1kLpvL9Tdw2
         57ENo9u32rzCcyFF8Bz10C0Ke6Kw9PA7yrelf2wZHQxnELip7hm4lj/MCQbEXMSB9PAd
         R4+WlqiKm2qcIUtYXKB/UCQZya0eFTj0sZZ/3tehPG5pxAO+2EANmXnfbN58TVYfn8dJ
         fG3rGYZleODzDFe0O0ZtGqwtA4miP9PfpYSbbx6UNOCMnmy1YL0YkscGsEmVPD1XYR2Q
         ImtA==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com
Cc: hch@lst.de, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

The boundary_size might be as large as ULONG_MAX, which means
that a device has no specific boundary limit. So "+ 1" would
potentially overflow.

Also, by following other places in the kernel, boundary_size
should align with the PAGE_SIZE before right shifting by the
PAGE_SHIFT. However, passing it to ALIGN() would potentially
overflow too.

According to kernel defines:
    #define ALIGN_MASK(x, mask) (((x) + (mask)) & ~(mask))
    #define ALIGN(x, a)	ALIGN_MASK(x, (typeof(x))(a) - 1)

We can simplify the logic here:
  ALIGN(boundary + 1, 1 << shift) >> shift
= ALIGN_MASK(b + 1, (1 << s) - 1) >> s
= {[b + 1 + (1 << s) - 1] & ~[(1 << s) - 1]} >> s
= [b + 1 + (1 << s) - 1] >> s
= [b + (1 << s)] >> s
= (b >> s) + 1

So fixing a potential overflow with the safer shortcut.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/alpha/kernel/pci_iommu.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 81037907268d..1ef2c647bd3e 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -141,12 +141,10 @@ iommu_arena_find_pages(struct device *dev, struct pci_iommu_arena *arena,
 	unsigned long boundary_size;
 
 	base = arena->dma_base >> PAGE_SHIFT;
-	if (dev) {
-		boundary_size = dma_get_seg_boundary(dev) + 1;
-		boundary_size >>= PAGE_SHIFT;
-	} else {
-		boundary_size = 1UL << (32 - PAGE_SHIFT);
-	}
+
+	boundary_size = dev ? dma_get_seg_boundary(dev) : U32_MAX;
+	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
+	boundary_size = (boundary_size >> PAGE_SHIFT) + 1;
 
 	/* Search forward for the first mask-aligned sequence of N free ptes */
 	ptes = arena->ptes;
-- 
2.17.1

