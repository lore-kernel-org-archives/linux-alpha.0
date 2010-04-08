From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH] alpha: simplify and optimize sched_find_first_bit
Date: Thu, 08 Apr 2010 11:52:32 -0700
Message-ID: <4BBE25F0.8060209@twiddle.net>
References: <1270751656-5614-1-git-send-email-mattst88@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1270751656-5614-1-git-send-email-mattst88@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mattst88@gmail.com
Cc: linux-alpha@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@elte.hu>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On 04/08/2010 11:34 AM, mattst88@gmail.com wrote:
> -	return __ffs(b0) + ofs;
> +	unsigned long output;
> +	asm(
> +		"cmoveq %0,64,%1        # ofs = (b[0] ? ofs : 64);\n"
> +		"cmoveq %0,%2,%0        # temp = (b[0] ? b[0] : b[1]);\n"
> +		"cttz   %0,%0           # output = cttz(temp);\n "
> +		: "=r" (output), "=r" (ofs)
> +		: "r" (b[1]), "0" (b[0]), "1" (0)
> +	);
> +	return output + ofs;

NACK.

You need to move that cttz out of the asm as well, to continue
to support pre-ev67.  Ack if you adjust to use __ffs.


r~
