From: Kautuk Consul <consul.kautuk@gmail.com>
Subject: [PATCH 02/19 v2] alpha/mm/fault.c: Port OOM changes to do_page_fault
Date: Sat, 31 Mar 2012 07:59:26 -0400
Message-ID: <1333195166-4978-1-git-send-email-consul.kautuk@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer;
        bh=38Y37cTwrK+R74kxLLzQDDlmBGRTuk0HUGA4K0IuhnI=;
        b=FkZbOLRRYGzVjoYG5MGwsN/jBaxwXkdYYXTMM5dzlz/FtQyrcZNASPq/od+GHrw16d
         54Kl+W3JEKjNCii6TMLDk2WlNbWWJzs4Fatabja+HOLwGcM8BsCjj6yIqnLd9K0iODkI
         /IE7eKRHztn41Wwii1pd34748pVHY9YWr+2Xd+JOjVRwa1WKWkCABnezEB6SJRz5ASdQ
         Hq+X/kNg2t0gLZUs7p+O0Vy9i5qi0z6HA45j8wCWblLbE5Xu0ZwNM7wyjWHI6/SS+Ay6
         I65Ly4pcsdSc98rvRm+9gx3ni9LDUtaIw/lvIphPq4mhqNHxYwzdYX4j+6qdOS9smwKS
         nW5w==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Kautuk Consul <consul.kautuk@gmail.com>, "Mohd. Faris" <mohdfarisq2010@gmail.com>

Commit d065bd810b6deb67d4897a14bfe21f8eb526ba99
(mm: retry page fault when blocking on disk transfer) and
commit 37b23e0525d393d48a7d59f870b3bc061a30ccdb
(x86,mm: make pagefault killable)

The above commits introduced changes into the x86 pagefault handler
for making the page fault handler retryable as well as killable.

These changes reduce the mmap_sem hold time, which is crucial
during OOM killer invocation.

Port these changes to ALPHA.

Signed-off-by: Mohd. Faris <mohdfarisq2010@gmail.com>
Signed-off-by: Kautuk Consul <consul.kautuk@gmail.com>
Acked-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/mm/fault.c |   36 ++++++++++++++++++++++++++++++------
 1 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index 5eecab1..0c4132d 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -89,6 +89,8 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	const struct exception_table_entry *fixup;
 	int fault, si_code = SEGV_MAPERR;
 	siginfo_t info;
+	unsigned int flags = (FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE |
+			      (cause > 0 ? FAULT_FLAG_WRITE : 0));
 
 	/* As of EV6, a load into $31/$f31 is a prefetch, and never faults
 	   (or is suppressed by the PALcode).  Support that for older CPUs
@@ -114,6 +116,7 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 		goto vmalloc_fault;
 #endif
 
+retry:
 	down_read(&mm->mmap_sem);
 	vma = find_vma(mm, address);
 	if (!vma)
@@ -144,8 +147,11 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	/* If for any reason at all we couldn't handle the fault,
 	   make sure we exit gracefully rather than endlessly redo
 	   the fault.  */
-	fault = handle_mm_fault(mm, vma, address, cause > 0 ? FAULT_FLAG_WRITE : 0);
-	up_read(&mm->mmap_sem);
+	fault = handle_mm_fault(mm, vma, address, flags);
+
+	if ((fault & VM_FAULT_RETRY) && fatal_signal_pending(current))
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
@@ -153,10 +159,26 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 			goto do_sigbus;
 		BUG();
 	}
-	if (fault & VM_FAULT_MAJOR)
-		current->maj_flt++;
-	else
-		current->min_flt++;
+
+	if (flags & FAULT_FLAG_ALLOW_RETRY) {
+		if (fault & VM_FAULT_MAJOR)
+			current->maj_flt++;
+		else
+			current->min_flt++;
+		if (fault & VM_FAULT_RETRY) {
+			flags &= ~FAULT_FLAG_ALLOW_RETRY;
+
+			 /* No need to up_read(&mm->mmap_sem) as we would
+			 * have already released it in __lock_page_or_retry
+			 * in mm/filemap.c.
+			 */
+
+			goto retry;
+		}
+	}
+
+	up_read(&mm->mmap_sem);
+
 	return;
 
 	/* Something tried to access memory that isn't in our memory map.
@@ -186,12 +208,14 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	/* We ran out of memory, or some other thing happened to us that
 	   made us unable to handle the page fault gracefully.  */
  out_of_memory:
+	up_read(&mm->mmap_sem);
 	if (!user_mode(regs))
 		goto no_context;
 	pagefault_out_of_memory();
 	return;
 
  do_sigbus:
+	up_read(&mm->mmap_sem);
 	/* Send a sigbus, regardless of whether we were in kernel
 	   or user mode.  */
 	info.si_signo = SIGBUS;
-- 
1.7.5.4

