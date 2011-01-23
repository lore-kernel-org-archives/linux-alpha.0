From: "Morten Holst Larsen" <m-larsen@post6.tele.dk>
Subject: [PATCH] Remove unused function marvel_irq_noop_return()
Date: Sun, 23 Jan 2011 13:44:25 +0100
Message-ID: <38683FAC43C6446A93B96668D2228010@morten>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-alpha@vger.kernel.org
Cc: Matt Turner <mattst88@gmail.com>

Remove unused function marvel_irq_noop_return()

Signed-off-by: Morten H. Larsen <m-larsen@post6.tele.dk>

index 2bfc9f1..5514dad 100644
--- a/arch/alpha/kernel/sys_marvel.c
+++ b/arch/alpha/kernel/sys_marvel.c
@@ -149,12 +149,6 @@ marvel_irq_noop(unsigned int irq)
        return;
 }

-static unsigned int
-marvel_irq_noop_return(unsigned int irq)
-{
-       return 0;
-}
-
 static struct irq_chip marvel_legacy_irq_type = {
        .name           = "LEGACY",
        .mask           = marvel_irq_noop,
--
1.7.1

