From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] alpha: Remove duplicate inclusion of asm/xchg.h
Date: Mon, 19 Nov 2012 16:41:39 +0530
Message-ID: <1353323499-8638-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: paul.gortmaker@windriver.com, rth@twiddle.net, mattst88@gmail.com, sachin.kamat@linaro.org, patches@linaro.org

asm/xchg.h was included twice.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/alpha/include/asm/cmpxchg.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
index 429e8cd..8df1674 100644
--- a/arch/alpha/include/asm/cmpxchg.h
+++ b/arch/alpha/include/asm/cmpxchg.h
@@ -40,7 +40,6 @@
 #undef ____cmpxchg
 #define ____xchg(type, args...)		__xchg ##type(args)
 #define ____cmpxchg(type, args...)	__cmpxchg ##type(args)
-#include <asm/xchg.h>
 
 #define xchg(ptr, x)							\
 ({									\
-- 
1.7.4.1

