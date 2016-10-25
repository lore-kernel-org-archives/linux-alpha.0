From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: BRSGP relocation truncations in linking kernel for Alpha.
Date: Tue, 25 Oct 2016 21:26:38 +1300
Message-ID: <20161025082638.u7c5kpi2q3kr3kld@tower>
References: <20161022024044.vbfxx4o2rrkwc7gy@tower>
 <580E7616.2020806@gmx.de>
 <65016d6a-3e42-a493-8765-aef683fde537@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <65016d6a-3e42-a493-8765-aef683fde537@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Helge Deller <deller@gmx.de>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>

On Mon, Oct 24, 2016 at 08:13:22PM -0700, Richard Henderson wrote:
> On 10/24/2016 01:59 PM, Helge Deller wrote:
> > Does it only happens for __copy_user() ?
> > If yes, I assume the problem happens because of __copy_tofrom_user_nocheck() in
> > uaccess.h is always inlined. Maybe un-inlining helps?
> > Or, the inline-assembly for jsr/bsr needs tweeking ?
> 
> Indeed.  Try changing #ifdef MODULE above __copy_tofrom_user_nocheck to #if 1.

Thanks, that indeed fixes it.

While I have your ears (or eyes since this is email) I have been
running the ltp tests and noted some syscall test failures.  The sendmsg
call fails with a segfault instead of returning EFAULT, when one passes
in a NULL for the message arg.  When the test is run under gdb it
reports the segfault in the libc sendmsg function at the instruction
immediately following the syscall instruction and that instruction is a
move of a register to another register, not a memory access.  Would I
be correct in surmising that the segfault actually occurred in kernel
code but gets reported at the instruction following the syscall
instruction in user space?  (But looking at the kernel source for
sys_sendmsg it looks to me that the msg argument is properly checked
before being accessed so why a segfault should occur is not
obvious...)

(I see fstatfs also segfaults when passed a bad pointer but that's
because libc does not pass the bad address to the kernel, but
passes the address of a temporary buffer from which libc then
copies back into the bad address, thus kaboom instead of EFAULT.
C'est la vie.)

And while I mention gdb, it no longer works on Alpha since version
7.10.  Richard, would you be able to take a look at the bug report:
https://sourceware.org/bugzilla/show_bug.cgi?id=19061

And while I mention libc I am seeing (rather rare) random segfaults
in programs such as cp, tar, install and dpkg ever since the upgrade
to glibc 2.23 (or maybe it was 2.24).  I am struggling to get a
backtrace because it only happens very occassionally (but often enough
that it is almost impossible for a build and install of large software
packages such as libreoffice to complete without failure at some
random point) and when I rerun the failing program manually it then
always works.  I'll keep trying to narrow this one down.

Cheers
Michael.
