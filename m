From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 2/5] alpha: Checkpatch warnings on lines 71 and 72
Date: Mon, 14 Jul 2014 23:46:37 -0400
Message-ID: <1405396000-4917-2-git-send-email-xerofoify@gmail.com>
References: <1405396000-4917-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xUxIqzBTjmWDAAq7kqRdXBYGMA3lMXmFtdVoq1VtH4M=;
        b=gG5IEwo/xq4ufmTtoyCH2JAk+NDnO2TBBhlkeSDThrOhNVX4gR/VTy282crXfOuqIY
         fhfEKNfT2G57lubXFtIqo96WFcSR09Ig6uD4o9OT5rqutFcsj0d+2IMQB7dL4oH4S5+4
         DngdmapjbDzQSGC7eunqH9cn+ks1sd0j0pdnSjADX3tz4znpwDg5W9Ss5Ommj4vW6qIg
         ZYOZmhAMOiEYI3W4YjcOsNcfb2/i/ImnyoLwsydzSK5ibjUreW68VVl+PZPNIMYoNiAb
         22QFiqtIUB1n1TFNnT96PwAreHwCBdKgb7XHe6bkO3oX/FMXFOBRtQotBk7ucDfDdTIV
         itVg==
In-Reply-To: <1405396000-4917-1-git-send-email-xerofoify@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

In bootp.c I am hitting lots of warnings this fixes two on lines 71,72
in order to pass checkpatch and follow kernel coding style.
---
 arch/alpha/boot/bootp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/boot/bootp.c b/arch/alpha/boot/bootp.c
index 8eb821e..3ee529d 100644
--- a/arch/alpha/boot/bootp.c
+++ b/arch/alpha/boot/bootp.c
@@ -68,8 +68,8 @@ void
 pal_init(void)
 {
 	unsigned long i, rev;
-	struct percpu_struct * percpu;
-	struct pcb_struct * pcb_pa;
+	struct percpu_struct *percpu;
+	struct pcb_struct *pcb_pa;
 
 	/* Create the dummy PCB.  */
 	pcb_va->ksp = 0;
-- 
1.9.1

