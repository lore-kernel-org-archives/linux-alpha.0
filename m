From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 11/23] y2038: rusage: use __kernel_old_timeval
Date: Fri,  8 Nov 2019 22:12:10 +0100
Message-ID: <20191108211323.1806194-2-arnd@arndb.de>
References: <20191108210236.1296047-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191108210236.1296047-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: y2038@lists.linaro.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Deepa Dinamani <deepa.kernel@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Cyrill Gorcunov <gorcunov@gmail.com>, Will Deacon <will@kernel.org>, =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-alpha@vger.kernel.org

There are two 'struct timeval' fields in 'struct rusage'.

Unfortunately the definition of timeval is now ambiguous when used in
user space with a libc that has a 64-bit time_t, and this also changes
the 'rusage' definition in user space in a way that is incompatible with
the system call interface.

While there is no good solution to avoid all ambiguity here, change
the definition in the kernel headers to be compatible with the kernel
ABI, using __kernel_old_timeval as an unambiguous base type.

In previous discussions, there was also a plan to add a replacement
for rusage based on 64-bit timestamps and nanosecond resolution,
i.e. 'struct __kernel_timespec'. I have patches for that as well,
if anyone thinks we should do that.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Question: should we also rename 'struct rusage' into 'struct __kernel_rusage'
here, to make them completely unambiguous?
---
 arch/alpha/kernel/osf_sys.c   | 2 +-
 include/uapi/linux/resource.h | 4 ++--
 kernel/sys.c                  | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index bf497b8b0ec6..bbe7a0da6264 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -963,7 +963,7 @@ put_tv32(struct timeval32 __user *o, struct timespec64 *i)
 }
 
 static inline long
-put_tv_to_tv32(struct timeval32 __user *o, struct timeval *i)
+put_tv_to_tv32(struct timeval32 __user *o, struct __kernel_old_timeval *i)
 {
 	return copy_to_user(o, &(struct timeval32){
 				.tv_sec = i->tv_sec,
diff --git a/include/uapi/linux/resource.h b/include/uapi/linux/resource.h
index cc00fd079631..74ef57b38f9f 100644
--- a/include/uapi/linux/resource.h
+++ b/include/uapi/linux/resource.h
@@ -22,8 +22,8 @@
 #define	RUSAGE_THREAD	1		/* only the calling thread */
 
 struct	rusage {
-	struct timeval ru_utime;	/* user time used */
-	struct timeval ru_stime;	/* system time used */
+	struct __kernel_old_timeval ru_utime;	/* user time used */
+	struct __kernel_old_timeval ru_stime;	/* system time used */
 	__kernel_long_t	ru_maxrss;	/* maximum resident set size */
 	__kernel_long_t	ru_ixrss;	/* integral shared memory size */
 	__kernel_long_t	ru_idrss;	/* integral unshared data size */
diff --git a/kernel/sys.c b/kernel/sys.c
index a611d1d58c7d..d3aef31e24dc 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1763,8 +1763,8 @@ void getrusage(struct task_struct *p, int who, struct rusage *r)
 	unlock_task_sighand(p, &flags);
 
 out:
-	r->ru_utime = ns_to_timeval(utime);
-	r->ru_stime = ns_to_timeval(stime);
+	r->ru_utime = ns_to_kernel_old_timeval(utime);
+	r->ru_stime = ns_to_kernel_old_timeval(stime);
 
 	if (who != RUSAGE_CHILDREN) {
 		struct mm_struct *mm = get_task_mm(p);
-- 
2.20.0

