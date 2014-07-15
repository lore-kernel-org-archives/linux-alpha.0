From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 5/5] alpha: Fix while statement
Date: Tue, 15 Jul 2014 15:18:10 -0400
Message-ID: <1405451890-6057-5-git-send-email-xerofoify@gmail.com>
References: <1405451890-6057-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gaD2hwCBsvqARGKC9ctVyExc5CPym2bXcUeP4nb78pw=;
        b=V+hphfS2GU6I17Zvl6uSLNe301SeTWujDjlEe3ORWG8Kdzbo8Wv9L6AY3cN+GqPlOL
         ZmG8Dp6as3sNQ7nKhahZEjX4FqQl9ms9BYojpj0/3qpeEcmfqmSGOfaxj53z2Ig9Zy+L
         gUXrEuZwWIXOFBqtRCIisnBnn+cAHZRo2yJNPsy/BFnynJf4ZT4lFPsT3qA5u/ifhzdq
         xXvqpDGkDISBusQ8wK2whRjtl1XqY5rVOEkIJj9TrhHzYpc5GVDixEs4OdXi+mPemyEl
         /dGqc4qFsc7hrXaHYk4jozSDmKerkRAGg+sf7mfM9CMPsQtKL2ne/MqqaivKNm0/pzDP
         RuIw==
In-Reply-To: <1405451890-6057-1-git-send-email-xerofoify@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This fixes the if statement on line 147 of misc.c to have parthesises
around itself removing a checkpatch error on this line.
---
 arch/alpha/boot/misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/boot/misc.c b/arch/alpha/boot/misc.c
index 886e469..56c3325 100644
--- a/arch/alpha/boot/misc.c
+++ b/arch/alpha/boot/misc.c
@@ -144,7 +144,7 @@ static void error(char *x)
 	puts(x);
 	puts("\n\n -- System halted");
 
-	while (1);
+	while{ (1); }
 	/* Halt */
 }
 
-- 
1.9.1
