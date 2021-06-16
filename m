From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 2/2] alpha/ptrace: Add missing switch_stack frames
Date: Wed, 16 Jun 2021 20:54:06 +0000
Message-ID: <YMpk7oNPSbVG0DSP@zeniv-ca.linux.org.uk>
References: <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133>
 <87zgvqor7d.fsf_-_@disp2133>
 <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
 <87mtrpg47k.fsf@disp2133>
 <87pmwlek8d.fsf_-_@disp2133>
 <87eed1ek31.fsf_-_@disp2133>
 <YMpeP0CrRUVKIysE@zeniv-ca.linux.org.uk>
 <YMpfBsIvqbK0L4Gh@zeniv-ca.linux.org.uk>
 <87lf798rh3.fsf@disp2133>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87lf798rh3.fsf@disp2133>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

On Wed, Jun 16, 2021 at 03:49:44PM -0500, Eric W. Biederman wrote:

> Someone might want or try to read them in the case of exit.  Which
> without some change will result in a read of other kernel stack content
> on alpha.

And someone might want a pony.  Again, why bother restoring those,
_especially_ in case of exit(2)?

> Plus there are coredumps which definitely want to read everything.

Huh?  In case of coredump we are going to have come through
$work_notifysig:
        mov     $sp, $16
	DO_SWITCH_STACK
	jsr     $26, do_work_pending
so they *do* have full pt_regs saved.  What's the problem?
