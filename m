From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: [RESEND] [PATCH] alpha: remove dead BIO_VMERGE_BOUNDARY
Date: Fri, 12 Dec 2008 17:47:49 +0900
Message-ID: <20081212174824M.fujita.tomonori@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: jens.axboe@oracle.com
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

This is a resend of:

http://marc.info/?l=linux-kernel&m=122482703716610&w=2

Jens, can you merge this via your tree? There is no tree for Alpha.

=
From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: [PATCH] alpha: remove dead BIO_VMERGE_BOUNDARY

The block layer dropped the virtual merge feature
(b8b3e16cfe6435d961f6aaebcfd52a1ff2a988c5). BIO_VMERGE_BOUNDARY
definition is meaningless now.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
---
 arch/alpha/include/asm/io.h |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index e971ab0..eda9b90 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -96,9 +96,6 @@ static inline dma_addr_t __deprecated isa_page_to_bus(struct page *page)
 	return page_to_phys(page);
 }
 
-/* This depends on working iommu.  */
-#define BIO_VMERGE_BOUNDARY	(alpha_mv.mv_pci_tbi ? PAGE_SIZE : 0)
-
 /* Maximum PIO space address supported?  */
 #define IO_SPACE_LIMIT 0xffff
 
-- 
1.5.6.5

