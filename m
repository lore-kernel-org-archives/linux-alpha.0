From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 03/30] PCI: Export busn_resource to drivers/pci
Date: Wed, 11 Mar 2015 17:28:35 -0500
Message-ID: <20150311222835.GA1082@google.com>
References: <1425868467-9667-1-git-send-email-wangyijing@huawei.com>
 <1425868467-9667-4-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=mS/D9My6itRFc4W9dSkiOYUFpZg5NuYMjp1cDw9QD+U=;
        b=ptaLP3DT5tAwyOnJ5GCpOtQXHD5b5KcUlqNFbALoC0rau3uZsVRbqEwVx9a1n/6UCm
         9fiOGURLHudsdrRjHSMRVwdnYxXwa/D0JfjE3zPA/rvDVKl+e1CbDt1RZouf/r7Qqua/
         bESmzwf9HqIRHmW7oiX48f9sVqEHaUmu7CLhup+zCnWE8S0Bzk75qTYUPhF5SI7KarEt
         1BzJqTib/yf1Lt2pyXECAr8eee8Cj1kJGt3xMcehZToc1NdguS/XxnrqQK7+D6rYj7QZ
         cgHefC0n82DCMYpkmdOfRcAtW+qbJ6rmK4QUiUJP5XtdFPgsmGOjXjKJ0P+qgqUw5BAW
         GzLg==
Content-Disposition: inline
In-Reply-To: <1425868467-9667-4-git-send-email-wangyijing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yijing Wang <wangyijing@huawei.com>
Cc: Jiang Liu <jiang.liu@linux.intel.com>, linux-pci@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rusty Russell <rusty@rustcorp.com.au>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Liviu Dudau <liviu@dudau.co.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>

On Mon, Mar 09, 2015 at 10:34:00AM +0800, Yijing Wang wrote:
> Export out busn_resource. Xen pcifront module need it.
> 
> Signed-off-by: Yijing Wang <wangyijing@huawei.com>
> ---
>  drivers/pci/pci.h   |    2 ++
>  drivers/pci/probe.c |    3 ++-
>  2 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 4091f82..eeacab9 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -10,6 +10,8 @@ bool pcie_cap_has_lnkctl(const struct pci_dev *dev);
>  
>  /* Functions internal to the PCI core code */
>  
> +extern struct resource busn_resource;
> +
>  int pci_create_sysfs_dev_files(struct pci_dev *pdev);
>  void pci_remove_sysfs_dev_files(struct pci_dev *pdev);
>  #if !defined(CONFIG_DMI) && !defined(CONFIG_ACPI)
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 8ef0375..b97ea81 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -17,12 +17,13 @@
>  #define CARDBUS_LATENCY_TIMER	176	/* secondary latency timer */
>  #define CARDBUS_RESERVE_BUSNR	3
>  
> -static struct resource busn_resource = {
> +struct resource busn_resource = {
>  	.name	= "PCI busn",
>  	.start	= 0,
>  	.end	= 255,
>  	.flags	= IORESOURCE_BUS,
>  };
> +EXPORT_SYMBOL(busn_resource);

I don't think this is a good idea.  We support multiple PCI domains, and
each domain has its own 0-255 bus number range.  This busn_resource is
only for domain 0 and probably should be handled in arch code instead of
the PCI core.

Right now, I think it's possible to call pci_scan_bus_parented() or
pci_scan_bus() several times for buses in different domains, and they would
all share the same busn_resource, which would cause corruption.

So it's already broken, but I don't want to make it harder to fix by
exporting this stuff.

>  
>  /* Ugh.  Need to stop exporting this to modules. */
>  LIST_HEAD(pci_root_buses);
> -- 
> 1.7.1
> 
