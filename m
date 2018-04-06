From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH] alpha: io: reorder barriers to guarantee writeX() and
 iowriteX() ordering
Date: Thu, 5 Apr 2018 21:35:10 -0400
Message-ID: <3c28281e-de52-abbe-36bc-06f5527da921@codeaurora.org>
References: <1522691281-21593-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1522978514;
        bh=KQr2OtYOZtUY2q9VO5FYa/bc90VcJAfTaxLhJ8BRHfU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=o2sU71ZfQvP4WvBa96Mj+QPczkkqMUIBDNYSRZXRTwhH3/Uq3AS+iMSlX0dtNh9Jj
         z90ojbYMAN97AdZkOpGjw46io+nVumyrubbHA2d96nR47ARt9eWP+qStr24cGAddEz
         9RWACJYqQV2XOUnnCAOQnqKIyRSnwLiWmt7ht2MA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1522978513;
        bh=KQr2OtYOZtUY2q9VO5FYa/bc90VcJAfTaxLhJ8BRHfU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JJvntSk3su8WNlOAquuAB77lK44vFAFynlXqYYpnoxzyuTV3C5RQTF64o0WEFBaFE
         10FLmpz+XuWBS0Pb9w77CB0z00TLMA+eEMktXoA1hOSwiTNIprybqfCGJHyBZJwTiQ
         HRPFPHSgABNKudKRIC1mGFrQdXC5JioQeo9Qb0MU=
In-Reply-To: <1522691281-21593-1-git-send-email-okaya@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, timur@codeaurora.org, sulrich@codeaurora.org
Cc: arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Kate Stewart <kstewart@linuxfoundation.org>, linux-kernel@vger.kernel.org

On 4/2/2018 1:48 PM, Sinan Kaya wrote:
> memory-barriers.txt has been updated with the following requirement.
> 
> "When using writel(), a prior wmb() is not needed to guarantee that the
> cache coherent memory writes have completed before writing to the MMIO
> region."
> 
> Current writeX() and iowriteX() implementations on alpha are not
> satisfying this requirement as the barrier is after the register write.
> 
> Move mb() in writeX() and iowriteX() functions to guarantee that HW
> observes memory changes before performing register operations.
> 
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/alpha/include/asm/io.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
> index d123ff9..4c533fc 100644
> --- a/arch/alpha/include/asm/io.h
> +++ b/arch/alpha/include/asm/io.h
> @@ -341,14 +341,14 @@ extern inline unsigned int ioread16(void __iomem *addr)
>  
>  extern inline void iowrite8(u8 b, void __iomem *addr)
>  {
> -	IO_CONCAT(__IO_PREFIX,iowrite8)(b, addr);
>  	mb();
> +	IO_CONCAT(__IO_PREFIX, iowrite8)(b, addr);
>  }
>  
>  extern inline void iowrite16(u16 b, void __iomem *addr)
>  {
> -	IO_CONCAT(__IO_PREFIX,iowrite16)(b, addr);
>  	mb();
> +	IO_CONCAT(__IO_PREFIX, iowrite16)(b, addr);
>  }
>  
>  extern inline u8 inb(unsigned long port)
> @@ -382,8 +382,8 @@ extern inline unsigned int ioread32(void __iomem *addr)
>  
>  extern inline void iowrite32(u32 b, void __iomem *addr)
>  {
> -	IO_CONCAT(__IO_PREFIX,iowrite32)(b, addr);
>  	mb();
> +	IO_CONCAT(__IO_PREFIX, iowrite32)(b, addr);
>  }
>  
>  extern inline u32 inl(unsigned long port)
> @@ -434,14 +434,14 @@ extern inline u16 readw(const volatile void __iomem *addr)
>  
>  extern inline void writeb(u8 b, volatile void __iomem *addr)
>  {
> -	__raw_writeb(b, addr);
>  	mb();
> +	__raw_writeb(b, addr);
>  }
>  
>  extern inline void writew(u16 b, volatile void __iomem *addr)
>  {
> -	__raw_writew(b, addr);
>  	mb();
> +	__raw_writew(b, addr);
>  }
>  #endif
>  
> @@ -482,14 +482,14 @@ extern inline u64 readq(const volatile void __iomem *addr)
>  
>  extern inline void writel(u32 b, volatile void __iomem *addr)
>  {
> -	__raw_writel(b, addr);
>  	mb();
> +	__raw_writel(b, addr);
>  }
>  
>  extern inline void writeq(u64 b, volatile void __iomem *addr)
>  {
> -	__raw_writeq(b, addr);
>  	mb();
> +	__raw_writeq(b, addr);
>  }
>  #endif
>  
> 


Can we get these merged to 4.17? 

There was a consensus to fix the architectures having API violation issues.
https://www.mail-archive.com/netdev@vger.kernel.org/msg225971.html



-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
