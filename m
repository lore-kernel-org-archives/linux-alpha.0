From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH] alpha: Don't export SOCK_NONBLOCK to user space.
Date: Sat, 16 Jun 2012 17:53:30 +1200
Message-ID: <1339826010-22132-1-git-send-email-mcree@orcon.net.nz>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

Currently we export SOCK_NONBLOCK to user space but that conflicts
with the definition from glibc leading to compilation errors in user
programs (e.g. see Debian bug #658460).  The generic socket.h
restricts the definition of SOCK_NONBLOCK to the kernel, as does
the MIPS specific socket.h, so let's do the same on Alpha.

Signed-off-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/include/asm/socket.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/alpha/include/asm/socket.h b/arch/alpha/include/asm/socket.h
index dcb221a..7d2f75b 100644
--- a/arch/alpha/include/asm/socket.h
+++ b/arch/alpha/include/asm/socket.h
@@ -76,9 +76,11 @@
 /* Instruct lower device to use last 4-bytes of skb data as FCS */
 #define SO_NOFCS		43
 
+#ifdef __KERNEL__
 /* O_NONBLOCK clashes with the bits used for socket types.  Therefore we
  * have to define SOCK_NONBLOCK to a different value here.
  */
 #define SOCK_NONBLOCK	0x40000000
+#endif /* __KERNEL__ */
 
 #endif /* _ASM_SOCKET_H */
-- 
1.7.4.3

