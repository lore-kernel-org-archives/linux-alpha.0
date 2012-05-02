From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 3/4] alpha: include module.h to fix modpost on Tsunami
Date: Tue,  1 May 2012 22:27:23 -0400
Message-ID: <1335925644-5192-3-git-send-email-mattst88@gmail.com>
References: <1335925644-5192-1-git-send-email-mattst88@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
        bh=bld/alZlNX1eZrlwHo33Qe/idpCcJ7o4aegqhkx0HQk=;
        b=CZRX1lFmL9rUnPxkwOIvYZ4MR7j7JABQKbRoRivDQVoFYVCehcDtQrL6sGWTS01FKa
         IAIFoUQNK7SW2PJYae3eDCH78KWjHcMKNN8NheIgIy7za/c2uHcAyOC/ctfEOQ3WK6Ei
         Q3thjRiLzw8KO4LS1q0jSavA3pIkWkFi7WKr3ZKNFMHJolTQwk3BAWAZ3T0GEgQ6MedN
         KDw5yUj00wDvvzl82X9gS+XYQEJlDBGXX/B0hLTbPrKkchlOUg+crSYWBivyDll32fWh
         OYdCPQ+KLYM/OfELP+MQyBHdQZpzoHF+qHq7lo3kzzuGqdOToszPBLtm8TIGZJEWjp38
         jZkw==
In-Reply-To: <1335925644-5192-1-git-send-email-mattst88@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, Jim Faulkner <jfaulkne@ccs.neu.edu>, Matt Turner <mattst88@gmail.com>

From: Jim Faulkner <jfaulkne@ccs.neu.edu>

Signed-off-by: Jim Faulkner <jfaulkne@ccs.neu.edu>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/core_tsunami.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/alpha/kernel/core_tsunami.c b/arch/alpha/kernel/core_tsunami.c
index 5e7c28f..61893d7 100644
--- a/arch/alpha/kernel/core_tsunami.c
+++ b/arch/alpha/kernel/core_tsunami.c
@@ -11,6 +11,7 @@
 #include <asm/core_tsunami.h>
 #undef __EXTERN_INLINE
 
+#include <linux/module.h>
 #include <linux/types.h>
 #include <linux/pci.h>
 #include <linux/sched.h>
-- 
1.7.3.4
