From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 3/7] alpha: Modernize lib/mpi/longlong.h
Date: Tue, 16 Jul 2013 10:19:19 -0700
Message-ID: <1373995159.1949.8.camel@joe-AO722>
References: <1373994280-12047-1-git-send-email-rth@twiddle.net>
	 <1373994280-12047-4-git-send-email-rth@twiddle.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1373994280-12047-4-git-send-email-rth@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>
Cc: linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

On Tue, 2013-07-16 at 10:04 -0700, Richard Henderson wrote:
> Remove the compile warning for __udiv_qrnnd not having a prototype.
> Use the __builtin_alpha_umulh introduced in gcc 4.0.

Isn't gcc 3.x still a supported compiler?

> diff --git a/lib/mpi/longlong.h b/lib/mpi/longlong.h
[]
> @@ -151,15 +151,12 @@ do { \
>  #endif /* __a29k__ */
>  
>  #if defined(__alpha) && W_TYPE_SIZE == 64
> -#define umul_ppmm(ph, pl, m0, m1) \
> -do { \
> -		UDItype __m0 = (m0), __m1 = (m1); \
> -		__asm__ ("umulh %r1,%2,%0" \
> -		: "=r" ((UDItype) ph) \
> -		: "%rJ" (__m0), \
> -			"rI" (__m1)); \
> -		(pl) = __m0 * __m1; \
> -	} while (0)
> +#define umul_ppmm(ph, pl, m0, m1)			\
> +do {							\
> +	UDItype __m0 = (m0), __m1 = (m1);		\
> +	(ph) = __builtin_alpha_umulh(__m0, __m1);	\
> +	(pl) = __m0 * __m1;                             \
> +} while (0)
>  #define UMUL_TIME 46
>  #ifndef LONGLONG_STANDALONE
>  #define udiv_qrnnd(q, r, n1, n0, d) \
> @@ -167,7 +164,7 @@ do { UDItype __r; \
>  	(q) = __udiv_qrnnd(&__r, (n1), (n0), (d)); \
>  	(r) = __r; \
>  } while (0)
> -extern UDItype __udiv_qrnnd();
> +extern UDItype __udiv_qrnnd(UDItype *, UDItype, UDItype, UDItype);
>  #define UDIV_TIME 220
>  #endif /* LONGLONG_STANDALONE */
>  #endif /* __alpha */



