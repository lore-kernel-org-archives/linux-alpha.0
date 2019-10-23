From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 02/12] arm: nommu: use pgtable-nopud instead of
 4level-fixup
Date: Wed, 23 Oct 2019 10:40:25 +0100
Message-ID: <20191023094025.GY25745@shell.armlinux.org.uk>
References: <1571822941-29776-1-git-send-email-rppt@kernel.org>
 <1571822941-29776-3-git-send-email-rppt@kernel.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Zj5XfgeeJGpKuLcZ9xIMs7v8y6wlyVmuVne2tYjeW1M=; b=tSh0TWsLv0zTB/+cgvenf9Alp
        bJ97VOL1Q4Q/wIuvnA12UaDMLRf78wnJjHpbggLuo4iMGeNglZ1as6l8RASl1TDll+uOHTPG25/pR
        acvy9GNDVqZ7KfBh47xSWs+PI5asIdAhm13tXE6BItpl+2VzngNhBvzuj+zOzsXjQrFsNNJCGjnRC
        AbTb9a1MpJm1fedkHTRfoEwRE0vhBKPst8jQpneLESyhJ64OYxELIPZrr0oJy1xuGi9RVf/xLwxxe
        lNgreE5Mr25YZDU0qQD3g4xFyjZHQ8a3w8RDULX7AAdieMMMEEubl0LuajXBuQGADa2mAfoNErhWi
Content-Disposition: inline
In-Reply-To: <1571822941-29776-3-git-send-email-rppt@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>, Helge Deller <deller@gmx.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Jeff Dike <jdike@addtoit.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, Linus Torvalds <torvalds@linux-foundation.org>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Michal Simek <monstr@monstr.eu>, Richard Weinberger <richard@nod.at>, Sam Creasey <sammy@sammy.net>, Vincent Chen <deanbo422@gmail.com>, Vineet Gupta <Vineet.Gupta1@syno>

On Wed, Oct 23, 2019 at 12:28:51PM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The generic nommu implementation of page table manipulation takes care of
> folding of the upper levels and does not require fixups.
> 
> Simply replace of include/asm-generic/4level-fixup.h with
> include/asm-generic/pgtable-nopud.h.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Acked-by: Russell King <rmk+kernel@armlinux.org.uk>

Thanks.

> ---
>  arch/arm/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
> index 3ae120c..eabcb48 100644
> --- a/arch/arm/include/asm/pgtable.h
> +++ b/arch/arm/include/asm/pgtable.h
> @@ -12,7 +12,7 @@
>  
>  #ifndef CONFIG_MMU
>  
> -#include <asm-generic/4level-fixup.h>
> +#include <asm-generic/pgtable-nopud.h>
>  #include <asm/pgtable-nommu.h>
>  
>  #else
> -- 
> 2.7.4
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
