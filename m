From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Mon, 21 Jun 2021 16:15:37 -0700
Message-ID: <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
References: <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com> <87a6njf0ia.fsf@disp2133>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=stNy8kLF5vctj8WXK363X+Ab+aWkvJsrhuAKRgNlaFY=;
        b=IL1c66HdRAXSPTueb6HvT7WAQ+hVTgraIpPVGrRtYIIPrdMk6idOyB+d7hgkhCbE/J
         WSDn2K6/KFlAr4ZepO/VZSbAHdCjsBoc9mInrjOrnW0t0J2Sklo0eRJQKmRh1FXkY2rP
         httftVRSDPt4omCrZhGPE4bzB66yBCzHc25jk=
In-Reply-To: <87a6njf0ia.fsf@disp2133>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

On Mon, Jun 21, 2021 at 1:04 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> For other ptrace_event calls I am playing with seeing if I can split
> them in two.  Like sending a signal.  So that we can have perform all
> of the work in get_signal.

That sounds like the right model, but I don't think it works.
Particularly not for exit(). The second phase will never happen.

              Linus
