From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 01/10] alpha: use libata instead of the legacy ide driver
Date: Thu, 18 Mar 2021 05:56:57 +0100
Message-ID: <20210318045706.200458-2-hch@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=irMBtb7DVN+4DAt49ti86ySGojmNnEJPOicBjBj4cMY=; b=X95wITBpAeF+TpRKQnFFC7lKIj
 OQanKRWqqfl5U/Ln26avaZ6H2sYIRG2/CJKWq4WXKPVdZY+O3R2Y033lN7LGuxJhIcTpwkp9aDr4B
 FA9+IOOkxQ6k0hMvPrEVU7OwZ8T/M+JVdZjxCLw6lRUAZpqWD2Kbw8B/LFbj5eg+V9X9zhxGznL5J
 RLsSjSaUggUMbrarHqo8GPQm8xvT75w8ZfwuwgH3DZZHquSFYAEx6u8xFX1SiSCiO6tmjjI5xswqV
 oS9E5uQbvyCss4KBtY7eFDu3TpPAjR+sSEJ/qnsISz9WHtbenqaui2e39bz0LOxGquU/oTOJAu/Rb
 LE/p5Qng==;
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

Switch the alpha defconfig from the legacy ide driver to libata.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/alpha/configs/defconfig | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/alpha/configs/defconfig b/arch/alpha/configs/defconfig
index 724c4075df408e..dd2dd9f0861f18 100644
--- a/arch/alpha/configs/defconfig
+++ b/arch/alpha/configs/defconfig
@@ -25,19 +25,18 @@ CONFIG_PNP=y
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
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
 CONFIG_SCSI_AIC7XXX=m
 CONFIG_AIC7XXX_CMDS_PER_DEVICE=253
 # CONFIG_AIC7XXX_DEBUG_ENABLE is not set
+CONFIG_ATA=y
+# CONFIG_SATA_PMP is not set
+CONFIG_PATA_ALI=y
+CONFIG_PATA_CMD64X=y
+CONFIG_PATA_CYPRESS=y
+CONFIG_ATA_GENERIC=y
 CONFIG_NETDEVICES=y
 CONFIG_DUMMY=m
 CONFIG_NET_ETHERNET=y
-- 
2.30.1

