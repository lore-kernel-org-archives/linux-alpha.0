From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [RESEND][PATCH 4/7] s390/pci_dma: Avoid overflow at boundary_size
Date: Mon, 31 Aug 2020 13:38:08 -0700
Message-ID: <20200831203811.8494-5-nicoleotsuka@gmail.com>
References: <20200831203811.8494-1-nicoleotsuka@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UkH8Mq/WpiesfkXrapLTRLCROpdsRyoJty+98OOSpss=;
        b=QBwNrPdfcSAA97dtBnIWUfFN68G3dlx1D0NnviFoEsXwwJ685l3hFpoUYeYtJQzsk/
         fa7q/UtZxp6YwHBe+lUXHOQ1+GfSZzVh/DlB4nJjGv8Y+GG4bROeovNbk90Dcxd5OiaP
         gYkpuhwWCgw69+Fd2vWpUnQw4H4CpId8WgPawlAj3OSXL312ysfq8SYTiTBN4xm5ThPO
         F5+hNzC4yo3iGIb2RECwzNn7zXfvrk0NhPLH5HEpZ91StyGiVU6TKHdKBob3F9RMPnA2
         XmuYHqTMy4gsXlEfIEJipnHZkQI0n3KRv58zBJxo9DDi8lOQS6j3A/NxhJQ1wSezy3yl
         U1oQ==
In-Reply-To: <20200831203811.8494-1-nicoleotsuka@gmail.com>
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, tony.luck@intel.com, fenghua.yu@intel.com, schnelle@linux.ibm.com, gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com, James.Bottomley@HansenPartnership.com, deller@gmx.de
Cc: sfr@canb.auug.org.au, hch@lst.de, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org

The boundary_size might be as large as ULONG_MAX, which means
that a device has no specific boundary limit. So either "+ 1"
or passing it to ALIGN() would potentially overflow.

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
 arch/s390/pci/pci_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/s390/pci/pci_dma.c b/arch/s390/pci/pci_dma.c
index 64b1399a73f0..ecb067acc6d5 100644
--- a/arch/s390/pci/pci_dma.c
+++ b/arch/s390/pci/pci_dma.c
@@ -263,8 +263,8 @@ static unsigned long __dma_alloc_iommu(struct device *dev,
 	struct zpci_dev *zdev = to_zpci(to_pci_dev(dev));
 	unsigned long boundary_size;
 
-	boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
-			      PAGE_SIZE) >> PAGE_SHIFT;
+	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
+	boundary_size = (dma_get_seg_boundary(dev) >> PAGE_SHIFT) + 1;
 	return iommu_area_alloc(zdev->iommu_bitmap, zdev->iommu_pages,
 				start, size, zdev->start_dma >> PAGE_SHIFT,
 				boundary_size, 0);
-- 
2.17.1

