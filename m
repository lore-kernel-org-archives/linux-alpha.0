From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH 1/2] alpha: Remove "strange" OSF/1 fork semantics
Date: Fri, 1 Aug 2014 09:00:23 +1200
Message-ID: <20140731210023.GC12601@stolen.phys.waikato.ac.nz>
References: <1406756552-23864-1-git-send-email-rth@twiddle.net>
 <1406756552-23864-2-git-send-email-rth@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1406756552-23864-2-git-send-email-rth@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Wed, Jul 30, 2014 at 11:42:31AM -1000, Richard Henderson wrote:
> The assignment to regs->r20 kills the original tls_val input
> to the clone syscall, which means that clone can no longer be
> restarted with the original inputs.
> 
> We could, perhaps, retain this result for true fork, but OSF/1
> compatibility is no longer important.  Note that glibc has never
> used the r20 result value, instead always testing r0 vs 0 to
> determine the child/parent status.
> 
> This failure can be seen in the glibc nptl/tst-eintr* tests.
> 
> Reported-by: Michael Cree <mcree@orcon.net.nz>
> Signed-off-by: Richard Henderson <rth@twiddle.net>

The glibc nptl/tst-eintr3 test now works successfully on the SMP
system with the patched kernel.

In addition builds of openjdk-6 or openjdk-7 use to always fail
because javac would randomly lock up at some point.  A test build of
openjdk-6 has just built successfully to completion with the patched
kernel.

I am not able to test whether OSF/1 compatibility is adversely
affected.

Tested-by: Michael Cree <mcree@orcon.net.nz>

Cheers
Michael.
