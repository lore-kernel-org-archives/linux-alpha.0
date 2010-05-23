From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 021/199] arch/alpha/kernel/io.c: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:05 +0200
Message-ID: <1274644466-24577-3-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=bh3Txv8w6X31zzolAlzsdR8OeikFg+7FEjOw1jukT90=;
        b=w77UPFye5x2K/Fr4vpRqjK+e1FQNdICntUWP5cgQaprzhfCX2dLF/ELTo30esdtHuh
         tsLWPV8lcKDrrpPxfVOuyVhiwY4LgVc//lEZyaq+adjNznVGfDATYZG6jnQm6VpLsuCf
         TN79dh/rDs/WTKdJzIAauN7j5UPwi1v70LWAw=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/kernel/io.c:11: ERROR: trailing whitespace
arch/alpha/kernel/io.c:18: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/kernel/io.c:25: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/kernel/io.c:32: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/kernel/io.c:39: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/kernel/io.c:45: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/kernel/io.c:51: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/kernel/io.c:101: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/kernel/io.c:106: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/kernel/io.c:111: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/kernel/io.c:116: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/kernel/io.c:121: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/kernel/io.c:126: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/kernel/io.c:131: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/kernel/io.c:136: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/kernel/io.c:139: ERROR: trailing whitespace
arch/alpha/kernel/io.c:140: ERROR: trailing whitespace
arch/alpha/kernel/io.c:141: ERROR: trailing whitespace
arch/alpha/kernel/io.c:142: ERROR: trailing whitespace
arch/alpha/kernel/io.c:143: ERROR: trailing whitespace
arch/alpha/kernel/io.c:144: ERROR: trailing whitespace
arch/alpha/kernel/io.c:145: ERROR: trailing whitespace
arch/alpha/kernel/io.c:146: ERROR: trailing whitespace
arch/alpha/kernel/io.c:277: ERROR: "(foo*)" should be "(foo *)"
arch/alpha/kernel/io.c:370: WARNING: braces {} are not necessary for single statement blocks
arch/alpha/kernel/io.c:578: WARNING: braces {} are not necessary for single statement blocks
arch/alpha/kernel/io.c:608: ERROR: else should follow close brace '}'
arch/alpha/kernel/io.c:622: ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/kernel/io.c |   47 ++++++++++++++++++++++-------------------------
 1 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/arch/alpha/kernel/io.c b/arch/alpha/kernel/io.c
index 19c5875..612443c 100644
--- a/arch/alpha/kernel/io.c
+++ b/arch/alpha/kernel/io.c
@@ -8,7 +8,7 @@
 #include <linux/module.h>
 #include <asm/io.h>
 
-/* Out-of-line versions of the i/o routines that redirect into the 
+/* Out-of-line versions of the i/o routines that redirect into the
    platform-specific version.  Note that "platform-specific" may mean
    "generic", which bumps through the machine vector.  */
 
@@ -42,13 +42,13 @@ void iowrite8(u8 b, void __iomem *addr)
 
 void iowrite16(u16 b, void __iomem *addr)
 {
-	IO_CONCAT(__IO_PREFIX,iowrite16)(b, addr);
+	IO_CONCAT(__IO_PREFIX, iowrite16)(b, addr);
 	mb();
 }
 
 void iowrite32(u32 b, void __iomem *addr)
 {
-	IO_CONCAT(__IO_PREFIX,iowrite32)(b, addr);
+	IO_CONCAT(__IO_PREFIX, iowrite32)(b, addr);
 	mb();
 }
 
@@ -108,42 +108,42 @@ u16 __raw_readw(const volatile void __iomem *addr)
 
 u32 __raw_readl(const volatile void __iomem *addr)
 {
-	return IO_CONCAT(__IO_PREFIX,readl)(addr);
+	return IO_CONCAT(__IO_PREFIX, readl)(addr);
 }
 
 u64 __raw_readq(const volatile void __iomem *addr)
 {
-	return IO_CONCAT(__IO_PREFIX,readq)(addr);
+	return IO_CONCAT(__IO_PREFIX, readq)(addr);
 }
 
 void __raw_writeb(u8 b, volatile void __iomem *addr)
 {
-	IO_CONCAT(__IO_PREFIX,writeb)(b, addr);
+	IO_CONCAT(__IO_PREFIX, writeb)(b, addr);
 }
 
 void __raw_writew(u16 b, volatile void __iomem *addr)
 {
-	IO_CONCAT(__IO_PREFIX,writew)(b, addr);
+	IO_CONCAT(__IO_PREFIX, writew)(b, addr);
 }
 
 void __raw_writel(u32 b, volatile void __iomem *addr)
 {
-	IO_CONCAT(__IO_PREFIX,writel)(b, addr);
+	IO_CONCAT(__IO_PREFIX, writel)(b, addr);
 }
 
 void __raw_writeq(u64 b, volatile void __iomem *addr)
 {
-	IO_CONCAT(__IO_PREFIX,writeq)(b, addr);
+	IO_CONCAT(__IO_PREFIX, writeq)(b, addr);
 }
 
-EXPORT_SYMBOL(__raw_readb); 
-EXPORT_SYMBOL(__raw_readw); 
-EXPORT_SYMBOL(__raw_readl); 
-EXPORT_SYMBOL(__raw_readq); 
-EXPORT_SYMBOL(__raw_writeb); 
-EXPORT_SYMBOL(__raw_writew); 
-EXPORT_SYMBOL(__raw_writel); 
-EXPORT_SYMBOL(__raw_writeq); 
+EXPORT_SYMBOL(__raw_readb);
+EXPORT_SYMBOL(__raw_readw);
+EXPORT_SYMBOL(__raw_readl);
+EXPORT_SYMBOL(__raw_readq);
+EXPORT_SYMBOL(__raw_writeb);
+EXPORT_SYMBOL(__raw_writew);
+EXPORT_SYMBOL(__raw_writel);
+EXPORT_SYMBOL(__raw_writeq);
 
 u8 readb(const volatile void __iomem *addr)
 {
@@ -273,9 +273,8 @@ void ioread16_rep(void __iomem *port, void *dst, unsigned long count)
 		dst += 4;
 	}
 
-	if (count) {
-		*(unsigned short*)dst = ioread16(port);
-	}
+	if (count)
+		*(unsigned short *)dst = ioread16(port);
 }
 
 void insw(unsigned long port, void *dst, unsigned long count)
@@ -575,9 +574,8 @@ void _memset_c_io(volatile void __iomem *to, unsigned long c, long count)
 	}
 
 	/* And finally, one last byte.. */
-	if (count) {
+	if (count)
 		__raw_writeb(c, to);
-	}
 	mb();
 }
 
@@ -604,8 +602,7 @@ scr_memcpyw(u16 *d, const u16 *s, unsigned int count)
 				u16 tmp = __raw_readw(ios++);
 				__raw_writew(tmp, iod++);
 			}
-		}
-		else
+		} else
 			memcpy_fromio(d, ios, count);
 	} else {
 		if (d_isio)
@@ -619,7 +616,7 @@ EXPORT_SYMBOL(scr_memcpyw);
 
 void __iomem *ioport_map(unsigned long port, unsigned int size)
 {
-	return IO_CONCAT(__IO_PREFIX,ioportmap) (port);
+	return IO_CONCAT(__IO_PREFIX, ioportmap) (port);
 }
 
 void ioport_unmap(void __iomem *addr)
-- 
1.7.1.251.gf80a2

