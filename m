From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 129/199] arch/alpha/math-emu/sfp-util.h: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:23 +0200
Message-ID: <1274644466-24577-21-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=w5weisYWhJ+FlOILPxitsNEose9cr7s+5IPWpEwbeLU=;
        b=S2STA9QiKeAEUMm3h9yKkcOtiivH0mNmzizV7KWXqwLt+jB64MncKv8aH2/+mVd1c4
         lerWGuWqgeoF6NsvDAbLta+4SxppmRooOI7uHgcBxRwCGmgn9RMOUDYLY21l2zLQoV99
         BaoXDKfcIBGVTsirxs6WNZlYimqoNz+8Iomqw=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/math-emu/sfp-util.h:25: WARNING: space prohibited between function name and open parenthesis '('
arch/alpha/math-emu/sfp-util.h:28: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/math-emu/sfp-util.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/math-emu/sfp-util.h b/arch/alpha/math-emu/sfp-util.h
index f53707f..7eec9bb 100644
--- a/arch/alpha/math-emu/sfp-util.h
+++ b/arch/alpha/math-emu/sfp-util.h
@@ -22,10 +22,10 @@
     (q) = __udiv_qrnnd (&__r, (n1), (n0), (d));			\
     (r) = __r;							\
   } while (0)
-extern unsigned long __udiv_qrnnd (unsigned long *, unsigned long,
+extern unsigned long __udiv_qrnnd(unsigned long *, unsigned long,
 				   unsigned long , unsigned long);
 
-#define UDIV_NEEDS_NORMALIZATION 1  
+#define UDIV_NEEDS_NORMALIZATION 1
 
 #define abort()			goto bad_insn
 
-- 
1.7.1.251.gf80a2

