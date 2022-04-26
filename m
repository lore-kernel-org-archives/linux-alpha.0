From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next] net: mark tulip obsolete
Date: Tue, 26 Apr 2022 14:31:34 -0700
Message-ID: <20220426143134.1b8de3d4@kernel.org>
References: <20220315184342.1064038-1-kuba@kernel.org>
        <29f1daf3-e9f2-bbc5-f5e5-6334c040e3fa@gmx.de>
        <20220315120432.2a72810d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
        <a66551f3-192a-70dc-4eb9-62090dbfe5fb@gmx.de>
        <20220426055311.53dd8c31@kernel.org>
        <87650cea-d190-9642-edf7-7dea42802dab@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651008696;
        bh=GNaLRUayu3a9RIB7bwNomHQ/zFlFwvI3eo6bb2FoaA4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PYIgbqlTdOVHHWQtVgt/iMNWyReRwLmpdDCEJ65EZMbSPSUQ2ep7h11u4en/Nz4M7
         lF45bY4+p9qS7BBcpaSt0XE957c62KOxEmTTJOuS2qks2XgWJLoe9z4d1KIFDf9vpN
         bwDZJDJA/B302FAUQdmvMtf1hg/SW7bTWf18Su7CIU9Re7VB3qBT0wMoFaIZJ9Mm/k
         RnY0ehY0aoM8l2yC8IEegC+nkhQH/Byi5wV2HcNt66px1CiBaY1dMfp1j76J0Ouuti
         HQHdOW6QntRemVh7NM4/dp97iz7pKwwkRVdj6GnnNSZiop9jGFEbCztnXs9VNO3Pyt
         N1bqlhCiT285Q==
In-Reply-To: <87650cea-d190-9642-edf7-7dea42802dab@gmx.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Helge Deller <deller@gmx.de>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-parisc@vger.kernel.org, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>

On Tue, 26 Apr 2022 22:53:00 +0200 Helge Deller wrote:
> >> That intention is ok, but "obsolete" means it's not used any more,
> >> and that's not true.  
> >
> > Hi Helge! Which incarnation of tulip do you need for PA-RISC, exactly?  
> 
> For parisc I have:
> 
> CONFIG_NET_TULIP=y
> # CONFIG_DE2104X is not set
> CONFIG_TULIP=y
> # CONFIG_TULIP_MWI is not set
> # CONFIG_TULIP_MMIO is not set
> # CONFIG_TULIP_NAPI is not set
> # CONFIG_DE4X5 is not set
> # CONFIG_WINBOND_840 is not set
> # CONFIG_DM9102 is not set
> # CONFIG_ULI526X is not set
> # CONFIG_PCMCIA_XIRCOM is not set
> # CONFIG_NET_VENDOR_DLINK is not set
> # CONFIG_NET_VENDOR_EMULEX is not set
> 
> So not the DE4X5.
> 
> > I'd like to try to remove DE4X5, if that's not the one you need
> > (getting rid of virt_to_bus()-using drivers).  
> 
> I've CC'ed the linux-alpha mailing list, as the DE4X5 driver might be
> needed there, so removing it completely might not be the best idea.
> 
> But since you want to remove virt_to_bus()....
> It seems this virt_to_bus() call is used for really old x86 machines/cards,
> which probably aren't supported any longer.
> 
> See drivers/net/ethernet/dec/tulip/de4x5.c:
> ...
> #if !defined(__alpha__) && !defined(__powerpc__) && !defined(CONFIG_SPARC) && !defined(DE4X5_DO_MEMCPY)
> ...
>     tmp = virt_to_bus(p->data);
> ...
> 
> Maybe you could simply remove the part inside #if...#else
> and insert a pr_err() instead (and return NULL)?

Ah, good find, thanks for taking a look! I'll look into dropping just
sections of the code.
