From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/8] irqchip/mips-gic: Only register IPI domain when
 SMP is enabled
Date: Tue, 5 Jul 2022 16:52:43 +0300
Message-ID: <20220705135243.ydbwfo4kois64elr@mobilestation>
References: <20220701200056.46555-1-samuel@sholland.org>
 <20220701200056.46555-2-samuel@sholland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E78460A8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CE7460A8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 481E281B35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DEEC81AF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hnG3EXAGSYglCl/wRCeE6XoUd122X8s3VFjj/Cl4BDo=;
 b=f0oPNRCtup46ssQPcrkajodUnXaa38S7aucBwdDILFTG2eeb4ezSSagYCCpSaPXn6q
 pM88V+eJuR+2wDKnqOvmIn2UBQeLj4Dvk+jM/7QzsaH+djXUCf8dVdZrR3Rum0ZxA4Fx
 1+V5jQK4WZ6A6r+Z7pGJ3DHRh/l/I+n6TS11toC5D+NwQqpCXjbGQMtOFJd9gZJEVfoN
 8o6r4MmM6XpKVa4t/W7kzcEgwfUE3Y+OozwbzeYUm+9Cfc1rCiR8kyXeLGCPMRo+QW0N
 dWcQwNP8U6XumHQBe98yfaBeLuhKipyLuPvGkvNRoq32ZtcDVOLho4L9W1jGhun/Kcvn
 3uIA==
Content-Disposition: inline
In-Reply-To: <20220701200056.46555-2-samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
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
To: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>, Marc Zyngier <maz-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Hansen <dave.hansen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "James E.J. Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Beulich <jbeulich-IBi9RG/b67k@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, "K. Y. Srinivasan" <kys-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>, Sven Schnelle <svens-yWSVVCS59A8YeIxN5WHPnw@public.gmane.org>, Boris Ostrovsky <boris.ostrovsky-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wei Liu <wei.liu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Hemminger <sthemmin-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>, kernel test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>, Will Deacon <will@ker>

Hi Samuel

On Fri, Jul 01, 2022 at 03:00:49PM -0500, Samuel Holland wrote:
> The MIPS GIC irqchip driver may be selected in a uniprocessor
> configuration, but it unconditionally registers an IPI domain.
> 
> Limit the part of the driver dealing with IPIs to only be compiled when
> GENERIC_IRQ_IPI is enabled, which corresponds to an SMP configuration.

Thanks for the patch. Some comment is below.

> 
> Reported-by: kernel test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
> ---
> 
> Changes in v3:
>  - New patch to fix build errors in uniprocessor MIPS configs
> 
>  drivers/irqchip/Kconfig        |  3 +-
>  drivers/irqchip/irq-mips-gic.c | 80 +++++++++++++++++++++++-----------
>  2 files changed, 56 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 1f23a6be7d88..d26a4ff7c99f 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -322,7 +322,8 @@ config KEYSTONE_IRQ
>  
>  config MIPS_GIC
>  	bool
> -	select GENERIC_IRQ_IPI
> +	select GENERIC_IRQ_IPI if SMP

> +	select IRQ_DOMAIN_HIERARCHY

It seems to me that the IRQ domains hierarchy is supposed to be
created only if IPI is required. At least that's what the MIPS GIC
driver implies. Thus we can go further and CONFIG_IRQ_DOMAIN_HIERARCHY
ifdef-out the gic_irq_domain_alloc() and gic_irq_domain_free()
methods definition together with the initialization:

 static const struct irq_domain_ops gic_irq_domain_ops = {
 	.xlate = gic_irq_domain_xlate,
+#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
 	.alloc = gic_irq_domain_alloc,
 	.free = gic_irq_domain_free,
+#endif
 	.map = gic_irq_domain_map,
};

If the GENERIC_IRQ_IPI config is enabled, CONFIG_IRQ_DOMAIN_HIERARCHY
will be automatically selected (see the config definition in
kernel/irq/Kconfig). If the IRQs hierarchy is needed for some another
functionality like GENERIC_MSI_IRQ_DOMAIN or GPIOs then they will
explicitly enable the IRQ_DOMAIN_HIERARCHY config thus activating the
denoted .alloc and .free methods definitions.

To sum up you can get rid of the IRQ_DOMAIN_HIERARCHY config
force-select from this patch and make the MIPS GIC driver code a bit
more coherent.

@Marc, please correct me if were wrong.

-Serget

>  	select MIPS_CM
>  
>  config INGENIC_IRQ
> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
> index ff89b36267dd..8a9efb6ae587 100644
> --- a/drivers/irqchip/irq-mips-gic.c
> +++ b/drivers/irqchip/irq-mips-gic.c
> @@ -52,13 +52,15 @@ static DEFINE_PER_CPU_READ_MOSTLY(unsigned long[GIC_MAX_LONGS], pcpu_masks);
>  
>  static DEFINE_SPINLOCK(gic_lock);
>  static struct irq_domain *gic_irq_domain;
> -static struct irq_domain *gic_ipi_domain;
>  static int gic_shared_intrs;
>  static unsigned int gic_cpu_pin;
>  static unsigned int timer_cpu_pin;
>  static struct irq_chip gic_level_irq_controller, gic_edge_irq_controller;
> +
> +#ifdef CONFIG_GENERIC_IRQ_IPI
>  static DECLARE_BITMAP(ipi_resrv, GIC_MAX_INTRS);
>  static DECLARE_BITMAP(ipi_available, GIC_MAX_INTRS);
> +#endif /* CONFIG_GENERIC_IRQ_IPI */
>  
>  static struct gic_all_vpes_chip_data {
>  	u32	map;
> @@ -472,9 +474,11 @@ static int gic_irq_domain_map(struct irq_domain *d, unsigned int virq,
>  	u32 map;
>  
>  	if (hwirq >= GIC_SHARED_HWIRQ_BASE) {
> +#ifdef CONFIG_GENERIC_IRQ_IPI
>  		/* verify that shared irqs don't conflict with an IPI irq */
>  		if (test_bit(GIC_HWIRQ_TO_SHARED(hwirq), ipi_resrv))
>  			return -EBUSY;
> +#endif /* CONFIG_GENERIC_IRQ_IPI */
>  
>  		err = irq_domain_set_hwirq_and_chip(d, virq, hwirq,
>  						    &gic_level_irq_controller,
> @@ -567,6 +571,8 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
>  	.map = gic_irq_domain_map,
>  };
>  
> +#ifdef CONFIG_GENERIC_IRQ_IPI
> +
>  static int gic_ipi_domain_xlate(struct irq_domain *d, struct device_node *ctrlr,
>  				const u32 *intspec, unsigned int intsize,
>  				irq_hw_number_t *out_hwirq,
> @@ -670,6 +676,48 @@ static const struct irq_domain_ops gic_ipi_domain_ops = {
>  	.match = gic_ipi_domain_match,
>  };
>  
> +static int gic_register_ipi_domain(struct device_node *node)
> +{
> +	struct irq_domain *gic_ipi_domain;
> +	unsigned int v[2], num_ipis;
> +
> +	gic_ipi_domain = irq_domain_add_hierarchy(gic_irq_domain,
> +						  IRQ_DOMAIN_FLAG_IPI_PER_CPU,
> +						  GIC_NUM_LOCAL_INTRS + gic_shared_intrs,
> +						  node, &gic_ipi_domain_ops, NULL);
> +	if (!gic_ipi_domain) {
> +		pr_err("Failed to add IPI domain");
> +		return -ENXIO;
> +	}
> +
> +	irq_domain_update_bus_token(gic_ipi_domain, DOMAIN_BUS_IPI);
> +
> +	if (node &&
> +	    !of_property_read_u32_array(node, "mti,reserved-ipi-vectors", v, 2)) {
> +		bitmap_set(ipi_resrv, v[0], v[1]);
> +	} else {
> +		/*
> +		 * Reserve 2 interrupts per possible CPU/VP for use as IPIs,
> +		 * meeting the requirements of arch/mips SMP.
> +		 */
> +		num_ipis = 2 * num_possible_cpus();
> +		bitmap_set(ipi_resrv, gic_shared_intrs - num_ipis, num_ipis);
> +	}
> +
> +	bitmap_copy(ipi_available, ipi_resrv, GIC_MAX_INTRS);
> +
> +	return 0;
> +}
> +
> +#else /* !CONFIG_GENERIC_IRQ_IPI */
> +
> +static inline int gic_register_ipi_domain(struct device_node *node)
> +{
> +	return 0;
> +}
> +
> +#endif /* !CONFIG_GENERIC_IRQ_IPI */
> +
>  static int gic_cpu_startup(unsigned int cpu)
>  {
>  	/* Enable or disable EIC */
> @@ -688,11 +736,12 @@ static int gic_cpu_startup(unsigned int cpu)
>  static int __init gic_of_init(struct device_node *node,
>  			      struct device_node *parent)
>  {
> -	unsigned int cpu_vec, i, gicconfig, v[2], num_ipis;
> +	unsigned int cpu_vec, i, gicconfig;
>  	unsigned long reserved;
>  	phys_addr_t gic_base;
>  	struct resource res;
>  	size_t gic_len;
> +	int ret;
>  
>  	/* Find the first available CPU vector. */
>  	i = 0;
> @@ -780,30 +829,9 @@ static int __init gic_of_init(struct device_node *node,
>  		return -ENXIO;
>  	}
>  
> -	gic_ipi_domain = irq_domain_add_hierarchy(gic_irq_domain,
> -						  IRQ_DOMAIN_FLAG_IPI_PER_CPU,
> -						  GIC_NUM_LOCAL_INTRS + gic_shared_intrs,
> -						  node, &gic_ipi_domain_ops, NULL);
> -	if (!gic_ipi_domain) {
> -		pr_err("Failed to add IPI domain");
> -		return -ENXIO;
> -	}
> -
> -	irq_domain_update_bus_token(gic_ipi_domain, DOMAIN_BUS_IPI);
> -
> -	if (node &&
> -	    !of_property_read_u32_array(node, "mti,reserved-ipi-vectors", v, 2)) {
> -		bitmap_set(ipi_resrv, v[0], v[1]);
> -	} else {
> -		/*
> -		 * Reserve 2 interrupts per possible CPU/VP for use as IPIs,
> -		 * meeting the requirements of arch/mips SMP.
> -		 */
> -		num_ipis = 2 * num_possible_cpus();
> -		bitmap_set(ipi_resrv, gic_shared_intrs - num_ipis, num_ipis);
> -	}
> -
> -	bitmap_copy(ipi_available, ipi_resrv, GIC_MAX_INTRS);
> +	ret = gic_register_ipi_domain(node);
> +	if (ret)
> +		return ret;
>  
>  	board_bind_eic_interrupt = &gic_bind_eic_interrupt;
>  
> -- 
> 2.35.1
> 
