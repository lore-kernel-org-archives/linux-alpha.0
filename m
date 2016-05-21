From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0065/1529] Fix typo
Date: Sat, 21 May 2016 13:45:28 +0200
Message-ID: <20160521114528.2448-1-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=e4yfhHa54U7dcdaQLCQSQkLBBq850aYVuTrwNsWVAjI=;
        b=s2lcw91glhBXHnS2+FgJL4I08Ty1RChqUnJQKepm+TztWOW0/YM8eRDtZgGcq4wF0/
         LAeSJkBT61IXiE2KFV6Q2zFfbtwxp8d5BCdLRRdOGfxW4U0EaVePcNrFUhDWgD/Ea76H
         hmrU8yLTYDZeFo+AAiuLPnHr0gDn+/Cixia/DwT6rq0JFrRLF0Zf22ilrMmB/UZ3UEIn
         l1zmeysY/71iEF4S/X2n8B21H+mNyqsRcqrCfEoU4JNbuJcxLsB7+gS5oepednYjTI05
         0cG2FrAR54MnXvyXtrKszbngCxeAUrHxRNKVniGN9ZjCKUU2Cc1ylGbSUrGxED+Eev78
         BBDg==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/kernel/smc37c669.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smc37c669.c b/arch/alpha/kernel/smc37c669.c
index c803fc7..c819ed2 100644
--- a/arch/alpha/kernel/smc37c669.c
+++ b/arch/alpha/kernel/smc37c669.c
@@ -1446,7 +1446,7 @@ unsigned int __init SMC37c669_enable_device ( unsigned int func )
 **      Disabling a function in the SMC37c669 device involves
 **	disabling all the function's mappings (port, irq, drq ...).
 **	A shadow copy of the device configuration is maintained
-**	in local storage so we won't worry aboving saving the
+**	in local storage so we won't worry about saving the
 **	current configuration information.
 **
 **--
-- 
2.8.2.534.g1f66975

