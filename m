From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] alpha: atomics: Add smp_read_barrier_depends() to
 release/relaxed atomics
Date: Thu, 12 Oct 2017 08:17:12 -0700
Message-ID: <20171012151712.GA3521@linux.vnet.ibm.com>
References: <1507818377-7546-1-git-send-email-will.deacon@arm.com>
 <1507818377-7546-4-git-send-email-will.deacon@arm.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507818377-7546-4-git-send-email-will.deacon@arm.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will.deacon@arm.com>
Cc: linux-kernel@vger.kernel.org, mcree@orcon.net.nz, peterz@infradead.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

On Thu, Oct 12, 2017 at 03:26:17PM +0100, Will Deacon wrote:
> As part of the fight against smp_read_barrier_depends(), we require
> dependency ordering to be preserved when a dependency is headed by a load
> performed using an atomic operation.
> 
> This patch adds smp_read_barrier_depends() to the _release and _relaxed
> atomics on alpha, which otherwise lack anything to enforce dependency
> ordering.
> 
> Signed-off-by: Will Deacon <will.deacon@arm.com>

Reviewed-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

> ---
>  arch/alpha/include/asm/atomic.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/alpha/include/asm/atomic.h b/arch/alpha/include/asm/atomic.h
> index 498933a7df97..16961a3f45ba 100644
> --- a/arch/alpha/include/asm/atomic.h
> +++ b/arch/alpha/include/asm/atomic.h
> @@ -13,6 +13,15 @@
>   * than regular operations.
>   */
> 
> +/*
> + * To ensure dependency ordering is preserved for the _relaxed and
> + * _release atomics, an smp_read_barrier_depends() is unconditionally
> + * inserted into the _relaxed variants, which are used to build the
> + * barriered versions. To avoid redundant back-to-back fences, we can
> + * define the _acquire and _fence versions explicitly.
> + */
> +#define __atomic_op_acquire(op, args...)	op##_relaxed(args)
> +#define __atomic_op_fence			__atomic_op_release
> 
>  #define ATOMIC_INIT(i)		{ (i) }
>  #define ATOMIC64_INIT(i)	{ (i) }
> @@ -60,6 +69,7 @@ static inline int atomic_##op##_return_relaxed(int i, atomic_t *v)	\
>  	".previous"							\
>  	:"=&r" (temp), "=m" (v->counter), "=&r" (result)		\
>  	:"Ir" (i), "m" (v->counter) : "memory");			\
> +	smp_read_barrier_depends();					\
>  	return result;							\
>  }
> 
> @@ -77,6 +87,7 @@ static inline int atomic_fetch_##op##_relaxed(int i, atomic_t *v)	\
>  	".previous"							\
>  	:"=&r" (temp), "=m" (v->counter), "=&r" (result)		\
>  	:"Ir" (i), "m" (v->counter) : "memory");			\
> +	smp_read_barrier_depends();					\
>  	return result;							\
>  }
> 
> @@ -111,6 +122,7 @@ static __inline__ long atomic64_##op##_return_relaxed(long i, atomic64_t * v)	\
>  	".previous"							\
>  	:"=&r" (temp), "=m" (v->counter), "=&r" (result)		\
>  	:"Ir" (i), "m" (v->counter) : "memory");			\
> +	smp_read_barrier_depends();					\
>  	return result;							\
>  }
> 
> @@ -128,6 +140,7 @@ static __inline__ long atomic64_fetch_##op##_relaxed(long i, atomic64_t * v)	\
>  	".previous"							\
>  	:"=&r" (temp), "=m" (v->counter), "=&r" (result)		\
>  	:"Ir" (i), "m" (v->counter) : "memory");			\
> +	smp_read_barrier_depends();					\
>  	return result;							\
>  }
> 
> -- 
> 2.1.4
> 

