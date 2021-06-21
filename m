From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 1/2] alpha/ptrace: Record and handle the absence of switch_stack
Date: Sun, 20 Jun 2021 19:17:57 -0700
Message-ID: <CAHk-=wip8KgrNUcU68wsLZqbWV+3NWg9kqqQwygHGAA8-xOwMA@mail.gmail.com>
References: <87sg1p30a1.fsf@disp2133> <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133> <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <87zgvqor7d.fsf_-_@disp2133> <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
 <87mtrpg47k.fsf@disp2133> <87pmwlek8d.fsf_-_@disp2133> <87k0mtek4n.fsf_-_@disp2133>
 <393c37de-5edf-effc-3d06-d7e63f34a317@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dZejXSKJots0a5Xk5qseqeRM6JTbTp59SHNg6hTQH+o=;
        b=MAhMZqudZsSxZ/7jbtmYhk1RV1H9tJShm//WrMFiOV2ya/PC4lyBw53NovX2z0W3UQ
         lVW5QcVk8O7fSzPpRXICb0URT/gxy4ajlbBr3HqIyZlMxRX6b08rhnK5f1HRSHzKKYIK
         QB0Eqv+7FA7Oe20guNcwkG9wa52yJ/I7XOJfE=
In-Reply-To: <393c37de-5edf-effc-3d06-d7e63f34a317@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

On Sun, Jun 20, 2021 at 7:01 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> instrumenting get_reg on m68k and using a similar patch to yours to warn
> when unsaved registers are accessed on the switch stack, I get a hit
> from getegid and getegid32, just by running a simple ptrace on ls.
>
> Going to wack those two moles now ...

I don't see what's going on. Those system calls don't use the register
state, afaik. What's the call chain, exactly?

           Linus
