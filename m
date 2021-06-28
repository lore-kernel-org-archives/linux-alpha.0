From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH 0/9] Refactoring exit
Date: Mon, 28 Jun 2021 14:02:50 -0500
Message-ID: <87v95xx15x.fsf@disp2133>
References: <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
        <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
        <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
        <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
        <87a6njf0ia.fsf@disp2133>
        <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
        <87tulpbp19.fsf@disp2133>
        <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
        <87zgvgabw1.fsf@disp2133> <875yy3850g.fsf_-_@disp2133>
        <YNULA+Ff+eB66bcP@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <YNULA+Ff+eB66bcP@zeniv-ca.linux.org.uk> (Al Viro's message of
        "Thu, 24 Jun 2021 22:45:23 +0000")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Al Viro <viro@zeniv.linux.org.uk> writes:

> On Thu, Jun 24, 2021 at 01:57:35PM -0500, Eric W. Biederman wrote:
>
>> So far the code has been lightly tested, and the descriptions of some
>> of the patches are a bit light, but I think this shows the direction
>> I am aiming to travel for sorting out exit(2) and exit_group(2).
>
> FWIW, here's the current picture for do_exit(), aside of exit(2) and do_exit_group():
>
> 1) stuff that is clearly oops-like -
>         alpha:die_if_kernel() alpha:do_entUna() alpha:do_page_fault() arm:oops_end()
>         arm:__do_kernel_fault() arm64:die() arm64:die_kernel_fault() csky:alignment()
>         csky:die() csky:no_context() h8300:die() h8300:do_page_fault() hexagon:die()
>         ia64:die() i64:ia64_do_page_fault() m68k:die_if_kernel() m68k:send_fault_sig()
>         microblaze:die() mips:die() nds32:handle_fpu_exception() nds32:die()
>         nds32:unhandled_interruption() nds32:unhandled_exceptions() nds32:do_revinsn()
>         nds32:do_page_fault() nios:die() openrisc:die() openrisc:do_page_fault()
>         parisc:die_if_kernel() ppc:oops_end() riscv:die() riscv:die_kernel_fault()
>         s390:die() s390:do_no_context() s390:do_low_address() sh:die()
>         sparc32:die_if_kernel() sparc32:do_sparc_fault() sparc64:die_if_kernel()
>         x86:rewind_stack_do_exit() xtensa:die() xtensa:bad_page_fault()
> We really do not want ptrace anywhere near any of those and we do not want
> any of that to return; this shit would better be handled right there and
> there - no "post a fatal signal" would do.

Thanks that makes a good start for digging into these.

I think the distinction I would make is:
- If the kernel is broken use do_task_dead.
- Otherwise cleanup the semantics by using start_group_exit,
  start_task_exit or by just cleaning up the code.
  

Looking at the reboot case it looks like we the code
should have become do_group_exit in 2.5.  I have a suspicion
we have a bunch of similar cases that want to terminate the
entire process, but we simply never updated to deal with
multi-thread processes.

I suspect in the reboot case panic if machine_halt or
or machine_power_off fails is more likely the correct
handling.  But we do have funny semantics sometimes.

I will see what I can do to expand my patchset to handle all of these
various callers of do_exit.

Eric
