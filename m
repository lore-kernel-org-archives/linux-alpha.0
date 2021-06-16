From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] alpha: Add extra switch_stack frames in exit, exec, and
 kernel threads
Date: Wed, 16 Jun 2021 20:50:38 +0000
Message-ID: <YMpkHpZo4zx01Hw4@zeniv-ca.linux.org.uk>
References: <87pmwsytb3.fsf@disp2133>
 <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133>
 <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
 <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133>
 <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133>
 <87zgvqor7d.fsf_-_@disp2133>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87zgvqor7d.fsf_-_@disp2133>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

On Tue, Jun 15, 2021 at 02:36:38PM -0500, Eric W. Biederman wrote:
> 
> While thinking about the information leaks fixed in 77f6ab8b7768
> ("don't dump the threads that had been already exiting when zapped.")
> I realized the problem is much more general than just coredumps and
> exit_mm.  We have io_uring threads, PTRACE_EVENT_EXEC and
> PTRACE_EVENT_EXIT where ptrace is allowed to access userspace
> registers, but on some architectures has not saved them.

Wait a sec.  To have anything happen on PTRACE_EVENT_EXEC, you need the
fucker traced.  *IF* you want to go that way, at least make it conditional
upon the same thing.
