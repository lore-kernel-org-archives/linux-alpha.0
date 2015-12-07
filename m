From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] alpha: mm: fix build failure
Date: Mon,  7 Dec 2015 17:32:24 +0530
Message-ID: <1449489744-20051-1-git-send-email-sudipm.mukherjee@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=pOrBWw2m6iknEzxkqx6R22IBHaKvkBkpvaa17hpbMFM=;
        b=X5fzowVtcc75qRnloeNEClw0dQtF9C8+xdskaNDz3ePUF61w0ma9xXVoeXTa2ojXTi
         DNKUjLOLUbNUqKzAo7GtxA6bdgIisUF3FNu8kY9nlbMFOY+8a28blRzuKLqoH0tbYESR
         TD3frnMvp4fdsm6uUTF0fq00ZHYqXK0I5wtVhC8qQH6oEq1+m73YUaHvrk1baxJM1ayx
         yUZ5U+E9HSi5AEktyRtxErAKPKWF7kKva2N4vg5vtadFi3Yqho+gNk9n86z9KxQQCtzN
         Ay1YfEpv55kCRjmq855vm+BbOafOGaQexux44TzLMn/70pQ8HC3TAnQPQddeuTEw4C7p
         gb6A==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Chen Gang <gang.chen.5i5j@gmail.com>, Minchan Kim <minchan@kernel.org>

We are having build failure with alpha defconfig with the error:
"MADV_FREE" redefined.

commit d53d95838c7d introduced uniform values for all architecture but
missed removing the old value.

Fixes: d53d95838c7d ("arch/*/include/uapi/asm/mman.h: : let MADV_FREE have same value for all architectures")
Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---

build log at:
https://travis-ci.org/sudipm-mukherjee/parport/jobs/95309505

 arch/alpha/include/uapi/asm/mman.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/alpha/include/uapi/asm/mman.h b/arch/alpha/include/uapi/asm/mman.h
index ab336c0..fec1947 100644
--- a/arch/alpha/include/uapi/asm/mman.h
+++ b/arch/alpha/include/uapi/asm/mman.h
@@ -47,7 +47,6 @@
 #define MADV_WILLNEED	3		/* will need these pages */
 #define	MADV_SPACEAVAIL	5		/* ensure resources are available */
 #define MADV_DONTNEED	6		/* don't need these pages */
-#define MADV_FREE	7		/* free pages only if memory pressure */
 
 /* common/generic parameters */
 #define MADV_FREE	8		/* free pages only if memory pressure */
-- 
1.9.1

