From: Roel Kluin <roel.kluin@gmail.com>
Subject: [PATCH] alpha: bad macro expansion, parameter is member
Date: Tue, 12 May 2009 23:49:36 +0200
Message-ID: <4A09EEF0.6060003@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=4wZc+oUxpvC8J2lw5fO51djZFyfwu6fObhwxZAmltM0=;
        b=hvfb9DXB1PQZKWXtMTkZua/NpqZEWek3fi0+v9gz9eVwmX2nHeZAhqYsrBLh8rWEE9
         XMDvBRy4G8G5TkkSQf2NF72EsYsvaUmZ2EyOI69QlnbG7nypvEvWObJ0O0fM3NYFjFnz
         dVpTekPBIoXL+0Vw21jEvEs/wwDEl5qi8gUoo=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, linux-alpha@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>

`for_each_mem_cluster(x, y, z)' will expand to 
`for ((x) = (y)->x ...' but correct is `for ((x) = (y)->cluster ...'

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 80df86c..d2634e4 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -252,9 +252,9 @@ reserve_std_resources(void)
 }
 
 #define PFN_MAX		PFN_DOWN(0x80000000)
-#define for_each_mem_cluster(memdesc, cluster, i)		\
-	for ((cluster) = (memdesc)->cluster, (i) = 0;		\
-	     (i) < (memdesc)->numclusters; (i)++, (cluster)++)
+#define for_each_mem_cluster(memdesc, _cluster, i)		\
+	for ((_cluster) = (memdesc)->cluster, (i) = 0;		\
+	     (i) < (memdesc)->numclusters; (i)++, (_cluster)++)
 
 static unsigned long __init
 get_mem_size_limit(char *s)
diff --git a/arch/alpha/mm/numa.c b/arch/alpha/mm/numa.c
index a13de49..0eab557 100644
--- a/arch/alpha/mm/numa.c
+++ b/arch/alpha/mm/numa.c
@@ -28,9 +28,9 @@ EXPORT_SYMBOL(node_data);
 #define DBGDCONT(args...)
 #endif
 
-#define for_each_mem_cluster(memdesc, cluster, i)		\
-	for ((cluster) = (memdesc)->cluster, (i) = 0;		\
-	     (i) < (memdesc)->numclusters; (i)++, (cluster)++)
+#define for_each_mem_cluster(memdesc, _cluster, i)		\
+	for ((_cluster) = (memdesc)->cluster, (i) = 0;		\
+	     (i) < (memdesc)->numclusters; (i)++, (_cluster)++)
 
 static void __init show_mem_layout(void)
 {
