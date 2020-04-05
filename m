From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 4/5] second: Fix typo'd operator
Date: Sun,  5 Apr 2020 11:48:57 -0700
Message-ID: <20200405184858.3963582-4-mattst88@gmail.com>
References: <20200405184858.3963582-1-mattst88@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OMzenX4mqVJrFhYZZkTRMlhfVu2Wc0DhKWgmDJYanJI=;
        b=HiXlKjbJMNr/EyuA1+oJE0asKCCH/+kT4NzOvdNmBrhXYR1erCa9+1z5L59vWxriYe
         PUGEHcxqNquXtI35ztMJmecbw2rGabBlVDOSPSnVxPoJ/S74PyHxR3Fmq4vS+llQ+Nw1
         CrvD3K7BYzvUax/kQf7Nca6tXDDc0tephvTqquHVVF/JMU/QZqb3H7mhksuIKh5l/CGX
         2U6k4ttcFxl4lsMH1o4e49DIeooABhEAw3x8aWzkR2UztH//7/XCWviVs2zG5wKoP4OB
         YTR4Xk9Ka0ErlpIoBzCSZKnjAUt+OOI584o6XZtjw8buISKGgnnjmw8ER1N7UKqI32uJ
         lnJw==
In-Reply-To: <20200405184858.3963582-1-mattst88@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Aaro Koskinen <aaro.koskinen@iki.fi>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 second/disk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/second/disk.c b/second/disk.c
index 40234b3..b81a465 100644
--- a/second/disk.c
+++ b/second/disk.c
@@ -293,7 +293,7 @@ int silo_disk_read(char *buff, int size, unsigned long long offset)
 	if (!net) {
 	    if (prom_vers != PROM_P1275) {
 		    if (((romvec->pv_printrev >> 16) < 2 || 
-		         ((romvec->pv_printrev >> 16) == 2 && (romvec->pv_printrev && 0xffff) < 6)) 
+		         ((romvec->pv_printrev >> 16) == 2 && (romvec->pv_printrev & 0xffff) < 6))
 		        && offset >= 0x40000000) {
 		    	printf ("Buggy old PROMs don't allow reading past 1GB from start of the disk. Send complaints to SMCC\n");
 	    		return -1;
-- 
2.24.1

