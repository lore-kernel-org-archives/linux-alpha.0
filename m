From: Andrea Parri <parri.andrea@gmail.com>
Subject: Re: [PATCH] locking/xchg/alpha: Remove memory barriers from the
 _local() variants
Date: Tue, 27 Feb 2018 21:08:31 +0100
Message-ID: <20180227200830.GA3164@andrea>
References: <1519704058-13430-1-git-send-email-parri.andrea@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+WTrYJEubfdbZmcWnSF59XvStrPnkxhBbbkALSbgqqA=;
        b=bM3U5CxlkdBeCOa542EdvvpEmZ919XH4usCcSmjLUUp0czRFgkiJkXO1KFHUK6dFaY
         rVSSyoKTBe2laCxBnxsnUPguY0Y+3yN19BBZS58kbhDw3koMoFO7JetZconkAPH04oLF
         Jt73eccN+9egLB8ZPLCoBt4Xut095nr/cSlJ7JLkfj8YQ/mXG2oVENYfTMn+RNt+8nY+
         w5dIc2t9ivdJNXwNdfrMWu1HkJ3uYXtwI5GHC6s6rp9HP7Xx2ELzqtCu7hRQKfAP4fA6
         6Tty8wH4odX6GwgQNGDH1kiHu8EcbTzjny7o4hyEM9CHRLWti3Xz7oaBvSl2NNHwQXtL
         GrzQ==
Content-Disposition: inline
In-Reply-To: <1519704058-13430-1-git-send-email-parri.andrea@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>, Alan Stern <stern@rowland.harvard.edu>, Andrew Morton <akpm@linux-foundation.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Linus Torvalds <torvalds@linux-foundation.org>, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, will.deacon@arm.com

[+ Will]

I'm not sure how this happened; Will, you at least figure as Reported-by: ;-)

  Andrea


On Tue, Feb 27, 2018 at 05:00:58AM +0100, Andrea Parri wrote:
> Commits 79d442461df74 ("locking/xchg/alpha: Clean up barrier usage by using
> smp_mb() in place of __ASM__MB") and 472e8c55cf662 ("locking/xchg/alpha:
> Fix xchg() and cmpxchg() memory ordering bugs") ended up adding unnecessary
> barriers to the _local variants, which the previous code took care to avoid.
> 
> Fix them by adding the smp_mb() into the cmpxchg macro rather than into the
> ____cmpxchg variants.
> 
> Fixes: 79d442461df74 ("locking/xchg/alpha: Clean up barrier usage by using smp_mb() in place of __ASM__MB")
> Fixes: 472e8c55cf662 ("locking/xchg/alpha: Fix xchg() and cmpxchg() memory ordering bugs")
> Reported-by: Will Deacon <will.deacon@arm.com>
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-alpha@vger.kernel.org
> ---
>  arch/alpha/include/asm/cmpxchg.h | 20 ++++++++++++++++----
>  arch/alpha/include/asm/xchg.h    | 27 ---------------------------
>  2 files changed, 16 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
> index 8a2b331e43feb..6c7c394524714 100644
> --- a/arch/alpha/include/asm/cmpxchg.h
> +++ b/arch/alpha/include/asm/cmpxchg.h
> @@ -38,19 +38,31 @@
>  #define ____cmpxchg(type, args...)	__cmpxchg ##type(args)
>  #include <asm/xchg.h>
>  
> +/*
> + * The leading and the trailing memory barriers guarantee that these
> + * operations are fully ordered.
> + */
>  #define xchg(ptr, x)							\
>  ({									\
> +	__typeof__(*(ptr)) __ret;					\
>  	__typeof__(*(ptr)) _x_ = (x);					\
> -	(__typeof__(*(ptr))) __xchg((ptr), (unsigned long)_x_,		\
> -				 sizeof(*(ptr)));			\
> +	smp_mb();							\
> +	__ret = (__typeof__(*(ptr)))					\
> +		__xchg((ptr), (unsigned long)_x_, sizeof(*(ptr)));	\
> +	smp_mb();							\
> +	__ret;								\
>  })
>  
>  #define cmpxchg(ptr, o, n)						\
>  ({									\
> +	__typeof__(*(ptr)) __ret;					\
>  	__typeof__(*(ptr)) _o_ = (o);					\
>  	__typeof__(*(ptr)) _n_ = (n);					\
> -	(__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,	\
> -				    (unsigned long)_n_,	sizeof(*(ptr)));\
> +	smp_mb();							\
> +	__ret = (__typeof__(*(ptr))) __cmpxchg((ptr),			\
> +		(unsigned long)_o_, (unsigned long)_n_, sizeof(*(ptr)));\
> +	smp_mb();							\
> +	__ret;								\
>  })
>  
>  #define cmpxchg64(ptr, o, n)						\
> diff --git a/arch/alpha/include/asm/xchg.h b/arch/alpha/include/asm/xchg.h
> index e2b59fac5257d..7adb80c6746ac 100644
> --- a/arch/alpha/include/asm/xchg.h
> +++ b/arch/alpha/include/asm/xchg.h
> @@ -12,10 +12,6 @@
>   * Atomic exchange.
>   * Since it can be used to implement critical sections
>   * it must clobber "memory" (also for interrupts in UP).
> - *
> - * The leading and the trailing memory barriers guarantee that these
> - * operations are fully ordered.
> - *
>   */
>  
>  static inline unsigned long
> @@ -23,7 +19,6 @@ ____xchg(_u8, volatile char *m, unsigned long val)
>  {
>  	unsigned long ret, tmp, addr64;
>  
> -	smp_mb();
>  	__asm__ __volatile__(
>  	"	andnot	%4,7,%3\n"
>  	"	insbl	%1,%4,%1\n"
> @@ -38,7 +33,6 @@ ____xchg(_u8, volatile char *m, unsigned long val)
>  	".previous"
>  	: "=&r" (ret), "=&r" (val), "=&r" (tmp), "=&r" (addr64)
>  	: "r" ((long)m), "1" (val) : "memory");
> -	smp_mb();
>  
>  	return ret;
>  }
> @@ -48,7 +42,6 @@ ____xchg(_u16, volatile short *m, unsigned long val)
>  {
>  	unsigned long ret, tmp, addr64;
>  
> -	smp_mb();
>  	__asm__ __volatile__(
>  	"	andnot	%4,7,%3\n"
>  	"	inswl	%1,%4,%1\n"
> @@ -63,7 +56,6 @@ ____xchg(_u16, volatile short *m, unsigned long val)
>  	".previous"
>  	: "=&r" (ret), "=&r" (val), "=&r" (tmp), "=&r" (addr64)
>  	: "r" ((long)m), "1" (val) : "memory");
> -	smp_mb();
>  
>  	return ret;
>  }
> @@ -73,7 +65,6 @@ ____xchg(_u32, volatile int *m, unsigned long val)
>  {
>  	unsigned long dummy;
>  
> -	smp_mb();
>  	__asm__ __volatile__(
>  	"1:	ldl_l %0,%4\n"
>  	"	bis $31,%3,%1\n"
> @@ -84,7 +75,6 @@ ____xchg(_u32, volatile int *m, unsigned long val)
>  	".previous"
>  	: "=&r" (val), "=&r" (dummy), "=m" (*m)
>  	: "rI" (val), "m" (*m) : "memory");
> -	smp_mb();
>  
>  	return val;
>  }
> @@ -94,7 +84,6 @@ ____xchg(_u64, volatile long *m, unsigned long val)
>  {
>  	unsigned long dummy;
>  
> -	smp_mb();
>  	__asm__ __volatile__(
>  	"1:	ldq_l %0,%4\n"
>  	"	bis $31,%3,%1\n"
> @@ -105,7 +94,6 @@ ____xchg(_u64, volatile long *m, unsigned long val)
>  	".previous"
>  	: "=&r" (val), "=&r" (dummy), "=m" (*m)
>  	: "rI" (val), "m" (*m) : "memory");
> -	smp_mb();
>  
>  	return val;
>  }
> @@ -135,13 +123,6 @@ ____xchg(, volatile void *ptr, unsigned long x, int size)
>   * Atomic compare and exchange.  Compare OLD with MEM, if identical,
>   * store NEW in MEM.  Return the initial value in MEM.  Success is
>   * indicated by comparing RETURN with OLD.
> - *
> - * The leading and the trailing memory barriers guarantee that these
> - * operations are fully ordered.
> - *
> - * The trailing memory barrier is placed in SMP unconditionally, in
> - * order to guarantee that dependency ordering is preserved when a
> - * dependency is headed by an unsuccessful operation.
>   */
>  
>  static inline unsigned long
> @@ -149,7 +130,6 @@ ____cmpxchg(_u8, volatile char *m, unsigned char old, unsigned char new)
>  {
>  	unsigned long prev, tmp, cmp, addr64;
>  
> -	smp_mb();
>  	__asm__ __volatile__(
>  	"	andnot	%5,7,%4\n"
>  	"	insbl	%1,%5,%1\n"
> @@ -167,7 +147,6 @@ ____cmpxchg(_u8, volatile char *m, unsigned char old, unsigned char new)
>  	".previous"
>  	: "=&r" (prev), "=&r" (new), "=&r" (tmp), "=&r" (cmp), "=&r" (addr64)
>  	: "r" ((long)m), "Ir" (old), "1" (new) : "memory");
> -	smp_mb();
>  
>  	return prev;
>  }
> @@ -177,7 +156,6 @@ ____cmpxchg(_u16, volatile short *m, unsigned short old, unsigned short new)
>  {
>  	unsigned long prev, tmp, cmp, addr64;
>  
> -	smp_mb();
>  	__asm__ __volatile__(
>  	"	andnot	%5,7,%4\n"
>  	"	inswl	%1,%5,%1\n"
> @@ -195,7 +173,6 @@ ____cmpxchg(_u16, volatile short *m, unsigned short old, unsigned short new)
>  	".previous"
>  	: "=&r" (prev), "=&r" (new), "=&r" (tmp), "=&r" (cmp), "=&r" (addr64)
>  	: "r" ((long)m), "Ir" (old), "1" (new) : "memory");
> -	smp_mb();
>  
>  	return prev;
>  }
> @@ -205,7 +182,6 @@ ____cmpxchg(_u32, volatile int *m, int old, int new)
>  {
>  	unsigned long prev, cmp;
>  
> -	smp_mb();
>  	__asm__ __volatile__(
>  	"1:	ldl_l %0,%5\n"
>  	"	cmpeq %0,%3,%1\n"
> @@ -219,7 +195,6 @@ ____cmpxchg(_u32, volatile int *m, int old, int new)
>  	".previous"
>  	: "=&r"(prev), "=&r"(cmp), "=m"(*m)
>  	: "r"((long) old), "r"(new), "m"(*m) : "memory");
> -	smp_mb();
>  
>  	return prev;
>  }
> @@ -229,7 +204,6 @@ ____cmpxchg(_u64, volatile long *m, unsigned long old, unsigned long new)
>  {
>  	unsigned long prev, cmp;
>  
> -	smp_mb();
>  	__asm__ __volatile__(
>  	"1:	ldq_l %0,%5\n"
>  	"	cmpeq %0,%3,%1\n"
> @@ -243,7 +217,6 @@ ____cmpxchg(_u64, volatile long *m, unsigned long old, unsigned long new)
>  	".previous"
>  	: "=&r"(prev), "=&r"(cmp), "=m"(*m)
>  	: "r"((long) old), "r"(new), "m"(*m) : "memory");
> -	smp_mb();
>  
>  	return prev;
>  }
> -- 
> 2.7.4
> 
