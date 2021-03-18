From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 07/10] MIPS: disable CONFIG_IDE in bigsur_defconfig
Date: Thu, 18 Mar 2021 05:57:03 +0100
Message-ID: <20210318045706.200458-8-hch@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=D+S8wlSiI4RJjZ5iJm2sxYRqVVY2Unydlyni8O7HV7o=; b=pzJ0Yf2lHvDqADXeBYbA1uMzpD
        I6mDgP2SEN/7rGW4D7M0Ki28esLEuHEzgcaB+m4I0HZb9ICnfb8uKmfHkgbct9yI3HZpieLHqlQEh
        8ZbEn5zQGPKudyNhU8V8cHI31vqq6hKIZ1nqgkPeMR1uuWM6Oxoidcm4R8IxXu0YYrCico+vv8b0e
        k+rwed8gxoGnWEhv0Hg3mbM4FuSQJxw8Qo8gIeaBe+lgf/aXSBWdZLIDAFI/vcihYht+9pWlSAmEG
        4Th3oOBd6lEMeB1Lb+YDe+H2jNV89dT/d7RDozI5Gdo0MLhPGOE1hDuCpQQpdvquZpbflKIZbTYYf
        bGwozUuw==;
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

bigsur_defconfig enables CONFIG_IDE for the tc86c001 ide driver, which
is a Toshiba plug in card that does not make much sense to use on bigsur
platforms.  For all other ATA cards libata support is already enabled.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/configs/bigsur_defconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/configs/bigsur_defconfig b/arch/mips/configs/bigsur_defconfig
index eea9b613bb7402..d83e7d600b0a56 100644
--- a/arch/mips/configs/bigsur_defconfig
+++ b/arch/mips/configs/bigsur_defconfig
@@ -105,10 +105,6 @@ CONFIG_BLK_DEV_CRYPTOLOOP=m
 CONFIG_BLK_DEV_NBD=m
 CONFIG_EEPROM_LEGACY=y
 CONFIG_EEPROM_MAX6875=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_IDETAPE=y
-CONFIG_BLK_DEV_TC86C001=m
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_ST=y
 CONFIG_BLK_DEV_SR=y
-- 
2.30.1

