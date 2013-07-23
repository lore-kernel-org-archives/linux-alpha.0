From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 0/7] Minor Alpha updates for 3.11
Date: Mon, 22 Jul 2013 21:31:41 -0500
Message-ID: <1374546701.3719.33@driftwood>
References: <20130717000347.GB2483@stolen.phys.waikato.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20130717000347.GB2483@stolen.phys.waikato.ac.nz> (from
	cree@waikato.ac.nz on Tue Jul 16 19:03:47 2013)
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: Michael Cree <cree@waikato.ac.nz>
Cc: Richard Henderson <rth@twiddle.net>, linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

On 07/16/2013 07:03:47 PM, Michael Cree wrote:
> On Tue, Jul 16, 2013 at 06:35:07PM -0500, Rob Landley wrote:
> > On 07/16/2013 12:04:33 PM, Richard Henderson wrote:
> > >Here's a set of minor updates for arch/alpha that should not
> > >be controversial.
> >
> > I also note that I had to do this to get busybox to build against
> > uClibc:
> > -#define __NR_umount		 22
> > +#define __NR_umount2		 22
> > -#define __NR_oldumount		321
> > +#define __NR_umount		321
> 
> I anticipate that this will likely break userspace.

Haven't seen it so far. It's the same semantics all the other targets  
have. Haven't built the whole of linux from scratch against it yet  
though. (Most of my package builds are native and I'm still tweaking my  
build environment to get a native toolchain built.)

> busybox should be fixed to test for __NR_oldumount and then call the
> correct functions, namely oldumount and umount if __NR_oldumount is  
> defined
> and umount and umount2 if it is not defined.

The man page for umount and umount2 doesn't mention "oldumount":

$ man 2 umount | grep old
$

Only three kernel targets mention it, alpha, powerpc, and x86:

$ find arch/*/include -type f | xargs grep oldumount
arch/alpha/include/uapi/asm/unistd.h:#define __NR_oldumount		 
321
arch/powerpc/include/asm/systbl.h:SYSX(sys_ni_syscall,sys_oldumount,sys_oldumount)
arch/x86/include/generated/asm/syscalls_32.h:__SYSCALL_I386(22,  
sys_oldumount, sys_oldumount)

And the other two export umount2:

$ find arch/*/include -type f | xargs grep umount2 | egrep "powerpc|x86"
arch/powerpc/include/uapi/asm/unistd.h:#define  
__NR_umount2		 52
arch/x86/include/generated/asm/unistd_32_ia32.h:#define  
__NR_ia32_umount2 52
arch/x86/include/generated/uapi/asm/unistd_x32.h:#define __NR_umount2  
(__X32_SYSCALL_BIT + 166)
arch/x86/include/generated/uapi/asm/unistd_32.h:#define __NR_umount2 52
arch/x86/include/generated/uapi/asm/unistd_64.h:#define __NR_umount2 166

So really what you're saying is busybox should #ifdef alpha/workaround  
target-specific breakage/#unifdef, and what this says to _me_ is that  
nobody's tried to build busybox on Alpha since it started using  
umount2(). How long ago was that?

   commit 6c5f2c602174c7fe0830a1fc4fe5b3dde5ed7068
   Author: Erik Andersen <andersen@codepoet.org>
   Date:   Fri May 5 19:49:33 2000 +0000

I.E. nobody's tried to build busybox umount for Alpha (except me) for  
thirteen years.

There are waaaaay more busybox installations out there than even  
_emulated_ alpha systems, and this is trivial to fix with a local patch  
to the kernel. So I'll just do that. Your idea of the "correct" thing  
to do to "fix" this seems entirely backwards to me.

Rob