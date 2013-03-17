From: Will Deacon <will.deacon@arm.com>
Subject: [PATCH] alpha: makefile: don't enforce small data model for kernel builds
Date: Sun, 17 Mar 2013 21:48:46 +0000
Message-ID: <1363556926-21097-1-git-send-email-will.deacon@arm.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

Due to all of the goodness being packed into today's kernels, the
resulting image isn't as slim as it once was.

In light of this, don't pass -msmall-data to the tools, which results in
link failures due to impossible relocations when compiling anything but
the most trivial configurations.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Signed-off-by: Will Deacon <will.deacon@arm.com>
---
 arch/alpha/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index 4759fe7..2cc3cc5 100644
--- a/arch/alpha/Makefile
+++ b/arch/alpha/Makefile
@@ -12,7 +12,7 @@ NM := $(NM) -B
 
 LDFLAGS_vmlinux	:= -static -N #-relax
 CHECKFLAGS	+= -D__alpha__ -m64
-cflags-y	:= -pipe -mno-fp-regs -ffixed-8 -msmall-data
+cflags-y	:= -pipe -mno-fp-regs -ffixed-8
 cflags-y	+= $(call cc-option, -fno-jump-tables)
 
 cpuflags-$(CONFIG_ALPHA_EV4)		:= -mcpu=ev4
-- 
1.8.0

