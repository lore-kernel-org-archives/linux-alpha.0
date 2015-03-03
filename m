From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v4 13/30] PCI: Introduce new scan function
 pci_scan_root_bridge()
Date: Mon, 2 Mar 2015 20:52:22 -0600
Message-ID: <20150303025222.GG11978@google.com>
References: <1424938344-4017-1-git-send-email-wangyijing@huawei.com>
 <1424938344-4017-14-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=YlJJHj9GM2g7xekC6HbAAmAqLfZJUyTFTTZYtn91VJk=;
        b=Vls+f2VCoZ2SfHBWM7nkpoB/9T3e3sTJAu5JL8KM+UCMTorCQKrVtiDb07/7Xi7NX4
         veMpUb5NhJOGeweOLHxdvyKyDiQVOABX8UpVVxc/AiqcjBPN1qgVbaB//ViKj1DggBRo
         6+F8skzjzwKeVZ2RPsV9MCW+9evPzvUuAggxFk4ZDNCfbBu8w1Uh6j7h4IHvk0XqOFmY
         Zff70EdfK+rjvodieWGibXHbuMUzmv/0MdGDgCxAs8Irgseks1i5IsO0kt4PyRs/5Pvh
         PL2hk4WpmWBVo53nPN03ZTMt/2VQal5P/P2zLmENX71DW5JQwMpEOvoeEjaze8o6eXIG
         cuFw==
Content-Disposition: inline
In-Reply-To: <1424938344-4017-14-git-send-email-wangyijing@huawei.com>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yijing Wang <wangyijing@huawei.com>
Cc: Jiang Liu <jiang.liu@linux.intel.com>, linux-pci@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rusty Russell <rusty@rustcorp.com.au>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Liviu Dudau <liviu@dudau.co.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>

On Thu, Feb 26, 2015 at 04:12:07PM +0800, Yijing Wang wrote:
> Introduce new scan function pci_scan_root_bridge() to
> support host bridge drivers that need to provide platform
> own pci_host_bridge_ops.
> 
> Signed-off-by: Yijing Wang <wangyijing@huawei.com>
> ---
>  drivers/pci/probe.c |   21 +++++++++++++++++++++
>  include/linux/pci.h |    3 +++
>  2 files changed, 24 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 8cec6ab..b5f9ca4 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2063,6 +2063,27 @@ static struct pci_bus *__pci_scan_root_bus(
>  	return b;
>  }
>  
> +struct pci_host_bridge *pci_scan_root_bridge(struct device *parent,
> +		u32 db, struct pci_ops *ops, void *sysdata,
> +		struct list_head *resources, struct pci_host_bridge_ops *phb_ops)

I prefer "host bridge" over "root bridge" because that's the terminology
used by the PCI specs.
