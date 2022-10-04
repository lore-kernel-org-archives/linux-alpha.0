From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] alpha: Use generic <asm-generic/io.h>
Date: Tue, 4 Oct 2022 12:42:27 -0700
Message-ID: <57200020-c460-74ec-c786-9a2c16f4870e@roeck-us.net>
References: <20220818092059.103884-1-linus.walleij@linaro.org>
 <20221002224521.GA968453@roeck-us.net>
 <fd905ca5-fe0d-4cfb-a0d0-aea8af539cc7@app.fastmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=HpG5i02vmxe3dnsSL7vxsuxzal8c9ky/pIndry6A4cs=;
        b=hJcs4dlEb7BByvrgCfy9uPQh9LlR4GiVDIbolUzf4p6P20IwqIr9yJ7pvGcXrM8bru
         J9z6f4x8AnlFbo5w3rVHAYIF/qrvUx9rNM/9DM2JrYWA1+Utbbi7rNtqQ8uZE/768etO
         xEzuPqNICgQyZnbbc5UPLgPH2XSYtweENUJizJU60+KhjLBHwNUpDwYJP95E/hG9kvZr
         r6s/gqGxv16/0LDu0c9snGxj2BNDq+vEKxU2sziXYykWcZBYQCJ/4fjw657YOyDIt7h2
         g4sux0RMZY8/Be0j+/IGmLb8jZ2UaeydAI+kN4183nUvNVMPhwku9BKAtBvqoSM0RMZr
         zCxw==
Sender: Guenter Roeck <groeck7@gmail.com>
Content-Language: en-US
In-Reply-To: <fd905ca5-fe0d-4cfb-a0d0-aea8af539cc7@app.fastmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>

On 10/3/22 06:03, Arnd Bergmann wrote:
> On Mon, Oct 3, 2022, at 12:45 AM, Guenter Roeck wrote:
> 
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Link: https://lore.kernel.org/linux-mm/202208181447.G9FLcMkI-lkp@intel.com/
>>> Cc: Mark Brown <broonie@kernel.org>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
>>> Cc: Matt Turner <mattst88@gmail.com>
>>> Cc: linux-arch@vger.kernel.org
>>> Cc: linux-alpha@vger.kernel.org
>>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> This patch results in the following build errors when trying to build
>> alpha:allmodconfig.
>>
>> ERROR: modpost: "ioread64" [drivers/pci/switch/switchtec.ko] undefined!
>> ERROR: modpost: "ioread64"
>> [drivers/net/ethernet/freescale/enetc/fsl-enetc.ko] undefined!
>> ERROR: modpost: "ioread64"
>> [drivers/net/ethernet/freescale/enetc/fsl-enetc-vf.ko] undefined!
>> ERROR: modpost: "iowrite64"
>> [drivers/net/ethernet/xilinx/xilinx_emac.ko] undefined!
>> ERROR: modpost: "iowrite64" [drivers/net/wwan/t7xx/mtk_t7xx.ko]
>> undefined!
>> ERROR: modpost: "ioread64" [drivers/net/wwan/t7xx/mtk_t7xx.ko]
>> undefined!
>> ERROR: modpost: "iowrite64" [drivers/firmware/arm_scmi/scmi-module.ko]
>> undefined!
>> ERROR: modpost: "ioread64" [drivers/firmware/arm_scmi/scmi-module.ko]
>> undefined!
>> ERROR: modpost: "iowrite64" [drivers/vfio/pci/vfio-pci-core.ko]
>> undefined!
>> ERROR: modpost: "ioread64" [drivers/ntb/hw/mscc/ntb_hw_switchtec.ko]
>> undefined!
>>
>> Reverting it doesn't help because that just reintroduces the problem
>> that was supposed to be fixed by this patch.
> 
> Thanks for the report, I've now added this patch on top.
> 
> Matt, can you take a look if this look correct?
> 

Looks like something was missed. When building alpha:allnoconfig
in next-20221004:

Building alpha:allnoconfig ... failed
--------------
Error log:
<stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
arch/alpha/kernel/core_marvel.c:807:1: error: conflicting types for 'marvel_ioread8'; have 'unsigned int(const void *)'
   807 | marvel_ioread8(const void __iomem *xaddr)
       | ^~~~~~~~~~~~~~
In file included from arch/alpha/kernel/core_marvel.c:10:
arch/alpha/include/asm/core_marvel.h:335:11: note: previous declaration of 'marvel_ioread8' with type 'u8(const void *)' {aka 'unsigned char(const void *)'}
   335 | extern u8 marvel_ioread8(const void __iomem *);
       |           ^~~~~~~~~~~~~~

Guenter
