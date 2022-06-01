From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.15 27/37] alpha: fix alloc_zeroed_user_highpage_movable()
Date: Wed,  1 Jun 2022 09:56:12 -0400
Message-ID: <20220601135622.2003939-27-sashal@kernel.org>
References: <20220601135622.2003939-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654091844;
        bh=p/08dZfZ7CBeLXRE9nPAnm/+jHFflppoG/BYqplNPyk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=loq+PnEthqsN1piiqNYF18ozggWATd66m7AdJS3yVjqjiIcHcJcS/ULEVtOaiDne6
         Q4628XJWiAm4QGMJ87DGz5ynqVw805eqbNLzviDPgzsXR2dmUt3WQAmO5t7MRRZ1Zw
         ISjBrf9Wcv2D5UPwNv6sCLO1xdHkCIoN2pRMRf1BjTTzkpfbG8Z47+joervNDjhhnk
         ZScYvfCKbbApTE5jVjaB5IeJWAon+r+DghxWaliRPkOq6A7zn1WGWMOUJ9s8ozvlbu
         lrVKynxIRcVLurtW8AVnLGV5d30CbSPoZzjmv5u4CxQQL9FrhE/4gkDYf3xF/k9va2
         Ta7RnGhgH0D/w==
In-Reply-To: <20220601135622.2003939-1-sashal@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, kernel test robot <lkp@intel.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Sasha Levin <sashal@kernel.org>, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, catalin.marinas@arm.com, will@kernel.org, pcc@google.com, linux-alpha@vger.kernel.org

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

[ Upstream commit f9c668d281aa20e38c9bda3b7b0adeb8891aa15e ]

Due to a typo, the final argument to alloc_page_vma() didn't refer to a
real variable.  This only affected CONFIG_NUMA, which was marked BROKEN in
2006 and removed from alpha in 2021.  Found due to a refactoring patch.

Link: https://lkml.kernel.org/r/20220504182857.4013401-4-willy@infradead.org
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/alpha/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.h
index 18f48a6f2ff6..8f3f5eecba28 100644
--- a/arch/alpha/include/asm/page.h
+++ b/arch/alpha/include/asm/page.h
@@ -18,7 +18,7 @@ extern void clear_page(void *page);
 #define clear_user_page(page, vaddr, pg)	clear_page(page)
 
 #define alloc_zeroed_user_highpage_movable(vma, vaddr) \
-	alloc_page_vma(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, vma, vmaddr)
+	alloc_page_vma(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, vma, vaddr)
 #define __HAVE_ARCH_ALLOC_ZEROED_USER_HIGHPAGE_MOVABLE
 
 extern void copy_page(void * _to, void * _from);
-- 
2.35.1

