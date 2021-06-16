From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH] alpha: Add extra switch_stack frames in exit, exec, and kernel threads
Date: Wed, 16 Jun 2021 11:32:47 -0500
Message-ID: <87mtrpg47k.fsf@disp2133>
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
        <87fsxjorgs.fsf@disp2133> <87zgvqor7d.fsf_-_@disp2133>
        <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
        (Linus Torvalds's message of "Tue, 15 Jun 2021 15:02:57 -0700")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Tue, Jun 15, 2021 at 12:36 PM Eric W. Biederman
> <ebiederm@xmission.com> wrote:
>>
>> I looked and there nothing I can do that is not arch specific, so
>> whack the moles with a minimal backportable fix.
>>
>> This change survives boot testing on qemu-system-alpha.
>
> So as mentioned in the other thread, I think this patch is exactly right.
>
> However, the need for this part
>
>> @@ -785,6 +785,7 @@ ret_from_kernel_thread:
>>         mov     $9, $27
>>         mov     $10, $16
>>         jsr     $26, ($9)
>> +       lda     $sp, SWITCH_STACK_SIZE($sp)
>>         br      $31, ret_to_user
>>  .end ret_from_kernel_thread
>
> obviously eluded me in my "how about something like this", and I had
> to really try to figure out why we'd ever return.
>
> Which is why I came to that "oooh - kernel_execve()" realization.
>
> It might be good to comment on that somewhere. And if you can think of
> some other case, that should be mentioned too.
>
> Anyway, thanks for looking into this odd case. And if you have a
> test-case for this all, it really would be a good thing. Yes, it
> should only affect a couple of odd-ball architectures, but still... It
> would also be good to hear that you actually did verify the behavior
> of this patch wrt that ptrace-of-io-worker-threads case..

*Grumble*

So just going through and looking to see what it takes to instrument
and put in warnings when things go wrong I have found another issue.

Today there exists:
PTRACE_EVENT_FORK
PTRACE_EVENT_VFORK
PTRACE_EVENT_CLONE

Which happens after the actual fork operation in the kernel.

The following code wraps those operations in arch/alpha/kernel/entry.S

.macro	fork_like name
	.align	4
	.globl	alpha_\name
	.ent	alpha_\name
alpha_\name:
	.prologue 0
	bsr	$1, do_switch_stack
	jsr	$26, sys_\name
	ldq	$26, 56($sp)
	lda	$sp, SWITCH_STACK_SIZE($sp)
	ret
.end	alpha_\name
.endm

The code in the kernel when calls in fork.c calls ptrace_event_pid
which ultimately calls ptrace_stop.  So userspace can reasonably expect
to stop the process and change it's registers.

With unconditionally popping the switch stack any of those registers
that are modified are lost.

So I will update my changes to handle that case as well.


Eric
