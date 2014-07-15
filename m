From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 3/5] alpha: Remove whitespace errors that cleanfile missed
Date: Tue, 15 Jul 2014 15:18:08 -0400
Message-ID: <1405451890-6057-3-git-send-email-xerofoify@gmail.com>
References: <1405451890-6057-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=03C4zdBLyqNITMSJ02aF1qVp+pP1tl/C/gSc5j4Yql8=;
        b=V6/7y7eU2NNwD9LbM8W6BydOo5ENMXi3Z11DT1UyaOhv3K5pQbqZWw99muD9Fhdf8K
         CO0kGKYJYayiITmJ9niBnea1hltDjxkl3lvW8x0xiW+7Dzc0soYeSMlNqFF9/6R5l/q5
         iWRMiForv47f2buIgf0YXG6Smn9LMSTdvGIGGaneBpQ8Ood1f+8MvmK3sbojr//2s1SL
         ovxiAhsvJ0EIdhWewj/gwg9mqu99c5gJ4PWuPuOXONbfgw0TiV3Vm5Vn7fr+KAYkuSM6
         DEjl2xYgsCn1KNVW1vrNwCZwF8DTaCw4YorOyraRpRAsZAyaMAkWjtcU7dGJc73xT6to
         8UTw==
In-Reply-To: <1405451890-6057-1-git-send-email-xerofoify@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This patch removes the whitespace error that cleanfile missed when
I ran it on this file.
---
 arch/alpha/boot/misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/boot/misc.c b/arch/alpha/boot/misc.c
index 119d500..174b7c6 100644
--- a/arch/alpha/boot/misc.c
+++ b/arch/alpha/boot/misc.c
@@ -144,7 +144,7 @@ static void error(char *x)
 	puts(x);
 	puts("\n\n -- System halted");
 
-	while (1);	
+	while (1);
 	/* Halt */
 }
 
-- 
1.9.1

