From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCHES] alpha asm glue cleanups and fixes
Date: Fri, 2 Sep 2022 02:48:55 +0100
Message-ID: <YxFhB4/cEXX5aHbn@ZenIV>
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=XSS9rkgS7B/43ydo8eO01AB8lrWnBsySyIdE/v6RhDY=; b=ftSYauo7Qibu/t03rICXdofBs7
        vaDvcP2AusJDRY+f3gaX/5nIfS2DJju9S+jAoO/caKXwXg+0QS4Z+Ty6VQBGPvGS/647PnjergUX/
        QA5rX6KAu7h3tegvj5ICZZjlCRU1x/62R/YWy+SngJ2Vfrlx/TBymNV55xTxE2zL2XEvn2dkNNJLw
        7I0pOh/AKJoaemouQem0Va3bOfR2gayftOc09kWT+2Sj5za/MvvTfZ8tQsXYN8BKRqHLbRhCn3LKD
        JKGTcHq8DxjQWH0Pb0SnyaUUJLHdqtum4cMs13L+r80Xd+5ERf214Bz0N+yKyujl4zfsAEGGgYAm4
        jFM2TqmA==;
Content-Disposition: inline
In-Reply-To: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>

Resurrecting old series:

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

7) lazy FPU switching.  We save/restore all FPU registers a lot more than
we have to; the following reduces the amount quite a bit:
	* move the array we save into from switch_stack to thread_info
	* have a (thread-synchronous) flag set when we save them
	* have another flag set when they should be restored on return to
userland.
	* do *NOT* save/restore them in do_switch_stack()/undo_switch_stack().
	* restore on the exit to user mode if the restore flag had been set.
Clear both flags.
	* on context switch, entry to fork/clone/vfork, before entry into
do_signal() and on entry into straced syscall save the registers and set
the 'saved' flag unless it had been already set.
	* on context switch set the 'restore' flag as well.
	* have copy_thread() set both flags for child, so the registers would
be restored once the child returns to userland.
	* use the saved data in setup_sigcontext(); have restore_sigcontext()
set both flags and copy from sigframe to save area.
	* teach ptrace to look for FPU registers in thread_info instead of
switch_stack.
	* teach isolated accesses to FPU registers (rdfpcr, wrfpcr, etc.)
to check the 'saved' flag (under preempt_disable()) and work with the save area
if it's been set; if 'saved' flag is found upon write access, set 'restore' flag
as well.  NOTE: it's tempting to just force register saving in those - it
would simplify the code quite a bit.  Unfortunately, it would also force the
full FPU save/restore in situations where we really don't want the overhead
of that ;-/

Tested on qemu and on real hw (older one - the only EV67 box I have is not
in good condition).  Seems to work; benefits depend upon the load.

Patchset lives in git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git
#next.alpha; individual patches in followups.
