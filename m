From: Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH] tmpfs: disallow CONFIG_TMPFS_INODE64 on alpha
Date: Mon,  8 Feb 2021 15:57:26 -0600
Message-ID: <20210208215726.608197-1-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Down <chris@chrisdown.name>, Amir Goldstein <amir73il@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

As with s390, alpha is a 64-bit architecture with a 32-bit ino_t.
With CONFIG_TMPFS_INODE64=y tmpfs mounts will get 64-bit inode
numbers and display "inode64" in the mount options, whereas
passing "inode64" in the mount options will fail. This leads to
erroneous behaviours such as this:

 # mkdir mnt
 # mount -t tmpfs nodev mnt
 # mount -o remount,rw mnt
 mount: /home/ubuntu/mnt: mount point not mounted or bad option.

Prevent CONFIG_TMPFS_INODE64 from being selected on alpha.

Fixes: ea3271f7196c ("tmpfs: support 64-bit inums per-sb")
Cc: stable@vger.kernel.org # v5.9+
Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 fs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/Kconfig b/fs/Kconfig
index 3347ec7bd837..da524c4d7b7e 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -203,7 +203,7 @@ config TMPFS_XATTR
 
 config TMPFS_INODE64
 	bool "Use 64-bit ino_t by default in tmpfs"
-	depends on TMPFS && 64BIT && !S390
+	depends on TMPFS && 64BIT && !(S390 || ALPHA)
 	default n
 	help
 	  tmpfs has historically used only inode numbers as wide as an unsigned
-- 
2.29.2

