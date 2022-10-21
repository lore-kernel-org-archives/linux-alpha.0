From: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH] alpha: remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO definitions
Date: Fri, 21 Oct 2022 15:18:38 -0500
Message-ID: <20221021201838.306176-1-helgaas@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666383522;
        bh=9N8hC43F53uZw3GUeYPmUFhh7KM4AYDCYlgMmHNSMks=;
        h=From:To:Cc:Subject:Date:From;
        b=pAPQH6Ma/i6sfdSdfOn98fL1TD3501f1E5jKOHMJY6M75NyN2XLX5E+aJGAtOp0Xt
         kG/lhzDu+uLlL10cTUepsLxvfESaf9vvZM6FQfVBPwK/NkrmRNmAugI26n2ElhgmSx
         UFWwbmVuF+vfgKwGiL3JvuqPQAKQagW+qMC3ArklDhvYdFBOMP09i+QnYpOGsTFdWH
         hDkSHFxJUaMjZV82bt1087addmv8lNkUAo+pOHQ77jLCHRP/SkGMZpoAIKRqPnNici
         TWxKYQJ+YX4yO8YoO9pUnjP+nUVbaoAlyTTSP9ke4jCu7teFZvJHL+Kkr27Zl/0vC4
         VSQIPc7BEag/A==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>

From: Bjorn Helgaas <bhelgaas@google.com>

Remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO definitions.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---

[Sorry for the noise; I sent this a few minutes ago, but it bounced from
all the individual recipients because of DMARC issues]

Previously posted v1 4/15/2022 at
  https://lore.kernel.org/all/20220415190817.842864-1-helgaas@kernel.org/
and reposted v1 10/13/2022 at
  https://lore.kernel.org/all/20221014001911.3342485-1-helgaas@kernel.org/

Changes from v1 to v2:
  - Drop the ia64 patch because Andrew applied it
      https://lore.kernel.org/all/20221021045245.99636C433C1@smtp.kernel.org/

  - Split sh and alpha to separate series

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
-- 
2.25.1

