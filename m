From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: [PATCH -mm 2/8] alpha: enable ARCH_DMA_ADDR_T_64BIT
Date: Fri,  3 Sep 2010 09:49:10 +0900
Message-ID: <1283474956-14710-2-git-send-email-fujita.tomonori@lab.ntt.co.jp>
References: <20100903094753S.fujita.tomonori@lab.ntt.co.jp>
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <20100903094753S.fujita.tomonori@lab.ntt.co.jp>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, fujita.tomonori@lab.ntt.co.jp, linux-alpha@vger.kernel.org

Signed-off-by: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Cc: linux-alpha@vger.kernel.org
---
 arch/alpha/Kconfig |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index b9647bb..953e31e 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -54,6 +54,9 @@ config ZONE_DMA
 	bool
 	default y
 
+config ARCH_DMA_ADDR_T_64BIT
+	def_bool y
+
 config NEED_DMA_MAP_STATE
        def_bool y
 
-- 
1.7.1
