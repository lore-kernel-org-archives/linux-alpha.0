From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH] alpha: Add DMA_ERROR_CODE defn to avert compiler error in drm
Date: Wed,  4 May 2011 20:13:37 +1200
Message-ID: <1304496817-7646-1-git-send-email-mcree@orcon.net.nz>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

The radeon drm code now relies on DMA_ERROR_CODE.  This defines
it in alpha dma-mapping header to at least enable me to compile
radeon drm/kms into kernel.

Signed-off-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/include/asm/dma-mapping.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/alpha/include/asm/dma-mapping.h b/arch/alpha/include/asm/dma-mapping.h
index 4567aca..644d9c3 100644
--- a/arch/alpha/include/asm/dma-mapping.h
+++ b/arch/alpha/include/asm/dma-mapping.h
@@ -3,6 +3,8 @@
 
 #include <linux/dma-attrs.h>
 
+#define DMA_ERROR_CODE 0
+
 extern struct dma_map_ops *dma_ops;
 
 static inline struct dma_map_ops *get_dma_ops(struct device *dev)
-- 
1.7.4.3

