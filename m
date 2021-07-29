From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v3 19/21] x86/amd_gart: don't set failed sg dma_address to DMA_MAPPING_ERROR
Date: Thu, 29 Jul 2021 14:15:37 -0600
Message-ID: <20210729201539.5602-20-logang@deltatee.com>
References: <20210729201539.5602-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=1Ac+kLf3m7NLdDW/VFqzSvvzNcJRkR+YtO34l2sNfsw=; b=CYpOEPkfDJsDZ19VVFUGJc08Hl
        wVyQ1auEMhFw3oG+P80C7VLasUNFa3YF3QP87IB+GtXwAyNyDAtXLiRs0WKNLvPAfMYKCjwgaxoUF
        xAYZu6F/j92HpUia8nEPJd0FBfaIXKdpUTDsjxnagjFHQ07zPNxKhTGah4dv+0uoZ5qaD0ZyJVVvq
        d8+MXykLHtmVVquaqIwBQ7+/DBw/Ai6GbAoiZnr/ymhywWpfp3K69RNFSzMTThgf3ugmo4v7Z3sr3
        oTfHb88CIGWF8sKLlRTWbMSEy/CEd56V/KXV4n6Fqsyvn6oP62OrUmlpQv36B4t10Aytm4gA2hg8x
        5z6w0R3A==;
In-Reply-To: <20210729201539.5602-1-logang@deltatee.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>

Setting the ->dma_address to DMA_MAPPING_ERROR is not part of
the ->map_sg calling convention, so remove it.

Link: https://lore.kernel.org/linux-mips/20210716063241.GC13345@lst.de/
Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/x86/kernel/amd_gart_64.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index 46aea9a4f26b..ed837383de5c 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -458,8 +458,6 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 		panic("dma_map_sg: overflow on %lu pages\n", pages);
 
 	iommu_full(dev, pages << PAGE_SHIFT, dir);
-	for_each_sg(sg, s, nents, i)
-		s->dma_address = DMA_MAPPING_ERROR;
 	return ret;
 }
 
-- 
2.20.1

