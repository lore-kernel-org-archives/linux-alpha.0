From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V4 01/26] alpha/PCI: deprecate pci_get_bus_and_slot()
Date: Wed, 3 Jan 2018 07:43:51 -0500
Message-ID: <73b8a0b3-eb69-f56a-bcde-08a5460859a6@codeaurora.org>
References: <1513661883-28662-1-git-send-email-okaya@codeaurora.org>
 <1513661883-28662-2-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1514983435;
        bh=c0kSFc8m2HFLGh6x3Fl0J7SJI9oO68hJA/4BQzIQsvo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=HTQcUx/x1uHHneFRD1e8PJW23lmEzgtp7DVdj0CBAZLqZOmstN62oQ930oCmMMZge
         tLYjYXrnhXtQaLtgzJ7pQxA0EobMlTFnHgrSk/LGL0Xo0mStFOZYVbha3xoJ/OONQC
         slCApi7wKE2lYow16hvm+NG4u2WEc7Gg9HIVjZZU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1514983434;
        bh=c0kSFc8m2HFLGh6x3Fl0J7SJI9oO68hJA/4BQzIQsvo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ejCKDIP1OcQZYxWghMQsn+72SsWVgRdNAS60NBUhxBoOPhaE0v6mQI/4aGtLoMjEG
         7hXyllH3aJQzNBooOG629zfRUDfe44PeKdBxEKiLejltVet20o+lcIJ0NHVAhhcgN7
         xZqba8aq7OEMDTSrJTUa7CDc1164Q1t08j9CX1eo=
In-Reply-To: <1513661883-28662-2-git-send-email-okaya@codeaurora.org>
Content-Language: en-US
Sender: linux-pci-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-pci@vger.kernel.org, timur@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On 12/19/2017 12:37 AM, Sinan Kaya wrote:
> pci_get_bus_and_slot() is restrictive such that it assumes domain=0 as
> where a PCI device is present. This restricts the device drivers to be
> reused for other domain numbers.
> 
> Use pci_get_domain_bus_and_slot() with a domain number of 0 where we can't
> extract the domain number. Other places, use the actual domain number from
> the device.
> 
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> ---
>  arch/alpha/kernel/pci.c          | 2 +-
>  arch/alpha/kernel/sys_nautilus.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/alpha/kernel/pci.c b/arch/alpha/kernel/pci.c
> index 87da005..2e86ebb 100644
> --- a/arch/alpha/kernel/pci.c
> +++ b/arch/alpha/kernel/pci.c
> @@ -425,7 +425,7 @@ struct resource * __init
>  		if (bus == 0 && dfn == 0) {
>  			hose = pci_isa_hose;
>  		} else {
> -			dev = pci_get_bus_and_slot(bus, dfn);
> +			dev = pci_get_domain_bus_and_slot(0, bus, dfn);
>  			if (!dev)
>  				return -ENODEV;
>  			hose = dev->sysdata;
> diff --git a/arch/alpha/kernel/sys_nautilus.c b/arch/alpha/kernel/sys_nautilus.c
> index 239dc0e..ff4f54b 100644
> --- a/arch/alpha/kernel/sys_nautilus.c
> +++ b/arch/alpha/kernel/sys_nautilus.c
> @@ -237,7 +237,7 @@
>  	bus = hose->bus = bridge->bus;
>  	pcibios_claim_one_bus(bus);
>  
> -	irongate = pci_get_bus_and_slot(0, 0);
> +	irongate = pci_get_domain_bus_and_slot(pci_domain_nr(bus), 0, 0);
>  	bus->self = irongate;
>  	bus->resource[0] = &irongate_io;
>  	bus->resource[1] = &irongate_mem;
> 

Any feedback here? most of the remaining patches have the ACK except these.


-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
