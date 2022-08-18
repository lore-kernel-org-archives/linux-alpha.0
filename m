From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Subject: build failure of next-20220818 due to 81c0386c1376 ("regmap: mmio:
 Support accelerared noinc operations")
Date: Thu, 18 Aug 2022 12:24:54 +0100
Message-ID: <Yv4hhoTTcRuk/2Kl@debian>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc;
        bh=BfkpuYhWWV3z0UBvbVgMJJbzhNR8JpIXBKTTsE8aT90=;
        b=BCcruAbNhnvE2FO99nIU8oKrInNU391CRjvwpRjdMG2qMb6mV59maUjV62qGUUrS6J
         9AifLDn8+lcaxSN81r3KI1uSfEPhNc1k70FxPAXW2+XQhz/47iRXEpte3XuRdMbgSbxm
         S/2XoFcC73UyKVyjEmZKElU7CFEMryxk8V4xtiyy87hgW7/tUUEL3mvs2IxmzKLBAWDX
         bPJDMmjRZlAeEZNVp2+3qBp4Pqn7tVn/Ecm9ZqlwrNnCWXRtCgui9aUCkN7KbnOpjHQp
         U9hElOPmPJSbh4hT6CQ1LDtzMVLQy77Al5y2UQChm1IfzWh0avE3TxmuCDy2/ay6IWiR
         pJtQ==
Content-Disposition: inline
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

Hi All,

Not sure if it has been reported, builds of alpha allmodconfig have
failed to build next-20220818 with the error:

drivers/base/regmap/regmap-mmio.c: In function 'regmap_mmio_noinc_write':
drivers/base/regmap/regmap-mmio.c:221:17: error: implicit declaration of function 'writesb'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
  221 |                 writesb(ctx->regs + reg, (const u8 *)val, val_count);
      |                 ^~~~~~~
      |                 writeb
drivers/base/regmap/regmap-mmio.c:224:17: error: implicit declaration of function 'writesw'; did you mean 'writew'? [-Werror=implicit-function-declaration]
  224 |                 writesw(ctx->regs + reg, (const u16 *)val, val_count);
      |                 ^~~~~~~
      |                 writew
drivers/base/regmap/regmap-mmio.c:227:17: error: implicit declaration of function 'writesl'; did you mean 'writel'? [-Werror=implicit-function-declaration]
  227 |                 writesl(ctx->regs + reg, (const u32 *)val, val_count);
      |                 ^~~~~~~
      |                 writel
drivers/base/regmap/regmap-mmio.c:231:17: error: implicit declaration of function 'writesq'; did you mean 'writeq'? [-Werror=implicit-function-declaration]
  231 |                 writesq(ctx->regs + reg, (const u64 *)val, val_count);
      |                 ^~~~~~~
      |                 writeq
drivers/base/regmap/regmap-mmio.c: In function 'regmap_mmio_noinc_read':
drivers/base/regmap/regmap-mmio.c:358:17: error: implicit declaration of function 'readsb'; did you mean 'readb'? [-Werror=implicit-function-declaration]
  358 |                 readsb(ctx->regs + reg, (u8 *)val, val_count);
      |                 ^~~~~~
      |                 readb
drivers/base/regmap/regmap-mmio.c:361:17: error: implicit declaration of function 'readsw'; did you mean 'readw'? [-Werror=implicit-function-declaration]
  361 |                 readsw(ctx->regs + reg, (u16 *)val, val_count);
      |                 ^~~~~~
      |                 readw
drivers/base/regmap/regmap-mmio.c:364:17: error: implicit declaration of function 'readsl'; did you mean 'readl'? [-Werror=implicit-function-declaration]
  364 |                 readsl(ctx->regs + reg, (u32 *)val, val_count);
      |                 ^~~~~~
      |                 readl
drivers/base/regmap/regmap-mmio.c:368:17: error: implicit declaration of function 'readsq'; did you mean 'readq'? [-Werror=implicit-function-declaration]
  368 |                 readsq(ctx->regs + reg, (u64 *)val, val_count);
      |                 ^~~~~~
      |                 readq


git bisect pointed to 81c0386c1376 ("regmap: mmio: Support accelerared noinc operations")
And, reverting that commit has fixed the build failure.

I will be happy to test any patch or provide any extra log if needed.


--
Regards
Sudip
