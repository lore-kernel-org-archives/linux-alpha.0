From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Thu, 10 Jun 2021 15:04:33 -0700
Message-ID: <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
References: <87sg1p30a1.fsf@disp2133>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IH1SveIFJ5wJ6kocsX0s8v3WiB0uqtridXReuF2KUMY=;
        b=Qzof8FNEW2Ba5XPZGpDfZSR6rdtd6WGsu717h8Er0yjM+Qrz/xmDEYF47olKQxMaDV
         /WuPvFIxyme1vchmGP1HhMrAqH5OzNDJ6D669STTMCTBS8PPP8U2SeAmmSAiNv3xHWUT
         sYS5gTDilCKxc+IrHBQDdFNyeZ8axOedobMUc=
In-Reply-To: <87sg1p30a1.fsf@disp2133>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Daniel Jacobowitz <drow@nevyn.them.org>, Kees Cook <keescook@chromium.org>

On Thu, Jun 10, 2021 at 1:58 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> The problem is sometimes we read all of the registers from
> a context where they are not all saved.

Ouch. Yes. And this is really painful because none of the *normal*
architectures do this, so it gets absolutely no coverage.

> I think at this point we need to say that the architectures that have a
> do this need to be fixed to at least call do_exit and the kernel
> function in create_io_thread with the deeper stack.

Yeah. We traditionally have that requirement for fork() and friends
too (vfork/clone), so adding exit and io_uring to do so seems like the
most straightforward thing.

But I really wish we had some way to test and trigger this so that we
wouldn't get caught on this before. Something in task_pt_regs() that
catches "this doesn't actually work" and does a WARN_ON_ONCE() on the
affected architectures?

               Linus
