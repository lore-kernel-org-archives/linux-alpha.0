From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Thu, 17 Jun 2021 07:40:57 +1200
Message-ID: <594ca040-3ad3-5cfe-2b9e-8e7804c199b5@gmail.com>
References: <87sg1p30a1.fsf@disp2133>
 <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133>
 <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133>
 <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
 <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com> <87eed4v2dc.fsf@disp2133>
 <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com> <87fsxjorgs.fsf@disp2133>
 <CAMuHMdUkhbq+tOyrpyd5hKGGcpYduBnbnXKFBwEfCGjw5XGYVA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qb5d+U0Id8lIqAWfxQheAcWONeEcboJpT5+z508o/Ww=;
        b=HQF8dUO0vj/JLY5AGo7v2s8QQaIzYV63qYOxawNXAC3aRARyE+nU5hzCMBYgwpOUA+
         q8nRzMkhc/tm6xxqwnopRUIz9WhF/HjXQjuanWT1+4mEkJ0UbKeZivFfZx94lhKOnQOP
         Ts7ZOjGA+YuFjIs9CLzBW3fINp+e9Um330Lz/Ig9wIZRxuRqLJJQam+5oQ2mzJV7WY1H
         yGwhgdKL8GJ1aWOeIyR1DNwwTwqNOo7pvB7p1J30SaPr82rNVxB7EhI/vk2o1PYt2hoc
         pp4iCipOjQ4/v83k/wL7M+dB89WD9kEBv4C8g2FUeiatzg/lKnEzH/64bvnzamhh106y
         ef/w==
In-Reply-To: <CAMuHMdUkhbq+tOyrpyd5hKGGcpYduBnbnXKFBwEfCGjw5XGYVA@mail.gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Geert Uytterhoeven <geert@linux-m68k.org>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Hi Geert,

On 16/06/21 7:38 pm, Geert Uytterhoeven wrote:
> Hi Eric,
>
> On Tue, Jun 15, 2021 at 9:32 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>> Do you happen to know if there is userspace that will run
>> in qemu-system-m68k that can be used for testing?
> There's a link to an image in Laurent's patch series "[PATCH 0/2]
> m68k: Add Virtual M68k Machine"
> https://lore.kernel.org/linux-m68k/20210323221430.3735147-1-laurent@vivier.eu/

Thanks, I'll try that one.

I'll try and implement a few of the solutions Eric came up with for 
alpha, unless someone beats me to it (Andreas?).

Cheers,

     Michael


>
> Gr{oetje,eeting}s,
>
>                          Geert
>
