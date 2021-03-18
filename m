From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 06/10] MIPS: disable CONFIG_IDE in rbtx49xx_defconfig
Date: Thu, 18 Mar 2021 05:57:02 +0100
Message-ID: <20210318045706.200458-7-hch@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=mqH6KDuSstLwS39mT0ePczEWX69vnztcqDBkxHzfniM=; b=XBg+7ubmm0t37QrQPz2c/WBvY8
        dtC3YDhxAjwUy5cpxnsuc7SSgT2hSLYEPvDEojx3Tu9mcNdlsPGRRKAG2Tbh6jwi43kGQuQdkFVrf
        WY+HgMNS+eg1fSCzaFR0We3k2NYO1O0rjRgFE+xXDAHiUH+5U+3QchcrRtvl/teL5iBosG83fzId1
        XpnaIH/FG+me/vASAybRjn/xx98rhf8RnRJLIKEIEZS5pmNb+2bS0TvfQvwLuhO4nO7RIKbq1vDfO
        BdEkIYSSJMqaM6ClR+wYqkb3IF3hYlVaURNyWrZlUIyhSktoDyaacNTD4I+eu9iJ1Wrd2PfjQJaGh
        0F8gRMlg==;
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

rbtx49xx_defconfig enables CONFIG_IDE for the tx4938 and tx4939 ide
drivers, but those aren't actually used by the last known remaining user:

https://lore.kernel.org/lkml/20210107.101729.1936921832901251107.anemo@mba.ocn.ne.jp/

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/configs/rbtx49xx_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/configs/rbtx49xx_defconfig b/arch/mips/configs/rbtx49xx_defconfig
index 5e389db35fa746..69f2300107f961 100644
--- a/arch/mips/configs/rbtx49xx_defconfig
+++ b/arch/mips/configs/rbtx49xx_defconfig
@@ -44,9 +44,6 @@ CONFIG_MTD_NAND_TXX9NDFMC=m
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDE_TX4938=y
-CONFIG_BLK_DEV_IDE_TX4939=y
 CONFIG_NETDEVICES=y
 CONFIG_NE2000=y
 CONFIG_SMC91X=y
-- 
2.30.1

