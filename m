From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [RFC] semantics of singlestepping vs. tracer exiting
Date: Mon, 3 Sep 2012 18:31:08 +0100
Message-ID: <20120903173108.GH23464@ZenIV.linux.org.uk>
References: <20120903001436.GG23464@ZenIV.linux.org.uk>
 <20120903160538.GA10114@redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120903160538.GA10114@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Nesterov <oleg@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Mon, Sep 03, 2012 at 06:05:38PM +0200, Oleg Nesterov wrote:

> This is not easy to fix. ptrace_disable() and user_disable_single_step()
> is arch dependant, but at least on x86 it assumes that the tracee is not
> running, so exit_ptrace() can't do this.

True (IOW, proposed fix is hopeless - we definitely want the detachees to be
in kernel space, and not only on x86).

> This is another reason to move enable/disable step into ptrace_stop().
> And in fact I had the patches a loong ago, but we need to cleanup
> the usage of PT_SINGLESTEP/PT_BLOCKSTEP first. The tracer should
> simply set/clear these PT_ flags and resume the tracee which should
> check them and do user_*_single_step() in response.

> > 	Related question: should execve(2) clear (ptrace-inflicted)
> > singlestepping?
> 
> Perhaps, but
> 
> > Tracer
> > exit(), however, does *not* do that right now, so the state after
> > execve(2) is theoretically observable.
> 
> ... why execve() is special?

Because that behaviour had been changed over the history, for one thing:
commit e1f287735c1e58c653b516931b5d3dd899edcb77
Author: Roland McGrath <roland@redhat.com>
Date:   Wed Jan 30 13:30:50 2008 +0100

    x86 single_step: TIF_FORCED_TF
had done that for x86, unless I'm misreading something.  BTW, now that
I've looked at that, alpha seems to have a really unpleasant bug with
single-stepping through execve() - it *must* reset ->bpt_nsaved to 0
in start_thread(), simply because the address space the breakpoints used
to be in is gone at that point.  I don't see any place where that would
be done; suppose we single-step right into callsys insn and do PTRACE_CONT
when stopped on the way out.  Won't that end up with ptrace_cancel_bpt()
done in *new* address space, silently buggering new .text contents?

BTW, speaking of alpha, what about PTRACE_SINGLESTEP when the task is stopped
on syscall entry/exit after previous PTRACE_SYSCALL, BTW?  Looks like it will
be like PTRACE_CONT until we hit the first signal, at which point it converts
to singlesteping mode; unless I'm seriously misreading that code, we rely
on ptrace_set_bpt() done shortly after returning from get_signal_to_deliver()
if we found that we'd been singlestepping.  Fine, but in this case we
had been resumed *not* in get_signal_to_deliver()...

Cc'd linux-alpha, in hopes to hear "you don't understand how single-stepping
works on alpha, you idiot, everything's fine because of $REASONS"...
