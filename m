From: Ben Hutchings <ben.hutchings@codethink.co.uk>
Subject: Re: [Y2038] [PATCH 2/2] alpha: osf_sys.c: use timespec64 where
 appropriate
Date: Wed, 08 Nov 2017 00:22:39 +0000
Message-ID: <1510100559.2465.44.camel@codethink.co.uk>
References: <20171107141029.3160278-1-arnd@arndb.de>
         <20171107141029.3160278-2-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20171107141029.3160278-2-arnd@arndb.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>
Cc: y2038@lists.linaro.org, linux-kernel@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Deepa Dinamani <deepa.kernel@gmail.com>

On Tue, 2017-11-07 at 15:09 +0100, Arnd Bergmann wrote:
> Some of the syscall helper functions (do_utimes, poll_select_set_timeout,
> core_sys_select) have changed over the past year or two to use
> 'timespec64' pointers rather than 'timespec'. This was fine on alpha,
> since 64-bit architectures treat the two as the same type.
> 
> However, I'd like to change that behavior and make 'timespec64' a proper
> type of its own even on 64-bit architectures, and that will introduce
> harmless type mismatch warnings here.
> 
> Also, I'm trying to kill off the do_gettimeofday() helper in favor of
> ktime_get() and related interfaces throughout the kernel.
[...]
> @@ -1004,9 +1013,10 @@ SYSCALL_DEFINE2(osf_gettimeofday, struct timeval32 __user *, tv,
>  		struct timezone __user *, tz)
>  {
>  	if (tv) {
> -		struct timeval ktv;
> -		do_gettimeofday(&ktv);
> -		if (put_tv32(tv, &ktv))
> +		struct timespec64 kts;
> +
> +		ktime_get_ts64(&kts);
[...]

But this syscall is supposed to use the realtime clock, no?  It seems
like the correct substitute here is getnstimeofday64() (as the kernel-
doc comment for do_gettimeofday() *almost* says).

Ben.

-- 
Ben Hutchings
Software Developer, Codethink Ltd.

