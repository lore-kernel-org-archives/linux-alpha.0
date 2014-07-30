From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 1/2] alpha: Remove "strange" OSF/1 fork semantics
Date: Wed, 30 Jul 2014 11:42:31 -1000
Message-ID: <1406756552-23864-2-git-send-email-rth@twiddle.net>
References: <1406756552-23864-1-git-send-email-rth@twiddle.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+0Md5wFe8FW5Ju5iJzHHs4lwlUrWGKJsV3RflFHiLf4=;
        b=KLiuT9YQHEIwkog2g53bhB3cYBMRVD7kVb7BBrWQk1gbcmbmEFiAioxVMDhLVPXlVe
         0aEiUihwLB6j19330zvc6P4GWxzuKHIKdroy+D7ypGok+aOBgnClHyA+Yfle9or+jJUO
         Z5EkNUEDM4fQDU6y77rJilbjwXcmKrenOsD3d2stn/SZRnJTOa+BT27yYza62NU4CQy7
         56ZNSI2mquWe+XG2UcOv3AaeuWJigsyGtWS2OIcd3Jb57OjDZpYnzgMD99J2Xe5lSlj0
         TX8Ru3rLdMZZxB7MEA/LyoFcG9yfhFs/GqRq7QNzeGadM2tzmKn+8wuu/pRS2DiQjla0
         E/NQ==
In-Reply-To: <1406756552-23864-1-git-send-email-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: mcree@orcon.net.nz, linux-alpha@vger.kernel.org

The assignment to regs->r20 kills the original tls_val input
to the clone syscall, which means that clone can no longer be
restarted with the original inputs.

We could, perhaps, retain this result for true fork, but OSF/1
compatibility is no longer important.  Note that glibc has never
used the r20 result value, instead always testing r0 vs 0 to
determine the child/parent status.

This failure can be seen in the glibc nptl/tst-eintr* tests.

Reported-by: Michael Cree <mcree@orcon.net.nz>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/kernel/process.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 1941a07..77028d7 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -278,8 +278,6 @@ copy_thread(unsigned long clone_flags, unsigned long usp,
 	*childregs = *regs;
 	childregs->r0 = 0;
 	childregs->r19 = 0;
-	childregs->r20 = 1;	/* OSF/1 has some strange fork() semantics.  */
-	regs->r20 = 0;
 	stack = ((struct switch_stack *) regs) - 1;
 	*childstack = *stack;
 	childstack->r26 = (unsigned long) ret_from_fork;
-- 
1.9.3
