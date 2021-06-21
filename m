From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Mon, 21 Jun 2021 19:24:19 +0000
Message-ID: <YNDnY0niP+IfSx+X@zeniv-ca.linux.org.uk>
References: <87sg1lwhvm.fsf@disp2133>
 <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
 <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133>
 <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133>
 <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

On Mon, Jun 21, 2021 at 06:59:01PM +0000, Al Viro wrote:
> On Mon, Jun 21, 2021 at 01:54:56PM +0000, Al Viro wrote:
> > On Tue, Jun 15, 2021 at 02:58:12PM -0700, Linus Torvalds wrote:
> > 
> > > And I think our horrible "kernel threads return to user space when
> > > done" is absolutely horrifically nasty. Maybe of the clever sort, but
> > > mostly of the historical horror sort.
> > 
> > How would you prefer to handle that, then?  Separate magical path from
> > kernel_execve() to switch to userland?  We used to have something of
> > that sort, and that had been a real horror...
> > 
> > As it is, it's "kernel thread is spawned at the point similar to
> > ret_from_fork(), runs the payload (which almost never returns) and
> > then proceeds out to userland, same way fork(2) would've done."
> > That way kernel_execve() doesn't have to do anything magical.
> > 
> > Al, digging through the old notes and current call graph...
> 
> 	There's a large mess around do_exit() - we have a bunch of
> callers all over arch/*; if nothing else, I very much doubt that really
> want to let tracer play with a thread in the middle of die_if_kernel()
> or similar.
> 
> We sure as hell do not want to arrange for anything on the kernel
> stack in such situations, no matter what's done in exit(2)...

FWIW, on alpha it's die_if_kernel(), do_entUna() and do_page_fault(),
all in not-from-userland cases.  On m68k - die_if_kernel(), do_page_fault()
(both for non-from-userland cases) and something really odd - fpsp040_die().
Exception handling for floating point stuff on 68040?  Looks like it has
an open-coded copy_to_user()/copy_from_user(), with faults doing hard
do_exit(SIGSEGV) instead of raising a signal and trying to do something
sane...

I really don't want to try and figure out how painful would it be to
teach that code how to deal with faults - _testing_ anything in that
area sure as hell will be.  IIRC, details of recovery from FPU exceptions
on 68040 in the manual left impression of a minefield...
