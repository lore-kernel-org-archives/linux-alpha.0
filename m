From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCHv2 RFC (repost) 11/16] tile: don't panic on iomap
Date: Wed, 21 Dec 2011 18:30:02 +0200
Message-ID: <aa4256d1c1644875fd69c7024193c7ac317ee7c6.1324484752.git.mst@redhat.com>
References: <cover.1324484752.git.mst@redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1324484752.git.mst@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

I think panic on iomap is there just for debugging.
If we return NULL instead, the generic pci_iomap will
DTRT so we don't need to roll our own.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Chris Metcalf <cmetcalf@tilera.com>
---
 arch/tile/include/asm/io.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/tile/include/asm/io.h b/arch/tile/include/asm/io.h
index c9ea165..d2152de 100644
--- a/arch/tile/include/asm/io.h
+++ b/arch/tile/include/asm/io.h
@@ -204,7 +204,8 @@ static inline long ioport_panic(void)
 
 static inline void __iomem *ioport_map(unsigned long port, unsigned int len)
 {
-	return (void __iomem *) ioport_panic();
+	pr_info("ioport_map: mapping IO resources is unsupported on tile.\n");
+	return NULL;
 }
 
 static inline void ioport_unmap(void __iomem *addr)
-- 
1.7.8.382.g3daff
