From: Changbin Du <changbin.du@gmail.com>
Subject: [PATCH] alpha: in_irq() cleanup
Date: Sat, 14 Aug 2021 09:01:03 +0800
Message-ID: <20210814010103.3929-1-changbin.du@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o8WfKmwINea2dak8eWcmeq5nymhBz5xQuf8CqG8OJr4=;
        b=sme3zgAmzQduFkzUo7E7f5eQZMJa3fnQrOektKNNlG3qHZyjx+gugUTEvhxDweudgc
         Xrn1f/qVwH1SZ6EHgp5YzIM/GA4q1A/Xh8MTzcyQqO3k/kTHeIHGgLMEZn0rWPP3r1ZS
         S0X02Og4zzGF62aWtQGVrS9J/VHGBVYyRIyeNHbwrFVO1NhuDge1QU4aYsAlT2xf/Pln
         qV218p69LURe2muWVW3NuOYDZnA3MB8i8Qp1fMFiRmfh/yXdhDkeRYJg/bdS/vAEkwV9
         k7wYRHRnOo9gnRAUDlY2GIF8PWhbfLZm7UJ56YFC/QPSwRzmjNAaeerPAIQlWCcivAy1
         JwRA==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Changbin Du <changbin.du@gmail.com>

Replace the obsolete and ambiguos macro in_irq() with new
macro in_hardirq().

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 arch/alpha/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index a5123ea426ce..a524de9f1c98 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -134,7 +134,7 @@ common_shutdown_1(void *generic_ptr)
 #ifdef CONFIG_DUMMY_CONSOLE
 		/* If we've gotten here after SysRq-b, leave interrupt
 		   context before taking over the console. */
-		if (in_irq())
+		if (in_hardirq())
 			irq_exit();
 		/* This has the effect of resetting the VGA video origin.  */
 		console_lock();
-- 
2.30.2

