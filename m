From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 4/4] alpha: Move two assignments for the variable "res" in
 srm_env_proc_write()
Date: Wed, 18 Jan 2017 12:50:17 +0100
Message-ID: <986573fa-e636-f864-14dc-5e65a31b454e@users.sourceforge.net>
References: <de76a580-c693-f422-ad78-d87bafd42bf3@users.sourceforge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <de76a580-c693-f422-ad78-d87bafd42bf3@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jan-Benedict Glaw <jbglaw@lug-owl.de>, Matt Turner <mattst88@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Richard Henderson <rth@twiddle.net>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 12:08:44 +0100

A local variable was set to an error code in two cases before a concrete
error situation was detected. Thus move the corresponding assignment into
an if branch to indicate a software failure there.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/alpha/kernel/srm_env.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/srm_env.c b/arch/alpha/kernel/srm_env.c
index ffe996a54fad..a5f182780578 100644
--- a/arch/alpha/kernel/srm_env.c
+++ b/arch/alpha/kernel/srm_env.c
@@ -113,13 +113,15 @@ static ssize_t srm_env_proc_write(struct file *file, const char __user *buffer,
 	if (!buf)
 		return -ENOMEM;
 
-	res = -EINVAL;
-	if (count >= PAGE_SIZE)
+	if (count >= PAGE_SIZE) {
+		res = -EINVAL;
 		goto out;
+	}
 
-	res = -EFAULT;
-	if (copy_from_user(buf, buffer, count))
+	if (copy_from_user(buf, buffer, count)) {
+		res = -EFAULT;
 		goto out;
+	}
 	buf[count] = '\0';
 
 	ret1 = callback_setenv(id, buf, count);
-- 
2.11.0

