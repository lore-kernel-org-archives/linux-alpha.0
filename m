From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 6/6] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Tue, 07 Jun 2022 22:33:49 +1000
Message-ID: <87y1y8tzyq.fsf@mpe.ellerman.id.au>
References: <20220606084109.4108188-1-arnd@kernel.org>
 <20220606084109.4108188-7-arnd@kernel.org>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1654605238;
        bh=xsqLotJgLRyhHSsJOogHV2acGAb2fC5jAOSFmHOIGA8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=CyKzGazU3+2K8KiXkFolMw7JQl3fOZLWg6z5Qa5Pu4HecLtJDYCw5wZXMKOpJGtNH
         ls59IpcNb+xkojsRvHCc4fWQ+jCa6EIATKhLPnYyeuNIQ3bM/kCbodmjHfgOjgkZkS
         4h1lW8cbZe+o+0DbG3jBJCA91u30ggP5RKfw27leNpg5nQnN6glbcE5esgg3QrVgMC
         F6vtgSRCeacrQYA+phjt3HatLp44B4mYcMY4ThklAxFfrqM77MDq/rb5P0zDTt02T0
         PGQo6ASa5inpNApELNIR+n6jSj0aWCgLFiNBXcmQyCK7Xw/Luq/s+wYpHBJDE3Ehpr
         xujYS3Qf+FLTQ==
In-Reply-To: <20220606084109.4108188-7-arnd@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org, Khalid Aziz <khalid@gonehiking.org>, linux-scsi@vger.kernel.org, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, Denis Efremov <efremov@linux.com>

Arnd Bergmann <arnd@kernel.org> writes:
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index be68c1f02b79..48e1aa0536b6 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -277,7 +277,6 @@ config PPC
>  	select SYSCTL_EXCEPTION_TRACE
>  	select THREAD_INFO_IN_TASK
>  	select TRACE_IRQFLAGS_SUPPORT
> -	select VIRT_TO_BUS			if !PPC64
>  	#
>  	# Please keep this list sorted alphabetically.
>  	#

> diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
> index c5a5f7c9b231..73fcd5cdb662 100644
> --- a/arch/powerpc/include/asm/io.h
> +++ b/arch/powerpc/include/asm/io.h
> @@ -985,8 +985,6 @@ static inline void * bus_to_virt(unsigned long address)
>  }
>  #define bus_to_virt bus_to_virt
>  
> -#define page_to_bus(page)	(page_to_phys(page) + PCI_DRAM_OFFSET)
> -
>  #endif /* CONFIG_PPC32 */
  
Seems that's not used by any drivers, so fine to remove.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
