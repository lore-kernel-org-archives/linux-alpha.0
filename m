From: David Daney <ddaney@caviumnetworks.com>
Subject: [PATCH 08/10] alpha: Convert BUG() to use unreachable()
Date: Thu, 10 Sep 2009 16:56:49 -0700
Message-ID: <1252627011-2933-8-git-send-email-ddaney@caviumnetworks.com>
References: <4AA991C1.1050800@caviumnetworks.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753284AbZIJX6O@vger.kernel.org>
In-Reply-To: <4AA991C1.1050800@caviumnetworks.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: torvalds@linux-foundation.org, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, David Daney <ddaney@caviumnetworks.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

Use the new unreachable() macro instead of for(;;);

Signed-off-by: David Daney <ddaney@caviumnetworks.com>
CC: Richard Henderson <rth@twiddle.net>
CC: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
CC: linux-alpha@vger.kernel.org
---
 arch/alpha/include/asm/bug.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/include/asm/bug.h b/arch/alpha/include/asm/bug.h
index 1720c8a..53281f4 100644
--- a/arch/alpha/include/asm/bug.h
+++ b/arch/alpha/include/asm/bug.h
@@ -13,7 +13,7 @@
 		"call_pal %0  # bugchk\n\t"				\
 		".long %1\n\t.8byte %2"					\
 		: : "i"(PAL_bugchk), "i"(__LINE__), "i"(__FILE__));	\
-	for ( ; ; ); } while (0)
+	unreachable(); } while (0)
 
 #define HAVE_ARCH_BUG
 #endif
-- 
1.6.2.5
