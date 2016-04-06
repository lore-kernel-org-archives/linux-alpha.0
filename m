From: zengzhaoxiu@163.com
Subject: [PATCH v2 03/30] Add alpha-specific parity functions
Date: Wed,  6 Apr 2016 16:46:37 +0800
Message-ID: <1459932397-6469-1-git-send-email-zengzhaoxiu@163.com>
References: <57031D9D.801@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=5EqEPmrODqBM7p9BNw
	fI5e/Ou2z6YLhZluJUeB5j1cI=; b=DgQQmw9AvbydE2ZH0H9Sd+qTKoKp1j555p
	ZKPtn5/wiGtNRQKdYEJqWhhVv6JWOLYNExRoH3If/95lStPEZxDqsv2plq0tziLs
	l1iOwTKnRKjiBQXc4zxJncKf0f+t/u+6F1zLS0jTD6aIP9lOeFBlDsK8L0FBhAb2
	Ll2L2hQh8=
In-Reply-To: <57031D9D.801@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>

From: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>

Signed-off-by: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>
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
2.5.0


