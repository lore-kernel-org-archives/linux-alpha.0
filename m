From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH -next] alpha: Define ioremap_uc and ioremap_wc
Date: Tue, 1 Sep 2015 19:12:12 -0700
Message-ID: <20150902021211.GA14302@roeck-us.net>
References: <1438396359-27697-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=8oy+BXwkxqPtuDqZLXVOa7wEkqLCCgaeXQs8QPzrbD0=;
	b=BVlu4bEaw/ffmO7UHsGrQyAQ3rsg27mq6dranyKjRgPGKLR20AvsiGZMIP3+V+i5ql/ZV22SVsOS/9jebVKQALkE+FoJE3/D+OxISYfE6u33GxeGMFkhemq6SihXkqe1YKr6ylWFDHJyfsoby33XmGvaQCRtIBKATsOt4CXUgG8=;
Content-Disposition: inline
In-Reply-To: <1438396359-27697-1-git-send-email-linux@roeck-us.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

On Fri, Jul 31, 2015 at 07:32:39PM -0700, Guenter Roeck wrote:
> Commit 3cc2dac5be3f ("drivers/video/fbdev/atyfb: Replace MTRR UC hole
> with strong UC") introduces calls to ioremap_wc and ioremap_uc. This
> causes build failures with alpha:allmodconfig. Map the missing functions
> to ioremap_nocache.
> 
> Fixes: 3cc2dac5be3f ("drivers/video/fbdev/atyfb:
>         Replace MTRR UC hole with strong UC")
> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> Cc: Luis R. Rodriguez <mcgrof@suse.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

ping ... alpha:allmodconfig now fails to build in mainline due to this
problem.

Guenter

> ---
>  arch/alpha/include/asm/io.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
> index f05bdb4b1cb9..7edfe6bf0ee6 100644
> --- a/arch/alpha/include/asm/io.h
> +++ b/arch/alpha/include/asm/io.h
> @@ -299,6 +299,9 @@ static inline void __iomem * ioremap_nocache(unsigned long offset,
>  	return ioremap(offset, size);
>  } 
>  
> +#define ioremap_wc	ioremap_nocache
> +#define ioremap_uc	ioremap_nocache
> +
>  static inline void iounmap(volatile void __iomem *addr)
>  {
>  	IO_CONCAT(__IO_PREFIX,iounmap)(addr);
> -- 
> 2.1.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
> 
