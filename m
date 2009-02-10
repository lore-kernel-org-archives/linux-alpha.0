From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: Need help fixing DRM locking on Alpha
Date: Tue, 10 Feb 2009 18:43:55 +0300
Message-ID: <20090210154355.GA27697@jurassic.park.msu.ru>
References: <b4198de60902091343p2aa76a27vf3bc077b6d55c78e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b4198de60902091343p2aa76a27vf3bc077b6d55c78e@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org

On Mon, Feb 09, 2009 at 04:43:12PM -0500, Matt Turner wrote:
> Hi,
> 
> Lately, I've spent time debugging a problem with the DRM locking code on Alpha.
> 
> http://bugs.freedesktop.org/show_bug.cgi?id=16549
> 
> After searching through the userspace components (libdrm, mesa,
> xserver) and not finding any relevant changes, I think the problem
> must be located in the kernel.
> 
> David Airlie pointed me to possibly relevant commits to alpha's
> system.h which contains cmpxchg.
> 
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=history;f=include/asm-alpha/system.h;h=afe20fa58c990927fd10c5e94d41fe4d8d9eee8a;hb=HEAD

No, I believe that at least __cmpxchg_u32/u64 kernel code is OK.
Perhaps there are problems with __cmpxchg_u8/u16, but I don't
think DRM locking code uses those.

> Can anyone see where the bug is located?

Hm, DRM_CAS looks suspicious - I'm not sure if it behaves as expected
in the contention case. But your change to it is incorrect either,
since you ignore the return value of stl_c.

Assuming that x86 and powerpc implementations do the correct thing, we need
something like this (untested!). Basically, it's cmpxchg with an inverted
return value. Also we need to be careful with sign-extension.

#define	DRM_CAS(lock, old, new, ret)		\
	do {					\
		int tmp;			\
		__asm__ __volatile__(		\
		"	addl	$31, %3, %3\n"	\
		"1:	ldl_l	%0, %2\n"	\
		"	cmpeq	%0, %3, %1\n"	\
		"	beq	%1, 2f\n"	\
		"	mov	%4, %0\n"	\
		"	stl_c	%0, %2\n"	\
		"	beq	%0, 3f\n"	\
		"2:	mb\n"			\
		"	cmpeq	%1, 0, %1\n"	\
		".subsection 2\n"		\
		"3:	br	1b\n"		\
		".previous"			\
		: "=&r"(tmp), "=&r"(ret),	\
		  "=m"(__drm_dummy_lock(lock)),	\
		  "=&r"(old)			\
		: "r"(new)			\
		: "memory");			\
	} while (0)

Ivan.
