From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 1/2] alpha/ptrace: Record and handle the absence of
 switch_stack
Date: Mon, 21 Jun 2021 16:08:35 +1200
Message-ID: <700d8acd-d3df-a026-8b1d-55eeae836eea@gmail.com>
References: <87sg1p30a1.fsf@disp2133>
 <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133>
 <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133>
 <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
 <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com> <87eed4v2dc.fsf@disp2133>
 <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com> <87fsxjorgs.fsf@disp2133>
 <87zgvqor7d.fsf_-_@disp2133>
 <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
 <87mtrpg47k.fsf@disp2133> <87pmwlek8d.fsf_-_@disp2133>
 <87k0mtek4n.fsf_-_@disp2133> <393c37de-5edf-effc-3d06-d7e63f34a317@gmail.com>
 <CAHk-=wip8KgrNUcU68wsLZqbWV+3NWg9kqqQwygHGAA8-xOwMA@mail.gmail.com>
 <60c0fe00-b966-6385-d348-f6dd45277113@gmail.com>
 <CAHk-=wgTGW0Q0BzpSJcLhseui1fH7Gbasvsz81Z89CMSAHE-Bw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=F9odJSZJ3JHPCDq5xWJRw+RMGbd9Q+9zPppzBJyCxj4=;
        b=Eho+Hv3biN4uuSiZMxo0AjUNa9n+ziDPIuyDrm4TVlHFw2x+yxKEQi7R8uZS5S9XNk
         gGgEAY96ZGN7wRhP53985TAMlMuEZfbZLbo2EkhHMls4CW8p7PdmYz1Cai5kkoswAZ9k
         gYBovh0PHzAkx9wudrQVZ0L01Ha8zSx6asccS+ynHXLe519RNSWSkK/OS03dv0NUgSy2
         z3CES8B12c2YuTbQMdxiyKGHKbvEt7uOdZGxNuQi6aD0jEIYM/7NhB/xYLnZHkm//IAI
         T8Wg9Z4swG5YS40bp0Ki/q5lMWliWOe+1KDUR8mH/5KcL0dLqru00c2OduyIF3kp8yXw
         0bog==
In-Reply-To: <CAHk-=wgTGW0Q0BzpSJcLhseui1fH7Gbasvsz81Z89CMSAHE-Bw@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Hi Linus,

I realized that the patch is still incomplete when answering Al...

Am 21.06.2021 um 15:37 schrieb Linus Torvalds:
> On Sun, Jun 20, 2021 at 8:18 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>
>> I hope that makes more sense?
>
> So the problem is in your debug patch: you don't set that
> TIS_SWITCH_STACK in nearly enough places.
>
> In this particular example, I think it's that you don't set it in
> do_trace_exit, so when you strace the process, the system call exit -
> which is where the return value will be picked up - gets that warning.
>
> You did set TIS_SWITCH_STACK on trace_entry, but then it's cleared
> again during the system call, and not set at the trace_exit path.
> Oddly, your debug patch also _clears_ it on the exit path, but it
> doesn't set it when do_trace_exit does the SAVE_SWITCH_STACK.
>
> You oddly also set it for __sys_exit, but not all the other special
> system calls that also do that SAVE_SWITCH_STACK.

That's the one I used to test whether my debug patch had any ill side 
effects (i.e. smashing the stack) late yesterday. Forgot to add that to 
the other cases.

>
> Really, pretty much every single case of SAVE_SWITCH_STACK would need
> to set it. Not just do_trace_enter/exit

Yes - done that now and the warning is gone.

> It's why I didn't like Eric's debug patch either. It's quite expensive
> to do, partly because you look up that curptr thing. All very nasty.

I need to talk to Geert and Andreas to find where register a1 is 
preserved, but if I have to reload a1 all the time, this won't be useful 
except for debugging.

> It would be *much* better to make the flag be part of the stack frame,
> but sadly at least on alpha we had exported the format of that stack
> frame to user space.

Same on m68k, but can we push a flag _after_ the switch stack?

> Anyway, I think these debug patches are not just expensive but the
> m68k one most definitely is also very incomplete.

Yes, I've seen that in the meantime. Need to triple check my work next 
time.

Sorry for the extra noise!

Cheers,

	Michael

>
>              Linus
>
