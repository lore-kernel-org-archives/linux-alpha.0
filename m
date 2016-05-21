From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0063/1529] Fix typo
Date: Sat, 21 May 2016 13:45:13 +0200
Message-ID: <20160521114513.2344-1-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=hkG+hN9lX3T1N6qf5jrwdcnfm7MIo5hfOC4Bk6Jeos8=;
        b=R0j2o8Jw2V07c8JYU/wsGYuOlAdUCI5l8Yt9Uhps08CLiiIQUcu7PV4VRsOORR/gVk
         3vzxi3YLcMEND9gk60EthAEEeif3iYeoz/zO0XbPMrlHbvwG+hKT1ggYJ5HXNLPyw3Tc
         lUBT5WI5NzzIjMjQUnwJ/++p4JBwOqA3P8TJHFHQcqRwLiT7xeUgSWYnk/Y8Sd/f0bIf
         J2zJ/0nFMtTFdmUiMSk/jCopCN10NTP+Ac6mqTgu6dCqMRqN14yLGW7FgglwVuK1aXF5
         AqiIKyG2WWvvRkBdhEKxxrJwyGvzXPL2JMXLCkgaH5t61SeWzFV3d0XD4Iu/qxuAz+cB
         XBcw==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/include/asm/fpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/fpu.h b/arch/alpha/include/asm/fpu.h
index 71c2095..1da4f8c 100644
--- a/arch/alpha/include/asm/fpu.h
+++ b/arch/alpha/include/asm/fpu.h
@@ -59,7 +59,7 @@ static inline unsigned long
 swcr_update_status(unsigned long swcr, unsigned long fpcr)
 {
 	/* EV6 implements most of the bits in hardware.  Collect
-	   the acrued exception bits from the real fpcr.  */
+	   the accrued exception bits from the real fpcr.  */
 	if (implver() == IMPLVER_EV6) {
 		swcr &= ~IEEE_STATUS_MASK;
 		swcr |= (fpcr >> 35) & IEEE_STATUS_MASK;
-- 
2.8.2.534.g1f66975

