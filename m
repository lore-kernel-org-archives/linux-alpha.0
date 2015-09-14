From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 2/2] alpha: lib: export __delay
Date: Mon, 14 Sep 2015 17:19:29 +0530
Message-ID: <1442231369-27118-3-git-send-email-sudipm.mukherjee@gmail.com>
References: <1442231369-27118-1-git-send-email-sudipm.mukherjee@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xg+XMiHp433LaVv+ko1oopaNO7JfJA7yb3zeryhAlbA=;
        b=AOMvXWX9M0CSkEH4o4octzmOKzELJaCmMCk9m7TOrhKkPACWz0FA7HZLImKFOWjI6I
         3pcEKMlQUG+mkpPGDmNKy+xKLyV+TzASGExtSTblzTuAy5rViNjj4yJ7bziUHIKMQC5t
         ED3SNgA1KvGYNvkwx9jR4oB6m9JDoIjyyz5t+aiQ8rNN9qO3S6/SDgHn9gM1H0n9Tx1R
         CREmi6XvOmrEcdndfl9L0FmlSAVu8DjznYHMe7aFQ4Xt21BKCcYyUCxDLwQAgJEh6qUE
         KkYnVayCxceNcxDBuURmtCGJCBXe/v/FQHNyNvRb+lnfh/5H/FaZLAsSq2qUKhO+scCW
         yxoA==
In-Reply-To: <1442231369-27118-1-git-send-email-sudipm.mukherjee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>

__delay was not exported as a result while building with allmodconfig we
were getting build error of undefined symbol. __delay is being used by:
drivers/net/phy/mdio-octeon.c

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---
 arch/alpha/lib/udelay.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/lib/udelay.c b/arch/alpha/lib/udelay.c
index 69d52aa..f2d81ff 100644
--- a/arch/alpha/lib/udelay.c
+++ b/arch/alpha/lib/udelay.c
@@ -30,6 +30,7 @@ __delay(int loops)
 		"	bgt %0,1b"
 		: "=&r" (tmp), "=r" (loops) : "1"(loops));
 }
+EXPORT_SYMBOL(__delay);
 
 #ifdef CONFIG_SMP
 #define LPJ	 cpu_data[smp_processor_id()].loops_per_jiffy
-- 
1.9.1
