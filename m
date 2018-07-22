From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: [PATCH] fix osf_wait4() breakage
Date: Sun, 22 Jul 2018 15:07:11 +0100
Message-ID: <20180722140711.GF30522@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

kernel_wait4() expects a userland address for status - it's only
rusage that goes as a kernel one (and needs a copyout afterwards)

Fixes: "osf_wait4: switch to kernel_wait4()"
Cc: stable@vger.kernel.org # v4.12+
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 6e921754c8fc..c210a25dd6da 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1180,13 +1180,10 @@ SYSCALL_DEFINE2(osf_getrusage, int, who, struct rusage32 __user *, ru)
 SYSCALL_DEFINE4(osf_wait4, pid_t, pid, int __user *, ustatus, int, options,
 		struct rusage32 __user *, ur)
 {
-	unsigned int status = 0;
 	struct rusage r;
-	long err = kernel_wait4(pid, &status, options, &r);
+	long err = kernel_wait4(pid, ustatus, options, &r);
 	if (err <= 0)
 		return err;
-	if (put_user(status, ustatus))
-		return -EFAULT;
 	if (!ur)
 		return err;
 	if (put_tv_to_tv32(&ur->ru_utime, &r.ru_utime))
