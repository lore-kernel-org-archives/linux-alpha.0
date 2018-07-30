From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [RFC PATCH] alpha: io: add reads{b,w,l,q}/writes{b,w,l,q}
Date: Mon, 30 Jul 2018 10:44:30 +0200
Message-ID: <20180730084430.23861-1-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=KdC8r1maZmHwHxwxt3L7DjAHnSIPBIUL/YjY9IJDgkU=; b=KUW
	pDPLKgrgN33e99sEyXqk7gDGOWySXNXPTMmhBH+7k5UnhNMdRPYyUUcsAMSfBcfn3CYSDK0xEMWHM
	q/Tt9TuafLRAG5z9Slmcqo+4BURX5Cueip9upKSh8eFOQwg/95nCJ1qa44zdziWDSits4IzdbeEjC
	9DUwkkNQwTlOuBNV1U6SjqwMOKnFEf/EoIfz1Uv9BXdmkVRs2IFc0VvWzpoi2t5XItsENzFbM8GP2
	4aBeIKBG9H90dj+dRV5NzUAXlMh/x3mdndTBNv4e2wqaIJih8h88xVMQS7//HZEXKpNaGg5Pu616+
	ZM0AH+4k3hFYwcZtymn45jXb/Xz65xQ==;
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

Some drivers need these for compile-testing. On most architectures
they come from asm-generic/io.h, but not on sparc64, which has its
own definitions.

Copy the generic implementation here.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Note that I tried to instead include asm-generic/io.h + a bunch a
#define xxx xxx to prevent asm-generic/io.h from redefining things
already implemented by the driver, but I faced prototypes mismatch
between asm-generic/io.h and asm-generic/iomap.h ('void __iomem *' vs
'const volatile void __iomem *') which I didn't expect because
asm-generic/io.h includes asm-generic/iomap.h when CONFIG_GENERIC_IOMAP
is defined.

Making prototypes consistent that should be doable, but it involves
checking that the prototype modification is not breaking other users.
Since that's not the problem I was initially trying to fix (my goal is
to make 2 NAND drivers using readsl to compile correctly on all archs
when enabled through COMPILE_TEST=y), I just ended copying the
reads{b,w,l,q}/writes{b,w,l,q} definitions in
arch/alpha/include/asm/io.h.

Let me know if that's a problem.
---
 arch/alpha/include/asm/io.h | 98 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index 4c533fc94d62..0b9cf320f39f 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -267,6 +267,104 @@ extern void		__raw_writew(u16 b, volatile void __iomem *addr);
 extern void		__raw_writel(u32 b, volatile void __iomem *addr);
 extern void		__raw_writeq(u64 b, volatile void __iomem *addr);
 
+static inline void readsb(const volatile void __iomem *addr, void *buffer,
+			  unsigned int count)
+{
+	if (count) {
+		u8 *buf = buffer;
+
+		do {
+			u8 x = __raw_readb(addr);
+			*buf++ = x;
+		} while (--count);
+	}
+}
+
+static inline void readsw(const volatile void __iomem *addr, void *buffer,
+			  unsigned int count)
+{
+	if (count) {
+		u16 *buf = buffer;
+
+		do {
+			u16 x = __raw_readw(addr);
+			*buf++ = x;
+		} while (--count);
+	}
+}
+
+static inline void readsl(const volatile void __iomem *addr, void *buffer,
+			  unsigned int count)
+{
+	if (count) {
+		u32 *buf = buffer;
+
+		do {
+			u32 x = __raw_readl(addr);
+			*buf++ = x;
+		} while (--count);
+	}
+}
+
+static inline void readsq(const volatile void __iomem *addr, void *buffer,
+			  unsigned int count)
+{
+	if (count) {
+		u64 *buf = buffer;
+
+		do {
+			u64 x = __raw_readq(addr);
+			*buf++ = x;
+		} while (--count);
+	}
+}
+static inline void writesb(volatile void __iomem *addr, const void *buffer,
+			   unsigned int count)
+{
+	if (count) {
+		const u8 *buf = buffer;
+
+		do {
+			__raw_writeb(*buf++, addr);
+		} while (--count);
+	}
+}
+
+static inline void writesw(volatile void __iomem *addr, const void *buffer,
+			   unsigned int count)
+{
+	if (count) {
+		const u16 *buf = buffer;
+
+		do {
+			__raw_writew(*buf++, addr);
+		} while (--count);
+	}
+}
+static inline void writesl(volatile void __iomem *addr, const void *buffer,
+			   unsigned int count)
+{
+	if (count) {
+		const u32 *buf = buffer;
+
+		do {
+			__raw_writel(*buf++, addr);
+		} while (--count);
+	}
+}
+
+static inline void writesq(volatile void __iomem *addr, const void *buffer,
+			   unsigned int count)
+{
+	if (count) {
+		const u64 *buf = buffer;
+
+		do {
+			__raw_writeq(*buf++, addr);
+		} while (--count);
+	}
+}
+
 /*
  * Mapping from port numbers to __iomem space is pretty easy.
  */
-- 
2.14.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
