From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/2] alpha: osf_sys.c: use timespec64 where appropriate
Date: Tue,  7 Nov 2017 15:09:25 +0100
Message-ID: <20171107141029.3160278-2-arnd@arndb.de>
References: <20171107141029.3160278-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171107141029.3160278-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, y2038@lists.linaro.org, Deepa Dinamani <deepa.kernel@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Some of the syscall helper functions (do_utimes, poll_select_set_timeout,
core_sys_select) have changed over the past year or two to use
'timespec64' pointers rather than 'timespec'. This was fine on alpha,
since 64-bit architectures treat the two as the same type.

However, I'd like to change that behavior and make 'timespec64' a proper
type of its own even on 64-bit architectures, and that will introduce
harmless type mismatch warnings here.

Also, I'm trying to kill off the do_gettimeofday() helper in favor of
ktime_get() and related interfaces throughout the kernel.

This changes the get_tv32/put_tv32 helper functions to also take a
timespec64 argument rather than timeval, which allows us to simplify
some of the syscall helpers a bit and avoid the type warnings.

For the moment, wait4 and adjtimex are still better off with the old
behavior, so I'm adding a special put_tv_to_tv32() helper for those.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/alpha/kernel/osf_sys.c | 68 ++++++++++++++++++++++-----------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 75a5c35a2067..6db6ec30c3de 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -950,18 +950,27 @@ struct itimerval32
 };
 
 static inline long
-get_tv32(struct timeval *o, struct timeval32 __user *i)
+get_tv32(struct timespec64 *o, struct timeval32 __user *i)
 {
 	struct timeval32 tv;
 	if (copy_from_user(&tv, i, sizeof(struct timeval32)))
 		return -EFAULT;
 	o->tv_sec = tv.tv_sec;
-	o->tv_usec = tv.tv_usec;
+	o->tv_nsec = tv.tv_usec * NSEC_PER_USEC;
 	return 0;
 }
 
 static inline long
-put_tv32(struct timeval32 __user *o, struct timeval *i)
+put_tv32(struct timeval32 __user *o, struct timespec64 *i)
+{
+	return copy_to_user(o, &(struct timeval32){
+				.tv_sec = i->tv_sec,
+				.tv_usec = i->tv_nsec / NSEC_PER_USEC},
+			    sizeof(struct timeval32));
+}
+
+static inline long
+put_tv_to_tv32(struct timeval32 __user *o, struct timeval *i)
 {
 	return copy_to_user(o, &(struct timeval32){
 				.tv_sec = i->tv_sec,
@@ -1004,9 +1013,10 @@ SYSCALL_DEFINE2(osf_gettimeofday, struct timeval32 __user *, tv,
 		struct timezone __user *, tz)
 {
 	if (tv) {
-		struct timeval ktv;
-		do_gettimeofday(&ktv);
-		if (put_tv32(tv, &ktv))
+		struct timespec64 kts;
+
+		ktime_get_ts64(&kts);
+		if (put_tv32(tv, &kts))
 			return -EFAULT;
 	}
 	if (tz) {
@@ -1019,22 +1029,19 @@ SYSCALL_DEFINE2(osf_gettimeofday, struct timeval32 __user *, tv,
 SYSCALL_DEFINE2(osf_settimeofday, struct timeval32 __user *, tv,
 		struct timezone __user *, tz)
 {
-	struct timespec64 kts64;
-	struct timespec kts;
+	struct timespec64 kts;
 	struct timezone ktz;
 
  	if (tv) {
-		if (get_tv32((struct timeval *)&kts, tv))
+		if (get_tv32(&kts, tv))
 			return -EFAULT;
-		kts.tv_nsec *= 1000;
-		kts64 = timespec_to_timespec64(kts);
 	}
 	if (tz) {
 		if (copy_from_user(&ktz, tz, sizeof(*tz)))
 			return -EFAULT;
 	}
 
-	return do_sys_settimeofday64(tv ? &kts64 : NULL, tz ? &ktz : NULL);
+	return do_sys_settimeofday64(tv ? &kts : NULL, tz ? &ktz : NULL);
 }
 
 asmlinkage long sys_ni_posix_timers(void);
@@ -1083,22 +1090,16 @@ SYSCALL_DEFINE3(osf_setitimer, int, which, struct itimerval32 __user *, in,
 SYSCALL_DEFINE2(osf_utimes, const char __user *, filename,
 		struct timeval32 __user *, tvs)
 {
-	struct timespec tv[2];
+	struct timespec64 tv[2];
 
 	if (tvs) {
-		struct timeval ktvs[2];
-		if (get_tv32(&ktvs[0], &tvs[0]) ||
-		    get_tv32(&ktvs[1], &tvs[1]))
+		if (get_tv32(&tv[0], &tvs[0]) ||
+		    get_tv32(&tv[1], &tvs[1]))
 			return -EFAULT;
 
-		if (ktvs[0].tv_usec < 0 || ktvs[0].tv_usec >= 1000000 ||
-		    ktvs[1].tv_usec < 0 || ktvs[1].tv_usec >= 1000000)
+		if (tv[0].tv_nsec < 0 || tv[0].tv_nsec >= 1000000000 ||
+		    tv[1].tv_nsec < 0 || tv[1].tv_nsec >= 1000000000)
 			return -EINVAL;
-
-		tv[0].tv_sec = ktvs[0].tv_sec;
-		tv[0].tv_nsec = 1000 * ktvs[0].tv_usec;
-		tv[1].tv_sec = ktvs[1].tv_sec;
-		tv[1].tv_nsec = 1000 * ktvs[1].tv_usec;
 	}
 
 	return do_utimes(AT_FDCWD, filename, tvs ? tv : NULL, 0);
@@ -1107,19 +1108,18 @@ SYSCALL_DEFINE2(osf_utimes, const char __user *, filename,
 SYSCALL_DEFINE5(osf_select, int, n, fd_set __user *, inp, fd_set __user *, outp,
 		fd_set __user *, exp, struct timeval32 __user *, tvp)
 {
-	struct timespec end_time, *to = NULL;
+	struct timespec64 end_time, *to = NULL;
 	if (tvp) {
-		struct timeval tv;
+		struct timespec64 tv;
 		to = &end_time;
 
 		if (get_tv32(&tv, tvp))
 		    	return -EFAULT;
 
-		if (tv.tv_sec < 0 || tv.tv_usec < 0)
+		if (tv.tv_sec < 0 || tv.tv_nsec < 0)
 			return -EINVAL;
 
-		if (poll_select_set_timeout(to, tv.tv_sec,
-					    tv.tv_usec * NSEC_PER_USEC))
+		if (poll_select_set_timeout(to, tv.tv_sec, tv.tv_nsec))
 			return -EINVAL;		
 
 	}
@@ -1192,9 +1192,9 @@ SYSCALL_DEFINE4(osf_wait4, pid_t, pid, int __user *, ustatus, int, options,
 		return -EFAULT;
 	if (!ur)
 		return err;
-	if (put_tv32(&ur->ru_utime, &r.ru_utime))
+	if (put_tv_to_tv32(&ur->ru_utime, &r.ru_utime))
 		return -EFAULT;
-	if (put_tv32(&ur->ru_stime, &r.ru_stime))
+	if (put_tv_to_tv32(&ur->ru_stime, &r.ru_stime))
 		return -EFAULT;
 	if (copy_to_user(&ur->ru_maxrss, &r.ru_maxrss,
 	      sizeof(struct rusage32) - offsetof(struct rusage32, ru_maxrss)))
@@ -1210,18 +1210,18 @@ SYSCALL_DEFINE4(osf_wait4, pid_t, pid, int __user *, ustatus, int, options,
 SYSCALL_DEFINE2(osf_usleep_thread, struct timeval32 __user *, sleep,
 		struct timeval32 __user *, remain)
 {
-	struct timeval tmp;
+	struct timespec64 tmp;
 	unsigned long ticks;
 
 	if (get_tv32(&tmp, sleep))
 		goto fault;
 
-	ticks = timeval_to_jiffies(&tmp);
+	ticks = timespec64_to_jiffies(&tmp);
 
 	ticks = schedule_timeout_interruptible(ticks);
 
 	if (remain) {
-		jiffies_to_timeval(ticks, &tmp);
+		jiffies_to_timespec64(ticks, &tmp);
 		if (put_tv32(remain, &tmp))
 			goto fault;
 	}
@@ -1280,7 +1280,7 @@ SYSCALL_DEFINE1(old_adjtimex, struct timex32 __user *, txc_p)
 	if (copy_to_user(txc_p, &txc, offsetof(struct timex32, time)) ||
 	    (copy_to_user(&txc_p->tick, &txc.tick, sizeof(struct timex32) - 
 			  offsetof(struct timex32, tick))) ||
-	    (put_tv32(&txc_p->time, &txc.time)))
+	    (put_tv_to_tv32(&txc_p->time, &txc.time)))
 	  return -EFAULT;
 
 	return ret;
-- 
2.9.0

