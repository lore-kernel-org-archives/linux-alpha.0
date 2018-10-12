From: Meelis Roos <mroos@linux.ee>
Subject: [PATCH] [alpha] Fix Eiger NR_IRQS to 128
Date: Fri, 12 Oct 2018 12:27:51 +0300
Message-ID: <9f5588f8-60e4-55e2-1a38-1dc1155a4eab@linux.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: et-EE
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

Eiger machine vector definition has nr_irqs 128, and working 2.6.26
boot shows SCSI getting IRQ-s 64 and 65. Current kernel boot fails
because Symbios SCSI fails to request IRQ-s and does not find the disks.
It has been broken at least since 3.18 - the earliest I could test with
my gcc-5.

The headers have moved around and possibly another order of defines has
worked in the past - but since 128 seems to be correct and used, fix
arch/alpha/include/asm/irq.h to have NR_IRQS=128 for Eiger.

This fixes 4.19-rc7 boot on my Force Flexor A264 (Eiger subarch).

Signed-off-by: Meelis Roos <mroos@linux.ee>

---
  arch/alpha/include/asm/irq.h | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/irq.h b/arch/alpha/include/asm/irq.h
index 4d17cacd1462..5681ccc3cf63 100644
--- a/arch/alpha/include/asm/irq.h
+++ b/arch/alpha/include/asm/irq.h
@@ -56,15 +56,15 @@
  
  #elif defined(CONFIG_ALPHA_DP264) || \
        defined(CONFIG_ALPHA_LYNX)  || \
-      defined(CONFIG_ALPHA_SHARK) || \
-      defined(CONFIG_ALPHA_EIGER)
+      defined(CONFIG_ALPHA_SHARK)
  # define NR_IRQS	64
  
  #elif defined(CONFIG_ALPHA_TITAN)
  #define NR_IRQS		80
  
  #elif defined(CONFIG_ALPHA_RAWHIDE) || \
-	defined(CONFIG_ALPHA_TAKARA)
+	defined(CONFIG_ALPHA_TAKARA) || \
+	defined(CONFIG_ALPHA_EIGER)
  # define NR_IRQS	128
  
  #elif defined(CONFIG_ALPHA_WILDFIRE)
-- 
2.19.1

