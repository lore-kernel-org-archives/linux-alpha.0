From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] time: posix-stubs: provide compat itimer supoprt for alpha
Date: Sat,  7 Dec 2019 20:10:26 +0100
Message-ID: <20191207191043.656328-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>, kbuild test robot <lkp@intel.com>, linux-kernel@vger.kernel.org

Using compat_sys_getitimer and compat_sys_setitimer on alpha
causes a link failure in the Alpha tinyconfig and other configurations
that turn off CONFIG_POSIX_TIMERS.

Use the same #ifdef check for the stub version as well.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 4c22ea2b9120 ("y2038: use compat_{get,set}_itimer on alpha")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/time/posix-stubs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/time/posix-stubs.c b/kernel/time/posix-stubs.c
index 67df65f887ac..20c65a7d4e3a 100644
--- a/kernel/time/posix-stubs.c
+++ b/kernel/time/posix-stubs.c
@@ -151,6 +151,9 @@ SYSCALL_DEFINE4(clock_nanosleep, const clockid_t, which_clock, int, flags,
 
 #ifdef CONFIG_COMPAT
 COMPAT_SYS_NI(timer_create);
+#endif
+
+#if defined(CONFIG_COMPAT) || defined(CONFIG_ALPHA)
 COMPAT_SYS_NI(getitimer);
 COMPAT_SYS_NI(setitimer);
 #endif
-- 
2.20.0

