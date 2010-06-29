From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: [PATCH] alpha: remove homegrown L1_CACHE_ALIGN macro
Date: Tue, 29 Jun 2010 16:29:02 +0900
Message-ID: <20100629162252L.fujita.tomonori@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: mattst88@gmail.com
Cc: ink@jurassic.park.msu.ru, rth@twiddle.net, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Let's use the standard L1_CACHE_ALIGN macro instead.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
---
 arch/alpha/include/asm/cache.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/include/asm/cache.h b/arch/alpha/include/asm/cache.h
index f199e69..ad368a9 100644
--- a/arch/alpha/include/asm/cache.h
+++ b/arch/alpha/include/asm/cache.h
@@ -17,7 +17,6 @@
 # define L1_CACHE_SHIFT     5
 #endif
 
-#define L1_CACHE_ALIGN(x)  (((x)+(L1_CACHE_BYTES-1))&~(L1_CACHE_BYTES-1))
 #define SMP_CACHE_BYTES    L1_CACHE_BYTES
 
 #endif
-- 
1.6.5
