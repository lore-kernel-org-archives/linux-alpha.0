From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
Date: Thu, 18 Mar 2021 05:56:58 +0100
Message-ID: <20210318045706.200458-3-hch@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ide-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=X7OKeBpeJsVYeN75fiWMn3APZAz6LKeWLTmdnRzWAQU=; b=MZboMS9VCAPdmM3jfgg035iyh2
        NIC+xKdCCd5WNGiIkBZtEByphZU8i8+/nwY0kxyrTJBDoXw+bV/cD6lBDa0f+1AoU8924bPzoLDCB
        eKOSv4Eafp4lsqnF3nVhKBYR3MhDbahkUR0iiDtCT1d3tLYgs8CxgE+Q1PumSSFrOeEJBp56+JyRV
        qnA6z9ThJvmyGn4N7/ATH/CmL3ahlVhhQY8mcvA9wZU9iO3Ls3F+kQa4h9ZwduQ+s5psyPEaF0BeN
        +Kfu8bucxJkCwG0SmsrgbzqMbKWwZV+xoXMppl1c0MtoWFSZ99+iEpBexpZBBT2h1iT2lHm6sFZuO
        yZ6BElgA==;
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

footbridge_defconfig enables CONFIG_IDE but no actual host controller
driver, so just drop it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/configs/footbridge_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/footbridge_defconfig b/arch/arm/configs/footbridge_defconfig
index 3a7938f244e566..1fe60e0fcf2790 100644
--- a/arch/arm/configs/footbridge_defconfig
+++ b/arch/arm/configs/footbridge_defconfig
@@ -65,7 +65,6 @@ CONFIG_PARIDE_ON26=m
 CONFIG_BLK_DEV_LOOP=m
 CONFIG_BLK_DEV_NBD=m
 CONFIG_BLK_DEV_RAM=y
-CONFIG_IDE=y
 CONFIG_NETDEVICES=y
 CONFIG_NET_ETHERNET=y
 CONFIG_NET_VENDOR_3COM=y
-- 
2.30.1

