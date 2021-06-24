From: ebiederm@xmission.com (Eric W. Biederman)
Subject: [PATCH 0/9] Refactoring exit
Date: Thu, 24 Jun 2021 13:57:35 -0500
Message-ID: <875yy3850g.fsf_-_@disp2133>
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
        <87a6njf0ia.fsf@disp2133>
        <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
        <87tulpbp19.fsf@disp2133>
        <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
        <87zgvgabw1.fsf@disp2133>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <87zgvgabw1.fsf@disp2133> (Eric W. Biederman's message of "Wed,
        23 Jun 2021 09:33:50 -0500")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>


I dug into exit because PTRACE_EVENT_EXIT not being guaranteed to be
called with a stack where ptrace read and write all of the userspace
registers can lead to unfiltered reads and writes of kernel stack
contents.

While looking into it I realized that there are a lot of little races
between all of the ways an exit can be initiated.  I don't know of a way
those races are harmful, but they make the code difficult to reason about.

The solution this set of changes adopts is to implement good primitives
for asynchronous exit and exit_group requests and modifies exit(2) and
exit_group(2) to use those primitives.

The result should be more consistent determination of the reason for an
exit, as well as PTRACE_EVENT_EXIT always being called from a context
(get_signal) where ptrace is guaranteed to be able to read and write
all of the registers.

I believe the set of changes could be justified for the cleanups alone
even if PTRACE_EVENT_EXIT did not need to be moved.  Which makes me
feel good about this approach.

If a way can be found that coredumps can be started from complete_signal
(needed for timely handling of fatal signals) instead of needing to
start in do_coredump for proper synchronization force_siginfo_to_task
and get_signal can be significantly simplified.  As it is a lot of
checks are duplicated to ensure that everything works properly in the
presence of do_coredump.

So far the code has been lightly tested, and the descriptions of some
of the patches are a bit light, but I think this shows the direction
I am aiming to travel for sorting out exit(2) and exit_group(2).

Eric W. Biederman (9):
      signal/sh: Use force_sig(SIGKILL) instead of do_group_exit(SIGKILL)
      signal/seccomp: Refactor seccomp signal and coredump generation
      signal/seccomp: Dump core when there is only one live thread
      signal: Factor start_group_exit out of complete_signal
      signal/group_exit: Use start_group_exit in place of do_group_exit
      signal: Fold do_group_exit into get_signal fixing io_uring threads
      signal: Make individual tasks exiting a first class concept.
      signal/task_exit: Use start_task_exit in place of do_exit
      signal: Move PTRACE_EVENT_EXIT into get_signal

 arch/sh/kernel/cpu/fpu.c     |  10 +--
 fs/exec.c                    |  10 ++-
 include/linux/sched/jobctl.h |   2 +
 include/linux/sched/signal.h |   5 ++
 include/linux/sched/task.h   |   1 -
 kernel/exit.c                |  41 ++---------
 kernel/seccomp.c             |  45 +++---------
 kernel/signal.c              | 166 ++++++++++++++++++++++++++++++-------------
 8 files changed, 154 insertions(+), 126 deletions(-)
