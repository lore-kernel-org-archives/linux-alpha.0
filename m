From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Mon, 21 Jun 2021 15:03:57 -0500
Message-ID: <87a6njf0ia.fsf@disp2133>
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
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
        (Linus Torvalds's message of "Mon, 21 Jun 2021 12:22:06 -0700")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Mon, Jun 21, 2021 at 11:59 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>>
>>         There's a large mess around do_exit() - we have a bunch of
>> callers all over arch/*; if nothing else, I very much doubt that really
>> want to let tracer play with a thread in the middle of die_if_kernel()
>> or similar.
>
> Right you are.
>
> I'm really beginning to hate ptrace_{event,notify}() and those
> PTRACE_EVENT_xyz things.
>
> I don't even know what uses them, honestly. How very annoying.

Modern strace does.  Modern gdb appears not to.

However strace at least does not read the exit code,
or really appear to care about stopping for PTRACE_EVENT_EXIT.

I completely agree with you that they are very annoying.

> I guess it's easy enough (famous last words) to move the
> ptrace_event() call out of do_exit() and into the actual
> exit/exit_group system calls, and the signal handling path. The paths
> that actually have proper pt_regs.
>
> Looks like sys_exit() and do_group_exit() would be the two places to
> do it (do_group_exit() would handle the signal case and
> sys_group_exit()).

For other ptrace_event calls I am playing with seeing if I can split
them in two.  Like sending a signal.  So that we can have perform all
of the work in get_signal.

I think we can even change exit_group(2) and exit(2) so that (at least
when ptraced) they just send the ``event signal'' and then the signal
handling path handles all of the ptrace stuff.


When I started it was just going to be exit and PTRACE_EVENT_EXIT and
some old architectures, and that a generic solution was going to be
hard.

I still think we are going to need to fix the io_uring threads on the
architectures that use the caller saved register optimization like alpha
and m68k.  But I think we can handle the rest in generic code.

Eric
