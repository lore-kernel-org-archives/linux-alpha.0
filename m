From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 1/2] alpha/ptrace: Record and handle the absence of switch_stack
Date: Sun, 20 Jun 2021 20:37:22 -0700
Message-ID: <CAHk-=wgTGW0Q0BzpSJcLhseui1fH7Gbasvsz81Z89CMSAHE-Bw@mail.gmail.com>
References: <87sg1p30a1.fsf@disp2133> <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133> <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <87zgvqor7d.fsf_-_@disp2133> <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
 <87mtrpg47k.fsf@disp2133> <87pmwlek8d.fsf_-_@disp2133> <87k0mtek4n.fsf_-_@disp2133>
 <393c37de-5edf-effc-3d06-d7e63f34a317@gmail.com> <CAHk-=wip8KgrNUcU68wsLZqbWV+3NWg9kqqQwygHGAA8-xOwMA@mail.gmail.com>
 <60c0fe00-b966-6385-d348-f6dd45277113@gmail.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1+HtUJLugMh1gE/Pq8w2A+iKsdZnPrpQbbhzWMAu6G8=;
        b=CguqVrwfLz3sZcjWNSP9u4srUE9fQXJpZYNDvur7BjH1Wa9iE+6JLPbb6gu1bHRbzP
         lhuXpf4aJ6FAM06cgPcFG8165A9ru2Rghgmk3cWS8VmtaMrnFl6vfe5YF+lxxVFXRiLZ
         rAtq4O0Gb8NYZTtOP3OEjIKCqz0zBbzRqM0Fw=
In-Reply-To: <60c0fe00-b966-6385-d348-f6dd45277113@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

On Sun, Jun 20, 2021 at 8:18 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> I hope that makes more sense?

So the problem is in your debug patch: you don't set that
TIS_SWITCH_STACK in nearly enough places.

In this particular example, I think it's that you don't set it in
do_trace_exit, so when you strace the process, the system call exit -
which is where the return value will be picked up - gets that warning.

You did set TIS_SWITCH_STACK on trace_entry, but then it's cleared
again during the system call, and not set at the trace_exit path.
Oddly, your debug patch also _clears_ it on the exit path, but it
doesn't set it when do_trace_exit does the SAVE_SWITCH_STACK.

You oddly also set it for __sys_exit, but not all the other special
system calls that also do that SAVE_SWITCH_STACK.

Really, pretty much every single case of SAVE_SWITCH_STACK would need
to set it. Not just do_trace_enter/exit

It's why I didn't like Eric's debug patch either. It's quite expensive
to do, partly because you look up that curptr thing. All very nasty.

It would be *much* better to make the flag be part of the stack frame,
but sadly at least on alpha we had exported the format of that stack
frame to user space.

Anyway, I think these debug patches are not just expensive but the
m68k one most definitely is also very incomplete.

             Linus
