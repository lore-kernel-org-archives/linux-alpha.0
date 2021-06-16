From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 4/6] ARM: disable CONFIG_IDE in pxa_defconfig
Date: Wed, 16 Jun 2021 15:46:56 +0200
Message-ID: <20210616134658.1471835-5-hch@lst.de>
References: <20210616134658.1471835-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=Uuuw+EDFBfHtUMgcBMPNTshRzz5rBLJMAuak5V48lNU=; b=qaqnCkDXikQQBHKgCwgIp11kIy
        2ueiMB+Y0zbmFHTfaBG9LRfpZbgfNtkA5Q7qKMbXAOLHSSY9rsW3Wf85ytYrY4nIAB4If6RYEvWp6
        UV1NsPXMrvphdW/xoLmZw1vNDMgUPkrsGohQ9DQvqkNz9L06lyofIjHzEZskRnHLfOolctVu1R7J5
        zP6qO4qpbgevda75Lh/N7aJVVZODUeeRS9PJxHMBlRk3I16UwzgRQTMZ9Nhg3YndYXfnnw76+fWLe
        J+dDaT2q8blTLTXAIQcZ5q39iE094tXk6KQb7Q2DxP6L1t7g3NnUa9U2DXmuQTcO+8KtvXxgXIR5i
        dg29zMYQ==;
In-Reply-To: <20210616134658.1471835-1-hch@lst.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, Linus Torvalds <torvalds@linux-foundation.org>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org

pxa_defconfig already enables libata including the pata_pcmcia driver, so
drop the legacy ide driver and idecs host driver.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/configs/pxa_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 875a3c28a267..363f1b1b08e3 100644
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
2.30.2

