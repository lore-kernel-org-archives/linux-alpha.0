From: Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH 1/1] task_work: Add local_irq_enable() into task_work_run()
Date: Fri, 12 Oct 2012 18:03:59 +0200
Message-ID: <20121012160359.GB30881@redhat.com>
References: <20121006204736.GA1830@ds20.borg.net> <20121012160337.GA30881@redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121012160337.GA30881@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dl8bcu@dl8bcu.de, peterz@infradead.org, mingo@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>

arch/alpha and probably some other architectures call
do_notify_resume()->task_work_run() with irqs disabled.

This wasn't noticed because key_replace_session_keyring() and
then task_work_run() did spin_lock_irq() + spin_unlock_irq(),
but this sequence was removed by 9da33de6.

Add local_irq_enable() as a workaround, and WARN_ONCE() to
catch other buggy callers.

While at it, remove the unnecessary initialization and add
smp_ to read_barrier_depends() in task_work_cancel().

Reported-by: Thorsten Kranzkowski <dl8bcu@dl8bcu.de>
Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/task_work.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/task_work.c b/kernel/task_work.c
index 65bd3c9..d39190c 100644
--- a/kernel/task_work.c
+++ b/kernel/task_work.c
@@ -25,7 +25,7 @@ struct callback_head *
 task_work_cancel(struct task_struct *task, task_work_func_t func)
 {
 	struct callback_head **pprev = &task->task_works;
-	struct callback_head *work = NULL;
+	struct callback_head *work;
 	unsigned long flags;
 	/*
 	 * If cmpxchg() fails we continue without updating pprev.
@@ -35,7 +35,7 @@ task_work_cancel(struct task_struct *task, task_work_func_t func)
 	 */
 	raw_spin_lock_irqsave(&task->pi_lock, flags);
 	while ((work = ACCESS_ONCE(*pprev))) {
-		read_barrier_depends();
+		smp_read_barrier_depends();
 		if (work->func != func)
 			pprev = &work->next;
 		else if (cmpxchg(pprev, work, work->next) == work)
@@ -51,6 +51,10 @@ void task_work_run(void)
 	struct task_struct *task = current;
 	struct callback_head *work, *head, *next;
 
+	if (WARN_ONCE(irqs_disabled(),
+		      "do_notify_resume() with irqs disabled, fix this arch."))
+		local_irq_enable();
+
 	for (;;) {
 		/*
 		 * work->func() can do task_work_add(), do not set
-- 
1.5.5.1


