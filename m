From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: [PATCH 11/23] y2038: rusage: use __kernel_old_timeval
Date: Wed, 13 Nov 2019 20:22:03 +0300
Message-ID: <20191113172203.GE5130@uranus>
References: <20191108210236.1296047-1-arnd@arndb.de>
 <20191108211323.1806194-2-arnd@arndb.de>
 <20191112210915.GD5130@uranus>
 <CAK8P3a03FRfTsXADH+xfLsWxCu54JXvXbb-OdyGXXf88RNP34w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kV1Wcdoyb3tKkjtZ6TiX+SctpfjtVlKeBG+DTOA7wco=;
        b=H6qUKjy+MIZ5DBe9pQIP/fOIsyk7X/1ym72XQuXiEOFm3FEysa6i8nj1wu//7qFbuN
         Rt1waOKtzNR0HNdxhROvzLzeMN2l0gzpdLkzNF3a2end5ARGrKaJ/pJ/8cEw4zCmE1iY
         74prm7mtFRNkAezXqAix5mcfLBByncIoMniVRKM6pcPGzcKF3HGWN3xWZTVzr+0l6N3C
         H2RyOI8wIbUTZ5GtNFDfRzVUXBbYccS1wknug0zQw1ZHxbc8LAmXMLTLY9TnwbXYLj5k
         xKosD5SBYYXJofqwIJhaO7SvfZUSYpQqGLKF20qyempqJ0DGfwmOZIU+w8SMlwyz8H7L
         DLVg==
Content-Disposition: inline
In-Reply-To: <CAK8P3a03FRfTsXADH+xfLsWxCu54JXvXbb-OdyGXXf88RNP34w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: y2038 Mailman List <y2038@lists.linaro.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Deepa Dinamani <deepa.kernel@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, alpha <linux-alpha@vger.kernel.org>

On Wed, Nov 13, 2019 at 11:02:12AM +0100, Arnd Bergmann wrote:
...
> 
> There are clearly too many time types at the moment, but I'm in the
> process of throwing out the ones we no longer need now.

Cool!

> I do have a number patches implementing other variants for the syscall,
> and I suppose that if we end up adding __kernel_rusage, that would
> have to go with a set of syscalls using 64-bit seconds/nanoseconds
> rather than the old 32/64 microseconds. I don't know what other
> changes remain that anyone would want from sys_waitid() now that
> it does support pidfd.
> 
> If there is still a need for a new waitid() replacement, that should take
> that new __kernel_rusage I think, but until then I hope we are fine
> with today's getrusage+waitid based on the current struct rusage.

Definitely.

> 
> BSD has wait6() to return separate rusage structures for 'self' and
> 'children', but I could not find any application (using the freebsd
> sources and debian code search) that actually uses that information,
> so there might not be any demand for that.

Thanks for detailed info Arnd!
