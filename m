From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 09/10] m68k: use libata instead of the legacy ide driver
Date: Thu, 18 Mar 2021 05:57:05 +0100
Message-ID: <20210318045706.200458-10-hch@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ZwLwotB3kh/Ng3fVpJhH1YpMv+tnI82qlLtcss1Rdic=; b=Gz4KcM7fijZ9HnYE/1O9zLpm23
 FLRIlhRapQ3L6mImDyYDqogBRO1xih/55s5q8yrkAkUTIeCmS86c+NxO4lhmDFvK9KjHnXtkO68Ig
 xqNhSHQSIzlI/oCcjiizOUaosVV6iMLxCr9guT4ETAKBEFz/vuNYcJ1iNtADBtlzZ8WV0CAYsN+lI
 eWplMrkTksgJ4TabNxfYRosgEmWvMPDRVrT3lZTlZqDvLz416mPMUaz4FipJMmnokO0TuR+wPC5Jb
 MU6MLo1F0xIN2GGlunb1lcUcQVIxF6a2e/1SB1KjOa3c6kc2dd/FKiQhKpUPj2VA79iQ7B2xAyXef
 1ldvEoGg==;
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>

Switch the m68 defconfigs from the deprecated ide subsystem to use libata
instead.  The gayle and buddha and falcon drivers are enabled for libata,
while support for the q40 and macide drivers is lost.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/configs/amiga_defconfig | 10 +++++-----
 arch/m68k/configs/atari_defconfig |  8 ++++----
 arch/m68k/configs/mac_defconfig   |  5 -----
 arch/m68k/configs/multi_defconfig | 15 ++++++---------
 arch/m68k/configs/q40_defconfig   |  4 ----
 5 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 786656090c5029..fba7275de0fb5f 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -323,11 +323,6 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_CDROM_PKTCDVD=m
 CONFIG_ATA_OVER_ETH=m
 CONFIG_DUMMY_IRQ=m
-CONFIG_IDE=y
-CONFIG_IDE_GD_ATAPI=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_GAYLE=y
-CONFIG_BLK_DEV_BUDDHA=y
 CONFIG_RAID_ATTRS=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
@@ -344,6 +339,11 @@ CONFIG_GVP11_SCSI=y
 CONFIG_SCSI_A4000T=y
 CONFIG_SCSI_ZORRO7XX=y
 CONFIG_SCSI_ZORRO_ESP=y
+CONFIG_ATA=y
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_ATA_BMDMA is not set
+CONFIG_PATA_GAYLE=y
+CONFIG_PATA_BUDDHA=y
 CONFIG_MD=y
 CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 413232626d9d57..235d038be94444 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -324,10 +324,6 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_CDROM_PKTCDVD=m
 CONFIG_ATA_OVER_ETH=m
 CONFIG_DUMMY_IRQ=m
-CONFIG_IDE=y
-CONFIG_IDE_GD_ATAPI=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_FALCON_IDE=y
 CONFIG_RAID_ATTRS=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
@@ -339,6 +335,10 @@ CONFIG_SCSI_SAS_ATTRS=m
 CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_ATARI_SCSI=y
+CONFIG_ATA=y
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_ATA_BMDMA is not set
+CONFIG_PATA_FALCON=y
 CONFIG_MD=y
 CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index bf15e6c1c939bb..cc92cc4601cb1f 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -315,11 +315,6 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_CDROM_PKTCDVD=m
 CONFIG_ATA_OVER_ETH=m
 CONFIG_DUMMY_IRQ=m
-CONFIG_IDE=y
-CONFIG_IDE_GD_ATAPI=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_PLATFORM=y
-CONFIG_BLK_DEV_MAC_IDE=y
 CONFIG_RAID_ATTRS=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 5466d48fcd9d51..9be9f2ad4ddb84 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -344,15 +344,6 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_CDROM_PKTCDVD=m
 CONFIG_ATA_OVER_ETH=m
 CONFIG_DUMMY_IRQ=m
-CONFIG_IDE=y
-CONFIG_IDE_GD_ATAPI=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_PLATFORM=y
-CONFIG_BLK_DEV_GAYLE=y
-CONFIG_BLK_DEV_BUDDHA=y
-CONFIG_BLK_DEV_FALCON_IDE=y
-CONFIG_BLK_DEV_MAC_IDE=y
-CONFIG_BLK_DEV_Q40IDE=y
 CONFIG_RAID_ATTRS=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
@@ -376,6 +367,12 @@ CONFIG_MVME147_SCSI=y
 CONFIG_MVME16x_SCSI=y
 CONFIG_BVME6000_SCSI=y
 CONFIG_SUN3X_ESP=y
+CONFIG_ATA=y
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_ATA_BMDMA is not set
+CONFIG_PATA_FALCON=y
+CONFIG_PATA_GAYLE=y
+CONFIG_PATA_BUDDHA=y
 CONFIG_MD=y
 CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 3ae421cb24a439..ac35e448b1c58f 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -314,10 +314,6 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_CDROM_PKTCDVD=m
 CONFIG_ATA_OVER_ETH=m
 CONFIG_DUMMY_IRQ=m
-CONFIG_IDE=y
-CONFIG_IDE_GD_ATAPI=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_Q40IDE=y
 CONFIG_RAID_ATTRS=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
-- 
2.30.1

