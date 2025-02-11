Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634BF25291B
	for <linux-alpha@vger.kernel.org>; Tue, 11 Feb 2025 16:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739292753; cv=none; b=XByHoAa49ERsL420E2+Ycl2iAeSpe2kCntTp4gQ+kvZSTuDqk9B1wpIHc/W8ftuuv/O4V6ZW66CA8osoZyS5r8ZrISAkFctVsGPCxEmVDrfCO8zRAbkAgzekEDhNg+ohIsFso+OSLRsVQWk+zyai3bZ3aJ5P4ZDivoKT3lh4518=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739292753; c=relaxed/simple;
	bh=gRo3G5m5Ukoont1Qsvcp35qa8dNR7KZETpu+sXWIZJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0Bc0lydcJN8ZIg2hjrbut9ooTHErzlC6WoOucv2baXTd+4p6+uEpCqMUPAYx6X9TchWmta/CByTLCdTrRdqep6rmus1G+30j1LjlOf+F+IowF6cHN8HdYKN3kdTMgrtcqJVrocDWmMD0OrfjX35CAsyCtrbpP02D4XRhl1wTFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8wwIxY/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8wwIxY/"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f92258aa6so66129605ad.3
        for <linux-alpha@vger.kernel.org>; Tue, 11 Feb 2025 08:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739292751; x=1739897551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6sNX3j45BuYX0jqFY0bgET5KHTO0uCeEEB9Pem3dY6c=;
        b=B8wwIxY/YKmZJtr6UculWh2VeAs0XBlW4ZJ5aWznZAN5rIUPHD/+wS5GNA21xz89iu
         nagTc3FdIMYPMksxnc+hRyfFoKcZSO6xG81Tm0jFBY8jMKmhCx4LfFOcP9uMFcbO+D+p
         NKO8XecguS6UlkWelKZ66urx6gB7YaROx0Xogjrc4+8pW22ZFkfRAY7m3gQYxWdIlaXP
         j+dMG38cal+XTIX7LMiWwhCsnxnIRs8iYHifjErqRGTESc8UJ4kAatQ0Pyy4VRszF1Ud
         kbFOFsBbaTWoO2Y4NkfbwCIfj1qH1SYQXBZQMpInn+xbmbdxwyXOvLwjl7HmWxRrwsCd
         76xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739292751; x=1739897551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6sNX3j45BuYX0jqFY0bgET5KHTO0uCeEEB9Pem3dY6c=;
        b=tdel42yp57v7xS/O1sYfDj3AbEPvTGfmR+XgQiG5LYedX3AbPrqnfm4sk5ZJR4EvaO
         gqomPlI2wGMPT8H3OZNqqeEpFRP/DCHmxdnznwoGronsmNhzrGVvRR3/y1U9SrcoJ67o
         hw3FmFfh06wLnjiuiFv95k5MVhql6ErLutpvoQd0/ZPRKI3WXPQFS9I7frKNVps96vC1
         +GwoS4XlFIDcLwsYVnnih4m71z4GVKX6AcHYZ0EYKldsriKhmvJ82vcUwCpka4k8IwHZ
         gYuLxHcI44vuiuB9bBYcJ5Trcp+ftAHnkvziW4Q0katPkLxDV4UWXNdulZZ+F44vfkL/
         yAMA==
X-Gm-Message-State: AOJu0YwGBNVJa6pL7q1Q1d0e+jx+L9jC3RMkRZ5NFOJrUtIPVVGHCfUx
	zqm7KYL2/EX2yfbBBJdrmgb8sIOCL7YBEOIdtCqOGN7C640b3S9Rkvf656Qiqpo=
X-Gm-Gg: ASbGncs0kiou6yQwdwqYdkFH0wQ9RCMXgIBQYaDDnR9HE2lA6+d6/0SojP0C49N/MSB
	fc7Iauowszj4xRaUPGMg9kyDfQ9HR1l4yTEBPTT+6Tx7D9giz1q2vM737rgWSMdO13yy9g3TfHt
	GvTR5zdWUrBiBkhaFaIa8QcI4KfiFPBRFS2JSmVvIGETm4UGwJVFYHd4OZ9l0g3eZiY0n7shBtE
	TKjZRAEpG8JhDl+Af+yzauRgHdvRrRto9+M03oLOgyHmLrL/dGSm0Vj5WhTUmESR+fuRmj7raw8
	gZEuMTaR1c4y2Fzl2XTgKZgBmX+qWBAxsDsckxQq/arru9zH72XH+WQ=
X-Google-Smtp-Source: AGHT+IGwAQZHSvMn3LFzLELKwxJYuB/UImaOPmixiwxZOIOHILOslZ5QYNsoJGgex4CGSOLd3rMkpw==
X-Received: by 2002:a05:6a21:9184:b0:1ed:75f4:d290 with SMTP id adf61e73a8af0-1ee03b41778mr35357775637.29.1739292750665;
        Tue, 11 Feb 2025 08:52:30 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048a9d7aesm9610968b3a.33.2025.02.11.08.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 08:52:30 -0800 (PST)
Message-ID: <a1803d33-c92a-4294-acd0-a2152fb0c163@linaro.org>
Date: Tue, 11 Feb 2025 08:52:28 -0800
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arch/alpha: optimize virt_to_phys with compiler automatic
 sign extension
To: Zhou Stephen Eta <stephen.eta.zhou@outlook.com>,
 "mattst88@gmail.com" <mattst88@gmail.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "paulmck@kernel.org" <paulmck@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <BYAPR12MB32057EF854A36230B5BC7E1AD5FD2@BYAPR12MB3205.namprd12.prod.outlook.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <BYAPR12MB32057EF854A36230B5BC7E1AD5FD2@BYAPR12MB3205.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/11/25 01:32, Zhou Stephen Eta wrote:
>  From 0bf2dd816c8369e2c690869b5f6c671f28c2b196 Mon Sep 17 00:00:00 2001
> From: "stephen.eta.zhou" <stephen.eta.zhou@outlook.com>
> Date: Tue, 11 Feb 2025 16:48:14 +0800
> Subject: [PATCH] arch/alpha: optimize virt_to_phys with compiler automatic
>   sign extension
> 
> In the `virt_to_phys` function, the following changes have been made:
> 1. **Automatic Sign Extension**:
>     - The manual sign extension code has been replaced with the
>       compiler's automatic sign extension.
>     - This simplifies the code and leverages the
>       compiler's optimization.
> 
> 2. **Fix for 64-bit Address Overflow**:
>     - Previously, when the input was a 64-bit address with a
>       negative high bit (sign bit), the sign extension caused an
>       overflow, resulting in an incorrect conversion to 0.
>     - This issue has been addressed by using the compiler's
>       automatic sign extension,
>       which ensures proper handling of negative addresses.
> 
> 3. **NULL Pointer Check**:
>     - A NULL pointer check has been added at the
>       beginning of the function.
>     - If the address is NULL, the function now
>       returns 0 to prevent potential crashes.
> 
> Signed-off-by: stephen.eta.zhou <stephen.eta.zhou@outlook.com>
> ---
>   arch/alpha/include/asm/io.h | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
> index 65fe1e54c6da..4d7cd7486b7d 100644
> --- a/arch/alpha/include/asm/io.h
> +++ b/arch/alpha/include/asm/io.h
> @@ -70,9 +70,11 @@ static inline unsigned long virt_to_phys(volatile void *address)
>   {
>           unsigned long phys = (unsigned long)address;
>   
> -	/* Sign-extend from bit 41.  */
> -	phys <<= (64 - 41);
> -	phys = (long)phys >> (64 - 41);
> +	if (!address)
> +		return 0;
> +
> +	/* Automatic Sign-extend  */
> +	phys = (long)phys;

NACK.  What do you think this does?  What it doesn't do is sign-extend from bit 41.


r~
