From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH 1/2] alpha/ptrace: Record and handle the absence of switch_stack
Date: Wed, 16 Jun 2021 15:57:19 -0500
Message-ID: <878s398r4g.fsf@disp2133>
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
        <87mtrpg47k.fsf@disp2133> <87pmwlek8d.fsf_-_@disp2133>
        <87k0mtek4n.fsf_-_@disp2133>
        <CAHk-=wiTEZN_3ipf51sh-csdusW4uGzAXq9m1JcMHu_c8OJ+pQ@mail.gmail.com>
        <CAHk-=whvNaYffE8Eaa4-jjYbF_r1u1sh5LF5zXFhdEP8hxySMQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAHk-=whvNaYffE8Eaa4-jjYbF_r1u1sh5LF5zXFhdEP8hxySMQ@mail.gmail.com>
        (Linus Torvalds's message of "Wed, 16 Jun 2021 13:37:29 -0700")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Wed, Jun 16, 2021 at 1:00 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> And even for debugging, I think it would be both easier and cheaper to
>> just add a magic word to the entry stack instead.
>
> IOW, just add a
>
>       unsigned long magic;
>
> to "struct switch_stack", and then make the stack switch code push that value.
>
> That would be cheap enough to be just unconditional, but you could
> make it depend on a debug config option too, of course.
>
> It helps if 'xyz' is some constant that is easyish to generate. It
> might not be a constant - maybe it could be the address of that
> 'magic' field itself, so you'd just generate it with
>
>     stq $r,($r)
>
> and it would be equally easy to just validate at lookup for that WARN_ON_ONCE():
>
>     WARN_ON_ONCE(switch_stack->magic != (unsigned long)&switch_stack->magic);
>
> or whatever.
>
> It's for debugging, not security. So it doesn't have to be some kind
> of super-great magic number, just something easy to generate and check
> (that isn't a common value like "0" that trivially exist on the stack
> anyway).

Fair enough.

I was thinking for a moment that do_sigreturn might have a problem with
that but restore_sigcontext makes it clear that struct switch_stack is
not exposed to userspace.

Do you know if struct switch_stack or pt_regs is ever exposeed to
usespace?  They are both defined in arch/alpha/include/uapi/asm/ptrace.h
which makes me think userspace must see those definitions somewhere.

Eric
