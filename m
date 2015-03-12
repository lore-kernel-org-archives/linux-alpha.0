From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 08/30] PCI: Introduce pci_host_assign_domain_nr() to
 assign domain
Date: Wed, 11 Mar 2015 20:39:18 -0500
Message-ID: <20150312013918.GC10949@google.com>
References: <1425868467-9667-1-git-send-email-wangyijing@huawei.com>
 <1425868467-9667-9-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Return-path: <linux-pci-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=/8t2ZNhu1rqNsQI3PK3M6k97kBI7LIC+m0OEyqSWetg=;
        b=Gr7lmD9oKzokR4BVEETJOB7cf06gOxFqFhuF1jxrZiyJO47RwqeQSckopIpcUJ//aL
         +en6cSLn8ccPQSADGN6J1eu/uPrnMFv15XlOc9Abl5qZnqqz71e2Z4h1oTCWJjLEwSKo
         G1UTXJME517+Kp3eTzuV5QXvEpvTi8+n+SkJdBaxcMz71XjZ18mqkrYJ0BZvYKSYp8Ls
         tXSWPQ9jjBjX83vbscDnJ3rSD1fcuMoxiXWEbX9i+VPWPhFS6SF0LTJIJCdR+uz3lEds
         Gl5rCyKKDwBGtRQNP1rzstNm9aJoFXgp6gM2ru+JllP9GqecLmLBBXJ5TZEw9AsQPrfo
         0P6Q==
Content-Disposition: inline
In-Reply-To: <1425868467-9667-9-git-send-email-wangyijing@huawei.com>
Sender: linux-pci-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yijing Wang <wangyijing@huawei.com>
Cc: Jiang Liu <jiang.liu@linux.intel.com>, linux-pci@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rusty Russell <rusty@rustcorp.com.au>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Liviu Dudau <liviu@dudau.co.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>

On Mon, Mar 09, 2015 at 10:34:05AM +0800, Yijing Wang wrote:
> Introduce pci_host_assign_domain_nr() to assign domain
> number for pci_host_bridge. Later we will remove
> pci_bus_assign_domain_nr().
> 
> Signed-off-by: Yijing Wang <wangyijing@huawei.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pci.c   |   20 +++++++++++++++-----
>  include/linux/pci.h |    4 ++++
>  2 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 81f06e8..c49eec1 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4501,10 +4501,10 @@ int pci_get_new_domain_nr(void)
>  }
>  
>  #ifdef CONFIG_PCI_DOMAINS_GENERIC
> -void pci_bus_assign_domain_nr(struct pci_bus *bus, struct device *parent)
> +static int pci_assign_domain_nr(struct device *dev)
>  {
>  	static int use_dt_domains = -1;
> -	int domain = of_get_pci_domain_nr(parent->of_node);
> +	int domain = of_get_pci_domain_nr(dev->of_node);
>  
>  	/*
>  	 * Check DT domain and use_dt_domains values.
> @@ -4538,12 +4538,22 @@ void pci_bus_assign_domain_nr(struct pci_bus *bus, struct device *parent)
>  		use_dt_domains = 0;
>  		domain = pci_get_new_domain_nr();
>  	} else {
> -		dev_err(parent, "Node %s has inconsistent \"linux,pci-domain\" property in DT\n",
> -			parent->of_node->full_name);
> +		dev_err(dev, "Node %s has inconsistent \"linux,pci-domain\" property in DT\n",
> +			dev->of_node->full_name);
>  		domain = -1;
>  	}
>  
> -	bus->domain_nr = domain;
> +	return domain;
> +}
> +
> +void pci_host_assign_domain_nr(struct pci_host_bridge *host)
> +{
> +	host->domain = pci_assign_domain_nr(host->dev.parent);
> +}
> +
> +void pci_bus_assign_domain_nr(struct pci_bus *bus, struct device *parent)
> +{
> +	bus->domain_nr = pci_assign_domain_nr(parent);
>  }
>  #endif
>  #endif
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 8b3d245..2b1b998 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1327,11 +1327,15 @@ static inline int pci_domain_nr(struct pci_bus *bus)
>  	return bus->domain_nr;
>  }
>  void pci_bus_assign_domain_nr(struct pci_bus *bus, struct device *parent);
> +void pci_host_assign_domain_nr(struct pci_host_bridge *host);

I do not think this needs to be in include/linux/pci.h.  It's called only
from drivers/pci/host-bridge.c, so at most, it needs to be in
drivers/pci/pci.h.

Better still would be if the definition could be moved from
drivers/pci/pci.c to drivers/pci/host-bridge.c so we wouldn't need anything
in a header file at all.

>  #else
>  static inline void pci_bus_assign_domain_nr(struct pci_bus *bus,
>  					struct device *parent)
>  {
>  }
> +static inline void pci_host_assign_domain_nr(struct pci_host_bridge *host)
> +{
> +}
>  #endif
>  
>  /* some architectures require additional setup to direct VGA traffic */
> -- 
> 1.7.1
> 
