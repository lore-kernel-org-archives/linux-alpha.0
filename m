From: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH] Convert alpha to use arch_gettimeoffset()
Date: Fri, 12 Jun 2009 00:03:26 -0700
Message-ID: <4A31FDBE.3030506@gmail.com>
References: <1244758210.7192.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=eOVDy8YEi5BRh3xKM7G7VnHVlTjwH+nup4g42N+I7Ds=;
        b=r5/8z2tRkLIDftoVmzdTEmT67XlqO5Ia2aUw3/zvY3idM1iI+H8wmJX8IP5vEwAvJX
         lQZtGFCgEYF1DLi9qvEJ61JTFU4+oVVq4V7+AqpWn5Gue9QTS/y64GNQCYaHL0mmv2lb
         ZklWQlWUSYg0G0kSm2cd9bomxRaRqSxdLU+4w=
In-Reply-To: <1244758210.7192.5.camel@localhost.localdomain>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: john stultz <johnstul@us.ibm.com>
Cc: ink@jurassic.park.msu.ru, lkml <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

john stultz wrote:
> I suspect the alpha arch could even be further improved to provide and
> rpcc() based clocksource, but not having the hardware, I don't feel
> comfortable attempting the more complicated conversion (but I'd be glad
> to help if anyone else is interested).

Unfortunately this isn't possible.  The rpcc value is only 32-bits wide,
and so rolls over in approx 3 to 4 seconds.  Thus all the contortions to
try and use the truncated value for sub 1 second adjustments.

> +	delta_cycles = rpcc() - state.last_time;
> +	partial_tick = state.partial_tick;
>  	/*
>  	 * usec = cycles * ticks_per_cycle * 2**48 * 1e6 / (2**48 * ticks)
>  	 *	= cycles * (s_t_p_c) * 1e6 / (2**48 * ticks)
> @@ -448,62 +437,9 @@ do_gettimeofday(struct timeval *tv)
>  	delta_usec = ((delta_usec / ((1UL << (FIX_SHIFT-6-1)) * HZ)) + 1) / 2;
>  #endif
...
> +	return delta_usec * 1000;

If we're going to be computing nsec now, we might as well adjust
the computation here.

   nsec = cycles * ticks_per_cycle * 1e9 / HZ
        = cycles * s_t_p_c * 1e9 / (2**48 * HZ)
        = cycles * s_t_p_c * 1953125 / (2**39 * HZ)

   delta_nsec = delta_cycles*state.scaled_ticks_per_cycle + partial_tick;
   delta_nsec *= 1953125
   delta_nsec /= HZ << (FIX_SHIFT - 9 - 1);
   delta_nsec = (delta_nsec + 1) / 2;

As far as I can tell, the range of the dividend is about 7e17,
which still fits in an unsigned long.


r~

