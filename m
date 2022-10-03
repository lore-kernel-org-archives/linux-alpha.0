From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] alpha: Fix ioread64/iowrite64 helpers
Date: Mon, 3 Oct 2022 09:07:24 -0700
Message-ID: <20221003160724.GA654712@roeck-us.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date;
        bh=Dvy2xvZBjbbxD4I6LW/0qoLOCIiEas9Nb7Ts/zuWvus=;
        b=PxHFGfJYSYBX1Yg/Mzj3ErQD6Iv0rG1btseJGyeEaERkil/gZnYatRuvX/+xDoa4cE
         0qfsGQOa7yVM1BAidTjqULiNyec7OvR3XyJUQYahJ2UOzSm2ZXD1elof2tdvhWWEleXz
         MZP4H5ayJ+sgdT7wm3bva+RJX3PhM8n0N0rTBZnLqiauxn4RS/QQqt+Oe/JTefg5rdNo
         wgwNEHgjP0T4wk2FvREvS65Qagg09v/Hsuq5vDVZwHD5hGjQ4R688DVvthiGSS/vROCw
         UleTzlOSUC7azvfKbfallf4ZuZDxTbONRqkFsZ3kQdGZ7Xe5BkIf/AhuDcHR+sdlkZTj
         Sp1A==
Sender: Guenter Roeck <groeck7@gmail.com>
Content-Disposition: inline
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org

On Mon, Oct 03, 2022 at 02:13:16PM +0200, Linus Walleij wrote:
> When doing allmod builds it turns out some modules are using
> ioread64() and iowrite64() that the alpha does not implement,
> as it is using <asm-generic/iomap.h> without selecting
> GENERIC_IOMAP.
> 
> Fix this by implementing the ioread64()/iowrite64() stubs
> as well, using readq() and writeq() respectively.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 7e772dad9913 ("alpha: Use generic <asm-generic/io.h>")
> Link: https://lore.kernel.org/linux-arch/20221002224521.GA968453@roeck-us.net/
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-arch@vger.kernel.org
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Note that I don't have a preference about the two suggested patches.
Both fix the problem I had observed.

Thanks,
Guenter

> ---
> Arnd if this looks OK then please apply it on linux-arch
> for fixes.
> ---
>  arch/alpha/kernel/io.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/alpha/kernel/io.c b/arch/alpha/kernel/io.c
> index 838586abb1e0..5f3e75a945c1 100644
> --- a/arch/alpha/kernel/io.c
> +++ b/arch/alpha/kernel/io.c
> @@ -41,6 +41,11 @@ unsigned int ioread32(const void __iomem *addr)
>  	return ret;
>  }
>  
> +u64 ioread64(const void __iomem *addr)
> +{
> +	return readq(addr);
> +}
> +
>  void iowrite8(u8 b, void __iomem *addr)
>  {
>  	mb();
> @@ -59,12 +64,19 @@ void iowrite32(u32 b, void __iomem *addr)
>  	IO_CONCAT(__IO_PREFIX,iowrite32)(b, addr);
>  }
>  
> +void iowrite64(u64 b, void __iomem *addr)
> +{
> +	writeq(b, addr);
> +}
> +
>  EXPORT_SYMBOL(ioread8);
>  EXPORT_SYMBOL(ioread16);
>  EXPORT_SYMBOL(ioread32);
> +EXPORT_SYMBOL(ioread64);
>  EXPORT_SYMBOL(iowrite8);
>  EXPORT_SYMBOL(iowrite16);
>  EXPORT_SYMBOL(iowrite32);
> +EXPORT_SYMBOL(iowrite64);
>  
>  u8 inb(unsigned long port)
>  {
> -- 
> 2.34.1
> 
