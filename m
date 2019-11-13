From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 11/23] y2038: rusage: use __kernel_old_timeval
Date: Wed, 13 Nov 2019 11:02:12 +0100
Message-ID: <CAK8P3a03FRfTsXADH+xfLsWxCu54JXvXbb-OdyGXXf88RNP34w@mail.gmail.com>
References: <20191108210236.1296047-1-arnd@arndb.de> <20191108211323.1806194-2-arnd@arndb.de>
 <20191112210915.GD5130@uranus>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191112210915.GD5130@uranus>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyrill Gorcunov <gorcunov@gmail.com>
Cc: y2038 Mailman List <y2038@lists.linaro.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Deepa Dinamani <deepa.kernel@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, alpha <linux-alpha@vger.kernel.org>

On Tue, Nov 12, 2019 at 10:09 PM Cyrill Gorcunov <gorcunov@gmail.com> wrote:
>
> On Fri, Nov 08, 2019 at 10:12:10PM +0100, Arnd Bergmann wrote:

> > ---
> > Question: should we also rename 'struct rusage' into 'struct __kernel_rusage'
> > here, to make them completely unambiguous?
>
> The patch looks ok to me. I must confess I looked into rusage long ago
> so __kernel_timespec type used in uapi made me nervious at first,
> but then i found that we've this type defined in time_types.h uapi
> so userspace should be safe. I also like the idea of __kernel_rusage
> but definitely on top of the series.

There are clearly too many time types at the moment, but I'm in the
process of throwing out the ones we no longer need now.

I do have a number patches implementing other variants for the syscall,
and I suppose that if we end up adding __kernel_rusage, that would
have to go with a set of syscalls using 64-bit seconds/nanoseconds
rather than the old 32/64 microseconds. I don't know what other
changes remain that anyone would want from sys_waitid() now that
it does support pidfd.

If there is still a need for a new waitid() replacement, that should take
that new __kernel_rusage I think, but until then I hope we are fine
with today's getrusage+waitid based on the current struct rusage.

BSD has wait6() to return separate rusage structures for 'self' and
'children', but I could not find any application (using the freebsd
sources and debian code search) that actually uses that information,
so there might not be any demand for that.

> Reviewed-by: Cyrill Gorcunov <gorcunov@gmail.com>

Thanks,

      Arnd
