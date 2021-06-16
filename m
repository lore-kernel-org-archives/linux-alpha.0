From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 3/6] ARM: disable CONFIG_IDE in footbridge_defconfig
Date: Wed, 16 Jun 2021 15:46:55 +0200
Message-ID: <20210616134658.1471835-4-hch@lst.de>
References: <20210616134658.1471835-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=FMWvGRuwohYEWT60Xs3SNXFuVN9yohix5OohuODqhyc=; b=br6x+NzkKsABPjh4jOMQRt+Zjs
        gkdBwBVrSRYcH9YV1BCMRs6gxXgSvR4t+dk0VfWfxUcx2En6qoLLVbtkpsJIn8zYOSX5MaFnlf+AC
        s4BYfkNSUFiHCLm3ZcCww+RvneOVfXyAfuLBX8amyd9zZemo0reYeT2uJr9azat6P9I9CsNHEEdDZ
        CmwHfSySJeALbsd4d3uhC5pUpUHCINLOSsFRnpY5MZElh0Sb9XXS+5tAA1bhHNBsOeGDIaPOD+Rid
        n5k0mgTuzhGTEIpQR22LwdrLS1wcqaP8RQrmNjGMsTfgGhT6EX79eRjnXHZhxYh+/Ozc7L4iXfFCL
        EWgrOXcA==;
In-Reply-To: <20210616134658.1471835-1-hch@lst.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, Linus Torvalds <torvalds@linux-foundation.org>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org

footbridge_defconfig enables CONFIG_IDE but no actual host controller
driver, so just drop it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/configs/footbridge_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/footbridge_defconfig b/arch/arm/configs/footbridge_defconfig
index 2aa3ebeb89d7..7a32de51f0fa 100644
--- a/arch/arm/configs/footbridge_defconfig
+++ b/arch/arm/configs/footbridge_defconfig
@@ -64,7 +64,6 @@ CONFIG_PARIDE_ON26=m
 CONFIG_BLK_DEV_LOOP=m
 CONFIG_BLK_DEV_NBD=m
 CONFIG_BLK_DEV_RAM=y
-CONFIG_IDE=y
 CONFIG_NETDEVICES=y
 CONFIG_NET_ETHERNET=y
 CONFIG_NET_VENDOR_3COM=y
-- 
2.30.2

