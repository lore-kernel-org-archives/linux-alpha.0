From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH] alpha: switch defconfig from the legacy ide driver to libata
Date: Thu, 24 Sep 2020 06:20:02 +0200
Message-ID: <20200924042002.521411-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=FcKdwf0I1J0dSJnjVNVYUAP29iwsDzFF5w1vapwwcAA=; b=vevxS8n1G81Umvz0FxewqlQIzC
        oTMh4mMU4Mo22Hmu1WM9gz5zRamGfnh7jaE+yzdhwO29+fkld3vCcxkNRW0JTamq7T/bNI22Aot5X
        MwzXTdfhH60Gs+5QCse5/YfmJh6rfYiZcxxlLVmN3VMpYLoOZN5/xtGV/0WcIGSGDip0ki/sQaLaM
        UVS2bLv9ljyJLEpPhw+F2QdPSnz/y5D/O/+NH56Tj4L2Mw67QkFeR3gaTUsvN/uQyfmzuYl6Dw+h0
        W7QFPFhvrY3yzNeaOu6iIVyBful2CKnQrPOLSNykhm9XcRnlOOERWJjiYQ+WuyObDx70GuIooyB6q
        3MIrcphA==;
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Switch from the soon to be removed legacy ide driver to libata.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/alpha/configs/defconfig | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/alpha/configs/defconfig b/arch/alpha/configs/defconfig
index 6293675db1644a..387174e2422f6b 100644
--- a/arch/alpha/configs/defconfig
+++ b/arch/alpha/configs/defconfig
@@ -26,13 +26,11 @@ CONFIG_PNP=y
 CONFIG_ISAPNP=y
 CONFIG_BLK_DEV_FD=y
 CONFIG_BLK_DEV_LOOP=m
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_ALI15X3=y
-CONFIG_BLK_DEV_CMD64X=y
-CONFIG_BLK_DEV_CY82C693=y
+CONFIG_ATA=y
+CONFIG_ATA_GENERIC=y
+CONFIG_PATA_ALI=y
+CONFIG_PATA_CMD64X=y
+CONFIG_PATA_CYPRESS=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
-- 
2.28.0

