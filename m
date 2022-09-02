From: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH v2 5/7] alpha: syscall exit cleanup
Date: Fri,  2 Sep 2022 02:50:10 +0100
Message-ID: <20220902015012.2664521-5-viro@zeniv.linux.org.uk>
References: <YxFhB4/cEXX5aHbn@ZenIV>
 <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=I7NpSH/rLBGjwJr10XcJCw6kobA0vHowCMfdAys6c8Y=; b=TyWsEwveDdRipVusTA3IYV6Rew
        OUaB/5l8ImWjPeRcPKrp4juDXK1TiGnV+DpJ/PzOOFi0KO4lKX6nbmuwIoCdYBbmywFfZ0ERS/xIS
        h2wVsrpt4L6jXj/AUBrEU7yu2OK0PpRrdjdKD83uZj2vjggxJ8ZWMx+vxRE/vPIvOQ27HPtMtEcdL
        JqjTCdo0tP5eEqOaAxWDqpWEUzwiRjXLyRRtYjjrBgXKQebbUm2kcVqRaf0IhOU9rputlX5rWm9Tw
        UiT2MpFnA9xn25lHS6eKc6EhJcbb4XW5DOF6L61ilLUIcGmtxMYHDtRF7qENjJ0Gf74iqcY4J2HQF
        H3dvwdsw==;
In-Reply-To: <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
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
index 78fe7ee25425..43380fbf600d 100644
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
2.30.2

