From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Mon, 14 Jun 2021 14:05:38 +1200
Message-ID: <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
References: <87sg1p30a1.fsf@disp2133>
 <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133>
 <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133>
 <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+U4GoEm12Mv2KWeNTFflh3iSMJxQvnIQYGnEBokeD3E=;
        b=bAhH8lpYP7l8LZwdKg5n4tzz+dADfCxOx1lDGRVuMMRc9dYcyt25Ixyes2Xr6G7IC9
         mfqt9HfSdeD3+s0RfqxaiJtfYK6DS4SM83//4OdzNK1JLLOmJfCycZrx0BNJB6dnKIQ3
         rU1NeM/syVD/5Y4VlJvwx4tJEJfBt93odbs4wxu6S9cXIP3nnpX4FO/0sUySL7C6vkJ1
         OoJQcYG8axVj/JnaG/QzNKmFDKgJKtVwzz1IuijO/PepMZ6JFiyuG3blM3h+vUlvDOHm
         7w7lLerUmE+wtEKzgHNOFs23F41k0r6Z2JKa3OG6nyoZPU6r41Xd5AZBkllpsWQFwfXD
         Ivzw==
In-Reply-To: <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Linus Torvalds <torvalds@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Daniel Jacobowitz <drow@nevyn.them.org>, Kees Cook <keescook@chromium.org>

Hi Linus,

On 14/06/21 10:18 am, Linus Torvalds wrote:
> On Sun, Jun 13, 2021 at 2:55 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>> The alpha_switch_to will remove the extra registers from the stack and
>> then call ret which if I understand alpha assembly correctly is
>> equivalent to jumping to where $26 points.  Which is
>> ret_from_kernel_thread (as setup by copy_thread).
>>
>> Which leaves ret_from_kernel_thread and everything it calls without
>> the extra context saved on the stack.
> Uhhuh. Right you are, I think. It's been ages since I worked on that
> code and my alpha handbook is somewhere else, but yes, when
> alpha_switch_to() has context-switched to the new PCB state, it will
> then pop those registers in the new context and return.
>
> So we do set up the right stack frame for the worker thread, but as
> you point out, it then gets used up immediately when running. So by
> the time the IO worker thread calls get_signal(), it's no longer
> useful.
>
> How very annoying.
>
> The (obviously UNTESTED) patch might be something like the attached.
>
> I wouldn't be surprised if m68k has the exact same thing for the exact
> same reason, but I didn't check..

m68k is indeed similar, it has:

        if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
                 /* kernel thread */
                 memset(frame, 0, sizeof(struct fork_frame));
                 frame->regs.sr = PS_S;
                 frame->sw.a3 = usp; /* function */
                 frame->sw.d7 = arg;
                 frame->sw.retpc = (unsigned long)ret_from_kernel_thread;
                 p->thread.usp = 0;
                 return 0;
         }

so a similar patch should be possible.

Cheers,

     Michael



>
>                    Linus
