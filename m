From: Julia Lawall <julia@diku.dk>
Subject: [PATCH 1/15] arch/alpha: Use DIV_ROUND_CLOSEST
Date: Sun, 2 Aug 2009 10:44:32 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0908021044000.15557@ask.diku.dk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752645AbZHBIv5@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
but is perhaps more readable.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@haskernel@
@@

#include <linux/kernel.h>

@depends on haskernel@
expression x,__divisor;
@@

- (((x) + ((__divisor) / 2)) / (__divisor))
+ DIV_ROUND_CLOSEST(x,__divisor)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/alpha/kernel/sys_ruffian.c     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/kernel/sys_ruffian.c b/arch/alpha/kernel/sys_ruffian.c
index d9f9cfe..8de1046 100644
--- a/arch/alpha/kernel/sys_ruffian.c
+++ b/arch/alpha/kernel/sys_ruffian.c
@@ -66,7 +66,7 @@ ruffian_init_irq(void)
 	common_init_isa_dma();
 }
 
-#define RUFFIAN_LATCH	((PIT_TICK_RATE + HZ / 2) / HZ)
+#define RUFFIAN_LATCH	DIV_ROUND_CLOSEST(PIT_TICK_RATE, HZ)
 
 static void __init
 ruffian_init_rtc(void)
