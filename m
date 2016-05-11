From: zengzhaoxiu@163.com
Subject: [patch V4 03/31] bitops: Add alpha-specific parity functions
Date: Wed, 11 May 2016 17:09:34 +0800
Message-ID: <1462957775-24395-1-git-send-email-zengzhaoxiu@163.com>
References: <1462955158-28394-1-git-send-email-zengzhaoxiu@163.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=R1xOPL/DCvUI3+kbiZ
	WOeCHcR8Tffs9ROuQqRC1Vg10=; b=fBZE2nvwABZi11hhj27D4gzT+TyG5hqa5M
	HgAi8avcbfUiM/Twn6cv0XdtLCSfZ8HATXszXNIXlYei3fqibumGxeVxcrBJHLce
	Whnxf20kHyVimtE0IIaMfXZGXRyVgq+HIZaU45qMrHa3gaEeVKFaFMrqqfz7IPaU
	pUnc1xkyg=
In-Reply-To: <1462955158-28394-1-git-send-email-zengzhaoxiu@163.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

From: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>

Signed-off-by: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>
Acked-by: Richard Henderson <rth@twiddle.net>
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
2.7.4


