From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 03/10] ARM: disable CONFIG_IDE in pxa_defconfig
Date: Thu, 18 Mar 2021 05:56:59 +0100
Message-ID: <20210318045706.200458-4-hch@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=XEzjoFaNLLzmVwwbnoy2Bul8yVzxins+1j9osZi/Pvo=; b=hNLYS6B20vnw5ApBEcCoV8gBs/
        U3iimCh4WdMAg+a8JX3jlBt/oK3auUbK9TlCE/iZq6tMxlcOHdWejcsrcI94trVU49pHWy7w68AM3
        2I4kmi5MFwcQ/vPp5fLI923OhE2qUxbJ/IpWZN9CYuuu3RP44KZPg7+HZUvZLGXKoom3c0fMABmlw
        EUrx6cqyd+PZsNsj5FuUSk6ilNDn6BdoeA3RleyBQdbSdXAwg0RmpWK606K3RdfWqMLeM+geVUBX0
        wUdrZbOn87+880UpFP/KuoSzihVYHUMUaP0lEF8L1LbenliEjDmcUqiC8+cyJ9ZuHR5khI9CXG+I2
        jHZgSDfQ==;
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

pxa_defconfig already enables libata including the pata_pcmcia driver, so
drop the legacy ide driver and idecs host driver.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/configs/pxa_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index bd7dd81c9c5441..c82b8a1d6e84f6 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -215,8 +215,6 @@ CONFIG_IIO=m
 CONFIG_AD5446=m
 CONFIG_EEPROM_AT24=m
 CONFIG_SENSORS_LIS3_SPI=m
-CONFIG_IDE=m
-CONFIG_BLK_DEV_IDECS=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=m
 CONFIG_CHR_DEV_ST=m
-- 
2.30.1

