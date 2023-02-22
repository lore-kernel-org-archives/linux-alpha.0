From: Randy Dunlap <rdunlap@infradead.org>
Subject: Alpha MTD_TSUNAMI BROKEN?
Date: Tue, 21 Feb 2023 21:37:21 -0800
Message-ID: <4da501dc-65af-ee89-441d-d3ef8867c64d@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:Subject:Cc:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=ZaFQaEhC0Y47Z5XC2rGkKe6thR+pRJg3kA0++NA4kj8=; b=M5MP3jm2Abz0PZrxM7dbWT6KFB
        5pIFqTaSP9PmHSBwS/DNAs2MCC9T4cYX+SaaJsCJt3UXP+K2cFpWypNYcdk7KgCm0oZ2YpvRZKr/h
        VQElFyvXIioD2mpimnR7tho3uudnoym/OX4YYNe0pSLLLN05ujXhjVaKFQgcMoGlFL8PqItOpW5+M
        ipStejeY0bNEo7pbWYz7gXeO3AQIArnjLfDQKA87zCxNok1MKKfaHmOQgvfWDsq4STeo2lKiI8CxI
        apofzYhGOadkilyfo5t8rZILu7fvuLJtvv/W+7SXEHwSaryDf09HnveRu8RJBiMnp4R8yrHMqHOtH
        qY6OOOlA==;
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

In an alpha kernel config with CONFIG_ALPHA_TSUNAMI=y
and CONFIG_MTD_TSUNAMI=y, the MTD driver build fails with:

../drivers/mtd/maps/tsunami_flash.c: In function 'tsunami_flash_read8':
../drivers/mtd/maps/tsunami_flash.c:21:20: error: implicit declaration of function 'tsunami_tig_readb'; did you mean 'tsunami_readb'? [-Werror=implicit-function-declaration]
   21 |         val.x[0] = tsunami_tig_readb(offset);
      |                    ^~~~~~~~~~~~~~~~~
      |                    tsunami_readb
../drivers/mtd/maps/tsunami_flash.c: In function 'tsunami_flash_write8':
../drivers/mtd/maps/tsunami_flash.c:27:9: error: implicit declaration of function 'tsunami_tig_writeb'; did you mean 'tsunami_writeb'? [-Werror=implicit-function-declaration]
   27 |         tsunami_tig_writeb(value.x[0], offset);
      |         ^~~~~~~~~~~~~~~~~~
      |         tsunami_writeb


The tsunami_tig_{readb,writeb{}() functions are completely missing.
I don't see any macros that would generate such function names.

I have searched both kernel/git/history/history.git and
kernel/git/mpe/linux-fullhistory.git (both at git.kernel.org)
and found no such functions. (It's possible that I could have
missed something here: all I did was 'git grep tsunami_tig'.
Do I need to do 'git checkout <something really old>' first?)

Should these functions just be tsunami_readb() and tsunami_writeb()
like the compiler asks?
Or should we mark this driver as BROKEN?

Thanks.
-- 
~Randy
