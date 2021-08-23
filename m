From: CGEL <cgel.zte@gmail.com>
Subject: [PATCH linux-next] alpha:smp: fix warning comparing pointer to 0
Date: Sun, 22 Aug 2021 18:49:08 -0700
Message-ID: <20210823014908.43982-1-jing.yangyang@zte.com.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kI6/jcFa5ErPZCczz8vBBWVQ0GOCghlyA75YU8iSdHY=;
        b=LeTbRY3rs3d5lKmbbfZhrfTRPBH+XrOYCUt6ZoDrB91yhBg6BDkRSn54h7cQaP8T3C
         yHTrpeZ8PO6p62ReqJjMRFn7uF0NWmgk2NMKA7XDGMB4nKDNL+De/OGBKZfwHGRVN4RE
         xd9iAUxEB1rPijyzjRSTxRvkLo6i6+b6At3lBu1MPvRK3oSjkecwc9iIcIG9bjmniZlU
         NKlKspnTTHttdLwjIEzKNjMqBx87MvMG03INJ8C/MPBZXmFO33nWl9x3KgvSVHpNe/tz
         FUdHgteSGcHQz1+Q5xHOfzXluHhHJjovvPOq0AXZgq9ZQkUwidfis9iPnV4xmGiixzeS
         +cXQ==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Jing Yangyang <jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>

From: Jing Yangyang <jing.yangyang@zte.com.cn>

Fix the following coccicheck warning:
./arch/alpha/kernel/smp.c:271:39-40:
WARNING:comparing pointer to 0

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
---
 arch/alpha/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index cb64e47..adc05c2 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -268,7 +268,7 @@ enum ipi_message_type {
 			memcpy(cp2, cp1, cnt);
 			cp2[cnt] = '\0';
 			
-			while ((cp2 = strchr(cp2, '\r')) != 0) {
+			while ((cp2 = strchr(cp2, '\r'))) {
 				*cp2 = ' ';
 				if (cp2[1] == '\n')
 					cp2[1] = ' ';
-- 
1.8.3.1


