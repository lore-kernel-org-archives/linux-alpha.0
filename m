From: Samuel Holland <samuel@sholland.org>
Subject: [PATCH v3 3/8] genirq: GENERIC_IRQ_EFFECTIVE_AFF_MASK depends on SMP
Date: Fri,  1 Jul 2022 15:00:51 -0500
Message-ID: <20220701200056.46555-4-samuel@sholland.org>
References: <20220701200056.46555-1-samuel@sholland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1656705696; x=1656712896; bh=D0
        9F9v2OsTHtUMBckCisA3fh+Z9dxIk2ZgixoBozn6s=; b=ewPaKoSkHX2BJXiLrX
        5+oSIjybcWAklW5wxV0V+2224R1S5aSbhX/ZumtO+pevNUEajJ4W+xkdb1xobtmO
        5XYTY4EQgS3vI31X9KpJqpcSStss2CBfMnsdLsoEi24/QiILGCKcwtKmT3IHTl3M
        Mv1Py5jjNaGrcKT545FKqrpJreT45hH04ngq4b9+jLCXhOz/SJLgVou/odMMcxHf
        jE7L5Oa7EAAx5jIAr6O1i4neJfVW0AS/PUT6wWsmA07a/DS+FN2RC5D0zeLTTFHO
        gxpbBrSPW1wLPGNr1k53E8cUdIxhDr0COGRwcsfZT5hqn7efH9ktohj1e3H0gw2y
        IDKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1656705696; x=1656712896; bh=D09F9v2OsTHtU
        MBckCisA3fh+Z9dxIk2ZgixoBozn6s=; b=TBQ5zmWoRj8elXqnGUzA7FTSfUjgW
        8okx2QN7XCl3ky8WadN5LKY6hzwdOfA9BJ0eXRmer/tFEiAUvbmU6wyJhpcSQZgj
        Rmt76VA2NSnO3ovcCIK5WjyW5TFWl9HMcuavVAdkHsJTygI2nPusqodgPFJV4ZxT
        L/edAsj355kbI6l/RzXXpdx9yUIvX2RXPv6ueqmRU44epIbZ+yjNJpk1CA53x/K2
        6amlSq383hivdloACmsNrkmMJ+PWpdATylN2kVPVACnX4rT6i/tvFuKDeoqp86hr
        Enu7oREUdbzL42YZLwjDCYWMY8dHPJjpHxLTP4IgdrwaIjKWoEmRjseFA==
In-Reply-To: <20220701200056.46555-1-samuel@sholland.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Samuel Holland <samuel@sholland.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chris Zankel <chris@zankel.net>, Colin Ian King <colin.king@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Dexuan Cui <decui@microsoft.com>, Florian Fainelli <f.fainelli@gmail.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Haiyang Zhang <haiyangz@microsoft.com>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "James E.J. Bottomley" <James.Bottomley@HansenP>

An IRQ's effective affinity can only be different from its configured
affinity if there are multiple CPUs. Make it clear that this option is
only meaningful when SMP is enabled. Most of the relevant code in
irqdesc.c is already hidden behind CONFIG_SMP anyway.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 arch/arm/mach-hisi/Kconfig |  2 +-
 drivers/irqchip/Kconfig    | 14 +++++++-------
 kernel/irq/Kconfig         |  1 +
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-hisi/Kconfig b/arch/arm/mach-hisi/Kconfig
index 75cccbd3f05f..7b3440687176 100644
--- a/arch/arm/mach-hisi/Kconfig
+++ b/arch/arm/mach-hisi/Kconfig
@@ -40,7 +40,7 @@ config ARCH_HIP04
 	select HAVE_ARM_ARCH_TIMER
 	select MCPM if SMP
 	select MCPM_QUAD_CLUSTER if SMP
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 	help
 	  Support for Hisilicon HiP04 SoC family
 
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 5dd98a81efc8..462adac905a6 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -8,7 +8,7 @@ config IRQCHIP
 config ARM_GIC
 	bool
 	select IRQ_DOMAIN_HIERARCHY
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
 config ARM_GIC_PM
 	bool
@@ -34,7 +34,7 @@ config ARM_GIC_V3
 	bool
 	select IRQ_DOMAIN_HIERARCHY
 	select PARTITION_PERCPU
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
 config ARM_GIC_V3_ITS
 	bool
@@ -76,7 +76,7 @@ config ARMADA_370_XP_IRQ
 	bool
 	select GENERIC_IRQ_CHIP
 	select PCI_MSI if PCI
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
 config ALPINE_MSI
 	bool
@@ -112,7 +112,7 @@ config BCM6345_L1_IRQ
 	bool
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
 config BCM7038_L1_IRQ
 	tristate "Broadcom STB 7038-style L1/L2 interrupt controller driver"
@@ -120,7 +120,7 @@ config BCM7038_L1_IRQ
 	default ARCH_BRCMSTB || BMIPS_GENERIC
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
 config BCM7120_L2_IRQ
 	tristate "Broadcom STB 7120-style L2 interrupt controller driver"
@@ -179,7 +179,7 @@ config IRQ_MIPS_CPU
 	select GENERIC_IRQ_CHIP
 	select GENERIC_IRQ_IPI if SMP && SYS_SUPPORTS_MULTITHREADING
 	select IRQ_DOMAIN
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
 config CLPS711X_IRQCHIP
 	bool
@@ -294,7 +294,7 @@ config VERSATILE_FPGA_IRQ_NR
 config XTENSA_MX
 	bool
 	select IRQ_DOMAIN
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
 config XILINX_INTC
 	bool "Xilinx Interrupt Controller IP"
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index fc760d064a65..db3d174c53d4 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -24,6 +24,7 @@ config GENERIC_IRQ_SHOW_LEVEL
 
 # Supports effective affinity mask
 config GENERIC_IRQ_EFFECTIVE_AFF_MASK
+       depends on SMP
        bool
 
 # Support for delayed migration from interrupt context
-- 
2.35.1

