From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v4 12/30] PCI: Introduce pci_host_bridge_ops to support
 host specific operations
Date: Mon, 2 Mar 2015 20:50:20 -0600
Message-ID: <20150303025020.GF11978@google.com>
References: <1424938344-4017-1-git-send-email-wangyijing@huawei.com>
 <1424938344-4017-13-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=B/nHRfQVZ2kqPQC3UGtcpKsVkignEAI2jUlFx1WvxHc=;
        b=YIVIyHODUxuMTzYiyGSLG0NFd6ZGV3g0/yETHp9tm7uP0NIA1dAJoM/PVhhWWXisWQ
         hTdwPOBccmsBn9jbo41KV37R/MQQy4NBI0zyj+nSvJdsHOlCbmpkDNJ9THyTSgu1YncT
         R5Rssl3mL0bAnuQw082JC7BvWiXfA0DKaVVEIKy/aByejvXJTFklJIDBK/OcSmkaG/SQ
         A3yS7ItGN3W6IUURwPugDUgn70rNv8dnR5O+hjnTQ/adawuIdOYrfZmEWpAG6zZquXSI
         yLPxPpBkzAU5HevZFxgo6t7tl597PmrYqm0ax3bTmtlqEtmMjOjsOZtDgega12hHBhqB
         DYDw==
Content-Disposition: inline
In-Reply-To: <1424938344-4017-13-git-send-email-wangyijing@huawei.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yijing Wang <wangyijing@huawei.com>
Cc: Jiang Liu <jiang.liu@linux.intel.com>, linux-pci@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rusty Russell <rusty@rustcorp.com.au>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Liviu Dudau <liviu@dudau.co.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>

On Thu, Feb 26, 2015 at 04:12:06PM +0800, Yijing Wang wrote:
> Now we have weak functions like pcibios_root_bridge_prepare()
> to setup pci host bridge, We could introduce pci_host_bridge_ops
> which contain host bridge specific ops to setup pci_host_bridge.
> Then host bridge driver could add pci_host_bridge_ops hooks
> intead of weak function to setup pci_host_bridge.
> This patch add following pci_host_bridge_ops hooks:
> 
> pci_host_bridge_ops {
> 	/* set root bus speed, some platform need this like powerpc */
> 	void (*phb_set_root_bus_speed)(struct pci_host_bridge *host);
> 	/* setup pci_host_bridge before pci_host_bridge be added to driver core */
> 	int (*phb_prepare)(struct pci_host_bridge *host);
> 	/* platform specific of scan hook to scan pci device */
> 	void (*phb_of_scan_bus)(struct pci_host_bridge *);
> }
> We could easily extend it to support different host bridge
> specific operations.
> 
> Signed-off-by: Yijing Wang <wangyijing@huawei.com>
> ---
>  drivers/pci/host-bridge.c |   12 ++++++++++--
>  drivers/pci/probe.c       |   17 +++++++++++------
>  include/linux/pci.h       |   12 ++++++++++--
>  3 files changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/host-bridge.c b/drivers/pci/host-bridge.c
> index b42a4bb..4a2baa2 100644
> --- a/drivers/pci/host-bridge.c
> +++ b/drivers/pci/host-bridge.c
> @@ -23,8 +23,8 @@ static void pci_release_host_bridge_dev(struct device *dev)
>  }
>  
>  struct pci_host_bridge *pci_create_host_bridge(
> -		struct device *parent, u32 db, 
> -		struct list_head *resources, void *sysdata)
> +		struct device *parent, u32 db, struct list_head *resources, 
> +		void *sysdata, struct pci_host_bridge_ops *ops)
>  {
>  	int error;
>  	int bus = PCI_BUSNUM(db);
> @@ -56,6 +56,7 @@ struct pci_host_bridge *pci_create_host_bridge(
>  		}
>  	mutex_unlock(&phb_mutex);
>  
> +	host->ops = ops;
>  	host->dev.parent = parent;
>  	INIT_LIST_HEAD(&host->windows);
>  	host->dev.release = pci_release_host_bridge_dev;
> @@ -63,6 +64,13 @@ struct pci_host_bridge *pci_create_host_bridge(
>  	dev_set_name(&host->dev, "pci%04x:%02x", host->domain, 
>  			host->busnum);
>  
> +	if (host->ops && host->ops->phb_prepare) {
> +		error = host->ops->phb_prepare(host);
> +		if(error) {

Whitespace error.

> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -400,6 +400,13 @@ static inline int pci_channel_offline(struct pci_dev *pdev)
>  	return (pdev->error_state != pci_channel_io_normal);
>  }
>  
> +struct pci_host_bridge;
> +struct pci_host_bridge_ops {
> +	void (*phb_set_root_bus_speed)(struct pci_host_bridge *host);
> +	int (*phb_prepare)(struct pci_host_bridge *host);
> +	void (*phb_of_scan_bus)(struct pci_host_bridge *);

These function pointers don't need a "phb_" prefix.
