Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262FF19993F
	for <linux-alpha@vger.kernel.org>; Thu,  3 Oct 2024 14:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727966786; cv=none; b=bcfZhlfHb8BRADXF3X/cmAb5/IEuywndoJQVsOPGTqRECvMmqRJfM3taU65PbRLA40x2zeIrCG6uCWd02zBRb5Z2yqGoFEFNQQ84u5y3hLpKJGtYGD3O04pM+7+2hcGjA7zQQaOtyWygxXlUzmcoeeK1puALNtDsK2cRh8A2La0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727966786; c=relaxed/simple;
	bh=fQwcGRptCa9kgB5UpZHLtjKvuJo7svABcu9q/+NvTbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NXj9N2wdjXzajXQZociKkqJ+q5yxemlc7FHiW94NoCfxCywRTTVnWQn9QM/IOWsUAzD/3Rxg6GUMEDOkeWTF+2E3KUbQg/aUPIS5wYoUREH8WQwLmG4PEvDUQs3w3IymFFCBSvzNlEGbFYORN4jB/3K9Xf5EGF8P7jlvuDDSprY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RJRjkiy6; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RJRjkiy6"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7178df70f28so943663b3a.2
        for <linux-alpha@vger.kernel.org>; Thu, 03 Oct 2024 07:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727966783; x=1728571583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/wSFs2AZuVyV0WjazJSfQ5VVOaJNnI6A+XKfJwz8XRo=;
        b=RJRjkiy6wiYkDiLb0vROoiS6XPsHZCveefX15k+QH7k4hb64rCWMNgxFFp/34dlzdz
         6pjmu5QYEj2nv3EjUpsCLvfOK/PCplyMiQDf/z+G2waTI1x+jeKmnTeVoxkYqjRr2aHC
         OQmJqgS5nzXNxVuVWqTxoGIkSiBg2pK9tAKsXAa6YUiQvqbJWROLdOtX+VoUXc1CsBEb
         fODBgEdBAvICBIyBzjvv4YFO6drJsVLbYuotNaoRM4d/6oSLmiOd5ZkklaGfQWBesBlv
         MmP6B4S2hNLqb2kaeHmgzJLasbvjRBFH8GAiYOWSmtQtDwJO1yZWvg7bD8yxBas7+VFa
         DeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727966783; x=1728571583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/wSFs2AZuVyV0WjazJSfQ5VVOaJNnI6A+XKfJwz8XRo=;
        b=Mg0xHkPdHaL838Do5sbU153bIxTFmRgHpEu8p42kUVI/anokj6KOOffKnsgNtMxwsT
         gswQzGX25rLKHnvwQSZsoHDrj2rjUMURwlS1CktBl1O46e7s6wce24gO+/6yYv7gay4T
         3+cwOMAfM2DYNSsQebW5YPZ5XV7dJtoKKR+mEJyeTri6Fus67xil4+EZL3SHdizcMsqd
         aK4be4KXrF2F6d0+muFtFf+S5KNplwXQ4EqLp1G9cidU/YDGZYpnLKPbCCJfzRqA9ntS
         wTVEB3BlrGEIW7dDE5/0wn7pUdc8eFF5uv/oWeiDVkQNJcAxOmADMCPITWeVy0srLvyZ
         r7Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVlTQZNwgMA8EfSd1ogYVMVGcGl2b9CWVstaCbBJHYODYzi7yHhIe6c0bCT7fL+qB1ar1ddkiUCkQZ5Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJh+bNnKOcRO5Ml9udndomm1EAkrfgGRTWRM+qoO6OzZc/sRLH
	uFgx0sxoZauixwtlTcYbjI6rd3C5s98YQ4JpnVJyi2u/zU11Pzs4u4+AGXBVlMU=
X-Google-Smtp-Source: AGHT+IFqtXWr7EWblGmxV8DoVUC/E8p3CDxEuCfrxe9bestz3shboebLieEWgxOyUrrtzt2XFRL+bA==
X-Received: by 2002:a05:6a00:a83:b0:710:7fd2:c91 with SMTP id d2e1a72fcca58-71dc5d6df3fmr9812888b3a.26.1727966783505;
        Thu, 03 Oct 2024 07:46:23 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9defa5bsm1405345b3a.153.2024.10.03.07.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 07:46:23 -0700 (PDT)
Message-ID: <beb7c984-0a10-4fe5-856f-58000edb68e8@linaro.org>
Date: Thu, 3 Oct 2024 07:46:20 -0700
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/10] alpha: Align prototypes of IO memcpy/memset
To: Julian Vetter <jvetter@kalrayinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 Yann Sionneau <ysionneau@kalrayinc.com>
References: <20240930132321.2785718-1-jvetter@kalrayinc.com>
 <20240930132321.2785718-7-jvetter@kalrayinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240930132321.2785718-7-jvetter@kalrayinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/24 06:23, Julian Vetter wrote:
> Align the prototypes of the memcpy_{from,to}io and memset_io functions
> with the new ones from iomap_copy.c and remove function declarations,
> because they are now declared in asm-generic/io.h.
> 
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>
> ---
> Changes for v7:
> - New patch
> ---
>   arch/alpha/include/asm/io.h | 6 ++----
>   arch/alpha/kernel/io.c      | 4 ++--
>   2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
> index b191d87f89c4..db3a9f41447e 100644
> --- a/arch/alpha/include/asm/io.h
> +++ b/arch/alpha/include/asm/io.h
> @@ -591,13 +591,11 @@ extern inline u64 readq_relaxed(const volatile void __iomem *addr)
>   /*
>    * String version of IO memory access ops:
>    */
> -extern void memcpy_fromio(void *, const volatile void __iomem *, long);
> -extern void memcpy_toio(volatile void __iomem *, const void *, long);
>   extern void _memset_c_io(volatile void __iomem *, unsigned long, long);
>   
> -static inline void memset_io(volatile void __iomem *addr, u8 c, long len)
> +static inline void memset_io(volatile void __iomem *dst, int c, size_t count)
>   {
> -	_memset_c_io(addr, 0x0101010101010101UL * c, len);
> +	_memset_c_io(dst, 0x0101010101010101UL * c, count);

By changing c from 'u8' to 'int', you need to mask before the multiplication.


r~
