From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v4 05/30] PCI: Rename pci_scan_bus() to
 pci_scan_bus_legacy()
Date: Mon, 2 Mar 2015 20:06:07 -0600
Message-ID: <20150303020607.GD11978@google.com>
References: <1424938344-4017-1-git-send-email-wangyijing@huawei.com>
 <1424938344-4017-6-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=2GN5tgZck0QSrIIR+IwIwVyw97P7q5TxHlwlXJgbUpw=;
        b=OifAGxcRTjzKq11mPaR9myhgI0xtmyG0dLdrRwE4xgnw9wGasPSwNzFoBEQxkwp/uX
         soVZVWxiHqOfJpqsS2Kysvoa0PyoEiA6LBgKVUew5kq4iwAP9Elng0TPi7n4HmgUKnw3
         zoea4bkJKrxTGDiDia2b24Oa1giT6Tflp7cZ79u34LMlyIJ7LfVu6IycG2NjxeYOkqt/
         JAb1LoMnFuULDy6sm0HXys/GCc8lfV15U9uTyjKkdHHOeqwf5hytt5IT8v3pO0+58AHP
         K/jnRCID6Z+PfPyLdEiNR9tjEEBr4ZhFR29yYi4vqLYDw332Q6HArBOnqUr/7zVrZALw
         j1Ng==
Content-Disposition: inline
In-Reply-To: <1424938344-4017-6-git-send-email-wangyijing@huawei.com>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yijing Wang <wangyijing@huawei.com>
Cc: Jiang Liu <jiang.liu@linux.intel.com>, linux-pci@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rusty Russell <rusty@rustcorp.com.au>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Liviu Dudau <liviu@dudau.co.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>

On Thu, Feb 26, 2015 at 04:11:59PM +0800, Yijing Wang wrote:
> Pci_scan_bus() is called by legacy pci host drivers,
> the legacy host drivers mean they use NULL as parent
> device, use all IO/MEM as default resources. Rename
> pci_scan_bus() to pci_scan_bus_legacy() for better
> readability.

We should mention that this changes an exported symbol, because that's
potentially an issue for distros.

I'm not saying we can't change it, but I don't want to do it unless there's
real benefit.  I'm not convinced of the benefit yet, but maybe I will be by
the end of the series.

> Signed-off-by: Yijing Wang <wangyijing@huawei.com>
> ---
>  arch/alpha/kernel/sys_nautilus.c  |    2 +-
>  arch/m68k/coldfire/pci.c          |    2 +-
>  arch/sparc/kernel/pcic.c          |    2 +-
>  arch/unicore32/kernel/pci.c       |    2 +-
>  drivers/pci/hotplug/ibmphp_core.c |    2 +-
>  drivers/pci/probe.c               |    4 ++--
>  include/linux/pci.h               |    2 +-
>  7 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/alpha/kernel/sys_nautilus.c b/arch/alpha/kernel/sys_nautilus.c
> index 4ae4a40..2c864bb 100644
> --- a/arch/alpha/kernel/sys_nautilus.c
> +++ b/arch/alpha/kernel/sys_nautilus.c
> @@ -206,7 +206,7 @@ nautilus_init_pci(void)
>  	unsigned long memtop = max_low_pfn << PAGE_SHIFT;
>  
>  	/* Scan our single hose.  */
> -	bus = pci_scan_bus(0, alpha_mv.pci_ops, hose);
> +	bus = pci_scan_bus_legacy(0, alpha_mv.pci_ops, hose);
>  	hose->bus = bus;
>  	pcibios_claim_one_bus(bus);
>  
> diff --git a/arch/m68k/coldfire/pci.c b/arch/m68k/coldfire/pci.c
> index d45f087..0ef4dd4 100644
> --- a/arch/m68k/coldfire/pci.c
> +++ b/arch/m68k/coldfire/pci.c
> @@ -312,7 +312,7 @@ static int __init mcf_pci_init(void)
>  	set_current_state(TASK_UNINTERRUPTIBLE);
>  	schedule_timeout(msecs_to_jiffies(200));
>  
> -	rootbus = pci_scan_bus(0, &mcf_pci_ops, NULL);
> +	rootbus = pci_scan_bus_legacy(0, &mcf_pci_ops, NULL);
>  	rootbus->resource[0] = &mcf_pci_io;
>  	rootbus->resource[1] = &mcf_pci_mem;
>  
> diff --git a/arch/sparc/kernel/pcic.c b/arch/sparc/kernel/pcic.c
> index 7a82fe2..f7edc97 100644
> --- a/arch/sparc/kernel/pcic.c
> +++ b/arch/sparc/kernel/pcic.c
> @@ -390,7 +390,7 @@ static void __init pcic_pbm_scan_bus(struct linux_pcic *pcic)
>  {
>  	struct linux_pbm_info *pbm = &pcic->pbm;
>  
> -	pbm->pci_bus = pci_scan_bus(pbm->pci_first_busno, &pcic_ops, pbm);
> +	pbm->pci_bus = pci_scan_bus_legacy(pbm->pci_first_busno, &pcic_ops, pbm);
>  	if (pbm->pci_bus)
>  		pci_bus_add_devices(pbm->pci_bus);
>  #if 0 /* deadwood transplanted from sparc64 */
> diff --git a/arch/unicore32/kernel/pci.c b/arch/unicore32/kernel/pci.c
> index 3d82024..2e238b4 100644
> --- a/arch/unicore32/kernel/pci.c
> +++ b/arch/unicore32/kernel/pci.c
> @@ -258,7 +258,7 @@ static int __init pci_common_init(void)
>  
>  	pci_puv3_preinit();
>  
> -	puv3_bus = pci_scan_bus(0, &pci_puv3_ops, NULL);
> +	puv3_bus = pci_scan_bus_legacy(0, &pci_puv3_ops, NULL);
>  
>  	if (!puv3_bus)
>  		panic("PCI: unable to scan bus!");
> diff --git a/drivers/pci/hotplug/ibmphp_core.c b/drivers/pci/hotplug/ibmphp_core.c
> index 86e3bfd..4ade1b4 100644
> --- a/drivers/pci/hotplug/ibmphp_core.c
> +++ b/drivers/pci/hotplug/ibmphp_core.c
> @@ -765,7 +765,7 @@ static u8 bus_structure_fixup(u8 busno)
>  					(l != 0x0000) && (l != 0xffff)) {
>  			debug("%s - Inside bus_structure_fixup()\n",
>  							__func__);
> -			b = pci_scan_bus(busno, ibmphp_pci_bus->ops, NULL);
> +			b = pci_scan_bus_legacy(busno, ibmphp_pci_bus->ops, NULL);
>  			if (b)
>  				pci_bus_add_devices(b);
>  			break;
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 699a238..ccab9b1 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2091,7 +2091,7 @@ struct pci_bus *pci_scan_root_bus(struct device *parent, int bus,
>  }
>  EXPORT_SYMBOL(pci_scan_root_bus);
>  
> -struct pci_bus *pci_scan_bus(int bus, struct pci_ops *ops,
> +struct pci_bus *pci_scan_bus_legacy(int bus, struct pci_ops *ops,
>  					void *sysdata)
>  {
>  	LIST_HEAD(resources);
> @@ -2108,7 +2108,7 @@ struct pci_bus *pci_scan_bus(int bus, struct pci_ops *ops,
>  	}
>  	return b;
>  }
> -EXPORT_SYMBOL(pci_scan_bus);
> +EXPORT_SYMBOL(pci_scan_bus_legacy);
>  
>  /**
>   * pci_rescan_bus_bridge_resize - scan a PCI bus for devices.
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 36effb8..6dffc57 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -769,7 +769,7 @@ void pcibios_bus_to_resource(struct pci_bus *bus, struct resource *res,
>  void pcibios_scan_specific_bus(int busn);
>  struct pci_bus *pci_find_bus(int domain, int busnr);
>  void pci_bus_add_devices(const struct pci_bus *bus);
> -struct pci_bus *pci_scan_bus(int bus, struct pci_ops *ops, void *sysdata);
> +struct pci_bus *pci_scan_bus_legacy(int bus, struct pci_ops *ops, void *sysdata);
>  struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
>  				    struct pci_ops *ops, void *sysdata,
>  				    struct list_head *resources);
> -- 
> 1.7.1
> 
