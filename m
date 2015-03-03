From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v4 22/30] PCI/Parisc: Use pci_scan_root_bus() for
 simplicity
Date: Mon, 2 Mar 2015 21:24:12 -0600
Message-ID: <20150303032412.GK11978@google.com>
References: <1424938344-4017-1-git-send-email-wangyijing@huawei.com>
 <1424938344-4017-23-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=tAyQMWBiRA2l2GkydDnGNoclMJJin3n9+v0t38glj0g=;
        b=JFeDZVveG1qJrZ9CSUPbfzCT+OikkvRgKBcNxeq7ale8/eyX0cYbCdXQA6urJR6uPh
         TOxTTD/uArBxO71dLR0g7mttGxnf8c8SwklJB+UDNed4/zwgTkYmNFhAuaJuRjfPqgxI
         KxZp842s4s7EXFy5mLBlLaYaQOiAUrjFK8BVt5Hz8sdsRFrwBiTfN6cATsOvTPc0hNXw
         niI/eMyCVKi0OnZ8V4BA9jxAxD1npRm0CCVv3sqME1xkG5GJpgrVDCockCf3lO8OiCYf
         V5aDZPJQ5sWEhJCwXNh0TZp0TvZyDMz+hp0mDYwPT0/Uo0r0YuxYalyjzCMttWoGfWwl
         w4Ug==
Content-Disposition: inline
In-Reply-To: <1424938344-4017-23-git-send-email-wangyijing@huawei.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yijing Wang <wangyijing@huawei.com>
Cc: Jiang Liu <jiang.liu@linux.intel.com>, linux-pci@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rusty Russell <rusty@rustcorp.com.au>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Liviu Dudau <liviu@dudau.co.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Yijing Wang <wangyijing0307@gmail.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, linux-parisc@vger.kernel.org

On Thu, Feb 26, 2015 at 04:12:16PM +0800, Yijing Wang wrote:
> From: Yijing Wang <wangyijing0307@gmail.com>

When you write subject lines, I think it's friendly to run
"git log --oneline" on the file you're changing, and make yours
match the previous ones.

  $ git log --oneline drivers/parisc/dino.c
  3f05536d226d PCI/Parisc: Use pci_scan_root_bus() for simplicity
  3335f75a8877 parisc: dino: fix %d confusingly prefixed with 0x in format string
  3fad9b8d597f drivers/parisc: Use printf extension %pR for struct resource
  0fe763c570ad Drivers: misc: remove __dev* attributes.
  0b79ca2a800d parisc/PCI: Use list_for_each_entry() for bus->devices traversal
  30aa80da43a5 parisc/PCI: register busn_res for root buses
  ...

Yours doesn't match any of them, but "parisc/PCI" seems the best match.

> Now pci_bus_add_devices() has been ripped out
> from pci_scan_root_bus(), we could use pci_scan_root_bus()
> instead of pci_create_root_bus() + pci_scan_child_bus()
> for simplicity. We could also remove the pci bus
> resource(dino_current_bus,255) and pci_bus_update_busn_res_end(),
> because pci_scan_root_bus() would do the same thing.
> 
> Signed-off-by: Yijing Wang <wangyijing@huawei.com>
> CC: "James E.J. Bottomley" <jejb@parisc-linux.org>
> CC: linux-parisc@vger.kernel.org
> ---
>  drivers/parisc/dino.c    |   11 ++---------
>  drivers/parisc/lba_pci.c |    7 ++-----
>  2 files changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
> index a0580af..e5ee339 100644
> --- a/drivers/parisc/dino.c
> +++ b/drivers/parisc/dino.c
> @@ -977,15 +977,11 @@ static int __init dino_probe(struct parisc_device *dev)
>  	if (dino_dev->hba.gmmio_space.flags)
>  		pci_add_resource(&resources, &dino_dev->hba.gmmio_space);
>  
> -	dino_dev->hba.bus_num.start = dino_current_bus;
> -	dino_dev->hba.bus_num.end = 255;
> -	dino_dev->hba.bus_num.flags = IORESOURCE_BUS;
> -	pci_add_resource(&resources, &dino_dev->hba.bus_num);

I know pci_scan_root_bus() does default to bus 0-255, but I don't really
like that behavior, and I think it's a bug for drivers like this to rely on
that.  The PCI core has no way to discover the actual bus number range, and
the only reason it supplies a default is because it was inconvenient to
change all the callers.  The host bridge driver is the only code that has
any chance of discovering and/or configuring the correct range.

So I think it's more correct to leave the existing code here, even though
this code is is likely incorrect.  At least then if we trip over an issue
with the bus range being incorrect, it will be clear that the fix should
be in dino.c rather than the PCI core.
