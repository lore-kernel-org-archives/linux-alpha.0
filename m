From: David Howells <dhowells@redhat.com>
Subject: [PATCH] Alpha: Fix a missing comma in sys_osf_statfs()
Date: Thu, 26 Aug 2010 17:44:35 +0100
Message-ID: <20100826164435.28668.25355.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hch@lst.de, torvalds@osdl.org, akpm@linux-foundation.com
Cc: viro@zeniv.linux.org.uk, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Fix a comma that got accidentally deleted from sys_osf_statfs() leading to the
following warning:

	arch/alpha/kernel/osf_sys.c: In function 'SYSC_osf_statfs':
	arch/alpha/kernel/osf_sys.c:255: error: syntax error before 'buffer'

Signed-off-by: David Howells <dhowells@redhat.com>
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

