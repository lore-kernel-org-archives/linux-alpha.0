Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599768;
	b=AY8cncsfFLtZrs057YmTi1LVKVL7tbBh+0itGk3zgAHWfM3uUy/2Ckk28xenVCO6ORuH
	 mA66X7agxM+J6+qc2IKecLPwMoWlP9CQ7174w+E3WP/sDyh5DMQUp3DdIihiFoAj3j894
	 YUCNXLt4ofW/cxcxbAL4oZaVZ3nrMzzskO4uDQD3sC1iDFc5P6NjXAVlkeGxZpfo5yFyi
	 93aQ4qlmmEx9WkxZXN76JmqUg2SyH+dkMesJNO3G6Qj90mZs+DNustsWADyyJaYkZ1jjS
	 eMWeINLFhDFtmLZk0GdxWqjs/yb9R58yLguyLdNF7G04vjMud0wHTtOxH/ccka66W/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599768;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IYzxrdxB6QZ0WZq97fRAoxslmFNvUVJkMtc4FLhOjLU=;
	b=K+3qNYVlGvr4HWP5O1iWesYbZ+OMez7/NTHccBRmDm96Zev7COm9dwqC1Lxz/bQEAHmr
	 FdP+3BsptXORdoa0jnyFZ1RyXNBlcbZQlXDOYntXLMeZ5r43q5TDAZsie8xDKeqp0CGfs
	 hmAmN40kQUWqgy8htAre0f7/2PzbUnlD1Jo7wMU4P4VBkRCOjU8GDMebrUyC1EZ6uQdLY
	 +/DJlhw4nvnslASFNeX3LbfLEC64Be7Gxtr/2/NzcJpBpNKNPxMGqhw8t7a8dggmI58/2
	 aZ25NGyCtBF85G3YI8ea+jGJglTQqWFQfRtmtH9pw3kB/DWEBkisqCxGFzQgNKTLOtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A17b7TL9;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=j9fNUdNQ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1EB60A2603
	for <linux-alpha@vger.kernel.org>; Fri, 13 Nov 2026 19:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A1EB60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A17b7TL9;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=j9fNUdNQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794599765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IYzxrdxB6QZ0WZq97fRAoxslmFNvUVJkMtc4FLhOjLU=;
	b=A17b7TL9dS62FMwaBhLPU1WmVYEsWZVsqb35LJmzpW7OYxJ0aV+/irehG1rgQKVSZlE6Si
	r4ztnCawDXwI+L9DxylX17KMRrSNjliqzcskqf5DmFzsO+VSR6r93tdNyVgTHy9xepVSpi
	/Sm8netbJalGHdU3z0zBnbsYs6xaboI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-IScHmfGaPQeI4TjUotWRoQ-1; Fri, 13 Nov 2026 14:56:04 -0500
X-MC-Unique: IScHmfGaPQeI4TjUotWRoQ-1
X-Mimecast-MFC-AGG-ID: IScHmfGaPQeI4TjUotWRoQ_1794599763
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49febef74e3so12255695e9.0
        for <linux-alpha@vger.kernel.org>; Fri, 13 Nov 2026 11:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794599763; x=1795204563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYzxrdxB6QZ0WZq97fRAoxslmFNvUVJkMtc4FLhOjLU=;
        b=j9fNUdNQY+Dpo927hL8NG8vN0L2tprIMIEaYpY1auSSv4ZXNUyfdpSOidUEAF+bYIZ
         tXuX5QNB8L2NWzlIlmCVYnmitfICbcUiyk/kJAxw6BRZeJ92N1+aDVC+Fkkwib0yuAGp
         5cLZ1VnZy7HydpydIKrln7WJvo6av1OeajgclpfwW3vOIXrYpGOMh8+7Fj0zhBdioLjx
         0E2vkZuIr6FZdK2imkzaOy9+/gBw9OfbHawHpDMJFQfX56Vklgf8yGkc/+W5AtFx27oH
         sARDQXczyJBl3DRnXcHL5NU/Ngwp8cg1gySNg63ZrVPFUpUt16gdoJjr1c5q8S29wlIA
         s7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599763; x=1795204563;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYzxrdxB6QZ0WZq97fRAoxslmFNvUVJkMtc4FLhOjLU=;
        b=Zq+Vw5MkEk4Jk8ccftFPOF0L8Y3B6+oZYaSCd6QLf32Bhwr08ic6BPbfRjvmr2V57y
         6P2t6hmd2zGZqmNtiYaYI7RygC9ktsQUConxicuRY5fGHEPsRYCx/gAeM1/uVGHmGyKC
         ovowtfAjW7M8TrwBXVyL7wW6wkKR1MGaFsuXDv31+nrrXwshPpGNCuhXDgiQhrnM8bNZ
         SEsPj8BIl9P6aVD1Bqlp/IVdQQfPdLbobHyEjmbwJznILDQFuP3UP9jQaNzEswKaib47
         wrFY+s/jsSxIJnTlSKd4i2JSeHbixjikwTGIw3MDCE2Jy57QGreBL5e+YofdOFjm5Cm/
         e3Mw==
X-Gm-Message-State: APuU4Z+P4Xo8mi80c8VgS1I/lelvRVFzzAmT+SElcYjUkrph+5iJbth5
	+AcU3/NDz8BS7KZlOL4wqM+z5AlLrdONXJ8XCyKTp72UQ5q9hHtTpdTVz3HqMtfK+i9/q8Uo/hK
	3aHVdgfmNl4UYUsESAoMsiSqF0uOJfcEXWTBrxaSyhVSq1yEsPAZWL/bxwzXOuzeI
X-Gm-Gg: AYBFou0aoIlNj5DkqBKelW1wd162ilaUfA2W/72TqlM5m2RNLsmVPD7qDtNJugD/Ag8
	5WkRlYfdvys9HHmpW4AZcadVt8CinXTfgn07tPS3QRXYQXIXc++9vZh/ybnRPe63xEHdBM4pMHg
	PP/w4fRJaAtYgOV7vuAjaiy2ertGruJtXOqfbLYJRc7pN56SscOuUJL1TVYIjADvZeeXTSzuVRl
	XzfKjXnBuzi2XvBwGh8L8piY7QiCn0E/nKqllMKH4s4/CRu5oHwN7wEADhVxcCKAis7z3D3n8R3
	rni5JK6rX8iWpTZydxwF2cx+I26mMl2ej4ie3t5daSAvzz3PCrj84gOkvJSCobqnIULmmAUiWOt
	nkQKufPo8/PjAa404UxblCDmxqQqDw3nrob2CKCC/1Tf3
X-Received: by 2002:a05:600c:354a:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb55a61152mr79579245e9.5.1794599762833;
        Fri, 13 Nov 2026 11:56:02 -0800 (PST)
X-Received: by 2002:a05:600c:354a:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb55a61152mr79579015e9.5.1794599762435;
        Fri, 13 Nov 2026 11:56:02 -0800 (PST)
Received: from [192.168.0.9] ([47.64.115.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5b4a3fcdsm49435525e9.0.2026.11.13.11.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:56:01 -0800 (PST)
Message-ID: <1125f201-ec86-4139-98a0-fef8e8efe6b4@redhat.com>
Date: Fri, 13 Nov 2026 20:55:59 +0100
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] alpha: Use symbol assignment in SYM_END
To: Linus Walleij <linusw@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
References: <20261103-alpha-compile-v1-1-9e93e2260a9f@kernel.org>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20261103-alpha-compile-v1-1-9e93e2260a9f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 03.11.26 um 10:09 schrieb Linus Walleij:
> Alpha uses the .set directive to select assembler options, so the
> symbol assignment emitted by the generic SYM_END macro fails to assemble.
> This breaks COMPILE_TEST builds left and right, e.g.:
> 
>    Error: junk at end of line, first unrecognized character is `,'
>    Error: .size expression for bcm6846_runner_start does not evaluate to a constant
> 
> Override SYM_END to use an ordinary symbol assignment for the calculated
> size. Preserve the symbol type, size and local size symbol while leaving
> other architectures unchanged.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611031620.n4ptlpo7-lkp@intel.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> The generic SYM_END uses .set for symbol assignment, but Alpha interprets
> .set as an assembler mode directive. Provide an Alpha override using
> ordinary assignment.
> 
> Tested the unchanged Runner wrapper with an Alpha-targeted GNU assembler
> 2.46.1: the original header reproduces the reported errors, while the
> fixed header assembles without warnings. Symbol sizes and the embedded
> Runner bytes were checked. A full Alpha allyesconfig build was not run.
> 
> This patch was prepared with LLM assistance.
> ---
>   arch/alpha/include/asm/linkage.h | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/alpha/include/asm/linkage.h b/arch/alpha/include/asm/linkage.h
> index aa8661fa60dc..a3f0302c92d0 100644
> --- a/arch/alpha/include/asm/linkage.h
> +++ b/arch/alpha/include/asm/linkage.h
> @@ -6,4 +6,12 @@
>   #define SYSCALL_ALIAS(alias, name)					\
>   	asm ( #alias " = " #name "\n\t.globl " #alias)
>   
> +#ifdef __ASSEMBLY__

I'm currently trying to convert all __ASSEMBLY__ statements into __ASSEMBLER__:

  https://lore.kernel.org/all/20261023064908.66707-1-thuth@redhat.com/

Could you please use __ASSEMBLER__ here, too?

  Thanks,
   Thomas


> +/* Alpha uses .set for assembler options, not symbol assignments. */
> +#define SYM_END(name, sym_type)				\
> +	.type name sym_type ASM_NL			\
> +	.L__sym_size_##name = . - name ASM_NL		\
> +	.size name, .L__sym_size_##name
> +#endif
> +
>   #endif
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-alpha-compile-efdde587115c
> 
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>

