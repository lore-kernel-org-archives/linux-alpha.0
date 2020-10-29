From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] alpha: add support for TIF_NOTIFY_SIGNAL
Date: Thu, 29 Oct 2020 10:00:44 -0600
Message-ID: <e04d1f77-9131-15b4-321a-ba0d9c22ff52@kernel.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=tMp2A0cmGdPXsWoXbDq8YFf8P3UnhjyMeu/E7Fr5588=;
        b=1cXQbr7SDRQrjOSa7DSUbfWqeKzkdaCWnyGVChqdyoAVUjlYmnKQ0NAgqHyYTlh58n
         o1hNyeWbUj63beDhxTyb0nz5rTFynU+QaE0jCx0JLNXpJe9GPr0WNToopujZhDnMAx+T
         JR+8dba/byLD3t+2ZqXypdTCF+tdqKBdaU1GkikZGemwejzW2smhX9Xi2bK7hcFpxeIk
         VpJuYfLtEcomYoSvzbgc77d6sALuCw2yxJA6YGxUipl6FEPTsnZPZbVtf/vE5vWuhZLd
         d/eOT9PcwUM3n7n+QUrTMTeRHdWcbURfI7nmGylshJgr4IkewXeXlwrSHE7NhAaJrjzC
         l50A==
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

Wire up TIF_NOTIFY_SIGNAL handling for alpha.

Cc: linux-alpha@vger.kernel.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---

5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
for details:

https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/

As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
as that will enable a set of cleanups once all of them support it. I'm
happy carrying this patch if need be, or it can be funelled through the
arch tree. Let me know.

 arch/alpha/include/asm/thread_info.h | 2 ++
 arch/alpha/kernel/entry.S            | 2 +-
 arch/alpha/kernel/signal.c           | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index 807d7b9a1860..2592356e3215 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -62,6 +62,7 @@ register struct thread_info *__current_thread_info __asm__("$8");
 #define TIF_SIGPENDING		2	/* signal pending */
 #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
 #define TIF_SYSCALL_AUDIT	4	/* syscall audit active */
+#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
 #define TIF_DIE_IF_KERNEL	9	/* dik recursion lock */
 #define TIF_MEMDIE		13	/* is terminating due to OOM killer */
 #define TIF_POLLING_NRFLAG	14	/* idle is polling for TIF_NEED_RESCHED */
@@ -71,6 +72,7 @@ register struct thread_info *__current_thread_info __asm__("$8");
 #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
 #define _TIF_NOTIFY_RESUME	(1<<TIF_NOTIFY_RESUME)
 #define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
+#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
 
 /* Work to do on interrupt/exception return.  */
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 2e09248f8324..6a90d05cae1f 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -544,7 +544,7 @@ $ret_success:
 	.align	4
 	.type	work_pending, @function
 work_pending:
-	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, $2
+	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, | _TIF_NOTIFY_SIGNAL, $2
 	bne	$2, $work_notifysig
 
 $work_resched:
diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index 3739efce1ec0..948b89789da8 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -527,7 +527,7 @@ do_work_pending(struct pt_regs *regs, unsigned long thread_flags,
 			schedule();
 		} else {
 			local_irq_enable();
-			if (thread_flags & _TIF_SIGPENDING) {
+			if (thread_flags & (_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)) {
 				do_signal(regs, r0, r19);
 				r0 = 0;
 			} else {
-- 
2.29.0

-- 
Jens Axboe

