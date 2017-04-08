From: Sergei Trofimovich <slyfox@gentoo.org>
Subject: [PATCH] alpha: cleanup: remove __NR_sys_epoll_*, leave __NR_epoll_*
Date: Sat,  8 Apr 2017 20:46:56 +0100
Message-ID: <20170408194656.17883-1-slyfox@gentoo.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Sergei Trofimovich <slyfox@gentoo.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-kernel@vger.kernel.org

__NR_sys_epoll_create and friends are alpha-specific
while __NR_epoll_create is a generic name for other
arches.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
---
 arch/alpha/include/uapi/asm/unistd.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/unistd.h b/arch/alpha/include/uapi/asm/unistd.h
index aa33bf5aacb6..650d339a8df6 100644
--- a/arch/alpha/include/uapi/asm/unistd.h
+++ b/arch/alpha/include/uapi/asm/unistd.h
@@ -366,11 +366,6 @@
 #define __NR_epoll_create		407
 #define __NR_epoll_ctl			408
 #define __NR_epoll_wait			409
-/* Feb 2007: These three sys_epoll defines shouldn't be here but culling
- * them would break userspace apps ... we'll kill them off in 2010 :) */
-#define __NR_sys_epoll_create		__NR_epoll_create
-#define __NR_sys_epoll_ctl		__NR_epoll_ctl
-#define __NR_sys_epoll_wait		__NR_epoll_wait
 #define __NR_remap_file_pages		410
 #define __NR_set_tid_address		411
 #define __NR_restart_syscall		412
-- 
2.12.2

