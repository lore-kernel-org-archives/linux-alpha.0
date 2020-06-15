From: Peter Xu <peterx@redhat.com>
Subject: [PATCH 03/25] mm/alpha: Use mm_fault_accounting()
Date: Mon, 15 Jun 2020 18:15:45 -0400
Message-ID: <20200615221607.7764-4-peterx@redhat.com>
References: <20200615221607.7764-1-peterx@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592259377;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Uy9S6zWlY4QUCbRMwtgEQKAubvhaoWQ6Csg0YCMvJi4=;
        b=bYB5anbFG0qTHiZSjAoa02nRe7wyCwUWfm0244QRLZ+LMITCMvjMkSvtU/e6KOgURl+pY7
        ttuuUM8Jdaaqs2WhtbmtJG12VSU8Y39h9ePNWx+aHI4+9mWQqgH1ooWuSbaUYC0gpVP38J
        2XoIgx2hbTGL0Dw0/x7b7HM2jnw1Qn0=
In-Reply-To: <20200615221607.7764-1-peterx@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Gerald Schaefer <gerald.schaefer@de.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, peterx@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>, Andrea Arcangeli <aarcange@redhat.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

Use the new mm_fault_accounting() helper for page fault accounting.

Avoid doing page fault accounting multiple times if the page fault is retried.
Also, the perf events for page faults will be accounted too when the config has
CONFIG_PERF_EVENTS defined.

CC: Richard Henderson <rth@twiddle.net>
CC: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
CC: Matt Turner <mattst88@gmail.com>
CC: linux-alpha@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/alpha/mm/fault.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index c2d7b6d7bac7..4f8632ddef25 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -88,7 +88,7 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	struct mm_struct *mm = current->mm;
 	const struct exception_table_entry *fixup;
 	int si_code = SEGV_MAPERR;
-	vm_fault_t fault;
+	vm_fault_t fault, major = 0;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
 
 	/* As of EV6, a load into $31/$f31 is a prefetch, and never faults
@@ -149,6 +149,7 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	   make sure we exit gracefully rather than endlessly redo
 	   the fault.  */
 	fault = handle_mm_fault(vma, address, flags);
+	major |= fault & VM_FAULT_MAJOR;
 
 	if (fault_signal_pending(fault, regs))
 		return;
@@ -164,10 +165,6 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	}
 
 	if (flags & FAULT_FLAG_ALLOW_RETRY) {
-		if (fault & VM_FAULT_MAJOR)
-			current->maj_flt++;
-		else
-			current->min_flt++;
 		if (fault & VM_FAULT_RETRY) {
 			flags |= FAULT_FLAG_TRIED;
 
@@ -182,6 +179,8 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 
 	up_read(&mm->mmap_sem);
 
+	mm_fault_accounting(current, regs, address, major);
+
 	return;
 
 	/* Something tried to access memory that isn't in our memory map.
-- 
2.26.2

