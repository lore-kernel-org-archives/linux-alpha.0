From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [RFC] semantics of singlestepping vs. tracer exiting
Date: Tue, 4 Sep 2012 17:08:24 +0100
Message-ID: <20120904160824.GI23464@ZenIV.linux.org.uk>
References: <20120903001436.GG23464@ZenIV.linux.org.uk>
 <20120903160538.GA10114@redhat.com>
 <20120903173108.GH23464@ZenIV.linux.org.uk>
 <20120904153938.GA8199@redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120904153938.GA8199@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Nesterov <oleg@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Tue, Sep 04, 2012 at 05:39:38PM +0200, Oleg Nesterov wrote:

> > BTW, speaking of alpha, what about PTRACE_SINGLESTEP when the task is stopped
> > on syscall entry/exit after previous PTRACE_SYSCALL, BTW?  Looks like it will
> > be like PTRACE_CONT until we hit the first signal, at which point it converts
> > to singlesteping mode; unless I'm seriously misreading that code, we rely
> > on ptrace_set_bpt() done shortly after returning from get_signal_to_deliver()
> > if we found that we'd been singlestepping.  Fine, but in this case we
> > had been resumed *not* in get_signal_to_deliver()...
> 
> Again, "single_stepping |= ptrace_cancel_bpt()" after get_signal_to_deliver()
> should work I think... Not sure.

Umm...  What would get us anywhere near get_signal_to_deliver() in this
case?  Look: we do PTRACE_SYSCALL and tracee stops on the way into the
system call.  We are blocked in ptrace_notify() called from syscall_trace().
Tracer does PTRACE_SINGLESTEP; that resumes the tracee and sets ->bpt_nsaved
to -1.  The 'data' argument of ptrace() is 0, so tracee->exit_code is 0
so no signals are sent.  TIF_SYSCALL_TRACE is cleared.  And we are off
to execute the syscall and return to userland, without having hit do_signal()
on the way out.  No breakpoint insns are patched in, so we happily proceed
to run the process until a signal arrives, same as we would with PTRACE_CONT.
What am I missing here?
