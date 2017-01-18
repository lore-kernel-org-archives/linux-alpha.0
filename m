From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 1/4] alpha: Return an error code only as a constant in
 osf_sigstack()
Date: Wed, 18 Jan 2017 12:45:13 +0100
Message-ID: <95ac67c7-6a80-6d58-a8c2-43701e76ecdc@users.sourceforge.net>
References: <de76a580-c693-f422-ad78-d87bafd42bf3@users.sourceforge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <de76a580-c693-f422-ad78-d87bafd42bf3@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jan-Benedict Glaw <jbglaw@lug-owl.de>, Matt Turner <mattst88@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Richard Henderson <rth@twiddle.net>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 10:40:51 +0100

* Return an error code without storing it in an intermediate variable.

* Delete the local variable "error" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/alpha/kernel/osf_sys.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 56e427c7aa3c..41174156a676 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -691,20 +691,17 @@ SYSCALL_DEFINE2(osf_sigstack, struct sigstack __user *, uss,
 	unsigned long usp = rdusp();
 	unsigned long oss_sp = current->sas_ss_sp + current->sas_ss_size;
 	unsigned long oss_os = on_sig_stack(usp);
-	int error;
 
 	if (uss) {
 		void __user *ss_sp;
 
-		error = -EFAULT;
 		if (get_user(ss_sp, &uss->ss_sp))
-			goto out;
+			return -EFAULT;
 
 		/* If the current stack was set with sigaltstack, don't
 		   swap stacks while we are on it.  */
-		error = -EPERM;
 		if (current->sas_ss_sp && on_sig_stack(usp))
-			goto out;
+			return -EPERM;
 
 		/* Since we don't know the extent of the stack, and we don't
 		   track onstack-ness, but rather calculate it, we must 
@@ -714,16 +711,12 @@ SYSCALL_DEFINE2(osf_sigstack, struct sigstack __user *, uss,
 	}
 
 	if (uoss) {
-		error = -EFAULT;
 		if (! access_ok(VERIFY_WRITE, uoss, sizeof(*uoss))
 		    || __put_user(oss_sp, &uoss->ss_sp)
 		    || __put_user(oss_os, &uoss->ss_onstack))
-			goto out;
+			return -EFAULT;
 	}
-
-	error = 0;
- out:
-	return error;
+	return 0;
 }
 
 SYSCALL_DEFINE3(osf_sysinfo, int, command, char __user *, buf, long, count)
-- 
2.11.0

