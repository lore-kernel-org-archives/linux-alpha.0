From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] alpha: remove mysterious if zero-ed out includes
Date: Sat, 30 Jun 2012 12:42:33 +0200
Message-ID: <1341052953.1911.67.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

There's a small group of odd looking includes in smc37c669.c. These
includes appear to be if zero-ed out ever since they were added to the
tree (in v2.1.89). Their purpose is unclear to me. Perhaps they were
used in someones build system. Whatever their purpose was, nothing else
uses something comparable. This entire if zero-ed out block might as
well be removed.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
0) Untested. I do not have the toolchain needed at hand.

1) I only care about these few lines because they show up (as false
positives) when grepping the tree for includes.

 arch/alpha/kernel/smc37c669.c |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/arch/alpha/kernel/smc37c669.c b/arch/alpha/kernel/smc37c669.c
index 0435921d..c803fc7 100644
--- a/arch/alpha/kernel/smc37c669.c
+++ b/arch/alpha/kernel/smc37c669.c
@@ -933,18 +933,6 @@ void SMC37c669_display_device_info(
  *
  *--
  */
-#if 0
-/* $INCLUDE_OPTIONS$ */
-#include    "cp$inc:platform_io.h"
-/* $INCLUDE_OPTIONS_END$ */
-#include    "cp$src:common.h"
-#include    "cp$inc:prototypes.h"
-#include    "cp$src:kernel_def.h"
-#include    "cp$src:msg_def.h"
-#include    "cp$src:smcc669_def.h"
-/* Platform-specific includes */
-#include    "cp$src:platform.h"
-#endif
 
 #ifndef TRUE
 #define TRUE 1
-- 
1.7.7.6
