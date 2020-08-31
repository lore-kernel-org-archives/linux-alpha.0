From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [RESEND][PATCH 1/7] powerpc/iommu: Avoid overflow at boundary_size
Date: Mon, 31 Aug 2020 13:38:05 -0700
Message-ID: <20200831203811.8494-2-nicoleotsuka@gmail.com>
References: <20200831203811.8494-1-nicoleotsuka@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=X3g/RFdq0XCD5HjHScp80cQCvDJiBf0FEu2sjpwx7PM=;
        b=FTBIoSkSFCuYfdZZaBdmEHEhwrbZcdgJQEmZ6+shh7rWUbYFsVNhqAvIZ76+x5Agay
         HZGd1vGAqH8QZN271wpNdm5UMhzNI4fjZxpDIzQoQQOkYhhXQV4pGykHjIkWUcRA+os0
         cfATZ79F07KBkEiXisWvSKSKRlB4nNLiJWGlc+KoC+c9cNTLJbaRwkGPyOMfTgCsij4L
         AIXUcsy6y/nvNko5LI3a7lMyuCUxiq3vv5/NauqeVADCoaX5kExpDbcxIi+KIEtcENxO
         D5VqKn4IFfj/HP7QtYhkIJMrqIKq81+SfGjp//+umfJhEqXXpj1hdk14thzK3bwfoS2D
         lu4g==
In-Reply-To: <20200831203811.8494-1-nicoleotsuka@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
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

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/kernel/iommu.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 9704f3f76e63..c01ccbf8afdd 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -236,15 +236,14 @@ static unsigned long iommu_range_alloc(struct device *dev,
 		}
 	}
 
-	if (dev)
-		boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
-				      1 << tbl->it_page_shift);
-	else
-		boundary_size = ALIGN(1UL << 32, 1 << tbl->it_page_shift);
 	/* 4GB boundary for iseries_hv_alloc and iseries_hv_map */
+	boundary_size = dev ? dma_get_seg_boundary(dev) : U32_MAX;
+
+	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
+	boundary_size = (boundary_size >> tbl->it_page_shift) + 1;
 
 	n = iommu_area_alloc(tbl->it_map, limit, start, npages, tbl->it_offset,
-			     boundary_size >> tbl->it_page_shift, align_mask);
+			     boundary_size, align_mask);
 	if (n == -1) {
 		if (likely(pass == 0)) {
 			/* First try the pool from the start */
-- 
2.17.1

