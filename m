From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH REPOST] alpha: Replace bogus in_interrupt()
Date: Fri, 13 Nov 2020 14:58:32 +0100
Message-ID: <20201113135832.2202833-1-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1605275936;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=EZhSayfqxE7+4WBi7Yr4R7OIt/65UMzRbKl6hPnLhbo=;
        b=gpN0qtIYKe/PBfD9Z+KsYfzQbtP6hm67X9ye0cKjdhtdS/3maqLxs5bgSJ0raIsVTo4dWy
        0Q/iYSoV+hJWMN87q26Xr/oHRohTUAOFGohKXy7nNfM0194KiBFCf+XU2mJxxCXtxXFn26
        EdnlbfAl33E3+wB7nx4cBDMbrrYSz6w/tId+tA54B2rsw8qiBi3hVrTW4ckeFwjT/8eEWr
        wqkxP0IvLUBq/ErMKa6tTV0DRja76R3paSs/iUEwmH7JBJroSLv+sJSLxz2B+hQf9IXrn6
        KiIdevq2FFhL3AM9DMZS3J3rIWZT4KwixMK+ShBexNdfSyzH9LWCj/H4k68h8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1605275936;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=EZhSayfqxE7+4WBi7Yr4R7OIt/65UMzRbKl6hPnLhbo=;
        b=QL/WeNSE6zWxHN2bUJELqaWk0wwnQeoBd8RtUT9ECb7zTuB9/yrouN9+wN8ayuJijkpkoR
        DeqaIzz8sUuQhtDQ==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

From: Thomas Gleixner <tglx@linutronix.de>

in_interrupt() is true for a variety of things including bottom half
disabled regions. Deducing hard interrupt context from it is dubious at
best.

Use in_irq() which is true if called in hard interrupt context. Otherwise
calling irq_exit() would do more harm than good.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-alpha@vger.kernel.org
---
Repost of
   https://www.spinics.net/lists/linux-alpha/msg06721.html

 arch/alpha/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 7462a79110024..1589467e75282 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -134,7 +134,7 @@ common_shutdown_1(void *generic_ptr)
 #ifdef CONFIG_DUMMY_CONSOLE
 		/* If we've gotten here after SysRq-b, leave interrupt
 		   context before taking over the console. */
-		if (in_interrupt())
+		if (in_irq())
 			irq_exit();
 		/* This has the effect of resetting the VGA video origin.  */
 		console_lock();
--=20
2.29.2

