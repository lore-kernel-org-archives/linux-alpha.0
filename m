From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/4] alpha: Move two assignments for the variable "error" in
 osf_utsname()
Date: Wed, 18 Jan 2017 12:46:52 +0100
Message-ID: <5649cb94-620c-7b60-f150-a6838cafbfc6@users.sourceforge.net>
References: <de76a580-c693-f422-ad78-d87bafd42bf3@users.sourceforge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <de76a580-c693-f422-ad78-d87bafd42bf3@users.sourceforge.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jan-Benedict Glaw <jbglaw@lug-owl.de>, Matt Turner <mattst88@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Richard Henderson <rth@twiddle.net>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 11:10:03 +0100

A local variable was set to an error code in one case before a concrete
error situation was detected. Thus move the corresponding assignment into
an if branch to indicate a software failure there.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/alpha/kernel/osf_sys.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 41174156a676..73ff5d698591 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -528,20 +528,14 @@ SYSCALL_DEFINE1(osf_utsname, char __user *, name)
 	int error;
 
 	down_read(&uts_sem);
-	error = -EFAULT;
-	if (copy_to_user(name + 0, utsname()->sysname, 32))
-		goto out;
-	if (copy_to_user(name + 32, utsname()->nodename, 32))
-		goto out;
-	if (copy_to_user(name + 64, utsname()->release, 32))
-		goto out;
-	if (copy_to_user(name + 96, utsname()->version, 32))
-		goto out;
-	if (copy_to_user(name + 128, utsname()->machine, 32))
-		goto out;
-
-	error = 0;
- out:
+	if (copy_to_user(name + 0, utsname()->sysname, 32) ||
+	    copy_to_user(name + 32, utsname()->nodename, 32) ||
+	    copy_to_user(name + 64, utsname()->release, 32) ||
+	    copy_to_user(name + 96, utsname()->version, 32) ||
+	    copy_to_user(name + 128, utsname()->machine, 32))
+		error = -EFAULT;
+	else
+		error = 0;
 	up_read(&uts_sem);	
 	return error;
 }
-- 
2.11.0

