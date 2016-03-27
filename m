From: "zhaoxiu.zeng" <zhaoxiu.zeng@gmail.com>
Subject: [PATCH 03/31] Add alpha-specific parity functions
Date: Sun, 27 Mar 2016 13:43:22 +0800
Message-ID: <56F772FA.1030104@gmail.com>
References: <1458788612-4367-1-git-send-email-zhaoxiu.zeng@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=37bcJiVcuxtNUPx4ess69o7vrM3ZR6Wsm8EIGk3KjqI=;
        b=Wvb2ElXJ4HA1t7v4DHi1k5pY2+gFRKbJDQX9nYHu+FY1A+22O1DaTc+TtPxwAiTuyW
         Uz43WrSXCEiWpkjVA4KXJ0zKQQQ1jTsFzm1vVscDBwj1S36b8QDxNGvQ8PoDupVveMRf
         QkRx6K/v83xtvzg/5ExNhZSEWW4oWfAIzljdosFYWn2mkAMFDc9NaWZM1uatC4+Q/eZb
         BVMuyX7i4LSyca4NZ8u8vUvZjsi5Ylk72ts/+hSxDUdwXA6QpIwz6PTlqGGcQzVj0Mbq
         L7cU+jYxzdoAm5YWK8f7iDopdR8QaXvM0GiLpUP7ontD6denn9i+bkQ14DQRiAKOYGdS
         uHSA==
In-Reply-To: <1458788612-4367-1-git-send-email-zhaoxiu.zeng@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>, linux-alpha@vger.kernel.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

From: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>

Signed-off-by: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>
---
 arch/alpha/include/asm/bitops.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/alpha/include/asm/bitops.h b/arch/alpha/include/asm/bitops.h
index 4bdfbd4..95a43fa 100644
--- a/arch/alpha/include/asm/bitops.h
+++ b/arch/alpha/include/asm/bitops.h
@@ -421,11 +421,38 @@ static inline unsigned int __arch_hweight8(unsigned int w)
 {
 	return __arch_hweight64(w & 0xff);
 }
+
+static inline unsigned int __arch_parity64(unsigned long w)
+{
+	return (unsigned int)__kernel_ctpop(w) & 1;
+}
+
+static inline unsigned int __arch_parity32(unsigned int w)
+{
+	return __arch_parity64(w);
+}
+
+static inline unsigned int __arch_parity16(unsigned int w)
+{
+	return __arch_parity64(w & 0xffff);
+}
+
+static inline unsigned int __arch_parity8(unsigned int w)
+{
+	return __arch_parity64(w & 0xff);
+}
+
+static inline unsigned int __arch_parity4(unsigned int w)
+{
+	return __arch_parity64(w & 0xf);
+}
 #else
 #include <asm-generic/bitops/arch_hweight.h>
+#include <asm-generic/bitops/arch_parity.h>
 #endif
 
 #include <asm-generic/bitops/const_hweight.h>
+#include <asm-generic/bitops/const_parity.h>
 
 #endif /* __KERNEL__ */
 
-- 
2.5.5

