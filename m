Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66314275869
	for <linux-alpha@vger.kernel.org>; Thu,  5 Jun 2025 18:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749147161; cv=none; b=KUpLTpSfvDiIinfwzCpI9PWSZjWPFW53b5R3/ONMAaT/QycvOpZH+WVyKC5NZRKoy1+198rLBvfutA7QHnkHtECMtyYNCLf/9utY/JKl3gQMI3zNKBECClDHNkqzROAIJVDQ+VYZYIu7J4tBRuhuhh2Oomlv3i9bC3/b+8V8yxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749147161; c=relaxed/simple;
	bh=XDLLiKupQrcqC7fIIkjWUPuhFLp8mbzNmHHgA6QU4sU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQygIfIYRs7Sgoj3tdhEqHCHUnndwA3CPxbbZZV0cuIraPcEE8yWU+t/XUYop1dkOI9xtQA274fmm79eouD1UmlxcDdfQfPLJMa52PaBj8aKTJrvYoxczkZKS07x8JRrNe55JnlHlFxwrL61oOvy5lEc/K0Xr1vGZrQ1mT5OzIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ehRWKKgN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ehRWKKgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749147158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=132dNq4r2Fz456vQcwRaqcjCeWZFG9ABMLOdYfWsS9I=;
	b=ehRWKKgNe0i9Toi4P2t0rHd1xxpEapVGhmdlO2QoXOimHZ6PuH/N3dVgqKYCczV35wTcQ7
	INdhn1J2cNFSX7uVUUFOz9UWoBaaAJ3jUUoI4yPHc9sW3c5lG3aBIhaFIWXluhnTW5fcJU
	p5ntkl9zuEKHc8APnE71sGBryEM+pX4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42--fx374khPw-hBJgE2dsTXQ-1; Thu, 05 Jun 2025 14:12:35 -0400
X-MC-Unique: -fx374khPw-hBJgE2dsTXQ-1
X-Mimecast-MFC-AGG-ID: -fx374khPw-hBJgE2dsTXQ_1749147154
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4517abcba41so7322405e9.0
        for <linux-alpha@vger.kernel.org>; Thu, 05 Jun 2025 11:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749147154; x=1749751954;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=132dNq4r2Fz456vQcwRaqcjCeWZFG9ABMLOdYfWsS9I=;
        b=c0bHRQrmySNq7ebC5W1Gs6pcLvPbvxJoLxXPPV8ZdNESzrLhkCUDQNJBvxPH/QqTwb
         V8z3ptB/cUO+mRjVCiTHgBbhtxieujNs07qULDQeCzotnDs0WGBYLmAwoWk8W66+6P4B
         qp/z+1g5S/2ExUG5lrMtwNPRg9RC1uhg3KMgdCxs8unqmC6i/XKLByAnjwZbvZ9f59LH
         8oUHE06wIq50oaf/RBSMZQFCkuI3+n/tEg1ButHbnQ2U/FoQ4vEczs6r6yZ7l/Bj70IB
         52yRMPMfpjfJWOegVbXJOEJ/cwDx0UQ9NMmdPuWyVGbfnu+2I+nxI5WHsY65+san1vYf
         VBQQ==
X-Gm-Message-State: AOJu0YwuCLn/Emk5TyayL6TET/KkzsV8PjhjD2O1ONhX2J7PLmr4UXbn
	T2hfvKJc0V3iKo+0M1aC0DpT6Aoak60aCWpVEGCTVvMfXDZgPibZtStaLJ29i52sHQaMQSUgoAg
	anae68h0qsBoZ3iWiwLzhu6xwDWva2jPLEMS75KnVLcpEj/x9cdBPehbWCHQKWDlt9oOGUvM2X6
	U=
X-Gm-Gg: ASbGncuH4Kj/GULQmgSiobsFW77MKc7V6pUMfKcK7KKTLkVaNbzKGw0P485ten/DEGF
	H5VLGkswccRgySGd3arYyHSHk80BFCzAjVDAV3EPkBbo3BqY03zAoegpyGIyOTS7tmhfz8CLvHX
	ln+QrQ8S/jfhF3zxghArocNNN9e8f+pax2GQVUU8ISvJSA/xrvp88Spfhep3mGLbJBDl39eVzPx
	0yHvXXoUKt27GNKKx2LshVI3pO/BhE9E17xb4kO84LCFxP279n3GT6DCYgFPcv2qWVQ+CS3fcpZ
	I91/DfYVy3yxfKS6v8weAF/rdkyA+oa+n5UVZaRlqDxilkZChGFNyQ==
X-Received: by 2002:a05:600c:8b55:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-452012b32cdmr4729545e9.0.1749147154233;
        Thu, 05 Jun 2025 11:12:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFQt59mP6apkd/yuRPFFAdHyBfQShQXdBAmgMMPOpD4KVZa5P0jyN/7/0yB64gf4+o1NkYoQ==
X-Received: by 2002:a05:600c:8b55:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-452012b32cdmr4729185e9.0.1749147153796;
        Thu, 05 Jun 2025 11:12:33 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-42-50-214.web.vodafone.de. [109.42.50.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009758esm25308112f8f.75.2025.06.05.11.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 11:12:33 -0700 (PDT)
Message-ID: <13f251d8-658b-430d-aef6-ec2bfa719f32@redhat.com>
Date: Thu, 5 Jun 2025 20:12:31 +0200
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/41] alpha: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 the alpha headers
To: Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
References: <20250314071013.1575167-1-thuth@redhat.com>
 <20250314071013.1575167-4-thuth@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250314071013.1575167-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/03/2025 08.09, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize on
> the __ASSEMBLER__ macro that is provided by the compilers now.
> 
> This is a completely mechanical patch (done with a simple "sed -i"
> statement).
> 
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   arch/alpha/include/asm/console.h     | 4 ++--
>   arch/alpha/include/asm/page.h        | 4 ++--
>   arch/alpha/include/asm/pal.h         | 4 ++--
>   arch/alpha/include/asm/thread_info.h | 8 ++++----
>   4 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/console.h b/arch/alpha/include/asm/console.h
> index 088b7b9eb15ae..1cabdb6064bbe 100644
> --- a/arch/alpha/include/asm/console.h
> +++ b/arch/alpha/include/asm/console.h
> @@ -4,7 +4,7 @@
>   
>   #include <uapi/asm/console.h>
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   extern long callback_puts(long unit, const char *s, long length);
>   extern long callback_getc(long unit);
>   extern long callback_open_console(void);
> @@ -26,5 +26,5 @@ struct crb_struct;
>   struct hwrpb_struct;
>   extern int callback_init_done;
>   extern void * callback_init(void *);
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   #endif /* __AXP_CONSOLE_H */
> diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.h
> index 5ec4c77e432e0..d2c6667d73e9e 100644
> --- a/arch/alpha/include/asm/page.h
> +++ b/arch/alpha/include/asm/page.h
> @@ -6,7 +6,7 @@
>   #include <asm/pal.h>
>   #include <vdso/page.h>
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #define STRICT_MM_TYPECHECKS
>   
> @@ -74,7 +74,7 @@ typedef struct page *pgtable_t;
>   #define PAGE_OFFSET		0xfffffc0000000000
>   #endif
>   
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>   
>   #define __pa(x)			((unsigned long) (x) - PAGE_OFFSET)
>   #define __va(x)			((void *)((unsigned long) (x) + PAGE_OFFSET))
> diff --git a/arch/alpha/include/asm/pal.h b/arch/alpha/include/asm/pal.h
> index db2b3b18b34c7..799a64c051984 100644
> --- a/arch/alpha/include/asm/pal.h
> +++ b/arch/alpha/include/asm/pal.h
> @@ -4,7 +4,7 @@
>   
>   #include <uapi/asm/pal.h>
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   extern void halt(void) __attribute__((noreturn));
>   #define __halt() __asm__ __volatile__ ("call_pal %0 #halt" : : "i" (PAL_halt))
> @@ -183,5 +183,5 @@ qemu_get_vmtime(void)
>   	return v0;
>   }
>   
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>   #endif /* __ALPHA_PAL_H */
> diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
> index 4a4d00b37986e..98ccbca64984c 100644
> --- a/arch/alpha/include/asm/thread_info.h
> +++ b/arch/alpha/include/asm/thread_info.h
> @@ -4,14 +4,14 @@
>   
>   #ifdef __KERNEL__
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   #include <asm/processor.h>
>   #include <asm/types.h>
>   #include <asm/hwrpb.h>
>   #include <asm/sysinfo.h>
>   #endif
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   struct thread_info {
>   	struct pcb_struct	pcb;		/* palcode state */
>   
> @@ -44,7 +44,7 @@ register struct thread_info *__current_thread_info __asm__("$8");
>   
>   register unsigned long *current_stack_pointer __asm__ ("$30");
>   
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   
>   /* Thread information allocation.  */
>   #define THREAD_SIZE_ORDER 1
> @@ -110,7 +110,7 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
>   	put_user(res, (int __user *)(value));				\
>   	})
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   extern void __save_fpu(void);
>   
>   static inline void save_fpu(void)

Friendly ping!

Richard, Matt, could you maybe pick this up via your alpha tree? (x86 and 
parisc already got merge via their respective architecture trees, so I guess 
the same should happen for this patch here, too).

  Thanks,
   Thomas

