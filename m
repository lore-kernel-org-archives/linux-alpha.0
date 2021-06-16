From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 1/2] alpha/ptrace: Record and handle the absence of switch_stack
Date: Wed, 16 Jun 2021 14:08:02 -0700
Message-ID: <CAHk-=whwqjetFoyPLehd0_qGbtmKHjibayFrdKC=g3FWYKzu4Q@mail.gmail.com>
References: <87sg1p30a1.fsf@disp2133> <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133> <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <87zgvqor7d.fsf_-_@disp2133> <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
 <87mtrpg47k.fsf@disp2133> <87pmwlek8d.fsf_-_@disp2133> <87k0mtek4n.fsf_-_@disp2133>
 <CAHk-=wiTEZN_3ipf51sh-csdusW4uGzAXq9m1JcMHu_c8OJ+pQ@mail.gmail.com>
 <CAHk-=whvNaYffE8Eaa4-jjYbF_r1u1sh5LF5zXFhdEP8hxySMQ@mail.gmail.com> <878s398r4g.fsf@disp2133>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GEgFwvG0aEYffAJwnwi/wSvP3mnzTq32F9Igb0VeJKo=;
        b=czhMl45rFwdrs0pcekybM2QQZCWZb/gXfUU/tObs7oUmAfWaFzGqU3ncQtuzzBoGEp
         6TNZuZHFOTzoLk3Kk4ftLDU0XygKDGA3j5horD9drSGEElyEC2cdjMrMkbWUZqNsOMEo
         d36CyJJhlk3IB7sj2YK9ivIRzIE0TuPNJ1Ugs=
In-Reply-To: <878s398r4g.fsf@disp2133>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

On Wed, Jun 16, 2021 at 1:57 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Do you know if struct switch_stack or pt_regs is ever exposeed to
> usespace?  They are both defined in arch/alpha/include/uapi/asm/ptrace.h
> which makes me think userspace must see those definitions somewhere.

Yeah, that uapi location is a bit unfortunate. It means that user
space _could_ have seen it.

Which probably means that some user space uses it. Not for any kernel
interfaces (the alpha ptrace register offsets are actually sane, and
we have that "regoff[]" array to find them) - but I could see some odd
program having decided to use the kernel pt_regs and switch_stack
structures for their own reasons.

Annoying. Because we don't really expose it as-is in any way, afaik.
Only incidentally - and by mistake - in a uapi header file.

Maybe a flag in thread_info->status (or even a new 32-bit field
entirely in thread_info) is the way to go like Al says.

            Linus
