Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9337241695
	for <linux-alpha@vger.kernel.org>; Wed, 30 Jul 2025 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859742; cv=none; b=qe6h9qpQdOdCLCzY2RDZ9HDt2XhZlTgp/SSCF87t+wN3pD/RsSsDJ6kYnsnUFP1G9Z13u/syEiC0qokHNDx5Dpp7R7Mnr+1/9+Guv729VtyIJ+YgvrzUPzr2VKAT9S0P2EdJ3hA6gvDinw9Rpgfc3PrUavsxhxHNadxtpR6mx/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859742; c=relaxed/simple;
	bh=8qsJx9tXybm6+3dNd5CcmAw7IicSGVwSqj3i1CCjsq8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pQ5rdj+K76BJckaLZ4868Ca+C26/O7F5a0GUfBt1ro0Zc2X7h9ZOFuVATiddwD4aRXjQz+A3FYpC28uKe1BJt97dFacUkEb1h9jv/TvISz5lf3ruzDBH+fQ4mXLR1CAkMdWOzZ0RJOQh073Q+1jADdo5TftNBoy81rrjaLhsTv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XB1sE2Nz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XB1sE2Nz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753859737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=r7cfkuliN+TnJM2MkGpax0zIKscrtbBRrJkW2PJ/iug=;
	b=XB1sE2NzYFlVs3nmEy7xVu3vmUsEHRthDBxnDDq0+of4cVvywdEsgo5C6O9EhPsqGcgD+v
	1FDo6bpoGfEc5fRGgHkbcC4FqV5pdxWPkstbeBX9BnXO1/CGXch5tH8/wFqJnuUgnOAkPD
	dZ9y6/kUCr3dETHx8nWvwhEcHRG8cMs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-S26wEm0TP62gwqsTKPfHFw-1; Wed, 30 Jul 2025 03:15:36 -0400
X-MC-Unique: S26wEm0TP62gwqsTKPfHFw-1
X-Mimecast-MFC-AGG-ID: S26wEm0TP62gwqsTKPfHFw_1753859735
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3b604541741so3925720f8f.3
        for <linux-alpha@vger.kernel.org>; Wed, 30 Jul 2025 00:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753859735; x=1754464535;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7cfkuliN+TnJM2MkGpax0zIKscrtbBRrJkW2PJ/iug=;
        b=RhMGLPYpDOn2U4Rs3Zm606omNc10CpeGLn5DDB5d1OnwNDxyHkZ+3qPaPP+EYfn5HH
         PtDV9GNBEzE2e5xWy7/I8nsqw1Aw6vQYDJYeQFJ+0O9kzO1eMXLOvsshPPFb3n5a0aes
         vcn6/ljUOEOfM7OAGdle/7/n1mkqVosfQEB/Ci69tJdMbJ3ywHo99aeWfkDmTy/dpq5q
         uVD5pT4HsXEfxmV2ee8qbj95jbJSkQgwEbE9EjR0kzWffLlKuMwgetAxGVBwhADUOYzk
         b9ingBLMVAlRu0jC40n3nP8T9nCpTujNWKzjqc53sLdrsWODY/C6idIvRgMjEVNecsHu
         n6KA==
X-Gm-Message-State: AOJu0Yx84mBkYpN9EdhNhxXRp+sbr6q+3FjshO46HopQI3RZl5Gkezed
	flJhdWK8TDDwq4dVmvYt7q8E6TnHfoWsvL1I1cqknIQhU4YacukH2PYTn4y2EcFSHmp4fXtqtDx
	Izj1z62jr/iOkTc8nx9+igRFupWYji7ALDrL4KYD9RaSaXsusa1+OYPzVpV9Oevcp
X-Gm-Gg: ASbGnctTjOqH11+Ki7uF5NX+5D5xzLsgjRFGCk16jUwSOI+4Gl2uf0S1sQyHC19fszB
	NRN5tDoPBlt4lEMYby2BYjdV0s8N5KgLclXxioxSAgpIU/jshQ/uy2jzIT/7R4KuZflbL4UlcKZ
	rJZON0nfKgHW+bUy50lMusN/cbRaKxLLY92YcAOF2dRaToo6Zkr86okPr+L0y1Ph3UwEKClvsLg
	5tvv5VbAQwlLiYu1wpXCfRmQo4G3bLy2xeDKXWmOCoPCcp+CAOcHii5DRyBYqAvuN0L5dXsc9BM
	QwCUSotsn3y9aHxfsd0+SQlx1aD0FnxVY87LOeuC8ATPW7px9fjBocYEDK21vPfBIGzVIZ/SpEA
	am5A=
X-Received: by 2002:a05:6000:2f85:b0:3a5:2694:d75f with SMTP id ffacd0b85a97d-3b79501df77mr1776142f8f.52.1753859734669;
        Wed, 30 Jul 2025 00:15:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkU+mNcaretyOJCOLMgbrL91jxvh2uHTrwR3e/6sgbzCUSDwzL/bXYPfuiOXJ5as2et92Gpw==
X-Received: by 2002:a05:6000:2f85:b0:3a5:2694:d75f with SMTP id ffacd0b85a97d-3b79501df77mr1776125f8f.52.1753859734210;
        Wed, 30 Jul 2025 00:15:34 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-115-093.pools.arcor-ip.net. [47.64.115.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778ec0e05sm14345010f8f.35.2025.07.30.00.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 00:15:33 -0700 (PDT)
Message-ID: <59e13aef-faab-4efd-bb42-d7d48505c28e@redhat.com>
Date: Wed, 30 Jul 2025 09:15:31 +0200
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/41] alpha: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 the alpha headers
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
References: <20250314071013.1575167-1-thuth@redhat.com>
 <20250314071013.1575167-4-thuth@redhat.com>
 <13f251d8-658b-430d-aef6-ec2bfa719f32@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <13f251d8-658b-430d-aef6-ec2bfa719f32@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/06/2025 20.12, Thomas Huth wrote:
> On 14/03/2025 08.09, Thomas Huth wrote:
>> While the GCC and Clang compilers already define __ASSEMBLER__
>> automatically when compiling assembly code, __ASSEMBLY__ is a
>> macro that only gets defined by the Makefiles in the kernel.
>> This can be very confusing when switching between userspace
>> and kernelspace coding, or when dealing with uapi headers that
>> rather should use __ASSEMBLER__ instead. So let's standardize on
>> the __ASSEMBLER__ macro that is provided by the compilers now.
>>
>> This is a completely mechanical patch (done with a simple "sed -i"
>> statement).
>>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Matt Turner <mattst88@gmail.com>
>> Cc: linux-alpha@vger.kernel.org
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   arch/alpha/include/asm/console.h     | 4 ++--
>>   arch/alpha/include/asm/page.h        | 4 ++--
>>   arch/alpha/include/asm/pal.h         | 4 ++--
>>   arch/alpha/include/asm/thread_info.h | 8 ++++----
>>   4 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/alpha/include/asm/console.h b/arch/alpha/include/asm/ 
>> console.h
>> index 088b7b9eb15ae..1cabdb6064bbe 100644
>> --- a/arch/alpha/include/asm/console.h
>> +++ b/arch/alpha/include/asm/console.h
>> @@ -4,7 +4,7 @@
>>   #include <uapi/asm/console.h>
>> -#ifndef __ASSEMBLY__
>> +#ifndef __ASSEMBLER__
>>   extern long callback_puts(long unit, const char *s, long length);
>>   extern long callback_getc(long unit);
>>   extern long callback_open_console(void);
>> @@ -26,5 +26,5 @@ struct crb_struct;
>>   struct hwrpb_struct;
>>   extern int callback_init_done;
>>   extern void * callback_init(void *);
>> -#endif /* __ASSEMBLY__ */
>> +#endif /* __ASSEMBLER__ */
>>   #endif /* __AXP_CONSOLE_H */
>> diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.h
>> index 5ec4c77e432e0..d2c6667d73e9e 100644
>> --- a/arch/alpha/include/asm/page.h
>> +++ b/arch/alpha/include/asm/page.h
>> @@ -6,7 +6,7 @@
>>   #include <asm/pal.h>
>>   #include <vdso/page.h>
>> -#ifndef __ASSEMBLY__
>> +#ifndef __ASSEMBLER__
>>   #define STRICT_MM_TYPECHECKS
>> @@ -74,7 +74,7 @@ typedef struct page *pgtable_t;
>>   #define PAGE_OFFSET        0xfffffc0000000000
>>   #endif
>> -#endif /* !__ASSEMBLY__ */
>> +#endif /* !__ASSEMBLER__ */
>>   #define __pa(x)            ((unsigned long) (x) - PAGE_OFFSET)
>>   #define __va(x)            ((void *)((unsigned long) (x) + PAGE_OFFSET))
>> diff --git a/arch/alpha/include/asm/pal.h b/arch/alpha/include/asm/pal.h
>> index db2b3b18b34c7..799a64c051984 100644
>> --- a/arch/alpha/include/asm/pal.h
>> +++ b/arch/alpha/include/asm/pal.h
>> @@ -4,7 +4,7 @@
>>   #include <uapi/asm/pal.h>
>> -#ifndef __ASSEMBLY__
>> +#ifndef __ASSEMBLER__
>>   extern void halt(void) __attribute__((noreturn));
>>   #define __halt() __asm__ __volatile__ ("call_pal %0 #halt" : : 
>> "i" (PAL_halt))
>> @@ -183,5 +183,5 @@ qemu_get_vmtime(void)
>>       return v0;
>>   }
>> -#endif /* !__ASSEMBLY__ */
>> +#endif /* !__ASSEMBLER__ */
>>   #endif /* __ALPHA_PAL_H */
>> diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/ 
>> asm/thread_info.h
>> index 4a4d00b37986e..98ccbca64984c 100644
>> --- a/arch/alpha/include/asm/thread_info.h
>> +++ b/arch/alpha/include/asm/thread_info.h
>> @@ -4,14 +4,14 @@
>>   #ifdef __KERNEL__
>> -#ifndef __ASSEMBLY__
>> +#ifndef __ASSEMBLER__
>>   #include <asm/processor.h>
>>   #include <asm/types.h>
>>   #include <asm/hwrpb.h>
>>   #include <asm/sysinfo.h>
>>   #endif
>> -#ifndef __ASSEMBLY__
>> +#ifndef __ASSEMBLER__
>>   struct thread_info {
>>       struct pcb_struct    pcb;        /* palcode state */
>> @@ -44,7 +44,7 @@ register struct thread_info *__current_thread_info 
>> __asm__("$8");
>>   register unsigned long *current_stack_pointer __asm__ ("$30");
>> -#endif /* __ASSEMBLY__ */
>> +#endif /* __ASSEMBLER__ */
>>   /* Thread information allocation.  */
>>   #define THREAD_SIZE_ORDER 1
>> @@ -110,7 +110,7 @@ register unsigned long *current_stack_pointer __asm__ 
>> ("$30");
>>       put_user(res, (int __user *)(value));                \
>>       })
>> -#ifndef __ASSEMBLY__
>> +#ifndef __ASSEMBLER__
>>   extern void __save_fpu(void);
>>   static inline void save_fpu(void)
> 
> Friendly ping!
> 
> Richard, Matt, could you maybe pick this up via your alpha tree? (x86 and 
> parisc already got merge via their respective architecture trees, so I guess 
> the same should happen for this patch here, too).

Ping^2! Any chance that you could pick this up for Linux v6.17 ?

  Thanks,
   Thomas

