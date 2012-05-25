From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] alpha: fix fpu.h usage in userspace
Date: Fri, 25 May 2012 01:42:11 -0400
Message-ID: <1337924531-9617-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: stable@vger.kernel.org

After commit ec2212088c42ff7d1362629ec26dda4f3e8bdad3, the fpu.h header
which we install for userland started depending on special_insns.h which
is not installed.  However, fpu.h only uses that for __KERNEL__ code, so
protect the inclusion the same way to avoid build breakage in glibc:
/usr/include/asm/fpu.h:4:31: fatal error: asm/special_insns.h: No such file or directory

Cc: stable@vger.kernel.org
Reported-by: Matt Turner <mattst88@gentoo.org>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 arch/alpha/include/asm/fpu.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/alpha/include/asm/fpu.h b/arch/alpha/include/asm/fpu.h
index db00f78..e477bcd 100644
--- a/arch/alpha/include/asm/fpu.h
+++ b/arch/alpha/include/asm/fpu.h
@@ -1,7 +1,9 @@
 #ifndef __ASM_ALPHA_FPU_H
 #define __ASM_ALPHA_FPU_H
 
+#ifdef __KERNEL__
 #include <asm/special_insns.h>
+#endif
 
 /*
  * Alpha floating-point control register defines:
-- 
1.7.8.6

