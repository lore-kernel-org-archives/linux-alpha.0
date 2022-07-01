From: Samuel Holland <samuel@sholland.org>
Subject: [PATCH v3 1/8] irqchip/mips-gic: Only register IPI domain when SMP is enabled
Date: Fri,  1 Jul 2022 15:00:49 -0500
Message-ID: <20220701200056.46555-2-samuel@sholland.org>
References: <20220701200056.46555-1-samuel@sholland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1656705682; x=1656712882; bh=1g
        Yq3VbEkPVty/pd1tEYQnVO1uU7x5LYLlMSe3zbDrE=; b=bdIu56u5NUcFW5hvaK
        2/laTWzN8GTHoYTAZXrQlwuGxUO/51vWxcPMTA2kgfltyNMsvcq9NazmXFT1M9hf
        Yy7nInyHLoEyitpTjDbv3GYoUVgLpWSo40ttAnfTRma7mvNYsPbG1mejs2Qgcb3t
        LbFItmmgx0ui1jMDv36Wq3t0B7zszJ1O7HYnTX+/01o0+2PoRscDY1WPAVAiDqzA
        lL8KiMkDxHJI+62Lumh+214ubp82KV2hgQ6WmN9StyO1UxZc5Jrl4uDo5CIcMf+v
        w3d+EflqLt3LJ6h3D97ccfd/v3Oe7fE6Pop4QYptsoopZcfNSmaoapHf/0dyMeat
        KJjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1656705682; x=1656712882; bh=1gYq3VbEkPVty
        /pd1tEYQnVO1uU7x5LYLlMSe3zbDrE=; b=IIGVa/3L4rIIDkpm5x9kJF4p4zPgE
        bekRQi2xgDfEmYrxPVdTUgxGIsZGgD0mmbIIymHEeJR6lUkDl7AgH4weEwbRvI39
        z+3v4BNWVNKOg4Y3UKxsTxHjzdvdNIGGn03gzsHuwPtkq11popiSb4aRYBnIvyaL
        L3pj53Cf9IJhHuC3KtMRhkQ9lEVDTzotxVI7nK9L+t1iY2zY5ZlKJF5XkZlzy1kW
        qRxbxA7qUT5pUcyoRZWtPspZfkyMkSc2u3lh/Z1BI0SuCIzlQIrm1Ogt1M9ktsDh
        yae+YwhKLB+1GibJY4Yhz0XeYPpHVyQA4KoXzDl26EyU2QNQe5gKGx26w==
In-Reply-To: <20220701200056.46555-1-samuel@sholland.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Samuel Holland <samuel@sholland.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chris Zankel <chris@zankel.net>, Colin Ian King <colin.king@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Dexuan Cui <decui@microsoft.com>, Florian Fainelli <f.fainelli@gmail.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Haiyang Zhang <haiyangz@microsoft.com>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "James E.J. Bottomley" <James.Bottomley@HansenP>

The MIPS GIC irqchip driver may be selected in a uniprocessor
configuration, but it unconditionally registers an IPI domain.

Limit the part of the driver dealing with IPIs to only be compiled when
GENERIC_IRQ_IPI is enabled, which corresponds to an SMP configuration.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v3:
 - New patch to fix build errors in uniprocessor MIPS configs

 drivers/irqchip/Kconfig        |  3 +-
 drivers/irqchip/irq-mips-gic.c | 80 +++++++++++++++++++++++-----------
 2 files changed, 56 insertions(+), 27 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 1f23a6be7d88..d26a4ff7c99f 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -322,7 +322,8 @@ config KEYSTONE_IRQ
 
 config MIPS_GIC
 	bool
-	select GENERIC_IRQ_IPI
+	select GENERIC_IRQ_IPI if SMP
+	select IRQ_DOMAIN_HIERARCHY
 	select MIPS_CM
 
 config INGENIC_IRQ
diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index ff89b36267dd..8a9efb6ae587 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -52,13 +52,15 @@ static DEFINE_PER_CPU_READ_MOSTLY(unsigned long[GIC_MAX_LONGS], pcpu_masks);
 
 static DEFINE_SPINLOCK(gic_lock);
 static struct irq_domain *gic_irq_domain;
-static struct irq_domain *gic_ipi_domain;
 static int gic_shared_intrs;
 static unsigned int gic_cpu_pin;
 static unsigned int timer_cpu_pin;
 static struct irq_chip gic_level_irq_controller, gic_edge_irq_controller;
+
+#ifdef CONFIG_GENERIC_IRQ_IPI
 static DECLARE_BITMAP(ipi_resrv, GIC_MAX_INTRS);
 static DECLARE_BITMAP(ipi_available, GIC_MAX_INTRS);
+#endif /* CONFIG_GENERIC_IRQ_IPI */
 
 static struct gic_all_vpes_chip_data {
 	u32	map;
@@ -472,9 +474,11 @@ static int gic_irq_domain_map(struct irq_domain *d, unsigned int virq,
 	u32 map;
 
 	if (hwirq >= GIC_SHARED_HWIRQ_BASE) {
+#ifdef CONFIG_GENERIC_IRQ_IPI
 		/* verify that shared irqs don't conflict with an IPI irq */
 		if (test_bit(GIC_HWIRQ_TO_SHARED(hwirq), ipi_resrv))
 			return -EBUSY;
+#endif /* CONFIG_GENERIC_IRQ_IPI */
 
 		err = irq_domain_set_hwirq_and_chip(d, virq, hwirq,
 						    &gic_level_irq_controller,
@@ -567,6 +571,8 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
 	.map = gic_irq_domain_map,
 };
 
+#ifdef CONFIG_GENERIC_IRQ_IPI
+
 static int gic_ipi_domain_xlate(struct irq_domain *d, struct device_node *ctrlr,
 				const u32 *intspec, unsigned int intsize,
 				irq_hw_number_t *out_hwirq,
@@ -670,6 +676,48 @@ static const struct irq_domain_ops gic_ipi_domain_ops = {
 	.match = gic_ipi_domain_match,
 };
 
+static int gic_register_ipi_domain(struct device_node *node)
+{
+	struct irq_domain *gic_ipi_domain;
+	unsigned int v[2], num_ipis;
+
+	gic_ipi_domain = irq_domain_add_hierarchy(gic_irq_domain,
+						  IRQ_DOMAIN_FLAG_IPI_PER_CPU,
+						  GIC_NUM_LOCAL_INTRS + gic_shared_intrs,
+						  node, &gic_ipi_domain_ops, NULL);
+	if (!gic_ipi_domain) {
+		pr_err("Failed to add IPI domain");
+		return -ENXIO;
+	}
+
+	irq_domain_update_bus_token(gic_ipi_domain, DOMAIN_BUS_IPI);
+
+	if (node &&
+	    !of_property_read_u32_array(node, "mti,reserved-ipi-vectors", v, 2)) {
+		bitmap_set(ipi_resrv, v[0], v[1]);
+	} else {
+		/*
+		 * Reserve 2 interrupts per possible CPU/VP for use as IPIs,
+		 * meeting the requirements of arch/mips SMP.
+		 */
+		num_ipis = 2 * num_possible_cpus();
+		bitmap_set(ipi_resrv, gic_shared_intrs - num_ipis, num_ipis);
+	}
+
+	bitmap_copy(ipi_available, ipi_resrv, GIC_MAX_INTRS);
+
+	return 0;
+}
+
+#else /* !CONFIG_GENERIC_IRQ_IPI */
+
+static inline int gic_register_ipi_domain(struct device_node *node)
+{
+	return 0;
+}
+
+#endif /* !CONFIG_GENERIC_IRQ_IPI */
+
 static int gic_cpu_startup(unsigned int cpu)
 {
 	/* Enable or disable EIC */
@@ -688,11 +736,12 @@ static int gic_cpu_startup(unsigned int cpu)
 static int __init gic_of_init(struct device_node *node,
 			      struct device_node *parent)
 {
-	unsigned int cpu_vec, i, gicconfig, v[2], num_ipis;
+	unsigned int cpu_vec, i, gicconfig;
 	unsigned long reserved;
 	phys_addr_t gic_base;
 	struct resource res;
 	size_t gic_len;
+	int ret;
 
 	/* Find the first available CPU vector. */
 	i = 0;
@@ -780,30 +829,9 @@ static int __init gic_of_init(struct device_node *node,
 		return -ENXIO;
 	}
 
-	gic_ipi_domain = irq_domain_add_hierarchy(gic_irq_domain,
-						  IRQ_DOMAIN_FLAG_IPI_PER_CPU,
-						  GIC_NUM_LOCAL_INTRS + gic_shared_intrs,
-						  node, &gic_ipi_domain_ops, NULL);
-	if (!gic_ipi_domain) {
-		pr_err("Failed to add IPI domain");
-		return -ENXIO;
-	}
-
-	irq_domain_update_bus_token(gic_ipi_domain, DOMAIN_BUS_IPI);
-
-	if (node &&
-	    !of_property_read_u32_array(node, "mti,reserved-ipi-vectors", v, 2)) {
-		bitmap_set(ipi_resrv, v[0], v[1]);
-	} else {
-		/*
-		 * Reserve 2 interrupts per possible CPU/VP for use as IPIs,
-		 * meeting the requirements of arch/mips SMP.
-		 */
-		num_ipis = 2 * num_possible_cpus();
-		bitmap_set(ipi_resrv, gic_shared_intrs - num_ipis, num_ipis);
-	}
-
-	bitmap_copy(ipi_available, ipi_resrv, GIC_MAX_INTRS);
+	ret = gic_register_ipi_domain(node);
+	if (ret)
+		return ret;
 
 	board_bind_eic_interrupt = &gic_bind_eic_interrupt;
 
-- 
2.35.1

