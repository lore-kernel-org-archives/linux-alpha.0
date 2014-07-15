From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 1/5] alpha: checkpatch  gives errors and warnings in bootp.c
Date: Mon, 14 Jul 2014 23:46:36 -0400
Message-ID: <1405396000-4917-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=r+OX3xO37BNM5IWy08fy77BrHf9ZcHFo+pvwsneti2s=;
        b=rQCghgIeUNAd0CawGf90suZXiQbM0CVYCW7u91vl7hBgYLwyrTgmnscZhvS2j9b639
         yt493+KefslKsyVRI0O0QyEmYQwmHErLlQ6tET+x1dT9lvw/jhVdoqaWQPNC6Z5sGyiU
         ClaIYDAxbAr3afGe+Qkpwhh7Qchy7k5JTU7h1T42atwiIhpdNWAH6mT/4JPKxJoLtrIW
         YH6nSNTjfPx6pb4+GKSPAUeTiDuHLy2L6WWfN3CiKSPDz8T5yV6R5tOc9P2Wkn0cQInp
         rDhkOpR9pvFe6G/yadH86rPO5hToM0P+5jiskRAb8u7X2NzcCFRjiDu0jTdhLsmKCBB6
         7Y3Q==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

When running checkpatch on this file I get lots of warnings and even a few
errors. This patch cleans up the coding style warning I get on line 26.
---
 arch/alpha/boot/bootp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/boot/bootp.c b/arch/alpha/boot/bootp.c
index 2a542a5..8eb821e 100644
--- a/arch/alpha/boot/bootp.c
+++ b/arch/alpha/boot/bootp.c
@@ -23,7 +23,7 @@
 #include "ksize.h"
 
 extern unsigned long switch_to_osf_pal(unsigned long nr,
-	struct pcb_struct * pcb_va, struct pcb_struct * pcb_pa,
+	struct pcb_struct *pcb_va, struct pcb_struct *pcb_pa,
 	unsigned long *vptb);
 
 extern void move_stack(unsigned long new_stack);
-- 
1.9.1
