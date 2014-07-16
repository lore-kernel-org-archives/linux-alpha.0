From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 6/6 v2] alpha: Join lines and merge strings for the two lines
Date: Tue, 15 Jul 2014 23:00:18 -0400
Message-ID: <1405479618-3808-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=qvS/XWP9Qg6oPS9Rc1XV36TEFitFQ5LYlfoD9R3hOKA=;
        b=IbTzXFldHKMqKNJmkljrPt0WAmu8cUY7Cfif6teZ5Q7Njv0n6j4KyYwbH4pEDBo60g
         gghLvmo64PMYJH+HxkGoAPrIamUKdZz7/Pgs7T8c7QCceMmSAnO80So/5DmoveUqNgSQ
         QTTF7BX10YO8hVOPw987ns3fQPT2m8hHcW/UfAXtqMRLi10CO75tAvamPetjRiG3IKSc
         aiNgX0aaWHfKVr7EP2VUSZlbzLq25j/tbHsxZeimOXF4b/ZEmQBV5yJ+E9poYK8/x4Wh
         HrIWiJuvt5j2+Vv1cn6dybd9sYp+XDjSd9+qEc+vbtzVOPaqk/xlFYYv5WQ9PruTrV2P
         996g==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This patch merges lines 92 and 93. In addition it merges the strings on
both lines by removing the quotes around the seperate strings. This is 
needed to remove the final checkpatch error I get from running it on 
bootpz.c

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 arch/alpha/boot/bootpz.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index d6ad191..51122f7 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -89,8 +89,7 @@ check_range(unsigned long vstart, unsigned long vend,
 		if (kaddr >= kstart && kaddr <= kend)
 		{
 #ifdef DEBUG_CHECK_RANGE
-			srm_printk("OVERLAP: vaddr 0x%lx kaddr 0x%lx"
-				   " [0x%lx:0x%lx]\n",
+			srm_printk("OVERLAP: vaddr 0x%lx kaddr 0x%lx [0x%lx:0x%lx]\n",
 				   vaddr, kaddr, kstart, kend);
 #endif
 			return 1;
-- 
1.9.1

