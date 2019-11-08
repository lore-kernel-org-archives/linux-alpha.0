From: Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] alpha: __udiv_qrnnd should be exported
Date: Fri,  8 Nov 2019 15:36:08 +0000
Message-ID: <1573227368-32686-1-git-send-email-clabbe@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=9lMgRNG2cJGG8AVeRQHErI9Gl3XI9KK/U31d8R3ejsQ=;
        b=EWNepT2WAfQMuRY60vzjXFgqPnRfaJU3DzL/cj1ATfS4TGT6MpPVYa3DtzO31+GY9U
         vlzIMrIyyXu3srvKdjem8uigYtg+lTS+x/T92CG9/SBuSyIsS7RYo8uBBuyvyjfoLeWW
         yZqDgtQmGMf9uk3FfTgemAWGIAqlBkVUFBC42XPIuVhMbttBjDtbaKjx6ken+aS2hDMD
         tz0emFkFCXwHC3dp3nQrWR561uI8jBBybT0ovHdWIZ74nV7TVtQf94Vq7sJf1TXcxcv1
         OL3LyD1xu/P6yHHnz5cWE6OqYBXaE9mm3K3xUEzwELESrCEGVlic3EbtfcYcZn2x1NwQ
         ot0w==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ink@jurassic.park.msu.ru, mattst88@gmail.com, rth@twiddle.net
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>

When building an alpha kernel with mpi set as module, I hit this build
error:
ERROR: "__udiv_qrnnd" [lib/mpi/mpi.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:92: __modpost] Error 1
make[1]: *** [Makefile:1266: modules] Error 2

This is due to __udiv_qrnnd not exported.
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/alpha/math-emu/math.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/alpha/math-emu/math.c b/arch/alpha/math-emu/math.c
index d568cd9a3e43..5617ac0889b8 100644
--- a/arch/alpha/math-emu/math.c
+++ b/arch/alpha/math-emu/math.c
@@ -401,3 +401,5 @@ alpha_fp_emul_imprecise (struct pt_regs *regs, unsigned long write_mask)
 egress:
 	return si_code;
 }
+
+EXPORT_SYMBOL(__udiv_qrnnd);
-- 
2.23.0

