From: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCHES] alpha asm glue cleanups and fixes
Date: Sat, 25 Sep 2021 02:54:13 +0000
Message-ID: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>

	Fallout from asm glue review on alpha:

1) TIF_NOTIFY_SIGNAL support is broken; do_work_pending() handles
it, but the logics *calling* do_work_pending() ignores that flag
completely.  If it's called for other reasons - fine, but
TIF_NOTIFY_SIGNAL alone will not suffice for that.  Bug from the
last cycle.  5.11 bug.

2) _TIF_ALLWORK_MASK is junk - never had been used.

3) !AUDIT_SYSCALL configs have buggered logics for going into
straced syscall path.  Any thread flag (including TIF_SIGNAL_PENDING)
will suffice to send us there.  3.14 bug.

4) on straced syscalls we have force_successful_syscall_return() broken -
it ends up with a3 *not* set to 0.

5) on non-straced syscalls force_successful_syscall_return() handling is
suboptimal - it duplicates code from the normal syscall return path for
no good reason; instead of branching to the copy, it might branch to the
original just fine.

6) ret_from_fork could just as well go to ret_from_user - it's not going
to be hit when returning to kernel mode.

Patchset lives in git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git
#work.alpha; individual patches in followups.
