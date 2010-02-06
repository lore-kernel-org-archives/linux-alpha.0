From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 01/16] alpha: remove trailing spaces in messages
Date: Sat,  6 Feb 2010 18:47:08 +0100
Message-ID: <1265478443-31072-1-git-send-email-elendil@planet.nl>
References: <201002061844.45212.elendil@planet.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201002061844.45212.elendil@planet.nl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Frans Pop <elendil@planet.nl>, linux-alpha@vger.kernel.org

Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: linux-alpha@vger.kernel.org
---
 arch/alpha/kernel/sys_dp264.c |    2 +-
 arch/alpha/kernel/sys_titan.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/sys_dp264.c b/arch/alpha/kernel/sys_dp264.c
index d64e1e4..4026502 100644
--- a/arch/alpha/kernel/sys_dp264.c
+++ b/arch/alpha/kernel/sys_dp264.c
@@ -224,7 +224,7 @@ static void
 dp264_device_interrupt(unsigned long vector)
 {
 #if 1
-	printk("dp264_device_interrupt: NOT IMPLEMENTED YET!! \n");
+	printk("dp264_device_interrupt: NOT IMPLEMENTED YET!!\n");
 #else
 	unsigned long pld;
 	unsigned int i;
diff --git a/arch/alpha/kernel/sys_titan.c b/arch/alpha/kernel/sys_titan.c
index 2880533..9008d0f 100644
--- a/arch/alpha/kernel/sys_titan.c
+++ b/arch/alpha/kernel/sys_titan.c
@@ -171,7 +171,7 @@ titan_set_irq_affinity(unsigned int irq, const struct cpumask *affinity)
 static void
 titan_device_interrupt(unsigned long vector)
 {
-	printk("titan_device_interrupt: NOT IMPLEMENTED YET!! \n");
+	printk("titan_device_interrupt: NOT IMPLEMENTED YET!!\n");
 }
 
 static void 
-- 
1.6.6.1
