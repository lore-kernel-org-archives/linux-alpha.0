From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Mon, 21 Jun 2021 16:36:33 -0700
Message-ID: <CAHk-=wjtagi3g5thA-T8ooM8AXcy3brdHzugCPU0itdbpDYH_A@mail.gmail.com>
References: <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <YNDsYk6kbisbNy3I@zeniv-ca.linux.org.uk> <CAHk-=wh82uJ5Poqby3brn-D7xWbCMnGv-JnwfO0tuRfCvsVgXA@mail.gmail.com>
 <YNEfXhi80e/VXgc9@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fqBMFMkh+3vsj4PE2zy4sOG9Di6zkfuPgmZeKyRMggk=;
        b=FwTzGNcpDtlrI1kY0RIGO3zETGbXVETw5XVSJFPsLGj6Xz/SJV56ObDVCGf2pDuQ1Z
         igDUi27LyzA/lOjip7sVylirPYT+bZ/hF+sKh406iS7GyB+Vq1L8K8GDXIUSy1RHLXYZ
         859pKuXlceGLPjaK41xP26kUTIY685CWI4qnY=
In-Reply-To: <YNEfXhi80e/VXgc9@zeniv-ca.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>

On Mon, Jun 21, 2021 at 4:23 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>         How would it help e.g. oopsen on the way out of timer interrupts?
> IMO we simply shouldn't allow ptrace access if the tracee is in that kind
> of state, on any architecture...

Yeah no, we can't do the "wait for ptrace" when the exit is due to an
oops. Although honestly, we have other cases like that where do_exit()
isn't 100% robust if you kill something in an interrupt. Like all the
locks it leaves locked etc.

So do_exit() from a timer interrupt is going to cause problems
regardless. I agree it's probably a good idea to try to avoid causing
even more with the odd ptrace thing, but I don't think ptrace_event is
some really "fundamental" problem at that point - it's just one detail
among many many.

So I was more thinking of the debug patch for m68k to catch all the
_regular_ cases, and all the other random cases of ptrace_event() or
ptrace_notify().

Although maybe we've really caught them all. The exit case was clearly
missing, and the thread fork case was scrogged. There are patches for
the known problems. The patches I really don't like are the
verification ones to find any unknown ones..

            Linus
