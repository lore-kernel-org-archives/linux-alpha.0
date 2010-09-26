From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 1/2] syscall,pid: Extract bodies of sys_get{pid,ppid}()
 into do_get{pid,ppid}()
Date: Sun, 26 Sep 2010 16:09:34 +0100
Message-ID: <1285513774.2697.255.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

Define do_get{pid,ppid}() for all architectures.

Change sys_get{pid,ppid}() to be wrappers for them, except on Alpha.
While we're at it, move them to the more obvious kernel/pid.c.

Change all callers accordingly.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
This is preparation for fixing sys_getxgid() on Alpha.

This applies on top of a previous quick-fix for TOMOYO
<http://article.gmane.org/gmane.linux.kernel.lsm/11708> which I hope to
see applied in 2.6.36.

Ben.

 include/linux/pid.h      |    4 ++++
 kernel/auditsc.c         |    4 ++--
 kernel/pid.c             |   45 +++++++++++++++++++++++++++++++++++++++++++++
 kernel/timer.c           |   36 ------------------------------------
 security/tomoyo/common.c |    6 +-----
 5 files changed, 52 insertions(+), 43 deletions(-)

diff --git a/include/linux/pid.h b/include/linux/pid.h
index 49f1c2f..f79d402 100644
--- a/include/linux/pid.h
+++ b/include/linux/pid.h
@@ -188,4 +188,8 @@ pid_t pid_vnr(struct pid *pid);
 		} while_each_thread(tg___, task);			\
 		task = tg___;						\
 	} while_each_pid_task(pid, type, task)
+
+extern pid_t do_getpid(void);
+extern pid_t do_getppid(void);
+
 #endif /* _LINUX_PID_H */
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 1b31c13..3c35ace 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -461,7 +461,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 		case AUDIT_PPID:
 			if (ctx) {
 				if (!ctx->ppid)
-					ctx->ppid = sys_getppid();
+					ctx->ppid = do_getppid();
 				result = audit_comparator(ctx->ppid, f->op, f->val);
 			}
 			break;
@@ -1320,7 +1320,7 @@ static void audit_log_exit(struct audit_context *context, struct task_struct *ts
 	/* tsk == current */
 	context->pid = tsk->pid;
 	if (!context->ppid)
-		context->ppid = sys_getppid();
+		context->ppid = do_getppid();
 	cred = current_cred();
 	context->uid   = cred->uid;
 	context->gid   = cred->gid;
diff --git a/kernel/pid.c b/kernel/pid.c
index d55c6fb..89eb2c2 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -562,3 +562,48 @@ void __init pidmap_init(void)
 	init_pid_ns.pid_cachep = KMEM_CACHE(pid,
 			SLAB_HWCACHE_ALIGN | SLAB_PANIC);
 }
+
+/**
+ * do_getpid - return the thread group id of the current process
+ *
+ * Note, despite the name, this returns the tgid not the pid.  The tgid and
+ * the pid are identical unless CLONE_THREAD was specified on clone() in
+ * which case the tgid is the same in all threads of the same group.
+ *
+ * This is SMP safe as current->tgid does not change.
+ */
+pid_t do_getpid(void)
+{
+	return task_tgid_vnr(current);
+}
+
+/*
+ * Accessing ->real_parent is not SMP-safe, it could
+ * change from under us. However, we can use a stale
+ * value of ->real_parent under rcu_read_lock(), see
+ * release_task()->call_rcu(delayed_put_task_struct).
+ */
+pid_t do_getppid(void)
+{
+	pid_t pid;
+
+	rcu_read_lock();
+	pid = task_tgid_vnr(current->real_parent);
+	rcu_read_unlock();
+
+	return pid;
+}
+
+#ifndef __alpha__
+
+SYSCALL_DEFINE0(getpid)
+{
+	return do_getpid();
+}
+
+SYSCALL_DEFINE0(getppid)
+{
+	return do_getppid();
+}
+
+#endif
diff --git a/kernel/timer.c b/kernel/timer.c
index 97bf05b..6248883 100644
--- a/kernel/timer.c
+++ b/kernel/timer.c
@@ -1334,42 +1334,6 @@ SYSCALL_DEFINE1(alarm, unsigned int, seconds)
 
 #ifndef __alpha__
 
-/*
- * The Alpha uses getxpid, getxuid, and getxgid instead.  Maybe this
- * should be moved into arch/i386 instead?
- */
-
-/**
- * sys_getpid - return the thread group id of the current process
- *
- * Note, despite the name, this returns the tgid not the pid.  The tgid and
- * the pid are identical unless CLONE_THREAD was specified on clone() in
- * which case the tgid is the same in all threads of the same group.
- *
- * This is SMP safe as current->tgid does not change.
- */
-SYSCALL_DEFINE0(getpid)
-{
-	return task_tgid_vnr(current);
-}
-
-/*
- * Accessing ->real_parent is not SMP-safe, it could
- * change from under us. However, we can use a stale
- * value of ->real_parent under rcu_read_lock(), see
- * release_task()->call_rcu(delayed_put_task_struct).
- */
-SYSCALL_DEFINE0(getppid)
-{
-	int pid;
-
-	rcu_read_lock();
-	pid = task_tgid_vnr(current->real_parent);
-	rcu_read_unlock();
-
-	return pid;
-}
-
 SYSCALL_DEFINE0(getuid)
 {
 	/* Only we change this so SMP safe */
diff --git a/security/tomoyo/common.c b/security/tomoyo/common.c
index c668b44..97192e1 100644
--- a/security/tomoyo/common.c
+++ b/security/tomoyo/common.c
@@ -1416,19 +1416,15 @@ static char *tomoyo_print_header(struct tomoyo_request_info *r)
 	const pid_t gpid = task_pid_nr(current);
 	static const int tomoyo_buffer_len = 4096;
 	char *buffer = kmalloc(tomoyo_buffer_len, GFP_NOFS);
-	pid_t ppid;
 	if (!buffer)
 		return NULL;
 	do_gettimeofday(&tv);
-	rcu_read_lock();
-	ppid = task_tgid_vnr(current->real_parent);
-	rcu_read_unlock();
 	snprintf(buffer, tomoyo_buffer_len - 1,
 		 "#timestamp=%lu profile=%u mode=%s (global-pid=%u)"
 		 " task={ pid=%u ppid=%u uid=%u gid=%u euid=%u"
 		 " egid=%u suid=%u sgid=%u fsuid=%u fsgid=%u }",
 		 tv.tv_sec, r->profile, tomoyo_mode[r->mode], gpid,
-		 task_tgid_vnr(current), ppid,
+		 do_getpid(), do_getppid(),
 		 current_uid(), current_gid(), current_euid(),
 		 current_egid(), current_suid(), current_sgid(),
 		 current_fsuid(), current_fsgid());
-- 
1.7.1



