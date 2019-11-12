From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: [PATCH 11/23] y2038: rusage: use __kernel_old_timeval
Date: Wed, 13 Nov 2019 00:09:15 +0300
Message-ID: <20191112210915.GD5130@uranus>
References: <20191108210236.1296047-1-arnd@arndb.de>
 <20191108211323.1806194-2-arnd@arndb.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JPZechq2eKF4wwi+8Qv9lfknYNyHmyO47xHG86HtDMs=;
        b=fU7vwVcrYm0D0uGcCtgj0ZXXNmSaBK8mJoOPiWQqqTejkcej/6TWQmT8eSkDCn4Jf/
         Pr2gGz0366EnVZSFzSalSEisx2UYQv2iLejrLZdy1/PmVkbxERC3U08mvKGfl9VnXNhD
         eG8dWD0PWDMQeFRVeCN43IAJViixazSac7nKrm6Fz0aYjflN8BCjXd5ENVGOk77tH5uw
         s3NkaypO210iBobuYM8NgwwjOPZiL7rOKlV8y5tKqjIUGChDU8CHOoS8IjSCasdyn/Az
         8r8Jf/O/RZu2evBDlSN/59MIt33XBDP+Hh1Kf9RP7DSKpnhoeCmsrxJjGsdlouvXvDlp
         rZxA==
Content-Disposition: inline
In-Reply-To: <20191108211323.1806194-2-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: y2038@lists.linaro.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-kernel@vger.kernel.org, Deepa Dinamani <deepa.kernel@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-alpha@vger.kernel.org

On Fri, Nov 08, 2019 at 10:12:10PM +0100, Arnd Bergmann wrote:
> There are two 'struct timeval' fields in 'struct rusage'.
> 
> Unfortunately the definition of timeval is now ambiguous when used in
> user space with a libc that has a 64-bit time_t, and this also changes
> the 'rusage' definition in user space in a way that is incompatible with
> the system call interface.
> 
> While there is no good solution to avoid all ambiguity here, change
> the definition in the kernel headers to be compatible with the kernel
> ABI, using __kernel_old_timeval as an unambiguous base type.
> 
> In previous discussions, there was also a plan to add a replacement
> for rusage based on 64-bit timestamps and nanosecond resolution,
> i.e. 'struct __kernel_timespec'. I have patches for that as well,
> if anyone thinks we should do that.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Question: should we also rename 'struct rusage' into 'struct __kernel_rusage'
> here, to make them completely unambiguous?

The patch looks ok to me. I must confess I looked into rusage long ago
so __kernel_timespec type used in uapi made me nervious at first,
but then i found that we've this type defined in time_types.h uapi
so userspace should be safe. I also like the idea of __kernel_rusage
but definitely on top of the series.

Reviewed-by: Cyrill Gorcunov <gorcunov@gmail.com>
