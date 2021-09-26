From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 7/7] alpha: lazy FPU switching
Date: Sun, 26 Sep 2021 00:31:58 +0000
Message-ID: <YU+/frjotvVo+rH6@zeniv-ca.linux.org.uk>
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk>
 <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
 <20210925025548.1694143-7-viro@zeniv.linux.org.uk>
 <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com>
 <YU+J1b2jA8ZZZpv/@zeniv-ca.linux.org.uk>
 <CAHk-=wihd78UK4wGfsNi_ofa_Zt=h-5swV=a=YQEj4Nvm_C4nA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHk-=wihd78UK4wGfsNi_ofa_Zt=h-5swV=a=YQEj4Nvm_C4nA@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: alpha <linux-alpha@vger.kernel.org>

On Sat, Sep 25, 2021 at 04:18:15PM -0700, Linus Torvalds wrote:
> This last one was the one I reacted to.
> 
> I don't think it's wrong (although please, use a more descriptive name
> that "V" for that asm macro shorthand), but it does strike me as
> somewhat special.

Ended up with the following (see updated #untested.alpha):

#define FR(n) n * 8 + TI_FP($8)
        .align  4
        .globl  __save_fpu
        .type   __save_fpu, @function
__save_fpu:
#define V(n) stt        $f##n, FR(n)
        V( 0); V( 1); V( 2); V( 3)
        V( 4); V( 5); V( 6); V( 7)
        V( 8); V( 9); V(10); V(11)  
        V(12); V(13); V(14); V(15)
        V(16); V(17); V(18); V(19)
        V(20); V(21); V(22); V(23)
        V(24); V(25); V(26); V(27)
        mf_fpcr $f0             # get fpcr
        V(28); V(29); V(30)  
        stt     $f0, FR(31)     # save fpcr in slot of $f31
        ldt     $f0, FR(0)      # don't let "__save_fpu" change fp state.
        ret
#undef V
        .size   __save_fpu, .-__save_fpu
        .align  4
restore_fpu:
        bic     $2, TS_SAVED_FP, $2 
#define V(n) ldt        $f##n, FR(n)
        ldt     $f30, FR(31)    # get saved fpcr
        V( 0); V( 1); V( 2); V( 3)
        mt_fpcr $f30            # install saved fpcr
        V( 4); V( 5); V( 6); V( 7)
        V( 8); V( 9); V(10); V(11)
        V(12); V(13); V(14); V(15)
        V(16); V(17); V(18); V(19)
        V(20); V(21); V(22); V(23)
        V(24); V(25); V(26); V(27)
        V(28); V(29); V(30)
        stl $2, TI_STATUS($8)
        br restore_other
#undef V

More readable that way, I think.  FWIW, asm macros were leftovers
of an attempt to do something like save_regs 0,27 that would expand
into the series of stores; no hope to do that with C macros, but
gas(1) ones do allow kinda-sorta loops, so I hoped to get it done.
No luck - AFAICS, no way to force evaluation of expressions as part
of macro expansion there, so you end up with something like $f(1+1+1).
It claims that .altmacro has something of that sort, and it might
be even possible to abuse a mix of C and asm macros to get there,
but it would be _way_ too opaque.  Not worth bothering, IMO, so
I ended up with the variant above...

> And if we do want to do this (I'm open to it, I just want to make sure
> it's tested), please just make those alpha_{read|write}_fp_reg()
> functions always do the save_fpu() thing, and then alway sjust access
> the array.
> 
> IOW, something like
> 
>         preempt_disable();
>         save_fpu(current);
>         preempt_disable();
>         .. now access the array that is easy to index ..
> 
> and just remove the silly "switch (reg)" things that access the raw
> registers. We couldn't do that before, but with that save state area
> it's trivial and much cleaner.

Umm...  It is, but if you look at the callers... it's used only
by the math emulator, and usually you end up with reading a register
or two + writing one.  Full FPU save + full FPU load on return to
userland might be too much overhead on that codepath.  Not sure;
it certainly simplifies things, but I'd like to see that tested on
EV4 hardware - it's already slow as it is, and an extra couple of
cachelines worth of loads and stores on each floating point arithmetical
instruction...  Sure, we do that on each context switch there, but
the frequency of those is much lower.
