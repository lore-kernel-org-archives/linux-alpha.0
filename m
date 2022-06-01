From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.17 33/48] alpha: fix alloc_zeroed_user_highpage_movable()
Date: Wed,  1 Jun 2022 09:54:06 -0400
Message-ID: <20220601135421.2003328-33-sashal@kernel.org>
References: <20220601135421.2003328-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654091738;
        bh=p/08dZfZ7CBeLXRE9nPAnm/+jHFflppoG/BYqplNPyk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oI+weow2Hxnk/ca6LkJimSB3MFXtgSAFdQP+VHnVeZNcv3YGMTe93wqGtBlOulhL5
         KyLeHbTAE67fIFjNA+tSCDxjU3KMlrkJyFo7uiF8eHlmgtW178NKk+7m+L6Ub0/hfx
         azVqByBKUthIpq48dSuBQRkoKyDJzT2VcsxqIehJ9XpIngEtscqxDWqt8YUMDpygxz
         MY4Gg8cZKZEAJPr/XKseRy6Nv+rJp6THGHk5lt8xEPho9vTR37mHRtHjWAPkMfBBbL
         7JstK1rs6p73NLMqhBQcUjdBtBsQFD2bbPrMUk6kyiOJLcsNpt5Tx2IOO6EsoN5QKa
         AWkwFheT7zrYQ==
In-Reply-To: <20220601135421.2003328-1-sashal@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, kernel test robot <lkp@intel.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Sasha Levin <sashal@kernel.org>, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, pcc@google.com, will@kernel.org, catalin.marinas@arm.com, linux-alpha@vger.kernel.org

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

