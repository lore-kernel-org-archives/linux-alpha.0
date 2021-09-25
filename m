From: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 5/6] alpha: syscall exit cleanup
Date: Sat, 25 Sep 2021 02:55:46 +0000
Message-ID: <20210925025548.1694143-5-viro@zeniv.linux.org.uk>
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

$ret_success consists of two insn + branch to ret_from_syscall.
The thing is, those insns are identical to the ones immediately
preceding ret_from_syscall...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/kernel/entry.S | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 78fe7ee254250..43380fbf600dd 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -478,6 +478,7 @@ entSys:
 1:	jsr	$26, ($27), sys_ni_syscall
 	ldgp	$gp, 0($26)
 	blt	$0, $syscall_error	/* the call failed */
+$ret_success:
 	stq	$0, 0($sp)
 	stq	$31, 72($sp)		/* a3=0 => no error */
 
@@ -527,11 +528,6 @@ $syscall_error:
 	stq	$1, 72($sp)	/* a3 for return */
 	br	ret_from_sys_call
 
-$ret_success:
-	stq	$0, 0($sp)
-	stq	$31, 72($sp)	/* a3=0 => no error */
-	br	ret_from_sys_call
-
 /*
  * Do all cleanup when returning from all interrupts and system calls.
  *
-- 
2.11.0

