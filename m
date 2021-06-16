From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 2/2] alpha/ptrace: Add missing switch_stack frames
Date: Wed, 16 Jun 2021 20:55:49 +0000
Message-ID: <YMplVZ1EOkHzcplt@zeniv-ca.linux.org.uk>
References: <87eed4v2dc.fsf@disp2133>
 <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133>
 <87zgvqor7d.fsf_-_@disp2133>
 <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
 <87mtrpg47k.fsf@disp2133>
 <87pmwlek8d.fsf_-_@disp2133>
 <87eed1ek31.fsf_-_@disp2133>
 <YMpeP0CrRUVKIysE@zeniv-ca.linux.org.uk>
 <87zgvp8rkv.fsf@disp2133>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87zgvp8rkv.fsf@disp2133>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

On Wed, Jun 16, 2021 at 03:47:28PM -0500, Eric W. Biederman wrote:

> Fork already saves the registers, all I did was restore them.  Which
> makes a debugger that modifies them in
> PTRACE_EVENT_{FORK,VFORK,CLONE,VFORK_DONE} work.

... first time ever.  Wonderful and well worth the overhead.
</sarcasm>
