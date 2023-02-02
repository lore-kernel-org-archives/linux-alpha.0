From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
Date: Thu, 2 Feb 2023 21:54:35 +1300
Message-ID: <Y9t6Swqt+A9noVIf@creeky>
References: <Y9lz6yk113LmC9SI@ZenIV>
 <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV>
 <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
 <Y9te+4n4ajSF++Ex@ZenIV>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Y9te+4n4ajSF++Ex@ZenIV>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>

On Thu, Feb 02, 2023 at 06:58:03AM +0000, Al Viro wrote:
> Other bugs in the same area:
> 	* we ought to compare address with VMALLOC_START,
> not TASK_SIZE.
> 	* we ought to do that *before* checking for
> kernel threads/pagefault_disable() being in effect.
> 
> Wait a minute - pgd_present() on alpha has become constant 1
> since a73c948952cc "alpha: use pgtable-nopud instead of 4level-fixup"
> 
> So that thing had been completely broken for 3 years and nobody
> had noticed.  

I have never noticed because I haven't been able to run a 5.9 or
newer kernel on Alpha reliably so have been running a 5.8 kernel
for quite some time.  Bad commit is about
25788738eb9ce46fe6a0fd84a3ceef5c795d41f0 but bisection proved very
difficult because the bug might only show up once per day (memory
corruption in user space causing gcc in big long builds to ICE
reporting corrupted structures, or similar) and so could never be
entirely sure a kernel marked as good was truly good in bisection
and went wrong a number of times.  There is a good possibility the bad
commit is one of facdaa917c4d5a376d or 25788738eb9ce46fe6.

Cheers,
Michael.
