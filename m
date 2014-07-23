From: Michael Cree <mcree@orcon.net.nz>
Subject: Bug: retry of clone() on Alpha can result in zeroed process thread
 pointer
Date: Wed, 23 Jul 2014 20:52:44 +1200
Message-ID: <20140723085244.GB4799@omega>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>

I am seeing a bug in clone() on the Alpha architecture.  Reported to
Debian as https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=755397

The test suite of glibc sometimes fails in the nptl/tst-eintr3 test
with a segmentation fault.  I have tracked it down to the thread
pointer returned by the rduniq PALcall is occasionally zero when
it should point to the TLS.  I have only ever seen this occur when
running a SMP kernel.

Running strace on nptl/tst-eintr3 reveals that the clone() syscall
is retried by the kernel if an ERESTARTNOINTR error occurs.  At
$syscall_error in arch/alpha/kernel/entry.S the kernel handles the
error and in doing that it writes to 72(sp) which is where the value
of the a3 CPU register on entry to the kernel is stored.  Then the
kernel retries the clone() function.  But the alpha specific code
for copy_thread() in arch/alpha/kernel/process.c does not use the
passed a3 cpu register (the argument tls), instead it goes to the
saved stack to get the value of the a3 register, which on the
second call to clone() has been modified to no longer be the value
of the a3 cpu register on entry to the kernel.  And a latent bomb
is laid for userspace in the form of an incorrect process unique
value (which is the thread pointer) in the PCB.

Am I correct in my analysis and, if so, can we get a fix for this
please.

Cheers
Michael.
