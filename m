From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH] alpha: Fix mixed up args in EXC macro in futex operations
Date: Fri, 24 Nov 2017 21:25:01 +1300
Message-ID: <20171124082501.9436-1-mcree@orcon.net.nz>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, stable@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>

Fix the typo (mixed up arguments) in the EXC macro in the futex
definitions introduced by commit ca282f697381 (alpha: add a
helper for emitting exception table entries).

Signed-off-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/include/asm/futex.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/include/asm/futex.h b/arch/alpha/include/asm/futex.h
index d2e4da93e68c..ca3322536f72 100644
--- a/arch/alpha/include/asm/futex.h
+++ b/arch/alpha/include/asm/futex.h
@@ -20,8 +20,8 @@
 	"3:	.subsection 2\n"				\
 	"4:	br	1b\n"					\
 	"	.previous\n"					\
-	EXC(1b,3b,%1,$31)					\
-	EXC(2b,3b,%1,$31)					\
+	EXC(1b,3b,$31,%1)					\
+	EXC(2b,3b,$31,%1)					\
 	:	"=&r" (oldval), "=&r"(ret)			\
 	:	"r" (uaddr), "r"(oparg)				\
 	:	"memory")
@@ -82,8 +82,8 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	"3:	.subsection 2\n"
 	"4:	br	1b\n"
 	"	.previous\n"
-	EXC(1b,3b,%0,$31)
-	EXC(2b,3b,%0,$31)
+	EXC(1b,3b,$31,%0)
+	EXC(2b,3b,$31,%0)
 	:	"+r"(ret), "=&r"(prev), "=&r"(cmp)
 	:	"r"(uaddr), "r"((long)(int)oldval), "r"(newval)
 	:	"memory");
-- 
2.11.0

