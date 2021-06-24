From: ebiederm@xmission.com (Eric W. Biederman)
Subject: [PATCH 8/9] signal/task_exit: Use start_task_exit in place of do_exit
Date: Thu, 24 Jun 2021 14:03:25 -0500
Message-ID: <87pmwb5blu.fsf_-_@disp2133>
References: <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
        <87sg1lwhvm.fsf@disp2133>
        <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
        <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
        <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
        <87eed4v2dc.fsf@disp2133>
        <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
        <87fsxjorgs.fsf@disp2133>
        <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
        <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
        <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
        <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
        <87a6njf0ia.fsf@disp2133>
        <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
        <87tulpbp19.fsf@disp2133>
        <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
        <87zgvgabw1.fsf@disp2133> <875yy3850g.fsf_-_@disp2133>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <875yy3850g.fsf_-_@disp2133> (Eric W. Biederman's message of
        "Thu, 24 Jun 2021 13:57:35 -0500")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>


Reuse start_task_exit_locked to implement start_task_exit.

Simplify the exit logic by having all exits go through get_signal.
This simplifies the analysis of syncrhonization during exit and
gurantees a full set of registers will be available for ptrace to
examine at PTRACE_EVENT_EXIT.

Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
---
 include/linux/sched/signal.h |  1 +
 kernel/exit.c                |  4 +++-
 kernel/seccomp.c             |  2 +-
 kernel/signal.c              | 12 ++++++++++++
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched/signal.h b/include/linux/sched/signal.h
index a958381ba4a9..3f4e69c019b7 100644
--- a/include/linux/sched/signal.h
+++ b/include/linux/sched/signal.h
@@ -430,6 +430,7 @@ static inline void ptrace_signal_wake_up(struct task_struct *t, bool resume)
 
 void start_group_exit(int exit_code);
 void start_task_exit_locked(struct task_struct *task, int exit_code);
+void start_task_exit(int exit_code);
 
 void task_join_group_stop(struct task_struct *task);
 
diff --git a/kernel/exit.c b/kernel/exit.c
index 635f434122b7..51e0c82b3f7d 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -889,7 +889,9 @@ EXPORT_SYMBOL(complete_and_exit);
 
 SYSCALL_DEFINE1(exit, int, error_code)
 {
-	do_exit((error_code&0xff)<<8);
+	start_task_exit((error_code&0xff)<<8);
+	/* get_signal will call do_exit */
+	return 0;
 }
 
 
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index b1c06fd1b205..e0c4c123a8bf 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1248,7 +1248,7 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
 			force_sig_seccomp(this_syscall, data, true);
 		} else {
 			if (action == SECCOMP_RET_KILL_THREAD)
-				do_exit(SIGSYS);
+				start_task_exit(SIGSYS);
 			else
 				start_group_exit(SIGSYS);
 		}
diff --git a/kernel/signal.c b/kernel/signal.c
index afbc001220dd..63fda9b6bbf9 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1424,6 +1424,18 @@ void start_task_exit_locked(struct task_struct *task, int exit_code)
 	}
 }
 
+void start_task_exit(int exit_code)
+{
+	struct task_struct *task = current;
+	if (!fatal_signal_pending(task)) {
+		struct sighand_struct *const sighand = task->sighand;
+		spin_lock_irq(&sighand->siglock);
+		if (!fatal_signal_pending(current))
+			start_task_exit_locked(task, exit_code);
+		spin_unlock_irq(&sighand->siglock);
+	}
+}
+
 struct sighand_struct *__lock_task_sighand(struct task_struct *tsk,
 					   unsigned long *flags)
 {
-- 
2.20.1

