From: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 6/8] genirq: Add and use an irq_data_update_affinity helper
Date: Fri,  1 Jul 2022 15:00:54 -0500
Message-ID: <20220701200056.46555-7-samuel@sholland.org>
References: <20220701200056.46555-1-samuel@sholland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F53860FB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD68C607D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4C9184145
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D07CA84143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1656705710; x=1656712910; bh=GP
 TgF7ArqFMLRWCMzAXk/iblC7hZOhNlz+8yGyXcVmI=; b=QpxRZ/QqCKAaTufwyd
 lUjoM1KJpo2vAxdEuEjb/waTg16dZR9eragrRhhtwxuPLt0ECneX3zy6CNzBBx5c
 Ygb4PPzfUzDV5VvtfKPQBAj8iCK8i+A3N0IvHHfLXEkCFny82EoJbTgg4N7U1bwk
 TgxvTxE3rNtOE/fFih1K1eJ8kHseL1OspFJFfo5CJ04JSj1DGPwQ6FHwv0IhNoq4
 EGKiBH64+38GGFPCSypyrkvUHdkYQuk9s/BixzzRoak4pO7Ob+kyqg83h69D4GAa
 h3rUBxATwnOMT09jx3nmAk3wW/b1biR06qzg7OZv2+rzhWJ7Rr/DFMBhHTnlVHau
 I+8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656705710; x=1656712910; bh=GPTgF7ArqFMLR
 WCMzAXk/iblC7hZOhNlz+8yGyXcVmI=; b=bZV6JNZNCNgrHjWghrR9O98nWKlYN
 DX/X53ob25+i0NwhRNBQiBLDVz6UVV3he1PXha4QFwp5yMwGnxpB7lu/UEE8Xi3o
 OpXqvhbTbTBs7KDOhb4KUllG3Pk9Aa1vRSyBe3BCvgnGtLlZf/oqGEk+Jnl3BG85
 OJ3xW7PAvFO/MhjF/+sAERp5XAdEzU4Ff5xnJ4prZbZoQYpU1kHRmjt2+C7DkY3Y
 SuzrsxXUNapv8zup6IGTgy0/s8A+vKX+TshcO/FgHArWEelqqro6tFdd578sYzkL
 51oiHdOk0YWBV5old0Q464FJ20N+qIDsdwwqcQx1JwG+SPenzYypJolkw==
In-Reply-To: <20220701200056.46555-1-samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Marc Zyngier <maz-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Hansen <dave.hansen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "James E.J. Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Beulich <jbeulich-IBi9RG/b67k@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, "K. Y. Srinivasan" <kys-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>, Sven Schnelle <svens-yWSVVCS59A8YeIxN5WHPnw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wei Liu <wei.liu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Hemminger <sthemmin-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>, Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>, Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <brgl@bgde>

Some architectures and irqchip drivers modify the cpumask returned by
irq_data_get_affinity_mask, usually by copying in to it. This is
problematic for uniprocessor configurations, where the affinity mask
should be constant, as it is known at compile time.

Add and use a setter for the affinity mask, following the pattern of
irq_data_update_effective_affinity. This allows the getter function to
return a const cpumask pointer.

Signed-off-by: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
---

Changes in v3:
 - New patch to introduce irq_data_update_affinity

 arch/alpha/kernel/irq.c          | 2 +-
 arch/ia64/kernel/iosapic.c       | 2 +-
 arch/ia64/kernel/irq.c           | 4 ++--
 arch/ia64/kernel/msi_ia64.c      | 4 ++--
 arch/parisc/kernel/irq.c         | 2 +-
 drivers/irqchip/irq-bcm6345-l1.c | 4 ++--
 drivers/parisc/iosapic.c         | 2 +-
 drivers/sh/intc/chip.c           | 2 +-
 drivers/xen/events/events_base.c | 7 ++++---
 include/linux/irq.h              | 6 ++++++
 10 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
index f6d2946edbd2..15f2effd6baf 100644
--- a/arch/alpha/kernel/irq.c
+++ b/arch/alpha/kernel/irq.c
@@ -60,7 +60,7 @@ int irq_select_affinity(unsigned int irq)
 		cpu = (cpu < (NR_CPUS-1) ? cpu + 1 : 0);
 	last_cpu = cpu;
 
-	cpumask_copy(irq_data_get_affinity_mask(data), cpumask_of(cpu));
+	irq_data_update_affinity(data, cpumask_of(cpu));
 	chip->irq_set_affinity(data, cpumask_of(cpu), false);
 	return 0;
 }
diff --git a/arch/ia64/kernel/iosapic.c b/arch/ia64/kernel/iosapic.c
index 35adcf89035a..99300850abc1 100644
--- a/arch/ia64/kernel/iosapic.c
+++ b/arch/ia64/kernel/iosapic.c
@@ -834,7 +834,7 @@ iosapic_unregister_intr (unsigned int gsi)
 	if (iosapic_intr_info[irq].count == 0) {
 #ifdef CONFIG_SMP
 		/* Clear affinity */
-		cpumask_setall(irq_get_affinity_mask(irq));
+		irq_data_update_affinity(irq_get_irq_data(irq), cpu_all_mask);
 #endif
 		/* Clear the interrupt information */
 		iosapic_intr_info[irq].dest = 0;
diff --git a/arch/ia64/kernel/irq.c b/arch/ia64/kernel/irq.c
index ecef17c7c35b..275b9ea58c64 100644
--- a/arch/ia64/kernel/irq.c
+++ b/arch/ia64/kernel/irq.c
@@ -57,8 +57,8 @@ static char irq_redir [NR_IRQS]; // = { [0 ... NR_IRQS-1] = 1 };
 void set_irq_affinity_info (unsigned int irq, int hwid, int redir)
 {
 	if (irq < NR_IRQS) {
-		cpumask_copy(irq_get_affinity_mask(irq),
-			     cpumask_of(cpu_logical_id(hwid)));
+		irq_data_update_affinity(irq_get_irq_data(irq),
+					 cpumask_of(cpu_logical_id(hwid)));
 		irq_redir[irq] = (char) (redir & 0xff);
 	}
 }
diff --git a/arch/ia64/kernel/msi_ia64.c b/arch/ia64/kernel/msi_ia64.c
index df5c28f252e3..025e5133c860 100644
--- a/arch/ia64/kernel/msi_ia64.c
+++ b/arch/ia64/kernel/msi_ia64.c
@@ -37,7 +37,7 @@ static int ia64_set_msi_irq_affinity(struct irq_data *idata,
 	msg.data = data;
 
 	pci_write_msi_msg(irq, &msg);
-	cpumask_copy(irq_data_get_affinity_mask(idata), cpumask_of(cpu));
+	irq_data_update_affinity(idata, cpumask_of(cpu));
 
 	return 0;
 }
@@ -132,7 +132,7 @@ static int dmar_msi_set_affinity(struct irq_data *data,
 	msg.address_lo |= MSI_ADDR_DEST_ID_CPU(cpu_physical_id(cpu));
 
 	dmar_msi_write(irq, &msg);
-	cpumask_copy(irq_data_get_affinity_mask(data), mask);
+	irq_data_update_affinity(data, mask);
 
 	return 0;
 }
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 0fe2d79fb123..5ebb1771b4ab 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -315,7 +315,7 @@ unsigned long txn_affinity_addr(unsigned int irq, int cpu)
 {
 #ifdef CONFIG_SMP
 	struct irq_data *d = irq_get_irq_data(irq);
-	cpumask_copy(irq_data_get_affinity_mask(d), cpumask_of(cpu));
+	irq_data_update_affinity(d, cpumask_of(cpu));
 #endif
 
 	return per_cpu(cpu_data, cpu).txn_addr;
diff --git a/drivers/irqchip/irq-bcm6345-l1.c b/drivers/irqchip/irq-bcm6345-l1.c
index 142a7431745f..6899e37810a8 100644
--- a/drivers/irqchip/irq-bcm6345-l1.c
+++ b/drivers/irqchip/irq-bcm6345-l1.c
@@ -216,11 +216,11 @@ static int bcm6345_l1_set_affinity(struct irq_data *d,
 		enabled = intc->cpus[old_cpu]->enable_cache[word] & mask;
 		if (enabled)
 			__bcm6345_l1_mask(d);
-		cpumask_copy(irq_data_get_affinity_mask(d), dest);
+		irq_data_update_affinity(d, dest);
 		if (enabled)
 			__bcm6345_l1_unmask(d);
 	} else {
-		cpumask_copy(irq_data_get_affinity_mask(d), dest);
+		irq_data_update_affinity(d, dest);
 	}
 	raw_spin_unlock_irqrestore(&intc->lock, flags);
 
diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
index 8a3b0c3a1e92..3a8c98615634 100644
--- a/drivers/parisc/iosapic.c
+++ b/drivers/parisc/iosapic.c
@@ -677,7 +677,7 @@ static int iosapic_set_affinity_irq(struct irq_data *d,
 	if (dest_cpu < 0)
 		return -1;
 
-	cpumask_copy(irq_data_get_affinity_mask(d), cpumask_of(dest_cpu));
+	irq_data_update_affinity(d, cpumask_of(dest_cpu));
 	vi->txn_addr = txn_affinity_addr(d->irq, dest_cpu);
 
 	spin_lock_irqsave(&iosapic_lock, flags);
diff --git a/drivers/sh/intc/chip.c b/drivers/sh/intc/chip.c
index 358df7510186..828d81e02b37 100644
--- a/drivers/sh/intc/chip.c
+++ b/drivers/sh/intc/chip.c
@@ -72,7 +72,7 @@ static int intc_set_affinity(struct irq_data *data,
 	if (!cpumask_intersects(cpumask, cpu_online_mask))
 		return -1;
 
-	cpumask_copy(irq_data_get_affinity_mask(data), cpumask);
+	irq_data_update_affinity(data, cpumask);
 
 	return IRQ_SET_MASK_OK_NOCOPY;
 }
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 46d9295d9a6e..5e8321f43cbd 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -528,9 +528,10 @@ static void bind_evtchn_to_cpu(evtchn_port_t evtchn, unsigned int cpu,
 	BUG_ON(irq == -1);
 
 	if (IS_ENABLED(CONFIG_SMP) && force_affinity) {
-		cpumask_copy(irq_get_affinity_mask(irq), cpumask_of(cpu));
-		cpumask_copy(irq_get_effective_affinity_mask(irq),
-			     cpumask_of(cpu));
+		struct irq_data *data = irq_get_irq_data(irq);
+
+		irq_data_update_affinity(data, cpumask_of(cpu));
+		irq_data_update_effective_affinity(data, cpumask_of(cpu));
 	}
 
 	xen_evtchn_port_bind_to_cpu(evtchn, cpu, info->cpu);
diff --git a/include/linux/irq.h b/include/linux/irq.h
index 69ee4e2f36ce..adcfebceb777 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -884,6 +884,12 @@ static inline struct cpumask *irq_data_get_affinity_mask(struct irq_data *d)
 	return d->common->affinity;
 }
 
+static inline void irq_data_update_affinity(struct irq_data *d,
+					    const struct cpumask *m)
+{
+	cpumask_copy(d->common->affinity, m);
+}
+
 static inline struct cpumask *irq_get_affinity_mask(int irq)
 {
 	struct irq_data *d = irq_get_irq_data(irq);
-- 
2.35.1
