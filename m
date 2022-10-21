From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2] alpha: remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO
 definitions
Date: Fri, 21 Oct 2022 14:40:05 -0500
Message-ID: <20221021-wip-bjorn-22-10-slow-down-io-alpha-v2-0-4f89a85f1b61@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1666381206; l=1632;
 i=bhelgaas@google.com; s=20221014; h=from:subject:message-id;
 bh=n+vFjonkIQ49sTZQZr2F918bVuOaqlI65MRC3qFzViY=;
 b=P38SAoAzaybGric0Q2Ac0MQx4CT47cUZ3ubBH9FW2vi6Db9fxnAP9+7naWlJKMsIc8T8e2v14vfT
 XmJ3FuX3CmfzajWvu3adyDg4JV8lIB0SVDwnWAPlTx56UY5AgcQo
X-Developer-Key: i=bhelgaas@google.com; a=ed25519;
 pk=bFjaHnNobtkUv3f7ErkQcm+PpbyCUUBlIfqMtNRJwQs=
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <richard.henderson@linaro.org>

Remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO definitions.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
---
alpha: remove unused SLOW_DOWN_IO

Only alpha and sh define SLOW_DOWN_IO, and there are no uses of it.  Remove
it from alpha.

This was previously posted 4/15/2022 at
  https://lore.kernel.org/all/20220415190817.842864-1-helgaas@kernel.org/
and reposted 10/13/2022 at
  https://lore.kernel.org/all/20221014001911.3342485-1-helgaas@kernel.org/

Changes from v1 to v2:
  - Drop the ia64 patch because Andrew applied it
      https://lore.kernel.org/all/20221021045245.99636C433C1@smtp.kernel.org/

  - Split sh and alpha to separate series
---
 arch/alpha/include/asm/io.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index 1c3605d874e9..7aeaf7c30a6f 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -14,10 +14,6 @@
    the implementation we have here matches that interface.  */
 #include <asm-generic/iomap.h>
 
-/* We don't use IO slowdowns on the Alpha, but.. */
-#define __SLOW_DOWN_IO	do { } while (0)
-#define SLOW_DOWN_IO	do { } while (0)
-
 /*
  * Virtual -> physical identity mapping starts at this offset
  */

---
base-commit: f1947d7c8a61db1cb0ef909a6512ede0b1f2115b
change-id: 20221021-wip-bjorn-22-10-slow-down-io-alpha-2b4fac9d06d3

Best regards,
-- 
Bjorn Helgaas <bhelgaas@google.com>
