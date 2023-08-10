From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 04/17] pci: sysfs: move declarations to linux/pci.h
Date: Thu, 10 Aug 2023 09:38:34 -0500
Message-ID: <20230810143834.GA29233@bhelgaas>
References: <20230810141947.1236730-5-arnd@kernel.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691678317;
        bh=6aZdlG0TFjmXA9MTJdarW9ykuWmFLg+ezFHrHCAQUFE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=laTmVQiB5UMAERREp8XOd8fnZfQJvcWru0BfS09a8TVtSLStx72PrB8yu1LjtxbsT
         HNdmQXR2UbueO4Frz4mPbMIBTCUU+WHAoyeOwWQxLhcxYblCihm2P8Wj8CaspiXl9B
         cj2VXaSGrJtb4bM3TmCsImOBnpzazRXMAV5Q+/kSEdO/7xCmk8fR++d+xXWXSP1Lfh
         c0yty67HD4DNxWnqkVOmvliq6XphZCpqpLyIrjo1xSF7CMGcTRSbCSWtOJJk9qkXCc
         eDcgH4Xk6dgO/F4ANTHVgoe41mYEgexj791kDUPK2TMlsVx7f8uetjVEIj/jEPX8pu
         cIqrXChQ7kaGA==
Content-Disposition: inline
In-Reply-To: <20230810141947.1236730-5-arnd@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Reinette Chatre <reinette.chatre@intel.com>, Ira Weiny <ira.weiny@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Sami Tolvanen <samitolvanen@google.com>, linux-alpha@v

On Thu, Aug 10, 2023 at 04:19:22PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A couple of architectures build the __weak versions of
> pci_create_resource_files() and pci_remove_resource_files() but don't
> have prototypes for these, which causes warnings:
> 
> drivers/pci/pci-sysfs.c:1253:12: error: no previous prototype for 'pci_create_resource_files' [-Werror=missing-prototypes]
>  1253 | int __weak pci_create_resource_files(struct pci_dev *dev) { return 0; }
> drivers/pci/pci-sysfs.c:1254:13: error: no previous prototype for 'pci_remove_resource_files' [-Werror=missing-prototypes]
>  1254 | void __weak pci_remove_resource_files(struct pci_dev *dev) { return; }
> 
> Move the prototypes from alpha architecture into the global header to
> avoid these warnings for all of them.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to pci/misc for v6.6, thanks!

> ---
>  arch/alpha/include/asm/pci.h | 3 ---
>  include/linux/pci.h          | 5 +++++
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/pci.h b/arch/alpha/include/asm/pci.h
> index 6312656279d79..6c04fcbdc8ed2 100644
> --- a/arch/alpha/include/asm/pci.h
> +++ b/arch/alpha/include/asm/pci.h
> @@ -88,7 +88,4 @@ extern void pci_adjust_legacy_attr(struct pci_bus *bus,
>  				   enum pci_mmap_state mmap_type);
>  #define HAVE_PCI_LEGACY	1
>  
> -extern int pci_create_resource_files(struct pci_dev *dev);
> -extern void pci_remove_resource_files(struct pci_dev *dev);
> -
>  #endif /* __ALPHA_PCI_H */
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index eeb2e6f6130f4..198a399c4b792 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2260,6 +2260,11 @@ int pcibios_alloc_irq(struct pci_dev *dev);
>  void pcibios_free_irq(struct pci_dev *dev);
>  resource_size_t pcibios_default_alignment(void);
>  
> +#if !defined(HAVE_PCI_MMAP) && !defined(ARCH_GENERIC_PCI_MMAP_RESOURCE)
> +extern int pci_create_resource_files(struct pci_dev *dev);
> +extern void pci_remove_resource_files(struct pci_dev *dev);
> +#endif
> +
>  #if defined(CONFIG_PCI_MMCONFIG) || defined(CONFIG_ACPI_MCFG)
>  void __init pci_mmcfg_early_init(void);
>  void __init pci_mmcfg_late_init(void);
> -- 
> 2.39.2
> 
