From: FUJITA Tomonori <tomof@acm.org>
Subject: Re: [regression]2.6.25-rc4: boot panic on alpha
Date: Fri, 7 Mar 2008 23:56:40 +0900
Message-ID: <20080307235616T.tomof@acm.org>
References: <20080307072304.GA25351@elte.hu>
	<20080307123645.0CB5BDBA2@gherkin.frus.com>
	<20080307141439.GB23178@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759333AbYCGO5V@vger.kernel.org>
In-Reply-To: <20080307141439.GB23178@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: rct@frus.com, mingo@elte.hu
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, fujita.tomonori@lab.ntt.co.jp, akpm@linux-foundation.org

On Fri, 7 Mar 2008 15:14:40 +0100
Ingo Molnar <mingo@elte.hu> wrote:

> 
> * Bob Tracy <rct@frus.com> wrote:
> 
> > Ingo Molnar wrote:
> > > Bob, does latest -git boot if you revert these 4 commits:
> > 
> > (FUJITA Tomonori's Alpha IOMMU changes)
> > 
> > I'll get things set up to try that later today...  In the meantime, it 
> > appears the regression is relative to -rc3: I'm up and running on that 
> > kernel as I type this.
> 
> yes, these iommu changes were added post-rc3, they came from -mm and 
> were i think declared to be untested on Alpha. So i'd strongly suspect 
> them.

Very sorry, I probably broke the IOMMU. I don't have the hardware so
I've not tested the patches.

Bob, if reverting the patches works, can you please try the following
patch? If it works, please let me know about the kernel message.

Thanks,

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index be6fa10..a6bef1d 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -129,8 +129,9 @@ static inline int is_span_boundary(unsigned int index, unsigned int nr,
 				   unsigned long shift,
 				   unsigned long boundary_size)
 {
-	shift = (shift + index) & (boundary_size - 1);
-	return shift + nr > boundary_size;
+	return 0;
+/* 	shift = (shift + index) & (boundary_size - 1); */
+/* 	return shift + nr > boundary_size; */
 }
 
 /* Must be called with the arena lock held */
@@ -144,7 +145,9 @@ iommu_arena_find_pages(struct device *dev, struct pci_iommu_arena *arena,
 	unsigned long base;
 	unsigned long boundary_size;
 
-	BUG_ON(arena->dma_base & ~PAGE_MASK);
+	if (arena->dma_base & ~PAGE_MASK)
+		printk("%s %d: %lx\n", __FUNCTION__, __LINE__, arena->dma_base);
+
 	base = arena->dma_base >> PAGE_SHIFT;
 	if (dev)
 		boundary_size = ALIGN(dma_get_max_seg_size(dev) + 1, PAGE_SIZE)
@@ -152,7 +155,8 @@ iommu_arena_find_pages(struct device *dev, struct pci_iommu_arena *arena,
 	else
 		boundary_size = ALIGN(1UL << 32, PAGE_SIZE) >> PAGE_SHIFT;
 
-	BUG_ON(!is_power_of_2(boundary_size));
+	if (!is_power_of_2(boundary_size))
+		printk("%s %d: %lx\n", __FUNCTION__, __LINE__, boundary_size);
 
 	/* Search forward for the first mask-aligned sequence of N free ptes */
 	ptes = arena->ptes;
