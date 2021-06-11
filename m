From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Fri, 11 Jun 2021 16:39:44 -0500
Message-ID: <87pmwsytb3.fsf@disp2133>
References: <87sg1p30a1.fsf@disp2133>
        <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
        (Linus Torvalds's message of "Thu, 10 Jun 2021 15:04:33 -0700")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Daniel Jacobowitz <drow@nevyn.them.org>, Kees Cook <keescook@chromium.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Thu, Jun 10, 2021 at 1:58 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>>
>> The problem is sometimes we read all of the registers from
>> a context where they are not all saved.
>
> Ouch. Yes. And this is really painful because none of the *normal*
> architectures do this, so it gets absolutely no coverage.
>
>> I think at this point we need to say that the architectures that have a
>> do this need to be fixed to at least call do_exit and the kernel
>> function in create_io_thread with the deeper stack.
>
> Yeah. We traditionally have that requirement for fork() and friends
> too (vfork/clone), so adding exit and io_uring to do so seems like the
> most straightforward thing.

Interesting.  I am starting with Al's analysis and reading the code
to see if I can understand what is going on.  So I am still glossing
over a few details as I dig into this.  Kernel threads not having
all of their registers saved is one of those details.

Looking at copy_thread it looks like at least on alpha we are dealing
with a structure that defines all of the registers in copy_thread.  So
perhaps all of the registers are there in kernel_threads already.  I
don't read alpha assembly very well and fork is a bit subtle.  I don't
know which piece of code is calling
ret_from_fork/ret_from_kernel_thread.

I really suspect that all of those registers are popped so at least for
IO_THREADS we need to push them again, in a way that signal_pt_regs()
can find them.

It looks like we just need something like this to cover the userspace
side of exit.

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index e227f3a29a43..ab0dcb545bd1 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -812,6 +812,22 @@ fork_like fork
 fork_like vfork
 fork_like clone
 
+.macro exit_like name
+	.align	4
+	.globl	alpha_\name
+	.ent	alpha_\name
+alpha_\name:
+	.prologue 0
+	DO_SWITCH_STACK
+	jsr	$26, sys_\name
+	UNDO_SWITCH_STACK
+	ret
+.end	alpha_\name
+.endm
+
+exit_like exit
+exit_like exit_group
+
 .macro	sigreturn_like name
 	.align	4
 	.globl	sys_\name
diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index 3000a2e8ee21..b9d6449d6caa 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -8,7 +8,7 @@
 # The <abi> is always "common" for this file
 #
 0	common	osf_syscall			alpha_syscall_zero
-1	common	exit				sys_exit
+1	common	exit				alpha_exit
 2	common	fork				alpha_fork
 3	common	read				sys_read
 4	common	write				sys_write
@@ -333,7 +333,7 @@
 400	common	io_getevents			sys_io_getevents
 401	common	io_submit			sys_io_submit
 402	common	io_cancel			sys_io_cancel
-405	common	exit_group			sys_exit_group
+405	common	exit_group			alpha_exit_group
 406	common	lookup_dcookie			sys_lookup_dcookie
 407	common	epoll_create			sys_epoll_create
 408	common	epoll_ctl			sys_epoll_ctl


> But I really wish we had some way to test and trigger this so that we
> wouldn't get caught on this before. Something in task_pt_regs() that
> catches "this doesn't actually work" and does a WARN_ON_ONCE() on the
> affected architectures?

I think that would require pushing an extra magic value in SWITCH_STACK
and not just popping it but deliberately changing that value in
UNDO_SWITCH_STACK.  Basically stack canaries.

I don't see how we could do it in an arch independent way though.
Which means it will require auditing all of the architectures to get
there. Volunteers?

This is looking straight forward enough that I can probably pull
something together, just don't count on me to have it done in anything
resembling a timely manner.

Eric
