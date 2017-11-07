From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/2] alpha: osf_sys.c: fix put_tv32 regression
Date: Tue,  7 Nov 2017 15:09:24 +0100
Message-ID: <20171107141029.3160278-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, y2038@lists.linaro.org, Deepa Dinamani <deepa.kernel@gmail.com>, Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

There was a typo in the new version of put_tv32() that caused
uninitialized stack data to be written back to user space, rather
than writing the actual timeval for the emulation of
gettimeofday(), wait4(), usleep_thread() and old_adjtimex().

This fixes it to write the correct data again.

Cc: stable@vger.kernel.org
Fixes: 1cc6c4635e9f ("osf_sys.c: switch handling of timeval32/itimerval32 to copy_{to,from}_user()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/alpha/kernel/osf_sys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index ce3a675c0c4b..75a5c35a2067 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -964,8 +964,8 @@ static inline long
 put_tv32(struct timeval32 __user *o, struct timeval *i)
 {
 	return copy_to_user(o, &(struct timeval32){
-				.tv_sec = o->tv_sec,
-				.tv_usec = o->tv_usec},
+				.tv_sec = i->tv_sec,
+				.tv_usec = i->tv_usec},
 			    sizeof(struct timeval32));
 }
 
-- 
2.9.0

