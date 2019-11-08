From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 19/23] y2038: use compat_{get,set}_itimer on alpha
Date: Fri,  8 Nov 2019 22:12:18 +0100
Message-ID: <20191108211323.1806194-10-arnd@arndb.de>
References: <20191108210236.1296047-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191108210236.1296047-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: y2038@lists.linaro.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Deepa Dinamani <deepa.kernel@gmail.com>, Christian Brauner <christian@brauner.io>, Heiko Carstens <heiko.carstens@de.ibm.com>, Anna-Maria Gleixner <anna-maria@linutronix.de>, linux-alpha@vger.kernel.org

The itimer handling for the old alpha osf_setitimer/osf_getitimer
system calls is identical to the compat version of getitimer/setitimer,
so just use those directly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/alpha/kernel/osf_sys.c            | 65 --------------------------
 arch/alpha/kernel/syscalls/syscall.tbl |  4 +-
 kernel/time/itimer.c                   |  4 +-
 3 files changed, 4 insertions(+), 69 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index bbe7a0da6264..94e4cde8071a 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -971,30 +971,6 @@ put_tv_to_tv32(struct timeval32 __user *o, struct __kernel_old_timeval *i)
 			    sizeof(struct timeval32));
 }
 
-static inline long
-get_it32(struct itimerval *o, struct itimerval32 __user *i)
-{
-	struct itimerval32 itv;
-	if (copy_from_user(&itv, i, sizeof(struct itimerval32)))
-		return -EFAULT;
-	o->it_interval.tv_sec = itv.it_interval.tv_sec;
-	o->it_interval.tv_usec = itv.it_interval.tv_usec;
-	o->it_value.tv_sec = itv.it_value.tv_sec;
-	o->it_value.tv_usec = itv.it_value.tv_usec;
-	return 0;
-}
-
-static inline long
-put_it32(struct itimerval32 __user *o, struct itimerval *i)
-{
-	return copy_to_user(o, &(struct itimerval32){
-				.it_interval.tv_sec = o->it_interval.tv_sec,
-				.it_interval.tv_usec = o->it_interval.tv_usec,
-				.it_value.tv_sec = o->it_value.tv_sec,
-				.it_value.tv_usec = o->it_value.tv_usec},
-			    sizeof(struct itimerval32));
-}
-
 static inline void
 jiffies_to_timeval32(unsigned long jiffies, struct timeval32 *value)
 {
@@ -1039,47 +1015,6 @@ SYSCALL_DEFINE2(osf_settimeofday, struct timeval32 __user *, tv,
 
 asmlinkage long sys_ni_posix_timers(void);
 
-SYSCALL_DEFINE2(osf_getitimer, int, which, struct itimerval32 __user *, it)
-{
-	struct itimerval kit;
-	int error;
-
-	if (!IS_ENABLED(CONFIG_POSIX_TIMERS))
-		return sys_ni_posix_timers();
-
-	error = do_getitimer(which, &kit);
-	if (!error && put_it32(it, &kit))
-		error = -EFAULT;
-
-	return error;
-}
-
-SYSCALL_DEFINE3(osf_setitimer, int, which, struct itimerval32 __user *, in,
-		struct itimerval32 __user *, out)
-{
-	struct itimerval kin, kout;
-	int error;
-
-	if (!IS_ENABLED(CONFIG_POSIX_TIMERS))
-		return sys_ni_posix_timers();
-
-	if (in) {
-		if (get_it32(&kin, in))
-			return -EFAULT;
-	} else
-		memset(&kin, 0, sizeof(kin));
-
-	error = do_setitimer(which, &kin, out ? &kout : NULL);
-	if (error || !out)
-		return error;
-
-	if (put_it32(out, &kout))
-		return -EFAULT;
-
-	return 0;
-
-}
-
 SYSCALL_DEFINE2(osf_utimes, const char __user *, filename,
 		struct timeval32 __user *, tvs)
 {
diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index 728fe028c02c..8e13b0b2928d 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -89,10 +89,10 @@
 80	common	setgroups			sys_setgroups
 81	common	osf_old_getpgrp			sys_ni_syscall
 82	common	setpgrp				sys_setpgid
-83	common	osf_setitimer			sys_osf_setitimer
+83	common	osf_setitimer			compat_sys_setitimer
 84	common	osf_old_wait			sys_ni_syscall
 85	common	osf_table			sys_ni_syscall
-86	common	osf_getitimer			sys_osf_getitimer
+86	common	osf_getitimer			compat_sys_getitimer
 87	common	gethostname			sys_gethostname
 88	common	sethostname			sys_sethostname
 89	common	getdtablesize			sys_getdtablesize
diff --git a/kernel/time/itimer.c b/kernel/time/itimer.c
index c52ebb40b60b..4664c6addf69 100644
--- a/kernel/time/itimer.c
+++ b/kernel/time/itimer.c
@@ -111,7 +111,7 @@ SYSCALL_DEFINE2(getitimer, int, which, struct itimerval __user *, value)
 	return error;
 }
 
-#ifdef CONFIG_COMPAT
+#if defined(CONFIG_COMPAT) || defined(CONFIG_ALPHA)
 struct old_itimerval32 {
 	struct old_timeval32	it_interval;
 	struct old_timeval32	it_value;
@@ -324,7 +324,7 @@ SYSCALL_DEFINE3(setitimer, int, which, struct itimerval __user *, value,
 	return 0;
 }
 
-#ifdef CONFIG_COMPAT
+#if defined(CONFIG_COMPAT) || defined(CONFIG_ALPHA)
 static int get_old_itimerval32(struct itimerval *o, const struct old_itimerval32 __user *i)
 {
 	struct old_itimerval32 v32;
-- 
2.20.0

