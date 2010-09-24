From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: How can I use getpid() and getppid() from kernel?
Date: Fri, 24 Sep 2010 13:42:38 +0900
Message-ID: <201009241342.AGI43783.OQMJFOtFVFOSHL@I-love.SAKURA.ne.jp>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

Hello.

Quoting from linux-2.6.36-rc5/security/tomoyo/common.c

static char *tomoyo_print_header(struct tomoyo_request_info *r)
{
	struct timeval tv;
	const pid_t gpid = task_pid_nr(current);
	static const int tomoyo_buffer_len = 4096;
	char *buffer = kmalloc(tomoyo_buffer_len, GFP_NOFS);
	if (!buffer)
		return NULL;
	do_gettimeofday(&tv);
	snprintf(buffer, tomoyo_buffer_len - 1,
        	 "#timestamp=%lu profile=%u mode=%s (global-pid=%u)"
		 " task={ pid=%u ppid=%u uid=%u gid=%u euid=%u"
		 " egid=%u suid=%u sgid=%u fsuid=%u fsgid=%u }",
		 tv.tv_sec, r->profile, tomoyo_mode[r->mode], gpid,
		 (pid_t) sys_getpid(), (pid_t) sys_getppid(),
		 current_uid(), current_gid(), current_euid(),
		 current_egid(), current_suid(), current_sgid(),
		 current_fsuid(), current_fsgid());
	return buffer;
}

But alpha does not have sys_getppid() and sys_getpid() defined, and
is causing build failure for "make allmodconfig" case.

arch/alpha/kernel/entry.S defines getxpid as an assembly function.

        .align  4
        .globl  sys_getxpid
        .ent    sys_getxpid
sys_getxpid:
        .prologue 0
        ldq     $2, TI_TASK($8)

        /* See linux/kernel/timer.c sys_getppid for discussion
           about this loop.  */
        ldq     $3, TASK_GROUP_LEADER($2)
        ldq     $4, TASK_REAL_PARENT($3)
        ldl     $0, TASK_TGID($2)
1:      ldl     $1, TASK_TGID($4)
#ifdef CONFIG_SMP
        mov     $4, $5
        mb
        ldq     $3, TASK_GROUP_LEADER($2)
        ldq     $4, TASK_REAL_PARENT($3)
        cmpeq   $4, $5, $5
        beq     $5, 1b
#endif
        stq     $1, 80($sp)
        ret
.end sys_getxpid

But I don't know how to call it from tomoyo_print_header().

How can I get PID and PPID?

Regards.
