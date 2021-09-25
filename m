From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 7/7] alpha: lazy FPU switching
Date: Sat, 25 Sep 2021 16:18:15 -0700
Message-ID: <CAHk-=wihd78UK4wGfsNi_ofa_Zt=h-5swV=a=YQEj4Nvm_C4nA@mail.gmail.com>
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk> <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
 <20210925025548.1694143-7-viro@zeniv.linux.org.uk> <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com>
 <YU+J1b2jA8ZZZpv/@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PaI8r8LZE3Qc9hDr4uY+V8+SQJczkLUjipeLe96hY/E=;
        b=BfppYlAzxMmrlGYUwoGDSlAwVwIUL1UQdOpwXcUJZIpUgf7+DixxRwTz7+xKGk1zG+
         Mlf5G2XkmHHQDs8bcoSBbg0+oPvkfobzwXbLVi7J3n1AK9O4gwR6une98zLpv5LtkDLV
         8WpnNp9IYKJuHerFSJXyEDf7a+D8tnQ/H+1JA=
In-Reply-To: <YU+J1b2jA8ZZZpv/@zeniv-ca.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: alpha <linux-alpha@vger.kernel.org>

On Sat, Sep 25, 2021 at 1:43 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Umm...  Bootable AS200 (EV45), bootable DS10 (EV6), theoretically
> resurrectable UP1000 (EV67, fans on CPU module are in horrible state
> and southbridge is unreliable, so the life is more interesting than
> it's worth), working qemu-system-alpha (EV67).  No SMP boxen and
> I've no idea if qemu can do SMP alpha these days...

Well, the way we traditionally did lazy x87 state save/restore on x86
was very much smp-sensitive, so that lack of test coverage is a bit
sad.

That said, this approach doesn't really seem to have _those_ kinds of
issues, since you always save things at 'switch_to()', so I guess it
doesn't matter.

> Whether it's worth it... beginning of the series or this one?

This last one was the one I reacted to.

I don't think it's wrong (although please, use a more descriptive name
that "V" for that asm macro shorthand), but it does strike me as
somewhat special.

And if we do want to do this (I'm open to it, I just want to make sure
it's tested), please just make those alpha_{read|write}_fp_reg()
functions always do the save_fpu() thing, and then alway sjust access
the array.

IOW, something like

        preempt_disable();
        save_fpu(current);
        preempt_disable();
        .. now access the array that is easy to index ..

and just remove the silly "switch (reg)" things that access the raw
registers. We couldn't do that before, but with that save state area
it's trivial and much cleaner.

            Linus
