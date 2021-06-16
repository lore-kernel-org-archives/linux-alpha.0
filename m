From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH 2/2] alpha/ptrace: Add missing switch_stack frames
Date: Wed, 16 Jun 2021 15:49:44 -0500
Message-ID: <87lf798rh3.fsf@disp2133>
References: <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
        <87eed4v2dc.fsf@disp2133>
        <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
        <87fsxjorgs.fsf@disp2133> <87zgvqor7d.fsf_-_@disp2133>
        <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
        <87mtrpg47k.fsf@disp2133> <87pmwlek8d.fsf_-_@disp2133>
        <87eed1ek31.fsf_-_@disp2133> <YMpeP0CrRUVKIysE@zeniv-ca.linux.org.uk>
        <YMpfBsIvqbK0L4Gh@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <YMpfBsIvqbK0L4Gh@zeniv-ca.linux.org.uk> (Al Viro's message of
        "Wed, 16 Jun 2021 20:28:54 +0000")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Al Viro <viro@zeniv.linux.org.uk> writes:

> On Wed, Jun 16, 2021 at 08:25:35PM +0000, Al Viro wrote:
>> On Wed, Jun 16, 2021 at 01:32:50PM -0500, Eric W. Biederman wrote:
>> 
>> > -.macro	fork_like name
>> > +.macro	allregs name
>> >  	.align	4
>> >  	.globl	alpha_\name
>> >  	.ent	alpha_\name
>> > +	.cfi_startproc
>> >  alpha_\name:
>> >  	.prologue 0
>> > -	bsr	$1, do_switch_stack
>> > +	SAVE_SWITCH_STACK
>> >  	jsr	$26, sys_\name
>> > -	ldq	$26, 56($sp)
>> > -	lda	$sp, SWITCH_STACK_SIZE($sp)
>> > +	RESTORE_SWITCH_STACK
>> 
>> 	No.  You've just added one hell of an overhead to fork(2),
>> for no reason whatsoever.  sys_fork() et.al. does *NOT* modify the
>> callee-saved registers; it's plain C.  So this change is complete
>> BS.
>> 
>> > +allregs exit
>> > +allregs exit_group
>> 
>> 	Details, please - what exactly makes exit(2) different from
>> e.g. open(2)?
>
> Ah... PTRACE_EVENT_EXIT garbage, fortunately having no counterparts in case of
> open(2)...  Still, WTF would you want to restore callee-saved registers for
> in case of exit(2)?

Someone might want or try to read them in the case of exit.  Which
without some change will result in a read of other kernel stack content
on alpha.

Plus there are coredumps which definitely want to read everything.
Although admittedly that case no longer matters.

Eric

