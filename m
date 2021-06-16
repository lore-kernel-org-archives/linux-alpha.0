From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Wed, 16 Jun 2021 10:06:56 -0500
Message-ID: <87mtrplugf.fsf@disp2133>
References: <87sg1p30a1.fsf@disp2133>
        <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
        <87pmwsytb3.fsf@disp2133>
        <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
        <87sg1lwhvm.fsf@disp2133>
        <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
        <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
        <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
        <87eed4v2dc.fsf@disp2133>
        <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
        <87fsxjorgs.fsf@disp2133>
        <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
        (Linus Torvalds's message of "Tue, 15 Jun 2021 14:58:12 -0700")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Tue, Jun 15, 2021 at 12:32 PM Eric W. Biederman
> <ebiederm@xmission.com> wrote:
>>
>> I had to update ret_from_kernel_thread to pop that state to get Linus's
>> change to boot.  Apparently kernel_threads exiting needs to be handled.
>
> You are very right.
>
> That, btw, seems to be a horrible design mistake, but I think it's how
> "kernel_execve()" works - both for the initial "init", but also for
> user-mode helper processes.
>
> Both of those cases do "kernel_thread()" to create a new thread, and
> then that new kernel thread does kernel_execve() to create the user
> space image for that thread. And that act of "execve()" clears
> PF_KTHREAD from the thread, and then the final return from the kernel
> thread function returns to that new user space.
>
> Or something like that. It's been ages since I looked at that code,
> and your patch initially confused the heck out of me because I went
> "that can't _possibly_ be needed".
>
> But yes, I think your patch is right.
>
> And I think our horrible "kernel threads return to user space when
> done" is absolutely horrifically nasty. Maybe of the clever sort, but
> mostly of the historical horror sort.
>
> Or am I mis-rememberting how this ends up working? Did you look at
> exactly what it was that returned from kernel threads?
>
> This might be worth commenting on somewhere. But your patch for alpha
> looks correct to me. Did you have some test-case to verify ptrace() on
> io worker threads?

At this point I just booted an alpha image and on qemu-system-alpha.

I do have gdb in my kernel image so I can test that.  I haven't yet but
I can and should.

Sleeping on it I came up with a plan to add TF_SWITCH_STACK_SAVED to
indicate if the registers have been saved.  The DO_SWITCH_STACK and
UNDO_SWITCH_STACK helpers (except in alpha_switch_to) can test that.
The ptrace helpers can test that and turn an access of random kernel
stack contents into something well behaved that does WARN_ON_ONCE
because we should not get there.

I suspect adding TF_SWITCH_STACK_SAVED should come first so it
is easy to verify the problem behavior, before I fix it.

My real goal is to find a pattern that architectures whose register
saves are structured like alphas can emulate, to minimize problems in
the future.

Plus I would really like to get the last handful of architectures
updated so we can remove CONFIG_HAVE_ARCH_TRACEHOOK.  I think we can
do that on alpha because we save all of the system call arguments
in pt_regs and that is all the other non-ptrace code paths care about.

AKA I am trying to move the old architectures forward so we can get rid
of unnecessary complications in the core code.

Eric
