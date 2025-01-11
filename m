Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC401CD2C
	for <linux-alpha@vger.kernel.org>; Sat, 11 Jan 2025 01:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736558238; cv=none; b=StbSua95P+Zb4XaocL9n1T+MTjO2gy2N4gWZr+eMEfKlDWXjJVMY4QJcgpRs1tHffH2gWGSeNc5CjmiSxzRhniUdVcPo1HUh8ezZo2LRhr1gi9QYM7GZ6rZ5mH2KyrKuHAiDH/xH807y5HHnMgr1X7vJeIVZsBH59/8xLYfz+3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736558238; c=relaxed/simple;
	bh=us44Uygq0YE3AaMfTOW5lXn8dsrshZ2hNa6WOsLiaUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMOTMJ4IIbh4P0qucreKL7vHDOuX4BJZDFfA+/rx8zmjQSxRuwWSzJu9UKPz3fxuFs3y5Uq5qtVqmdCm3YxrxYxBu1W5LIkcA/rexZoqowsNo2PICVnW26dEAHk+lmEJRcP8AM/Wk2iUQwq8EBsAZ5nx6MK+RGc9PgQ10DWYNus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HgPn4wdM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HgPn4wdM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2166651f752so56456475ad.3
        for <linux-alpha@vger.kernel.org>; Fri, 10 Jan 2025 17:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736558236; x=1737163036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oFDqME3Q1nThGD1k29pkHgYDyzcQcez3iTxF/87K9DM=;
        b=HgPn4wdM2BM4EU4P6Vkd6zGlx51RaNo+3o9EWWqpCtcB2Or6UfC3djSanTjnpoHWBv
         1IuZUUShPCjGTiv7Z9ypycYhXpZJ0S96zzCYNAjXeQaRs3aHxFH+hawqiAVEQd8smEt1
         52ovFmWEH68ogR1O29MZguS+GpFrdvVPHWAMsnO7f2iAmMTm3R03Qwno48omHwsq/NLC
         FwzJ0UmmF9FB6ZVDL1vcSP/O1wfd7ioHjfNqDJDKFFvu3fpaS5ZsdHKiYmEIphIDYyUg
         I3rqb2UZPtoB/auPDSvU23/8rQ5cLZJi/mJ5/Ta7OBka9pXC6NuVJLfiQJzu7rv6Gr2s
         1nYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736558236; x=1737163036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFDqME3Q1nThGD1k29pkHgYDyzcQcez3iTxF/87K9DM=;
        b=tl0f8KFhP5UIOuOPKhAESv3u6hJQ37lqxQm8soAybN1fPLRhBXOUzfel494gB/CszU
         1AIMQ70fofpOtNW7XCxFdfbfggsfV2tvsedO39KDAF5yMpjamRchkqNrmSHZ+ijCKOnz
         LZzUPhtcGlQ2TEEvf1eCe04dvtiFkXd7m1fTE02CcBjHx6vY04clpD1/pCjp7nReVtmA
         x4JQ7dfKQm65m6oQDH10J26S72YdDsvDp2tZAqzwMBbdV9eBtLngNzTlRXAFhJ/SG3D/
         Up9a+bo60QF8FPvMTf1GGN9wO1cpBoBiXDn/MbaQ0onwwhADND/dIu+MGH0VFnooqJ1Z
         q5hA==
X-Forwarded-Encrypted: i=1; AJvYcCXWMrcVUTgME1cvp4ytSK+Z39LIbQc3In0SkCK+7CC0GLE7xxZkTyzS+ycDVBgyxDF8W9zYZUur9snA6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcHi6LSPXZw4q++mBwz4rNlGuhSSINTWG7DWMX0tkCHYCMmTPf
	SvyysMkfJs6NsZoIrQyu5NdQX41WNW9nN35Nfg8TqGFu5954yI5eRbfkYEWweaw=
X-Gm-Gg: ASbGnctrh2TwyK89GGN6suT7N+nt6ksDwilpKTM2u7rszasWpoGHj17NQEhYqTlJqBa
	WoX8c6XRPDCBfz0LaKtE5R+y1uIwsyHmUQTu4RKrDUfXKjMpl08Vcu1Cwk05/Nc/MOMOeW3It/J
	qq3UxCdjGTCdVuwY+n9EraGHb7pIg1Dsa+oI9kZusmafMb4fBaxK2Z+FjX2rcU77Bkcx0mxp9RU
	929IuEPwYwzbUYOyMUnGPqxmHFJ1CZwTvMDPEu+cVeCkRgXy35Ng6Qcn++9lJnGxn6oEHW0AasM
	sSfRcLWXxJ4soPRNaX2vZ7iv5EPE9jI=
X-Google-Smtp-Source: AGHT+IE452X910tVgFm5oJf0XtFxutdqQAAARDDjZaJsInDm3xqPn8tv471ky9X/6A5ID/0JjcVFfg==
X-Received: by 2002:a05:6a00:3913:b0:725:e309:7110 with SMTP id d2e1a72fcca58-72d21f1ab41mr18362201b3a.5.1736558236255;
        Fri, 10 Jan 2025 17:17:16 -0800 (PST)
Received: from [192.168.132.227] (76-14-228-138.or.wavecable.com. [76.14.228.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4056ac96sm2194946b3a.65.2025.01.10.17.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 17:17:15 -0800 (PST)
Message-ID: <4931d683-bebd-4617-ac55-f40f578f2e18@linaro.org>
Date: Fri, 10 Jan 2025 17:17:12 -0800
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] alpha/elf: Fix misc/setarch test of util-linux by
 removing 32bit support
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>,
 Kees Cook <kees@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-alpha@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>,
 Sam James <sam@gentoo.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Chris Hofstaedtler <zeha@debian.org>, util-linux@vger.kernel.org,
 linux-mips@vger.kernel.org, loongarch@lists.linux.dev
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
 <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
 <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
 <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
 <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
 <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
 <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/25 16:16, Eric W. Biederman wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes[1]:
> 
>> There was a Spec benchmark (I forget which) which was memory bound and ran
>> twice as fast with 32-bit pointers.
>>
>> I copied the idea from DEC to the ELF abi, but never did all the other work
>> to allow the toolchain to take advantage.
>>
>> Amusingly, a later Spec changed the benchmark data sets to not fit into a
>> 32-bit address space, specifically because of this.
>>
>> I expect one could delete the ELF bit and personality and no one would
>> notice. Not even the 10 remaining Alpha users.
> 
> In [2] it was pointed out that parts of setarch weren't working
> properly on alpha because it has it's own SET_PERSONALITY
> implementation.  In the discussion that followed Richard Henderson
> pointed out that the 32bit pointer support for alpha was never
> completed.
> 
> Fix this by removing alpha's 32bit pointer support.
> 
> As a bit of paranoia refuse to execute any alpha binaries that hafe
> the EF_ALPHA_32BIT flag set.  Just to fail explicitly in case someone
> somewhere has binaries that trying to use alpha's 32bit pointer
> support.
> 
> [1] https://lkml.kernel.org/r/CAFXwXrkgu=4Qn-v1PjnOR4SG0oUb9LSa0g6QXpBq4ttm52pJOQ@mail.gmail.com
> [2] https://lkml.kernel.org/r/20250103140148.370368-1-glaubitz@physik.fu-berlin.de
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>

Thanks for cleaning this up.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


> ---
>   arch/alpha/include/asm/elf.h       |  6 +-----
>   arch/alpha/include/asm/pgtable.h   |  2 +-
>   arch/alpha/include/asm/processor.h |  8 ++------
>   arch/alpha/kernel/osf_sys.c        | 11 ++---------
>   4 files changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/elf.h b/arch/alpha/include/asm/elf.h
> index 4d7c46f50382..50c82187e60e 100644
> --- a/arch/alpha/include/asm/elf.h
> +++ b/arch/alpha/include/asm/elf.h
> @@ -74,7 +74,7 @@ typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
>   /*
>    * This is used to ensure we don't load something for the wrong architecture.
>    */
> -#define elf_check_arch(x) ((x)->e_machine == EM_ALPHA)
> +#define elf_check_arch(x) (((x)->e_machine == EM_ALPHA) && !((x)->e_flags & EF_ALPHA_32BIT))
>   
>   /*
>    * These are used to set parameters in the core dumps.
> @@ -137,10 +137,6 @@ extern int dump_elf_task(elf_greg_t *dest, struct task_struct *task);
>   	: amask (AMASK_CIX) ? "ev6" : "ev67");	\
>   })
>   
> -#define SET_PERSONALITY(EX)					\
> -	set_personality(((EX).e_flags & EF_ALPHA_32BIT)		\
> -	   ? PER_LINUX_32BIT : PER_LINUX)
> -
>   extern int alpha_l1i_cacheshape;
>   extern int alpha_l1d_cacheshape;
>   extern int alpha_l2_cacheshape;
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
> index 635f0a5f5bbd..02e8817a8921 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -360,7 +360,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>   
>   extern void paging_init(void);
>   
> -/* We have our own get_unmapped_area to cope with ADDR_LIMIT_32BIT.  */
> +/* We have our own get_unmapped_area */
>   #define HAVE_ARCH_UNMAPPED_AREA
>   
>   #endif /* _ALPHA_PGTABLE_H */
> diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/processor.h
> index 55bb1c09fd39..5dce5518a211 100644
> --- a/arch/alpha/include/asm/processor.h
> +++ b/arch/alpha/include/asm/processor.h
> @@ -8,23 +8,19 @@
>   #ifndef __ASM_ALPHA_PROCESSOR_H
>   #define __ASM_ALPHA_PROCESSOR_H
>   
> -#include <linux/personality.h>	/* for ADDR_LIMIT_32BIT */
> -
>   /*
>    * We have a 42-bit user address space: 4TB user VM...
>    */
>   #define TASK_SIZE (0x40000000000UL)
>   
> -#define STACK_TOP \
> -  (current->personality & ADDR_LIMIT_32BIT ? 0x80000000 : 0x00120000000UL)
> +#define STACK_TOP (0x00120000000UL)
>   
>   #define STACK_TOP_MAX	0x00120000000UL
>   
>   /* This decides where the kernel will search for a free chunk of vm
>    * space during mmap's.
>    */
> -#define TASK_UNMAPPED_BASE \
> -  ((current->personality & ADDR_LIMIT_32BIT) ? 0x40000000 : TASK_SIZE / 2)
> +#define TASK_UNMAPPED_BASE (TASK_SIZE / 2)
>   
>   /* This is dead.  Everything has been moved to thread_info.  */
>   struct thread_struct { };
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index 86185021f75a..a08e8edef1a4 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -1210,8 +1210,7 @@ SYSCALL_DEFINE1(old_adjtimex, struct timex32 __user *, txc_p)
>   	return ret;
>   }
>   
> -/* Get an address range which is currently unmapped.  Similar to the
> -   generic version except that we know how to honor ADDR_LIMIT_32BIT.  */
> +/* Get an address range which is currently unmapped. */
>   
>   static unsigned long
>   arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
> @@ -1230,13 +1229,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
>   		       unsigned long len, unsigned long pgoff,
>   		       unsigned long flags, vm_flags_t vm_flags)
>   {
> -	unsigned long limit;
> -
> -	/* "32 bit" actually means 31 bit, since pointers sign extend.  */
> -	if (current->personality & ADDR_LIMIT_32BIT)
> -		limit = 0x80000000;
> -	else
> -		limit = TASK_SIZE;
> +	unsigned long limit = TASK_SIZE;
>   
>   	if (len > limit)
>   		return -ENOMEM;

