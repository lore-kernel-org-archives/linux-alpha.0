From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 1/5] alpha: checkpatch whitespace errors in misc.c
Date: Tue, 15 Jul 2014 15:18:06 -0400
Message-ID: <1405451890-6057-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=ZHJkc9oBVArgpgJVXSHDlSfXQdxxya9B09CPN/X8B+A=;
        b=zSlywUpWhSq8U4LrzGIfLl2ASNNvmgPHmd/Sb6TDMkdLUNjmouIjrvDni4Wz7RWZUs
         H8+5zueNZ1R5fEZM9AQ1YGBBhXxjjPANrcpAadpuXQZQHozHGGdfmUBC5Up4mB3r1+2f
         rFHC1SVYCMTwDv0ZxT7RLzIYa8W3v8jRCio4frtOPQs97aq9L/7mCZwQbwIYZZd58DAi
         oomNLeX+6m0EhJZoAxolhP34zyxTwPND9QKbsUoE7HGq/tROXKoDYnaXntw2rE9e7FiI
         gNAUr4lApV6YLlpHquV4yuJI+Eg5F9cYmCzIIv0h+2f9c/tMipSKxj0ALDDv4tEpxRjm
         TtpQ==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This patch runs cleanfile against this file in order to remove all
outstanding whitespace errors caught when I ran checkpatch on it.
---
 arch/alpha/boot/misc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/boot/misc.c b/arch/alpha/boot/misc.c
index 3ff9a95..3f86c3e 100644
--- a/arch/alpha/boot/misc.c
+++ b/arch/alpha/boot/misc.c
@@ -1,7 +1,7 @@
 /*
  * misc.c
- * 
- * This is a collection of several routines from gzip-1.0.3 
+ *
+ * This is a collection of several routines from gzip-1.0.3
  * adapted for Linux.
  *
  * malloc by Hannu Savolainen 1993 and Matthias Urlichs 1994
@@ -10,7 +10,7 @@
  *
  * Nicolas Pitre <nico@visuaide.com>  1999/04/14 :
  *  For this code to run directly from Flash, all constant variables must
- *  be marked with 'const' and all other variables initialized at run-time 
+ *  be marked with 'const' and all other variables initialized at run-time
  *  only.  This way all non constant variables will end up in the bss segment,
  *  which should point to addresses in RAM and cleared to 0 on start.
  *  This allows for a much quicker boot time.
-- 
1.9.1

