From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 2/4] net: i825xx: Use absolute_pointer for memcpy from fixed memory location
Date: Tue, 14 Sep 2021 20:52:25 -0700
Message-ID: <20210915035227.630204-3-linux@roeck-us.net>
References: <20210915035227.630204-1-linux@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YbkO6eX3svmIKG5IOf3KbQnfzJzo05Zk/s9XsuhsdgM=;
        b=jkECE0ZRStw6Q+C2y91NLFDDGbMCo24+eUfO5W8Zf2UooRooEgR6+ccD826ws8BQOT
         egJP6pkgfrD8D/D6WBg4ybOgNN97BuF+ALm8IV7syJCNG23dtJrUQudCvZ2eBpar56cd
         eXOODyByiVqpceuqOrBtJivz6GOuicpHqM1jNQItDPt0BTo3c1gp+4LrFetDoRfKSbLp
         AZ5bmv7IwRLgfFKMSGwzJY4qpA3DTZ9o9t2d5Rm6WZI9XngbNVIHyBNwpuBO+ZWFWj9N
         1ZAu1KhTyBj+FCIZTl/sex87MzTpSA33dMlts9CowFJlanAOw1xGk1UY0jtyPWRXC59T
         rqZQ==
Sender: Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <20210915035227.630204-1-linux@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-sparse@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

gcc 11.x reports the following compiler warning/error.

drivers/net/ethernet/i825xx/82596.c: In function 'i82596_probe':
    ./arch/m68k/include/asm/string.h:72:25: error:
            '__builtin_memcpy' reading 6 bytes from a region of size 0
                    [-Werror=stringop-overread]

Use absolute_pointer() to work around the problem.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

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

