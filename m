From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH] alpha: Fix compile error due to typo in call of do_osf_statfs()
Date: Mon, 16 Aug 2010 20:18:00 +1200
Message-ID: <1281946680-23497-1-git-send-email-mcree@orcon.net.nz>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org

Typo, i.e., missing comma in argument list of call of do_osf_statfs(),
was introduced by commit ebabe9a9001af0af56c0c2780ca1576246e7a74b.

Signed-off-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/kernel/osf_sys.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index fb58150..5d1e6d6 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -252,7 +252,7 @@ SYSCALL_DEFINE3(osf_statfs, const char __user *, pathname,
 
 	retval = user_path(pathname, &path);
 	if (!retval) {
-		retval = do_osf_statfs(&path buffer, bufsiz);
+		retval = do_osf_statfs(&path, buffer, bufsiz);
 		path_put(&path);
 	}
 	return retval;
-- 
1.7.1

