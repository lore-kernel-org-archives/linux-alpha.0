From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Bug: retry of clone() on Alpha can result in zeroed process
 thread pointer
Date: Fri, 25 Jul 2014 07:30:25 +1200
Message-ID: <20140724193025.GA2540@omega>
References: <20140723085244.GB4799@omega>
 <53D14E48.3040202@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53D14E48.3040202@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 24, 2014 at 08:19:52AM -1000, Richard Henderson wrote:
> On 07/22/2014 10:52 PM, Michael Cree wrote:
> > Running strace on nptl/tst-eintr3 reveals that the clone() syscall
> > is retried by the kernel if an ERESTARTNOINTR error occurs.  At
> > $syscall_error in arch/alpha/kernel/entry.S the kernel handles the
> > error and in doing that it writes to 72(sp) which is where the value
> > of the a3 CPU register on entry to the kernel is stored.  Then the
> > kernel retries the clone() function.  But the alpha specific code
> > for copy_thread() in arch/alpha/kernel/process.c does not use the
> > passed a3 cpu register (the argument tls), instead it goes to the
> > saved stack to get the value of the a3 register, which on the
> > second call to clone() has been modified to no longer be the value
> > of the a3 cpu register on entry to the kernel.  And a latent bomb
> > is laid for userspace in the form of an incorrect process unique
> > value (which is the thread pointer) in the PCB.
> > 
> > Am I correct in my analysis and, if so, can we get a fix for this
> > please.
> 
> Well...  let me start with the assumption that we can't possibly restart unless
> the syscall fails with -ERESTART*.
> 
> Before we clobber 72($sp), $syscall_error saves the old value in $19.  This is
> the r19 parameter to do_work_pending, and is passed all the way down to
> syscall_restart where we do restore the original value of a3 for ERESTARTNOINTR.
> 
> So if there's a path that leads to restart, but doesn't save a3 before
> clobbering, I don't see it.  Do you have an strace dump that shows this?

Yes.  This is an example of a run of nptl/tst-eintr3 that fails after
cutting off quite a bit of stuff at the start to get to the relevant
section:

clone(child_stack=0x2000121eae0, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, parent_tidptr=0x2000121f2c0, tls=0x2000121f8e0, child_tidptr=0x2000121f2c0) = ? ERESTARTNOINTR (To be restarted)
--- SIGUSR1 {si_signo=SIGUSR1, si_code=SI_TKILL, si_pid=20086, si_uid=1000} ---
write(1, ".", 1.)                        = 1
sigreturn() (mask [])                   = -1 ERRNO_312 (Unknown error 312)
clone(child_stack=0x2000121eae0, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, parent_tidptr=0x2000121f2c0, tls=0, child_tidptr=0x2000121f2c0) = 20089
+++ killed by SIGSEGV +++


Note that the retry of clone() has zero for the tls argument.

Examining the resultant core dump reveals that tst-eintr3 segfaulted
when trying to access a thread local variable and that register v0,
used in calculating the TLS location and set up by the rduniq PALcall,
is zero.

Cheers
Michael.

