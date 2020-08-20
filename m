From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.7 23/24] alpha: fix annotation of io{read,write}{16,32}be()
Date: Wed, 19 Aug 2020 20:01:54 -0400
Message-ID: <20200820000155.215089-23-sashal@kernel.org>
References: <20200820000155.215089-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597881747;
        bh=8wABEDlREpvzT6ukPbd1Mmmvfg+2A2EvnE7zEw6dBsw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0+UFVxWbCBFWikAStdtsevk/1CoNBgRZw1JHehXwIUtf2q7se+svywePqD+qRtR3D
         s6j1xSTIjjPU70lImod7Bphbnp7O2wf7h+ooLSBWcKTQ51C4UwmFvAC5v9XC8jluRJ
         K+yAr2IvE02AkReXWuheYBJxaBhXRmrlSaEyo0Hs=
In-Reply-To: <20200820000155.215089-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, kernel test robot <lkp@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Sasha Levin <sashal@kernel.org>, linux-alpha@vger.kernel.org

From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

[ Upstream commit bd72866b8da499e60633ff28f8a4f6e09ca78efe ]

These accessors must be used to read/write a big-endian bus.  The value
returned or written is native-endian.

However, these accessors are defined using be{16,32}_to_cpu() or
cpu_to_be{16,32}() to make the endian conversion but these expect a
__be{16,32} when none is present.  Keeping them would need a force cast
that would solve nothing at all.

So, do the conversion using swab{16,32}, like done in asm-generic for
similar situations.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Link: http://lkml.kernel.org/r/20200622114232.80039-1-luc.vanoostenryck@gmail.com
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/alpha/include/asm/io.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index e6225cf40de57..b09dd6bc98a12 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -490,10 +490,10 @@ extern inline void writeq(u64 b, volatile void __iomem *addr)
 }
 #endif
 
-#define ioread16be(p) be16_to_cpu(ioread16(p))
-#define ioread32be(p) be32_to_cpu(ioread32(p))
-#define iowrite16be(v,p) iowrite16(cpu_to_be16(v), (p))
-#define iowrite32be(v,p) iowrite32(cpu_to_be32(v), (p))
+#define ioread16be(p) swab16(ioread16(p))
+#define ioread32be(p) swab32(ioread32(p))
+#define iowrite16be(v,p) iowrite16(swab16(v), (p))
+#define iowrite32be(v,p) iowrite32(swab32(v), (p))
 
 #define inb_p		inb
 #define inw_p		inw
-- 
2.25.1

