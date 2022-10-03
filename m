From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] alpha: Fix ioread64/iowrite64 helpers
Date: Mon,  3 Oct 2022 14:13:16 +0200
Message-ID: <20221003121316.2540339-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=YsLY1swMVj4DKjC2Q49eQR4Pp7U9mFeotQVi/NOOp94=;
        b=pV53mRtibSCQbNNhXfTXs70Kmg8n3Z+FVWKdAtto7dRD3YuIZyNVFPInMy3JGWS3MD
         FBsQWZ+GAJHC7TItFNEGBj6pQdVskouXi66wSGxST8L8thTQDQST6VHHLeAaD732CbTm
         QLVxgKBWZT8Yz6EiRY5KjKJ/i5oojzRPwOolKi1GsscMGPbxvEn9VWJzUb07ObMNssIQ
         HkE9fXeTFtCOtxnL3uzM3p/ktu4I3MVsr7/ehRHh4GawuEyuJgpYb5lVSZHxMV3CO+kX
         gYXhjlFYAd3c9H5gG2TZxmvD3uDF0nfgqC1PN0yi0PbUf/1UI1AAEeAt1wuDgKuF1SlQ
         LRsA==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-alpha@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Guenter Roeck <linux@roeck-us.net>, linux-arch@vger.kernel.org

When doing allmod builds it turns out some modules are using
ioread64() and iowrite64() that the alpha does not implement,
as it is using <asm-generic/iomap.h> without selecting
GENERIC_IOMAP.

Fix this by implementing the ioread64()/iowrite64() stubs
as well, using readq() and writeq() respectively.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 7e772dad9913 ("alpha: Use generic <asm-generic/io.h>")
Link: https://lore.kernel.org/linux-arch/20221002224521.GA968453@roeck-us.net/
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-arch@vger.kernel.org
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Arnd if this looks OK then please apply it on linux-arch
for fixes.
---
 arch/alpha/kernel/io.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/alpha/kernel/io.c b/arch/alpha/kernel/io.c
index 838586abb1e0..5f3e75a945c1 100644
--- a/arch/alpha/kernel/io.c
+++ b/arch/alpha/kernel/io.c
@@ -41,6 +41,11 @@ unsigned int ioread32(const void __iomem *addr)
 	return ret;
 }
 
+u64 ioread64(const void __iomem *addr)
+{
+	return readq(addr);
+}
+
 void iowrite8(u8 b, void __iomem *addr)
 {
 	mb();
@@ -59,12 +64,19 @@ void iowrite32(u32 b, void __iomem *addr)
 	IO_CONCAT(__IO_PREFIX,iowrite32)(b, addr);
 }
 
+void iowrite64(u64 b, void __iomem *addr)
+{
+	writeq(b, addr);
+}
+
 EXPORT_SYMBOL(ioread8);
 EXPORT_SYMBOL(ioread16);
 EXPORT_SYMBOL(ioread32);
+EXPORT_SYMBOL(ioread64);
 EXPORT_SYMBOL(iowrite8);
 EXPORT_SYMBOL(iowrite16);
 EXPORT_SYMBOL(iowrite32);
+EXPORT_SYMBOL(iowrite64);
 
 u8 inb(unsigned long port)
 {
-- 
2.34.1

