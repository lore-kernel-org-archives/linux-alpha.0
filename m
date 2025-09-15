Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2361311AC
	for <linux-alpha@vger.kernel.org>; Mon, 15 Sep 2025 06:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757918539; cv=none; b=VDvHJbknvC5IdslplKmNIb0lyGc2tNY8G5PwwwiqwHHkMjyufvuemDyZcFYDTOG2aV/8KrCok9K23ieA9tS7HMdICNoqglu9ThvMpMUlATOv5T3okCl4DRcPJaEr/KgBzpT+iymkuzEL2VtYNItI3sipksQzPryOrQXE45RDBoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757918539; c=relaxed/simple;
	bh=VDrHGtFOrHkGMUyMK7CG8vsgW1x0lP0y6Ux4RfvsjZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAsd1OUSiOryAxkFdcxa7leb8TYzBmD0LP2wFt8Xu13u21f91HmiitRcJjwAgByRSizV+c8EZ/FTHonXgtbz/jVdm3xKWkwX9DAIofV/GWeU5Qt7+g/O61FXr69k/TPmDSVqfkSSGZlmwGzKfitRcAthteursrMB/8eZecfFi2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=tmdrCh1b; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="tmdrCh1b"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b0428b537e5so511469466b.3
        for <linux-alpha@vger.kernel.org>; Sun, 14 Sep 2025 23:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1757918533; x=1758523333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JYpqNcnwO1AiOugXjAT6rZVipdVhaKdoRjjyakgRNKQ=;
        b=tmdrCh1bxc01Zos3g2onVQwwvTnW8nmYD9jL5RU+4oA87FxFPnbg6tm+V1vA8zBOe3
         Iz3uvQxrNI+r2W8PfIyg0HWUdrHYO5na5cnhfJO0h4uz2Iu/siWns9OyKQeZkde/g7IU
         LLNZhim5XgYUfamP/N4RSolXm4Rlnz1n5zvRvVWXQNwFqQEq7BSatqBWDzu5cJKobOOE
         W9wCPu1mvCbrql3cc1hHEg+CDgmkJkNOxqtehhh1TJeHP9r6IKyjIhw2A1FGu58MSjP0
         xZP/ocreefUMWJ35T46qyAEvxAwUID6Dld6XltEHkCTu2T0J531lqJQLvb1BxemKVUGa
         apyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757918533; x=1758523333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYpqNcnwO1AiOugXjAT6rZVipdVhaKdoRjjyakgRNKQ=;
        b=DGbEd0jB7FQ95bdQ51X4islTXkNDNBgFQ2/jbM7xQBi81glP/v0NllHDpDZY4Q8jy0
         WEG0xkyVveLR3iBtU5jkYAIrowrc63+Vn9EfDmLq9jXhVV8LGmm+pvE1YIqjuWbKJpoV
         nQIbd9YA8dP2gmOROeteLweCp7PXaskIc6fd6YVjFWghFLxrQ0TnY+jA/nhJ/c2fZ9Z7
         ql6LeJOdHw9uMxbKnWgahyLhEFfthBtFoH+wjmFao0nBh+3DDG6VtnkDwnMfFgWqLejm
         VtmMCxf6c7kZGeG5+ADQdfFDl1xIVFvekXBg5Mo4nuaFHdLtW8HiDlW2QB5PkKJxfhMv
         LATQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgtV5CB5OeLgjrU4mgMdribCR3wcHita7j9UnQjJajsIDEyF7kPklQS1Ud3FwSK+ZjcI+FjVNJodvs+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL22fGmPnScZkDZ2cWS93pQ1TwX5eahokyHx1iOjUxCuNJAC5I
	xzBnX+YXwiZSEcfH2OsS8cOaZ3qheKSD69XhbhesZPhfP/CsFf3EJkZ/3SAzKJE9PQ==
X-Gm-Gg: ASbGncsV5MWBPIu5mbho7BuhvoRUaOdC7FYIRndUXekyq+tD7gqCpdf5DnIxS9JotbE
	lxmAV5t7iXEuHHymlqGdOnsmpfLsAMdqGky9E+z8PM8WgXmFsa9nFbc53IZ9LM/U+LoK+yNd6ga
	EdCAVt+UvdO2cCSOe3f8ioFke+d7Xc/b881ZJMpRxA5CZ3k5/L5K2C06w4ONqBSLkzxt65TuCC1
	UR/f2s36Km1X1DploG1TqpqG1GMP+rKnLtR48TTvJVOL5qRbg3ggxTR7ENZtXiWQhblhuovgx05
	8RLy1kBRnOyJmEmRhjE7el9UPyDyf1HmmLK0aNH4eJfTblwJJMHI/JraPeqLiuB08d3t59pNNW8
	QClMBaMEKkFTlT4fQuzT7gZtJ
X-Google-Smtp-Source: AGHT+IHmUY+dFRWpugaWotftvE9e1WhXDKJpaHEynboNJZT47ghrfaqdx2cchbgiTQPPUsWBemmXoQ==
X-Received: by 2002:a17:907:7f22:b0:b04:578f:b3fb with SMTP id a640c23a62f3a-b07c35becafmr1318742766b.17.1757918532129;
        Sun, 14 Sep 2025 23:42:12 -0700 (PDT)
Received: from [10.254.183.223] ([149.199.62.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07c337e785sm703515366b.25.2025.09.14.23.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 23:42:11 -0700 (PDT)
Message-ID: <d71106e9-95d1-48ab-844c-ed3fa38762e7@monstr.eu>
Date: Mon, 15 Sep 2025 08:42:04 +0200
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6][microblaze,xtensa] kill FIRST_USER_PGD_NR
To: Al Viro <viro@zeniv.linux.org.uk>, linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Jonas Bonn <jonas@southpole.se>
References: <20250911015124.GV31600@ZenIV> <20250911015440.GE2604499@ZenIV>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20250911015440.GE2604499@ZenIV>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/11/25 03:54, Al Viro wrote:
> dead since 2005, time to bury the body...
> 
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>   arch/microblaze/include/asm/pgtable.h | 1 -

Reviewed-by: Michal Simek <michal.simek@amd.com> # microblaze

Thanks
Michal
-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

