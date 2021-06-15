From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Tue, 15 Jun 2021 14:30:59 -0500
Message-ID: <87fsxjorgs.fsf@disp2133>
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
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com> (Michael
        Schmitz's message of "Tue, 15 Jun 2021 10:26:33 +1200")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Michael Schmitz <schmitzmic@gmail.com> writes:

> Hi Eric,
>
> On 15/06/21 4:26 am, Eric W. Biederman wrote:
>> Michael Schmitz <schmitzmic@gmail.com> writes:
>>
>>> On second thought, I'm not certain what adding another empty stack frame would
>>> achieve here.
>>>
>>> On m68k, 'frame' already is a new stack frame, for running the new thread
>>> in. This new frame does not have any user context at all, and it's explicitly
>>> wiped anyway.
>>>
>>> Unless we save all user context on the stack, then push that context to a new
>>> save frame, and somehow point get_signal to look there for IO threads
>>> (essentially what Eric suggested), I don't see how this could work?
>>>
>>> I must be missing something.
>> It is only designed to work well enough so that ptrace will access
>> something well defined when ptrace accesses io_uring tasks.
>>
>> The io_uring tasks are special in that they are user process
>> threads that never run in userspace.  So as long as everything
>> ptrace can read is accessible on that process all is well.
> OK, I'm testing a patch that would save extra context in sys_io_uring_setup,
> which ought to ensure that for m68k.

I had to update ret_from_kernel_thread to pop that state to get Linus's
change to boot.  Apparently kernel_threads exiting needs to be handled.

>> Having stared a bit longer at the code I think the short term
>> fix for both of PTRACE_EVENT_EXIT and io_uring is to guard
>> them both with CONFIG_HAVE_ARCH_TRACEHOOK.

Which does not work because nios2 which looks susceptible
sets CONFIG_HAVE_ARCH_TRACEHOOK.

A further look shows that there is also PTRACE_EVENT_EXEC that
needs to be handled so execve and execveat need to be wrapped
as well.

Do you happen to know if there is userspace that will run
in qemu-system-m68k that can be used for testing?

Eric

