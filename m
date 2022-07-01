From: Samuel Holland <samuel@sholland.org>
Subject: [PATCH v3 2/8] genirq: GENERIC_IRQ_IPI depends on SMP
Date: Fri,  1 Jul 2022 15:00:50 -0500
Message-ID: <20220701200056.46555-3-samuel@sholland.org>
References: <20220701200056.46555-1-samuel@sholland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1656705689; x=1656712889; bh=f2
        gTOnVVlawVp6N5bLg8smmhsDaH+rFeOulG3ok0Jrc=; b=S00usAZDc/YM64VNCn
        FjrEnQNeYOIV4LNXFxrNe+DvmbJ1spyaNknAlkMKCOYdB8xZAB6BY9sx7dI8cRwD
        aNrKuvCkIxj/PKyZRFpy+snzjxdT/wGYVUKvGizh4ybfVco0jpNkt9KuqI3lODmv
        VgMOfXezM/xbArBQvHUjLN61LUq2x7L0hMa6QJigRe0ReXc8M/xo9kR71pvG5fav
        zb0DMcwbxYzRwjHctt2+SKmtMgzgd0yTB8uENd3D0VqTECGgquIpAjLlEagHYC3j
        iGuAmAltKJ2/jWPPQ1vs09gP9bynvMqw+WFPrd9CKAWkKbcNwG53wW45gJRugpgB
        7etg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1656705689; x=1656712889; bh=f2gTOnVVlawVp
        6N5bLg8smmhsDaH+rFeOulG3ok0Jrc=; b=p8dJ+iBG+yyKxcHv8Ird4QI+8K5e2
        deriiVPbLfaAp7jH0aTFXbKRlCyn1EkHQyKB2khg8+haSRMztqOCdPVXCF1Z0WCH
        XMZ2dC520GBYyCM3t4JRbY69RiaW08lpNIFhNE6+kx66gd+4fAfUbrwSyPs6mbPc
        nB4SQ4rjMwxLFceJ639l6X5Gnfabx0+YkFVX26GUHctAf/ClGo5S4UwBUh4m9yPh
        5lA0hUcpMSQycZcnZaO6J6XLkQxj0nrANK1+St4Vqj9eYNEZlQb3hS2C/cwKEL+5
        BILChd6I7vOuP7X0g3FgLvTGrvQkLzGX2qG9+nUpNgkqLUj+CVjSJhhdQ==
In-Reply-To: <20220701200056.46555-1-samuel@sholland.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Samuel Holland <samuel@sholland.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chris Zankel <chris@zankel.net>, Colin Ian King <colin.king@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Dexuan Cui <decui@microsoft.com>, Florian Fainelli <f.fainelli@gmail.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Haiyang Zhang <haiyangz@microsoft.com>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "James E.J. Bottomley" <James.Bottomley@HansenP>

The generic IPI code depends on the IRQ affinity mask being allocated
and initialized. This will not be the case if SMP is disabled. Fix up
the remaining driver that selected GENERIC_IRQ_IPI in a non-SMP config.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v2)

Changes in v2:
 - New patch to prevent GENERIC_IRQ_IPI from being selected on !SMP

 drivers/irqchip/Kconfig | 2 +-
 kernel/irq/Kconfig      | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index d26a4ff7c99f..5dd98a81efc8 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -177,7 +177,7 @@ config MADERA_IRQ
 config IRQ_MIPS_CPU
 	bool
 	select GENERIC_IRQ_CHIP
-	select GENERIC_IRQ_IPI if SYS_SUPPORTS_MULTITHREADING
+	select GENERIC_IRQ_IPI if SMP && SYS_SUPPORTS_MULTITHREADING
 	select IRQ_DOMAIN
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
 
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 10929eda9825..fc760d064a65 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -82,6 +82,7 @@ config IRQ_FASTEOI_HIERARCHY_HANDLERS
 # Generic IRQ IPI support
 config GENERIC_IRQ_IPI
 	bool
+	depends on SMP
 	select IRQ_DOMAIN_HIERARCHY
 
 # Generic MSI interrupt support
-- 
2.35.1

