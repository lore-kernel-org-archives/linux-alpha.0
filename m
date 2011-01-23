From: "Morten Holst Larsen" <m-larsen@post6.tele.dk>
Subject: [PATCH] Fix typo in call to irq_to_desc()
Date: Sun, 23 Jan 2011 13:40:47 +0100
Message-ID: <F49BAFD32B8946B3B60EB150F23CE224@morten>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-alpha@vger.kernel.org
Cc: Matt Turner <mattst88@gmail.com>

Fix typo in call to irq_to_desc()

Signed-off-by: Morten H. Larsen <m-larsen@post6.tele.dk>

diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
index 9ab234f..d3e20c7 100644
--- a/arch/alpha/kernel/irq.c
+++ b/arch/alpha/kernel/irq.c
@@ -44,7 +44,7 @@ static char irq_user_affinity[NR_IRQS];

 int irq_select_affinity(unsigned int irq)
 {
-       struct irq_desc *desc = irq_to_desc[irq];
+       struct irq_desc *desc = irq_to_desc(irq);
        static int last_cpu;
        int cpu = last_cpu + 1;

--
1.7.1

