From: Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] alpha: defconfig: add necessary configs for boot testing
Date: Mon, 18 Jan 2021 11:20:29 +0000
Message-ID: <20210118112029.19894-1-clabbe@baylibre.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=/7fg9ZprR2DPa+4Jsl6UVEuZoNjc7tPVVMDh2sLrbZc=;
        b=MI82XlpW2CglNKbsqGQ0jQwpJcb1UJzgBvNOwn7KdkNCtge+NFANxEhnjPBQlo7rKn
         RZumD1IWmsu4r4KSxgFt86Ea68hXlGIZEFyXImQibURSrf6nVwg4MVIKBgrd6pA58DPy
         ioK7BZwc/0p9fRCQV5jWD+lb3lpVQF2YtqL9UJ1zZiYu9ju+L4PkDnBxF0xL2sM1NmFE
         RuXNZbBaDvJ4f7c486y6pjOZqu46jMiqYy+3Ceeaw65KAZtKkg4VGal+AjQqBpKBhI2O
         g+9wvfdA5hDX2pRzus41yCkN4xhAGKf/99lM7extU/rCBaDr7PIlX+0r2BSirxabAYfB
         7VHw==
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ink@jurassic.park.msu.ru, mattst88@gmail.com, rth@twiddle.net
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>

Gentoo's KernelCI will soon boot test alpha kernel and we need
CONFIG_DEVTMPFS=y to be set for that.
Note that CONFIG_DEVTMPFS=y is already necessary for lot of other
distribution/tools like recent udev/systemd.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/alpha/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/configs/defconfig b/arch/alpha/configs/defconfig
index 6293675db164..b52ed626ab55 100644
--- a/arch/alpha/configs/defconfig
+++ b/arch/alpha/configs/defconfig
@@ -72,3 +72,4 @@ CONFIG_DEBUG_INFO=y
 CONFIG_ALPHA_LEGACY_START_ADDRESS=y
 CONFIG_MATHEMU=y
 CONFIG_CRYPTO_HMAC=y
+CONFIG_DEVTMPFS=y
-- 
2.26.2

