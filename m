From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] alpha: update config files
Date: Thu, 29 Sep 2022 12:13:29 +0200
Message-ID: <20220929101329.31036-1-lukas.bulwahn@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=+1jb+nfNrrfT47twFWxXKdVM9Wqmz0pwBbN3bVcD7Sc=;
        b=RMlq4j0v9c9V68QmGp8qPZAxlNF0r+I8ps9TEAfWeSlPwqYQmFZOHMNm9WKzaZpiqP
         BUIhBp8izAt+eC5a4STiG0cb+/G7vOoeb0iyb2Kc6HXq+NQ7fsfD3meT+CNgHhFWM89i
         wPpn6fiZC9ftYmg1ZuNZ2V5Bb260mXiEg6zuV/iSW0KpUXVX8UCOE/fj6PpAGFm3qRyb
         PjzHirM3LoRUVT1kiX87w9n0TzKpEnR0zqVwtve1amKwIDotfT2hVPcF3Z44+WAteO3u
         +M3stm9d/ZbwwsJ2ePE0FIy16K8mjCNT8L8Gm2+tR73iP6wUUoZhfVTTXna89fl+DPe8
         j7Zg==
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Clean up config files by:
  - removing configs that were deleted in the past
  - removing configs not in tree and without recently pending patches
  - adding new configs that are replacements for old configs in the file

For some detailed information, see Link.

Link: https://lore.kernel.org/kernel-janitors/20220929090645.1389-1-lukas.bulwahn@gmail.com/

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/alpha/configs/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/configs/defconfig b/arch/alpha/configs/defconfig
index 6a39fe8ce9e5..1816c1dc22b1 100644
--- a/arch/alpha/configs/defconfig
+++ b/arch/alpha/configs/defconfig
@@ -39,14 +39,12 @@ CONFIG_PATA_CYPRESS=y
 CONFIG_ATA_GENERIC=y
 CONFIG_NETDEVICES=y
 CONFIG_DUMMY=m
-CONFIG_NET_ETHERNET=y
 CONFIG_NET_VENDOR_3COM=y
 CONFIG_VORTEX=y
 CONFIG_NET_TULIP=y
 CONFIG_DE2104X=m
 CONFIG_TULIP=y
 CONFIG_TULIP_MMIO=y
-CONFIG_NET_PCI=y
 CONFIG_YELLOWFIN=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
-- 
2.17.1

