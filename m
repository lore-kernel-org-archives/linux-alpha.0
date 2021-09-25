From: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 4/6] alpha: fix handling of a3 on straced syscalls
Date: Sat, 25 Sep 2021 02:55:45 +0000
Message-ID: <20210925025548.1694143-4-viro@zeniv.linux.org.uk>
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk>
 <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>

For successful syscall that happens to return a negative, we want
a3 set to 0, no matter whether it's straced or not.  As it is,
for straced case we leave the value it used to have on syscall
entry.  Easily fixed, fortunately...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index c41a5a9c3b9f2..78fe7ee254250 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -600,8 +600,8 @@ ret_from_straced:
 
 	/* check return.. */
 	blt	$0, $strace_error	/* the call failed */
-	stq	$31, 72($sp)		/* a3=0 => no error */
 $strace_success:
+	stq	$31, 72($sp)		/* a3=0 => no error */
 	stq	$0, 0($sp)		/* save return value */
 
 	DO_SWITCH_STACK
-- 
2.11.0

