Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCCA346AD4
	for <linux-alpha@vger.kernel.org>; Thu, 22 Jan 2026 14:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769090440; cv=none; b=DcbtasXKQiIuBT8G9V0/nrvjCSOCGRVZMyRWu3DYnxdWIeKBEYWUTny7SizVExNpbXBTIEHf5GXskqy9rOLqb4nBZhOgokBE+EzI82wD+tTa8SV0ld7e8zEzNbvLQy92J27wIl787wdWDQe3KX/tgHdw3YqJrXLW67JWizf/jvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769090440; c=relaxed/simple;
	bh=AHSBEaRYfStLiqJd2Yrr0EQ+tzb5DiwinzVPHKX4hIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRccx2mpHHAr8bwESTaHYGMzHv1gDF2xYpHG13Ki4k0+e07iWD/Ukl81jPr5DmqOQ7lQTU4B32FKZjdg9ma9n73T/4vOzDu9X6P1pmK3vzXLdqoRVmbm7u7eHmgWaqNE1JaixLsEN5zhrY8Eii4SxEri42G0PwJKUUYjZ9X1n30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mE3JzZyS; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mE3JzZyS"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b88455e6663so104716966b.1
        for <linux-alpha@vger.kernel.org>; Thu, 22 Jan 2026 06:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769090436; x=1769695236; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXXllTpn+4j3DQ+o0FpmjiZEdWUg34VA5GPm+3TDwac=;
        b=mE3JzZySbsZNFXrazHRmfkLgXK1G6CICo/45BaSEMmri8qoPvELmkqlJUJuLq8r/cR
         BZuBE98d600tezPM1Ev3Lv6/wgj1maHQPUX5UMH0X7Bb1TL3sUzOm4dc6Ly1PPaTjaqs
         hDxR1qZKtGXBH67ziEpREgFLFgUdSeobUOgLHgZlfBxr0178fS+J4nD8OTVboWYl3pQt
         VfUZvZP7nVL41fRWgaHUJ4aLvHkvxOcT8JiNj8YivRx/Teoe0yOHaPjpxbMoqspGXGs4
         vz+mawD5KrfuWoRGegQ0STZROYkcYTyB9Mb6z3UbWWha+b7zhPD0i037Q32eJSQYTC72
         KJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769090436; x=1769695236;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KXXllTpn+4j3DQ+o0FpmjiZEdWUg34VA5GPm+3TDwac=;
        b=ggVbN6yrcA3/xtsU+dCyGdhmChC+93V4kR4QpALOqK4/HmNZTJlRui6j78pO/0YXNv
         PGbM5sj8kmb9+k2GvHrGaVjSbxC6a0ht5vyCxHjVBFtaGGsm+hIQzryhu4TPrsq0TFSJ
         00KelLdV2U3lQJAuGiiPkJOzpVUPE3ArlG1YtP/pv1hPDXRGKujip1LEvkf0Q4QMqkYq
         CJzUqFYb2EZWkA2q/t+Q3Nc9oAxhBKfC1zKiekIWajd07lubDzo4t0HzmzI08OixvKcm
         eYXiWb8Z+aqoTP6em9+ba88vSJXObJ2S0XJWDq7TWrzHzUD3KkvkY4HU0B3QATeXyiue
         rJpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKblytDF2qTjlTbST+mTLbfB0CMcCyQoPwSIfL0ymjfhRmgCCe9TswFUUZIYoaoo/9Vx554lyoALlnPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhsoUHzPM0KEVw3Qs+gn13ysL1hVNfCuKsvswAbtVts+SwoIeE
	qgYD34MhwLS7rBlnFnx0xQdnRpITT9G8fuPFyVk4Ioz+zsxcgb7KFMDE
X-Gm-Gg: AZuq6aJLCFwj2HF/TI50ULT1lTJnBSQ4Ci9g+8IGJPhMK/BoYzz1myKuXozM6ZoAQdV
	seTL/RrDgHwX4PCCAF4H4zHtg/Lfjrng9BmxvNCawSIqED0YdTzGqGCiLrRNISCskU/3O2/w59y
	oAFc78yZuAunrUYnZxlTSVedgY1UK06tflEHge6F3zJq+lPBmlTHmfm+tkD7hbJMdlZyJwi5Bky
	mlM1gxvNceqJedbu4y7gwdPvVeaiV/bwKStzZg8T77tRh7FNP6yjrNBnHhZbV54/5TIH0vCtNNI
	SS2XHEkqLxMgzVpvMR7RgjnQ9stL7FjqWeywalh/c2jvRDtNkzpA+3DXLhFkQwYA/4bNWqPlOQ2
	7IfbiehCQAJ4xNlWcuOoauXCgvPwXfJ41cRwtoSOQAH07vlV0MbvkLWrpCtVHQpp2LiYfPwQeKV
	M9WebmM4T/eg==
X-Received: by 2002:a17:907:84e:b0:b87:33f3:6042 with SMTP id a640c23a62f3a-b8792d3be6dmr1826205366b.9.1769090435585;
        Thu, 22 Jan 2026 06:00:35 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b884006d3bbsm68748466b.32.2026.01.22.06.00.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jan 2026 06:00:35 -0800 (PST)
Date: Thu, 22 Jan 2026 14:00:34 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, Qi Zheng <qi.zheng@linux.dev>,
	will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
	peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org,
	ioworker0@gmail.com, linmag7@gmail.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v3 7/7] mm: make PT_RECLAIM depends on
 MMU_GATHER_RCU_TABLE_FREE
Message-ID: <20260122140034.ymigrfppzwvmcjkr@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1765963770.git.zhengqi.arch@bytedance.com>
 <ac2bdb2a66da1edb24f60d1da1099e2a0b734880.1765963770.git.zhengqi.arch@bytedance.com>
 <20251231094243.zmjs7kgflm7q6k73@master>
 <a3a60bbb-70b7-49ed-abc6-937e6c13d681@linux.dev>
 <20260101020715.45wqnjgcklvjcth3@master>
 <d38fcbe5-8b4a-40bc-b8c8-1c49ccaa9964@kernel.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d38fcbe5-8b4a-40bc-b8c8-1c49ccaa9964@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Jan 19, 2026 at 11:18:52AM +0100, David Hildenbrand (Red Hat) wrote:
>On 1/1/26 03:07, Wei Yang wrote:
>> On Wed, Dec 31, 2025 at 05:52:57PM +0800, Qi Zheng wrote:
>> > 
>> > 
>> > On 12/31/25 5:42 PM, Wei Yang wrote:
>> > > On Wed, Dec 17, 2025 at 05:45:48PM +0800, Qi Zheng wrote:
>> > > > From: Qi Zheng <zhengqi.arch@bytedance.com>
>> > > > 
>> > > > The PT_RECLAIM can work on all architectures that support
>> > > > MMU_GATHER_RCU_TABLE_FREE, so make PT_RECLAIM depends on
>> > > > MMU_GATHER_RCU_TABLE_FREE.
>> > > > 
>> > > > BTW, change PT_RECLAIM to be enabled by default, since nobody should want
>> > > > to turn it off.
>> > > > 
>> > > > Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> > > > ---
>> > > > arch/x86/Kconfig | 1 -
>> > > > mm/Kconfig       | 9 ++-------
>> > > > 2 files changed, 2 insertions(+), 8 deletions(-)
>> > > > 
>> > > > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> > > > index 80527299f859a..0d22da56a71b0 100644
>> > > > --- a/arch/x86/Kconfig
>> > > > +++ b/arch/x86/Kconfig
>> > > > @@ -331,7 +331,6 @@ config X86
>> > > > 	select FUNCTION_ALIGNMENT_4B
>> > > > 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
>> > > > 	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
>> > > > -	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
>> > > > 	select ARCH_SUPPORTS_SCHED_SMT		if SMP
>> > > > 	select SCHED_SMT			if SMP
>> > > > 	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
>> > > > diff --git a/mm/Kconfig b/mm/Kconfig
>> > > > index bd0ea5454af82..fc00b429b7129 100644
>> > > > --- a/mm/Kconfig
>> > > > +++ b/mm/Kconfig
>> > > > @@ -1447,14 +1447,9 @@ config ARCH_HAS_USER_SHADOW_STACK
>> > > > 	  The architecture has hardware support for userspace shadow call
>> > > >             stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>> > > > 
>> > > > -config ARCH_SUPPORTS_PT_RECLAIM
>> > > > -	def_bool n
>> > > > -
>> > > > config PT_RECLAIM
>> > > > -	bool "reclaim empty user page table pages"
>> > > > -	default y
>> > > > -	depends on ARCH_SUPPORTS_PT_RECLAIM && MMU && SMP
>> > > > -	select MMU_GATHER_RCU_TABLE_FREE
>> > > > +	def_bool y
>> > > > +	depends on MMU_GATHER_RCU_TABLE_FREE
>> > > > 	help
>> > > > 	  Try to reclaim empty user page table pages in paths other than munmap
>> > > > 	  and exit_mmap path.
>> > > 
>> > > Hi, Qi
>> > > 
>> > > I am new to PT_RECLAIM, when reading related code I got one question.
>> > > 
>> > > Before this patch,  we could have this config combination:
>> > > 
>> > >       CONFIG_MMU_GATHER_RCU_TABLE_FREE & !CONFIG_PT_RECLAIM
>> > > 
>> > > This means tlb_remove_table_free() is rcu version while tlb_remove_table_one()
>> > > is semi rcu version.
>> > > 
>> > > I am curious could we use rcu version tlb_remove_table_one() for this case?
>> > > Use rcu version tlb_remove_table_one() if CONFIG_MMU_GATHER_RCU_TABLE_FREE. Is
>> > > there some limitation here?
>> > 
>> > I think there's no problem. The rcu version can also ensure that the
>> > fast GUP works well.
>> > 
>> 
>> Thanks for your quick response :-)
>> 
>> And Happy New Year
>> 
>> So my little suggestion is move the definition of __tlb_remove_table_one()
>> under CONFIG_MMU_GATHER_RCU_TABLE_FREE. Do you thinks this would be more
>> clear?
>
>
>Do you mean
>
>diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
>index 2faa23d7f8d42..6aeba4bae68d2 100644
>--- a/mm/mmu_gather.c
>+++ b/mm/mmu_gather.c
>@@ -319,7 +319,7 @@ static inline void tlb_table_invalidate(struct mmu_gather
>*tlb)
>        }
> }
>
>-#ifdef CONFIG_PT_RECLAIM
>+#ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
> static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
> {
>        struct ptdesc *ptdesc;
>
>?

Sorry for the late reply.

Yes, and maybe we can move the definition to the 
#ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE code block above, then to be next to
tlb_remove_table_free().

So that we always have rcu version when CONFIG_MMU_GATHER_RCU_TABLE_FREE.

>
>-- 
>Cheers
>
>David

-- 
Wei Yang
Help you, Help me
