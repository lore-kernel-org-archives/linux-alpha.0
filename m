Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF0A381AF
	for <linux-alpha@vger.kernel.org>; Sat,  4 May 2024 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714834852; cv=none; b=pgHrTxuTscZK2WY8zeJGj9d0qp/DU9gesT54adlYBRteN1Eg8Ut74pa6YDLhlMCV+1j8kK18UssWW5U8ePb9CWS+d4OO8hcMigy70k76+DTRgYhfx1ZDmpej3R1/LlHjg3yHPICbwDmelbu5LW+SjgAYM8eye/jT0JDIYbyedPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714834852; c=relaxed/simple;
	bh=dm6dvBjLZNt3OOIjZlO2mihXFCuWVIr/2xvHjRiHyVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwLcQPeBdCi0GxG9fMdnzBAbEc7fL5v4MHz6hqAd1ROuHcH37B04EcPv6h8UEDTtmiDkZx5Mz9RHIlODFPjp9XvQ1zjlSIxkPYZYVSDU9/LZt9kkh3tLyMjpBngGWd824M4xAvbyGqYa8KMEw/qvkZDjf9+dbfuzdu340iQ7t98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OTCBfmJO; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OTCBfmJO"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ecddf96313so4865275ad.2
        for <linux-alpha@vger.kernel.org>; Sat, 04 May 2024 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714834850; x=1715439650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UnwRSsy/rruc4QDUohYmGqOdPTqTE8KujCBy49Cfq/M=;
        b=OTCBfmJOJm+r42OYIPrsCtkC/CXU/Q5XgVR3Qr4+9bvS2atfm5H9mnJuSAjMqgldDX
         Md+Lf3VorKW4u/ZWwQ9jiLgU/lCB4m+/mbJp6MxD0C2sYWwfbiTZ31PCcJm3eOwBsUfq
         XuhZv604FNDta6Z8deAgctp2VySB7uwLZSzLoagtEe9s4zSkXu9R5iBk9MPwCDx3D3IA
         ZDNVCmnMVQAmSGJDOkRjLiFQqdB4ErCNTJBeJEteRafuc887LRTvRHoNxzLyvwMPm2K0
         XuPj3nda6gKsLG9ngx7thuIk5g8azeDl2jao0PP/E2lVnwGzhz/OPQg8NUO1Fb2shwLV
         iJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714834850; x=1715439650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnwRSsy/rruc4QDUohYmGqOdPTqTE8KujCBy49Cfq/M=;
        b=tZmSaa1nJ3gymqGCaoI3WbX0ybiXCQyTwXEy9N+/Slm60pPfyW4ptNA2KjuJrtmZwC
         g1IOgC5BPg/r6TyLwtyl3PsHbR4xZAr9CKfghTOb8SqH3I3dkfmTbWWpycU46LmQ7Elc
         MTtlyCuv5gH7pLHS/GPrzyywJeEidX4oBD3wg/VuDyf5G5EaJ9Cmvtvs4/Jg/QPZcRg6
         W6drh3uPGSxUYqo562290sFqvSVY5UgEufvw567Y45ZyNgjoAjpMBKVjPhZCqauhV3SV
         3ZhN8u6Or5MktUPu4KWfhiPHNCrCOwZjayZnBKoNQKDTI/4FghNg7pWD977jKzs1pVp5
         kEsA==
X-Forwarded-Encrypted: i=1; AJvYcCVOVUkntfodxu1eU1y/0WSnH5HI+FU9/DH7yFHXSy6sWlJYCrRlAhjOn6vluVhVvU5d6y1qtZt21McwEtcPoUef6iS6/dY+v4mulao=
X-Gm-Message-State: AOJu0YwbDv5snOBW6OwOh8gT9VFZ0QfS/jQnSVyl1AsHjz5Kc/piB2yt
	jj5wM3nW8S1XiExYgEgmTgbli3azkTgeFN1b93CqpxwsQWiXBg1WN+nZsM67HSI=
X-Google-Smtp-Source: AGHT+IGxZE/j9rER98oVKJvhmBHRhIQPsuWXnMI6RBpOj+dySFp0WCcjTLcrOwoH034d+P/lA7yzhA==
X-Received: by 2002:a17:902:b186:b0:1e2:9066:4a8b with SMTP id s6-20020a170902b18600b001e290664a8bmr6570336plr.26.1714834850014;
        Sat, 04 May 2024 08:00:50 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902e89100b001ed1dab9dcbsm3997398plg.110.2024.05.04.08.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 May 2024 08:00:49 -0700 (PDT)
Message-ID: <31f1bbfb-733c-4027-834c-98f155562941@linaro.org>
Date: Sat, 4 May 2024 08:00:46 -0700
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] alpha: drop pre-EV56 support
To: Arnd Bergmann <arnd@kernel.org>, linux-alpha@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Marc Zyngier <maz@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org
References: <20240503081125.67990-1-arnd@kernel.org>
 <20240503081125.67990-15-arnd@kernel.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240503081125.67990-15-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/3/24 01:11, Arnd Bergmann wrote:
>   
> -/* Flush just one page in the current TLB set.  We need to be very
> -   careful about the icache here, there is no way to invalidate a
> -   specific icache page.  */
> -
> -__EXTERN_INLINE void
> -ev4_flush_tlb_current_page(struct mm_struct * mm,
> -			   struct vm_area_struct *vma,
> -			   unsigned long addr)
> -{
> -	int tbi_flag = 2;
> -	if (vma->vm_flags & VM_EXEC) {
> -		__load_new_mm_context(mm);
> -		tbi_flag = 3;
> -	}
> -	tbi(tbi_flag, addr);
> -}
> -
>   __EXTERN_INLINE void
>   ev5_flush_tlb_current_page(struct mm_struct * mm,
>   			   struct vm_area_struct *vma,

The comment being removed applied to both functions and still applies to 
ev5_flush_tlb_current_page.  (Thus __load_new_mm_context instead of a tbi.)


r~
