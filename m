From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 5/6] alpha: Add line below declartion on line 287
Date: Tue, 15 Jul 2014 14:18:23 -0400
Message-ID: <1405448304-3724-5-git-send-email-xerofoify@gmail.com>
References: <1405448304-3724-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=08KfrHQxb9RTLUAMFjJCDheclNNX2TchPHQvRXyPDgs=;
        b=OYx4syuXHlAFwTxwcPFR7BJIq13wmtXL1Xy38iA4RtVv1EN48QuUcfMRprvl3TDXEc
         +srIazPKJkD0i9XxvBvu9uhs0qEAe10RMBrxnQbQ+raxbWX+kxHXuri1D/lMF6c9KjuV
         X+rEULM7eFL7xqpn/+WGZ6B6RDGHrKeK7Xqz5rh/VrqJX6n5XBS6TrMewuf8cLM6suXU
         2fiURRtx7bQC2am3Ux3iURYNqiY786KAqrPmh+38yI91vMXyFZZqJtrQ6Gko4zWvB7NB
         KH6r4LJWeygLEV/pXPDMK74RDxTT49zsHNsKakd6+Yg7BZhekw4bPbFiIpU4usBO0/Pg
         Kh5Q==
In-Reply-To: <1405448304-3724-1-git-send-email-xerofoify@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This patch adds a line before the declartion of asm_sp in order
to fix a checkpatch error I get when running it on this file.
---
 arch/alpha/boot/bootpz.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index 6dd34e4..6fc840d 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -285,6 +285,7 @@ start_kernel(void)
 	 */
 	static long nbytes;
 	static char envval[256] __attribute__((aligned(8)));
+
 	register unsigned long asm_sp asm("30");
 
 	SP_on_entry = asm_sp;
-- 
1.9.1

