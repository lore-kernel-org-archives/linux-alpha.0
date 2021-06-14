From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Mon, 14 Jun 2021 17:03:32 +1200
Message-ID: <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
References: <87sg1p30a1.fsf@disp2133>
 <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133>
 <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133>
 <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=/Shcl0CcwcVQvnqm4kjruvfteHB5V70Bgq+EW67+hVs=;
        b=B5SBMSbjT8JJZ0clP7225Gi2clR3Q4OchlvIiY/CVvOS/s3gFjPf0ybYVRqwbIG/dZ
         Y8fJHjfu8wY1guNyM/wNNFbHK+cMl/eMbnj3TVjh8v7tBKbjRrt5ivQORq0NjueN9QXa
         x6x0nPCYp+HfTubRj1wmV4idu6a/kvc2wnsRx5LyQ7CLvBsu7qQIu6s5MRo+cSTHs51z
         FJRDLeLVosLvWgeGb5rV8piHUEoVvgaZ8PYvVHCrSOExft7bgqRESMuQ+KAxHiCu22A+
         lSmXN9GdGs/9vgPpg0Md5tu3/RxBd29BWkXJYO1MPH6PcllXlp8hVlnIvMHJQm5foksZ
         Ue2A==
In-Reply-To: <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

On second thought, I'm not certain what adding another empty stack frame 
would achieve here.

On m68k, 'frame' already is a new stack frame, for running the new 
thread in. This new frame does not have any user context at all, and 
it's explicitly wiped anyway.

Unless we save all user context on the stack, then push that context to 
a new save frame, and somehow point get_signal to look there for IO 
threads (essentially what Eric suggested), I don't see how this could work?

I must be missing something.

Cheers,

	Michael Schmitz

Am 14.06.2021 um 14:05 schrieb Michael Schmitz:
>>
>> I wouldn't be surprised if m68k has the exact same thing for the exact
>> same reason, but I didn't check..
>
> m68k is indeed similar, it has:
>
>        if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
>                 /* kernel thread */
>                 memset(frame, 0, sizeof(struct fork_frame));
>                 frame->regs.sr = PS_S;
>                 frame->sw.a3 = usp; /* function */
>                 frame->sw.d7 = arg;
>                 frame->sw.retpc = (unsigned long)ret_from_kernel_thread;
>                 p->thread.usp = 0;
>                 return 0;
>         }
>
> so a similar patch should be possible.
>
> Cheers,
>
>     Michael
>
>
>
>>
>>                    Linus
