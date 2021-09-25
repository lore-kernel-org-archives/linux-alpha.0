From: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 6/6] alpha: ret_from_fork can go straight to ret_to_user
Date: Sat, 25 Sep 2021 02:55:47 +0000
Message-ID: <20210925025548.1694143-6-viro@zeniv.linux.org.uk>
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

We only hit ret_from_fork when the child is meant to return to
userland (since 2012 or so).

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 43380fbf600dd..a6207c47f0894 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -766,7 +766,7 @@ alpha_switch_to:
 	.align	4
 	.ent	ret_from_fork
 ret_from_fork:
-	lda	$26, ret_from_sys_call
+	lda	$26, ret_to_user
 	mov	$17, $16
 	jmp	$31, schedule_tail
 .end ret_from_fork
-- 
2.11.0

