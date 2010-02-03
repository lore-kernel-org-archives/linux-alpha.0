From: Roel Kluin <roel.kluin@gmail.com>
Subject: [PATCH] alpha: PTR_ERR overwrites -EINVAL in syscall osf_mount
Date: Wed, 03 Feb 2010 16:49:26 +0100
Message-ID: <4B699B06.2040202@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=TYt2GTiOYfaUu2dswM5ViEOwlfehLNxB+cs6l7R5ZU0=;
        b=XANu7Tce+o6vNO+BmuxuzpMfb8Y736di1jjqewftqqxLFfA6ygbCld66WkeTpGpYAh
         XLUJzpetNw70L4ACdSewqmrZsc7/OB3hgkz/adfVZqZYM12k8bqgik563nqg6WLxYvw4
         nozFxKuuYLHlLDA7rKoky3M8GjDGCJHxYiYyw=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.or>

The initial -EINVAL value is overwritten by `retval = PTR_ERR(name)'.
If this isn't an error pointer and typenr is not 1, 6 or 9, then
this retval, a pointer cast to a long, is returned.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
Was this intended? Not sure whether this can occur, found by code
analysis.

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 62619f2..53c213f 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -361,7 +361,7 @@ osf_procfs_mount(char *dirname, struct procfs_args __user *args, int flags)
 SYSCALL_DEFINE4(osf_mount, unsigned long, typenr, char __user *, path,
 		int, flag, void __user *, data)
 {
-	int retval = -EINVAL;
+	int retval;
 	char *name;
 
 	name = getname(path);
@@ -379,6 +379,7 @@ SYSCALL_DEFINE4(osf_mount, unsigned long, typenr, char __user *, path,
 		retval = osf_procfs_mount(name, data, flag);
 		break;
 	default:
+		retval = -EINVAL;
 		printk("osf_mount(%ld, %x)\n", typenr, flag);
 	}
 	putname(name);
