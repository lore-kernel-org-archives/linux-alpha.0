From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 28/30] PCI: Export find_pci_host_bridge() and rename
 to pci_find_host_bridge()
Date: Wed, 11 Mar 2015 22:43:05 -0500
Message-ID: <20150312034305.GJ10949@google.com>
References: <1425868467-9667-1-git-send-email-wangyijing@huawei.com>
 <1425868467-9667-29-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Return-path: <linux-pci-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=1Z4F0NIR6AZbxo6OTQLGhSkMQRAjgaoQ9aYRtnJM9p4=;
        b=kYDIfVnSXAXQEBcBo+Ge7pzvm/rK2VMKiEslGKDEAQKFVMwxJymg4yfzTO7CAk6gfs
         Q9Gq9Np6f+EDh3A+L6Om4NXQK6ZQihNSn7J5gA5CTw9/5/ISOrLOETqHlcCjHKRuHAWP
         biLRasIrXUCD2b8c97if8ehreH91mziRi6UlSyJgoXIir2dY/E39+R/mPQ23rWBtLLqv
         gTswkyQMnNqzmQC6PNQUtHC/QGwZNk4mHpvLKngS12hbkO1cWdZDilUoTz00QLSgDg/V
         gXyPwdiBe93m1xoO6R842pxhSHz1CWt9iCiS0v1wqRecYYjKLlNg6RJqxOWZj8+k/zoh
         SyQw==
Content-Disposition: inline
In-Reply-To: <1425868467-9667-29-git-send-email-wangyijing@huawei.com>
Sender: linux-pci-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yijing Wang <wangyijing@huawei.com>
Cc: Jiang Liu <jiang.liu@linux.intel.com>, linux-pci@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rusty Russell <rusty@rustcorp.com.au>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Liviu Dudau <liviu@dudau.co.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>

On Mon, Mar 09, 2015 at 10:34:25AM +0800, Yijing Wang wrote:
> Signed-off-by: Yijing Wang <wangyijing@huawei.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/host-bridge.c |    6 +++---
>  drivers/pci/pci.h         |    2 ++
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/host-bridge.c b/drivers/pci/host-bridge.c
> index bc1de59..51f0a82 100644
> --- a/drivers/pci/host-bridge.c
> +++ b/drivers/pci/host-bridge.c
> @@ -103,7 +103,7 @@ static struct pci_bus *find_pci_root_bus(struct pci_bus *bus)
>  	return bus;
>  }
>  
> -static struct pci_host_bridge *find_pci_host_bridge(struct pci_bus *bus)
> +struct pci_host_bridge *pci_find_host_bridge(struct pci_bus *bus)
>  {
>  	struct pci_bus *root_bus = find_pci_root_bus(bus);
>  
> @@ -121,7 +121,7 @@ void pci_set_host_bridge_release(struct pci_host_bridge *bridge,
>  void pcibios_resource_to_bus(struct pci_bus *bus, struct pci_bus_region *region,
>  			     struct resource *res)
>  {
> -	struct pci_host_bridge *bridge = find_pci_host_bridge(bus);
> +	struct pci_host_bridge *bridge = pci_find_host_bridge(bus);
>  	struct resource_entry *window;
>  	resource_size_t offset = 0;
>  
> @@ -146,7 +146,7 @@ static bool region_contains(struct pci_bus_region *region1,
>  void pcibios_bus_to_resource(struct pci_bus *bus, struct resource *res,
>  			     struct pci_bus_region *region)
>  {
> -	struct pci_host_bridge *bridge = find_pci_host_bridge(bus);
> +	struct pci_host_bridge *bridge = pci_find_host_bridge(bus);
>  	struct resource_entry *window;
>  	resource_size_t offset = 0;
>  
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index a1dc9f2..45252dd 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -328,4 +328,6 @@ struct pci_host_bridge *pci_create_host_bridge(
>  		void *sysdata, struct pci_host_bridge_ops *ops);
>  
>  void pci_free_host_bridge(struct pci_host_bridge *host);
> +struct pci_host_bridge *pci_find_host_bridge(struct pci_bus *bus);

This is only used in drivers/pci/host-bridge.c and in drivers/pci/pci.c for
pci_domain_nr().  Can you drop this patch and put the generic
pci_domain_nr() implementation (next patch) in host-bridge.c instead of in
pci.c?

> +
>  #endif /* DRIVERS_PCI_H */
> -- 
> 1.7.1
> 
