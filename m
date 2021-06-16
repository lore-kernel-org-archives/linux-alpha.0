From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 1/2] alpha/ptrace: Record and handle the absence of switch_stack
Date: Wed, 16 Jun 2021 13:00:52 -0700
Message-ID: <CAHk-=wiTEZN_3ipf51sh-csdusW4uGzAXq9m1JcMHu_c8OJ+pQ@mail.gmail.com>
References: <87sg1p30a1.fsf@disp2133> <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133> <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <87zgvqor7d.fsf_-_@disp2133> <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
 <87mtrpg47k.fsf@disp2133> <87pmwlek8d.fsf_-_@disp2133> <87k0mtek4n.fsf_-_@disp2133>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y0sGanNeM+6nVMH7hMipVVh7kfFvtaj9v71nplXpGOQ=;
        b=W2AITzayliTdBtw+P2eGCat6m1fvimytrfbjpYp3F+ZqA7U78mdL6p9s1QlqYnA0Cu
         HmuuCHptbwVi95FtTdSDCMlLPBnLl9I3IjPOnYExv6QFeCUpcrP5yEPGt2AUEAL6rQRa
         AVA3P5mSOxUsuokFD59yB5+vElkaqAzJ+n8vs=
In-Reply-To: <87k0mtek4n.fsf_-_@disp2133>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

On Wed, Jun 16, 2021 at 11:32 AM Eric W. Biederman
<ebiederm@xmission.com> wrote:
>
> Prevent security holes by recording when all of the registers are
> available so generic code changes do not result in security holes
> on alpha.

Please no, not this way. ldl/stc is extremely expensive on some alpha cpus.

I really think thatTIF_ALLREGS_SAVED bit isn't worth it, except
perhaps for debugging.

And even for debugging, I think it would be both easier and cheaper to
just add a magic word to the entry stack instead.

              Linus
