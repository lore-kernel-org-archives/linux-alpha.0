From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 3/5] locking/arch: Wire up local_try_cmpxchg
Date: Wed, 12 Apr 2023 13:32:31 +0200
Message-ID: <20230412113231.GA628377@hirez.programming.kicks-ass.net>
References: <20230405141710.3551-1-ubizjak@gmail.com>
 <20230405141710.3551-4-ubizjak@gmail.com>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ptb2avmE0b7kYpkD6HQ5sKXtmJgMCEPhKl497g20A1Q=; b=OeJpnwPQVQrSrkQnsPYnkVz6Xn
	MQHlpDq4OctaeZMIotctQRvuZFYgTUiewZ7yhKiM52JM3lAIDo3z9I7QtTxis1qzyh+z8drUYv/WV
	bfbaBd2P8XywYXeiBMI5PritExaKlrWXJd7/wY7wiQAHiZblhmhYLud/MzynJ+MYFFW0+5xyzQc6I
	virTasGQ1pP9Bw2IUpE4ZnHiiBOZdruaGxw9KZH5HnVc+61Syh0q79vu8y30TAFx7q+e26Z3cuEp/
	bsMrHDSoGfQD+fNsEp4WZY7Lu2KON5AN0m6qsqM2FWXzkMBO2BMwFxx8Is50hsXaD3MySaIdcQUTV
	LkPO9Wwg==;
Content-Disposition: inline
In-Reply-To: <20230405141710.3551-4-ubizjak@gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, linux-arch@vger.kernel.org, Jun Yi <yijun@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org

On Wed, Apr 05, 2023 at 04:17:08PM +0200, Uros Bizjak wrote:
> diff --git a/arch/powerpc/include/asm/local.h b/arch/powerpc/include/asm/local.h
> index bc4bd19b7fc2..45492fb5bf22 100644
> --- a/arch/powerpc/include/asm/local.h
> +++ b/arch/powerpc/include/asm/local.h
> @@ -90,6 +90,17 @@ static __inline__ long local_cmpxchg(local_t *l, long o, long n)
>  	return t;
>  }
>  
> +static __inline__ bool local_try_cmpxchg(local_t *l, long *po, long n)
> +{
> +	long o = *po, r;
> +
> +	r = local_cmpxchg(l, o, n);
> +	if (unlikely(r != o))
> +		*po = r;
> +
> +	return likely(r == o);
> +}
> +

Why is the ppc one different from the rest? Why can't it use the
try_cmpxchg_local() fallback and needs to have it open-coded?
