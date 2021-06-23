From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Tue, 22 Jun 2021 17:41:51 -0700
Message-ID: <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
References: <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133> <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1pJi6stLtza5ZFdImIffUNgdJoHKsMjc09flZZ4qiAI=;
        b=SFcCe3m1FiAXHxPsSVxKjvrdNckQVrxdff+U4unr4V4zJzTMYaBEpSK9jjYtU7tMd6
         D6+UsvBUdCLcIdv0JgGtdHlWRGtgBWAILphbvJEUZilovxO8PsYLDfvqyyYAEF0oFQuI
         Rb1F4OutZ2mQyaIxFkh4FOdwyNm9Ixhuqq2qU=
In-Reply-To: <87tulpbp19.fsf@disp2133>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

On Tue, Jun 22, 2021 at 1:53 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Playing with it some more I think I have everything working working
> except for PTRACE_EVENT_SECCOMP (which can stay ptrace_event) and
> group_exit(2).
>
> Basically in exit sending yourself a signal and then calling do_exit
> from the signal handler is not unreasonable, as exit is an ordinary
> system call.

Ok, this is a bit odd, but I do like the concept of just making
ptrace_event just post a signal, and have all ptrace things always be
handled at signal time (or the special system call entry/exit, which
is fine too).

> For purposes of discussion this is my current draft implementation.

I didn't check what is so different about exit_group() that you left
that as an exercise for the reader, but if that ends up then removing
the whole "wait synchromously for ptrace" cases for good I don't
_hate_ this. It's a bit odd, but it would be really nice to limit
where ptrace picks up data.

We do end up doing that stuff in "get_signal()", and that means that
we have the interaction with io_uring calling it directly, but it's at
least not a new thing.

               Linus
