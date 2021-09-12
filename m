From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/4] net: i825xx: Use absolute_pointer for memcpy on fixed memory location
Date: Sun, 12 Sep 2021 09:01:47 -0700
Message-ID: <20210912160149.2227137-3-linux@roeck-us.net>
References: <20210912160149.2227137-1-linux@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tyfgbpEWB0om8tzf9mpCL7ZcoNm2ky582Pji67hHRFQ=;
        b=FipBo31bo4Y9wn2cwKQRxkhXZxLWCn+R45DcIskkVp75c1TgMGyjogwJwyZOXFC4tv
         stoxC1TbwWGQ+SVkngtXViHocHoaVTtD2BBYiJPvDjNTybowvZ5OzMJ0BvcZBw1tSFVV
         WvuF8X0N5/D8+gT4APANqLNRhq+59UrNncv3vpGQBPma8SCO7gYwVE6iGXjpUZDSx5LK
         Mrre1qNJSrKUOp7Bz8xYEI5VjP5yPoQFMHyY65D1co3w7stKAEc0MHHesMO+X31r8VOS
         nbGd99VOHdmPbZHJyPppMEZ1X8zmprSmHfblrUwwAkfgGe5JEZF/CJPrdQSQaVVyJAYv
         OeTg==
Sender: Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <20210912160149.2227137-1-linux@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-sparse@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

gcc 11.x reports the following compiler warning/error.

drivers/net/ethernet/i825xx/82596.c: In function 'i82596_probe':
    ./arch/m68k/include/asm/string.h:72:25: error:
            '__builtin_memcpy' reading 6 bytes from a region of size 0
                    [-Werror=stringop-overread]

Use absolute_address() to work around the problem.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/net/ethernet/i825xx/82596.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/i825xx/82596.c b/drivers/net/ethernet/i825xx/82596.c
index b8a40146b895..b482f6f633bd 100644
--- a/drivers/net/ethernet/i825xx/82596.c
+++ b/drivers/net/ethernet/i825xx/82596.c
@@ -1144,7 +1144,7 @@ static struct net_device * __init i82596_probe(void)
 			err = -ENODEV;
 			goto out;
 		}
-		memcpy(eth_addr, (void *) 0xfffc1f2c, ETH_ALEN);	/* YUCK! Get addr from NOVRAM */
+		memcpy(eth_addr, absolute_pointer(0xfffc1f2c), ETH_ALEN); /* YUCK! Get addr from NOVRAM */
 		dev->base_addr = MVME_I596_BASE;
 		dev->irq = (unsigned) MVME16x_IRQ_I596;
 		goto found;
-- 
2.33.0

