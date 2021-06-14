From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Mon, 14 Jun 2021 11:26:39 -0500
Message-ID: <87eed4v2dc.fsf@disp2133>
References: <87sg1p30a1.fsf@disp2133>
        <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
        <87pmwsytb3.fsf@disp2133>
        <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
        <87sg1lwhvm.fsf@disp2133>
        <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
        <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
        <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com> (Michael
        Schmitz's message of "Mon, 14 Jun 2021 17:03:32 +1200")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Michael Schmitz <schmitzmic@gmail.com> writes:

> On second thought, I'm not certain what adding another empty stack frame would
> achieve here.
>
> On m68k, 'frame' already is a new stack frame, for running the new thread
> in. This new frame does not have any user context at all, and it's explicitly
> wiped anyway.
>
> Unless we save all user context on the stack, then push that context to a new
> save frame, and somehow point get_signal to look there for IO threads
> (essentially what Eric suggested), I don't see how this could work?
>
> I must be missing something.

It is only designed to work well enough so that ptrace will access
something well defined when ptrace accesses io_uring tasks.

The io_uring tasks are special in that they are user process
threads that never run in userspace.  So as long as everything
ptrace can read is accessible on that process all is well.

Having stared a bit longer at the code I think the short term
fix for both of PTRACE_EVENT_EXIT and io_uring is to guard
them both with CONFIG_HAVE_ARCH_TRACEHOOK.

Today CONFIG_HAVE_ARCH_TRACEHOOK guards access to /proc/self/syscall.
Which out of necessity ensures that user context is always readable.
Which seems to solve both the PTRACE_EVENT_EXIT and the io_uring
problems.

What I especially like about that is there are a lot of other reasons
to encourage architectures in a CONFIG_HAVE_ARCH_TRACEHOOK direction.
I think the biggies are getting architectures to store the extra
saved state on context switch into some place in task_struct
and to implement the regset view of registers.

Hmm. This is odd. CONFIG_HAVE_ARCH_TRACEHOOK is supposed to imply
CORE_DUMP_USE_REGSET.  But alpha, csky, h8300, m68k, microblaze, nds32
don't implement CORE_DUMP_USE_REGSET but nds32 implements
CONFIG_ARCH_HAVE_TRACEHOOK.

I will keep digging and see what clean code I can come up with.

Eric
