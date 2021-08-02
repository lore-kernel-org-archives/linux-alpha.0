From: <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBhbHBoYTogcmVtb3ZlIHVubmVlZGVkIHZhcmlhYmxl?=
Date: Mon, 2 Aug 2021 17:25:30 +0800 (CST)
Message-ID: <202107221858308514719@zte.com.cn>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

From: Zhang Yunkai <zhang.yunkai@zte.com.cn>

This is a warning in coccicheck. Unneeded variable "status".

Reported-by: Zeal Robot <zealci@zte.com.cn> 
Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
---
 arch/alpha/kernel/err_titan.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/err_titan.c b/arch/alpha/kernel/err_titan.c
index 0ffb2feea42a..85d91da86ec4 100644
--- a/arch/alpha/kernel/err_titan.c
+++ b/arch/alpha/kernel/err_titan.c
@@ -589,7 +589,6 @@ titan_register_error_handlers(void)
 static int
 privateer_process_680_frame(struct el_common *mchk_header, int print)
 {
-    int status = MCHK_DISPOSITION_UNKNOWN_ERROR;
 #ifdef CONFIG_VERBOSE_MCHECK
     struct el_PRIVATEER_envdata_mcheck *emchk =
         (struct el_PRIVATEER_envdata_mcheck *)
@@ -598,7 +597,7 @@ privateer_process_680_frame(struct el_common *mchk_header, int print)
     /* TODO - categorize errors, for now, no error */
 
     if (!print)
-        return status;
+        return MCHK_DISPOSITION_UNKNOWN_ERROR;
 
     /* TODO - decode instead of just dumping... */
     printk("%s  Summary Flags:         %016llx\n"
@@ -624,7 +623,7 @@ privateer_process_680_frame(struct el_common *mchk_header, int print)
            emchk->code);
 #endif /* CONFIG_VERBOSE_MCHECK */
 
-    return status;
+    return MCHK_DISPOSITION_UNKNOWN_ERROR;
 }
 
 int
-- 
2.25.1

