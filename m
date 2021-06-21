From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Mon, 21 Jun 2021 08:38:14 -0700
Message-ID: <CAHk-=wjC_=iwj61vSZ0orPGjrxhDK3Ob2D4eaRpXXFdAbF6coQ@mail.gmail.com>
References: <87pmwsytb3.fsf@disp2133> <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R/gsr/Z80fSxEB0qmGqShvDUtlhm4ESakW3xcimnUEw=;
        b=a39nbPZCP+nWMeIZ/x5qt0slwYnbNb/TvhmNaAml5kNvhs0i32rgF44OFGvy4ACZ5M
         SfNAyRTK1aJ1m7aW6sC2No3kMhETcLZ7kUjianICGGeVyVPSyizOAaXDDMbjMew6KcRK
         SAT8eIJUsUOJFoDNwA7oyYdllQrDrIWi08wng=
In-Reply-To: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

On Mon, Jun 21, 2021 at 6:55 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Tue, Jun 15, 2021 at 02:58:12PM -0700, Linus Torvalds wrote:
>
> > And I think our horrible "kernel threads return to user space when
> > done" is absolutely horrifically nasty. Maybe of the clever sort, but
> > mostly of the historical horror sort.
>
> How would you prefer to handle that, then?  Separate magical path from
> kernel_execve() to switch to userland?  We used to have something of
> that sort, and that had been a real horror...

Hmm. Maybe the alternatives would all be worse. The current thing is
clever, and shares the return path with the normal case. It's just
also a bit surprising, in that a kernel thread normally must not
return - with the magical exception of "if it had done a
kernel_execve() at some point, then returning is magically the way you
actually start user mode".

So it all feels very special, and there's not even a comment about it.

I think we only have two users of that thing (the very first 'init',
and user-mode-helpr), So I guess it doesn't really matter.

            Linus
