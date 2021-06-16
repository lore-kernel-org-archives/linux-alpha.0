From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH 1/2] alpha/ptrace: Record and handle the absence of switch_stack
Date: Wed, 16 Jun 2021 15:42:05 -0500
Message-ID: <87czsla6ea.fsf@disp2133>
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
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <CAHk-=wiTEZN_3ipf51sh-csdusW4uGzAXq9m1JcMHu_c8OJ+pQ@mail.gmail.com>
        (Linus Torvalds's message of "Wed, 16 Jun 2021 13:00:52 -0700")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Wed, Jun 16, 2021 at 11:32 AM Eric W. Biederman
> <ebiederm@xmission.com> wrote:
>>
>> Prevent security holes by recording when all of the registers are
>> available so generic code changes do not result in security holes
>> on alpha.
>
> Please no, not this way. ldl/stc is extremely expensive on some alpha cpus.
>
> I really think thatTIF_ALLREGS_SAVED bit isn't worth it, except
> perhaps for debugging.
>
> And even for debugging, I think it would be both easier and cheaper to
> just add a magic word to the entry stack instead.

I think I can do something like that.

Looking at arch/alpha/asm/cache.h it looks like alpha had either 32byte
or 64bit cachelines.  Which makes struct switch_stack a full 10 or 5
cachelines in size.  So pushing something extra might hit an extra
cacheline.

However it looks like struct pt_regs is 16 bytes short of a full cache
line so struct switch_stack isn't going to be cacheline aligned. Adding
an extra 8 bytes of magic number will hopefully be in the noise.

If I can I would like to find something that is cheap enough that I can
always leave on.  Mostly because there is little enough testing that a
bug that allows anyone to stomp the kernel stack has existed for 17 years
without being noticed.

If you want it to be a debug option only I can certainly make that
happen.  I am still going "Eek! Arbitrary stack smash!" in my head.

Eric
