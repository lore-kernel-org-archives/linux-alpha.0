From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 0/9] Refactoring exit
Date: Sun, 27 Jun 2021 22:13:32 +0000
Message-ID: <YNj4DItToR8FphxC@zeniv-ca.linux.org.uk>
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133>
 <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133>
 <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133>
 <875yy3850g.fsf_-_@disp2133>
 <YNULA+Ff+eB66bcP@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <YNULA+Ff+eB66bcP@zeniv-ca.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

On Thu, Jun 24, 2021 at 10:45:23PM +0000, Al Viro wrote:

> 13) there's bdflush(1, whatever), which is equivalent to exit(0).
> IMO it's long past the time to simply remove the sucker.

Incidentally, calling that from ptraced process on alpha leads to
the same headache for tracer.  _If_ we leave it around, this is
another candidate for "hit yourself with that special signal" -
both alpha and m68k have that syscall, and IMO adding an asm
wrapper for that one is over the top.

Said that, we really ought to bury that thing:

commit 2f268ee88abb33968501a44368db55c63adaad40
Author: Andrew Morton <akpm@digeo.com>
Date:   Sat Dec 14 03:16:29 2002 -0800

    [PATCH] deprecate use of bdflush()
	
    Patch from Robert Love <rml@tech9.net>
		
    We can never get rid of it if we do not deprecate it - so do so and
    print a stern warning to those who still run bdflush daemons.

Deprecated for 18.5 years by now - I seriously suspect that we have
some contributors younger than that...
