From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 3/4] alpha: Return directly after a failed copy_from_user() or
 getname() in two functions
Date: Wed, 18 Jan 2017 12:47:54 +0100
Message-ID: <b4831521-3a80-904b-e341-978d702deb28@users.sourceforge.net>
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
Date: Wed, 18 Jan 2017 11:30:06 +0100

Return directly after a call of the function "copy_from_user" or "getname"
failed at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/alpha/kernel/osf_sys.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 73ff5d698591..4310bc79d09c 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -454,16 +454,13 @@ osf_ufs_mount(const char __user *dirname,
 	struct cdfs_args tmp;
 	struct filename *devname;
 
-	retval = -EFAULT;
 	if (copy_from_user(&tmp, args, sizeof(tmp)))
-		goto out;
+		return -EFAULT;
 	devname = getname(tmp.devname);
-	retval = PTR_ERR(devname);
 	if (IS_ERR(devname))
-		goto out;
+		return PTR_ERR(devname);
 	retval = do_mount(devname->name, dirname, "ext2", flags, NULL);
 	putname(devname);
- out:
 	return retval;
 }
 
@@ -475,16 +472,13 @@ osf_cdfs_mount(const char __user *dirname,
 	struct cdfs_args tmp;
 	struct filename *devname;
 
-	retval = -EFAULT;
 	if (copy_from_user(&tmp, args, sizeof(tmp)))
-		goto out;
+		return -EFAULT;
 	devname = getname(tmp.devname);
-	retval = PTR_ERR(devname);
 	if (IS_ERR(devname))
-		goto out;
+		return PTR_ERR(devname);
 	retval = do_mount(devname->name, dirname, "iso9660", flags, NULL);
 	putname(devname);
- out:
 	return retval;
 }
 
-- 
2.11.0

