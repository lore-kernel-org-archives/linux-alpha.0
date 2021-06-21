From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Mon, 21 Jun 2021 12:22:06 -0700
Message-ID: <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
References: <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UWwkKMPjf9VHxhA/g9kybS/n5fjzQ1lCr96tYKbsWb4=;
        b=OWY9B/m6/Mxc4KE4rlqUmS8up4KOodyzZabkrCDG8PZQO7BOG22XJGJUOTvpEvWYz8
         5PgA6ftqBTHNUdu8z3XpFvF/2p6ZVtR21Nv8hDF/pcwb1wKzuer3Yr3ZrfLh8V5mdy+M
         eKJPw1pfo8vN7QoUHB7TWIVl4z9STd1R+XvlA=
In-Reply-To: <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

On Mon, Jun 21, 2021 at 11:59 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>         There's a large mess around do_exit() - we have a bunch of
> callers all over arch/*; if nothing else, I very much doubt that really
> want to let tracer play with a thread in the middle of die_if_kernel()
> or similar.

Right you are.

I'm really beginning to hate ptrace_{event,notify}() and those
PTRACE_EVENT_xyz things.

I don't even know what uses them, honestly. How very annoying.

I guess it's easy enough (famous last words) to move the
ptrace_event() call out of do_exit() and into the actual
exit/exit_group system calls, and the signal handling path. The paths
that actually have proper pt_regs.

Looks like sys_exit() and do_group_exit() would be the two places to
do it (do_group_exit() would handle the signal case and
sys_group_exit()).

               Linus
