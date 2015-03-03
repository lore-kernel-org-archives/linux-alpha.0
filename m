From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v4 12/30] PCI: Introduce pci_host_bridge_ops to support
 host specific operations
Date: Mon, 2 Mar 2015 21:03:01 -0600
Message-ID: <20150303030301.GI11978@google.com>
References: <1424938344-4017-1-git-send-email-wangyijing@huawei.com>
 <1424938344-4017-13-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Return-path: <linux-pci-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=TdzUJN5mYS3iPhs5a5LFMzatlmteXotmpn3PGhwoCsI=;
        b=QPAN0lQOf7v1ocmPxNdu43w517Gbnk8F/EAh2LO/Ht9HU4QAb7JjRRE3NvvTNBMNGL
         Ktaw//aGph2qsrLziGBMeFPm6bSo7G85bp9D9/CMFnPJ0KyWBSotG5cGZkaPVuiIVeEp
         +LWcg/zQ5p1PdBGxvJtJ1hbZn75Rd/Zv92pNZ2QzzKuL5fnz/EirKjU24wSb9Lo83wVJ
         pQhqKPbGjwUwURcgq1X9en5iorIgexkKyPGZdzWqqTB+8rO6SKh2v8hzVCEWHacHhbep
         ROWUwVfNHlsQRJmrzk1YknctUjARQxzyu8mJz4D8deWqvsZRQ5sMz/HhgkG2vOSs11aX
         Qo+Q==
Content-Disposition: inline
In-Reply-To: <1424938344-4017-13-git-send-email-wangyijing@huawei.com>
Sender: linux-pci-owner@vger.kernel.org
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
> ...

> @@ -2050,10 +2052,13 @@ static struct pci_bus *__pci_scan_root_bus(
>  		pci_bus_insert_busn_res(b, b->number, 255);
>  	}
>  
> -	max = pci_scan_child_bus(b);
> -
> -	if (!found)
> -		pci_bus_update_busn_res_end(b, max);
> +	if (host->ops && host->ops->phb_of_scan_bus) {
> +		host->ops->phb_of_scan_bus(host);

The important thing here is not the use of OF (Open Firmware/Device Tree),
is it?  Why would we want "_of_" in the function name?  I assume the intent
is that this host bridge op performs the same function as
pci_scan_child_bus(), so I think the op should be called "scan_bus".

> +	} else {
> +		max = pci_scan_child_bus(b);
> +		if (!found)
> +			pci_bus_update_busn_res_end(b, max);
> +	}
>  
>  	return b;
>  }
