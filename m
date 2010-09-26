From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 2/2] alpha: Make sys_getxpid() call do_getppid()
Date: Sun, 26 Sep 2010 16:13:11 +0100
Message-ID: <1285513991.2697.262.camel@localhost>
References: <1285513774.2697.255.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1285513774.2697.255.camel@localhost>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

sys_getxpid() was not following RCU protocol or considering namespace
visibility for the parent pid.  Change it to call do_geptpid() which
does the right thing.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
This is totally untested, and I've never written Alpha assembly before,
so this definitely needs review and testing by an Alpha porter.

I've left the shortcut tgid lookup there as I assume it is still valid.

Ben.

 arch/alpha/kernel/entry.S |   21 ++++++---------------
 1 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index ab1ee0a..5b1bc48 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -857,24 +857,15 @@ sys_getxgid:
 	.globl	sys_getxpid
 	.ent	sys_getxpid
 sys_getxpid:
+	lda	$sp, -16($sp)
+	stq	$26, 0($sp)
 	.prologue 0
+	jsr	$26, do_getppid
+	ldq	$26, 0($sp)
+	lda	$sp, 16($sp)
+	stq	$0, 80($sp)
 	ldq	$2, TI_TASK($8)
-
-	/* See linux/kernel/timer.c sys_getppid for discussion
-	   about this loop.  */
-	ldq	$3, TASK_GROUP_LEADER($2)
-	ldq	$4, TASK_REAL_PARENT($3)
 	ldl	$0, TASK_TGID($2)
-1:	ldl	$1, TASK_TGID($4)
-#ifdef CONFIG_SMP
-	mov	$4, $5
-	mb
-	ldq	$3, TASK_GROUP_LEADER($2)
-	ldq	$4, TASK_REAL_PARENT($3)
-	cmpeq	$4, $5, $5
-	beq	$5, 1b
-#endif
-	stq	$1, 80($sp)
 	ret
 .end sys_getxpid
 
-- 
1.7.1


