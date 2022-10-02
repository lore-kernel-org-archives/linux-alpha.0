From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] alpha: Use generic <asm-generic/io.h>
Date: Sun, 2 Oct 2022 15:45:21 -0700
Message-ID: <20221002224521.GA968453@roeck-us.net>
References: <20220818092059.103884-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=hTl+pyY12f3DZxyUqnMSkcg5Alz1/QdlswdwOgdvgGk=;
        b=XItK+i7/HHci/1wBFZFyGwYWT2B91gu7BuaV3mRqEMPRoXYrcBnpcqKi23LUK4/1j4
         Z+xWpx3f0QM7q5q/w8zc6ls9iGpj/Q7bVIWz7VyZoyN3CfpUunLP8KslF7KvgLCUfSDE
         +kYMQFIwDVxI6C4jJlSPDr8oA/T/xNcwijpIqbzLzHqAm2KWG1W2jbe2Bd4krpv4Mbjq
         W7HLeqJ3INfBp2DjKHH3ut2jdD6bUbDyR4k3v6uzL0LKMDt2b7clroFdda89W/fg1EpV
         xzr3xbAXANE7O+xsyTfo/qhN7IfFUMb+/r2as/EIep+c14/5M+ioEdecitSMCP9bhHjP
         l+Wg==
Sender: Guenter Roeck <groeck7@gmail.com>
Content-Disposition: inline
In-Reply-To: <20220818092059.103884-1-linus.walleij@linaro.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>, linux-arch@vger.kernel.org

On Thu, Aug 18, 2022 at 11:20:59AM +0200, Linus Walleij wrote:
> This enables the alpha to use <asm-generic/io.h> to fill in the
> missing (undefined) I/O accessor functions.
> 
> This is needed if Alpha ever wants to uses CONFIG_REGMAP_MMIO
> which has been patches to use accelerated _noinc accessors
> such as readsq/writesq that Alpha, while being a 64bit platform,
> as of now not yet provide. readq/writeq is however provided
> so the machine can do 64bit I/O.
> 
> This comes with the requirement that everything the architecture
> already provides needs to be defined, rather than just being,
> say, static inline functions.
> 
> Bite the bullet and just provide the definitions and make it work.
> 
> Alternative approaches:
> 
> - Implement proper readsq/writesq inline accessors for alpha
> - Rewrite the whole world of io.h to use something like __weak
>   instead of relying on defines
> - Leave regmap MMIO broken on Alpha because none of its drivers
>   use it
> - Make regmap MMIO depend of !ARCH_ALPHA
> 
> The latter seems a bit over the top. First option to implement
> readsq/writesq seems possible but I cannot test it (no hardware)
> so using the generic fallbacks seems like a better idea, also in
> general that will provide future defaults for accelerated defines.
> 
> Leaving regmap MMIO broken or disabling it for Alpha feels bad
> because it breaks compiler coverage.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/linux-mm/202208181447.G9FLcMkI-lkp@intel.com/
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-arch@vger.kernel.org
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

This patch results in the following build errors when trying to build
alpha:allmodconfig.

ERROR: modpost: "ioread64" [drivers/pci/switch/switchtec.ko] undefined!
ERROR: modpost: "ioread64" [drivers/net/ethernet/freescale/enetc/fsl-enetc.ko] undefined!
ERROR: modpost: "ioread64" [drivers/net/ethernet/freescale/enetc/fsl-enetc-vf.ko] undefined!
ERROR: modpost: "iowrite64" [drivers/net/ethernet/xilinx/xilinx_emac.ko] undefined!
ERROR: modpost: "iowrite64" [drivers/net/wwan/t7xx/mtk_t7xx.ko] undefined!
ERROR: modpost: "ioread64" [drivers/net/wwan/t7xx/mtk_t7xx.ko] undefined!
ERROR: modpost: "iowrite64" [drivers/firmware/arm_scmi/scmi-module.ko] undefined!
ERROR: modpost: "ioread64" [drivers/firmware/arm_scmi/scmi-module.ko] undefined!
ERROR: modpost: "iowrite64" [drivers/vfio/pci/vfio-pci-core.ko] undefined!
ERROR: modpost: "ioread64" [drivers/ntb/hw/mscc/ntb_hw_switchtec.ko] undefined!

Reverting it doesn't help because that just reintroduces the problem
that was supposed to be fixed by this patch.

Guenter
