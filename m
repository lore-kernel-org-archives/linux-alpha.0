Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E021DC07D
	for <linux-alpha@vger.kernel.org>; Sun, 13 Jul 2025 22:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752445325; cv=none; b=J2w67m0E60UyBNiWUGECYbcd3TmGCnNlsug6SbTy0c5o4byYHiLQxWK0owo2HVMDIskGEQgToyl3WhZXfac8qBPFH+dn+6l+z+E/5HStceyA82Br2N4dLU0zfWutoLVviKvuBAtCvGCEQ2j4hdOmM+MK4d6ZUhzfA9poHgeik9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752445325; c=relaxed/simple;
	bh=2M05FiEV9oioJZ+K+AycdJhhGPNaMof4obeYtnotUlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XyogMz58Zy92zGSD35DPi8UPjxkxAR00KrsPD6zv5zoJbTCGSjGbOSc4Mq9Bh7ejK1TbSou9XsVVso77IzF5kws3OuVfQ7PN6mqfo3D8TsQl/9n7udfNhymC7sytmx41fFcjHwczvcgFYxujX7R8JdoEZyXiDgEP6dyx/Vviguo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BJjPqClp; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BJjPqClp"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-61396c3f681so799966eaf.3
        for <linux-alpha@vger.kernel.org>; Sun, 13 Jul 2025 15:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752445321; x=1753050121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RNQNXDV+LG1KwYa30nsj5pHp/8wtAgv4sSv2jyxQ0YI=;
        b=BJjPqClpEjeAfzj+kQB4D8osc1Hzl0LmeKEcI6iyka+IDbDcvzY6ghH6cp9KXdz0fS
         9Lf3ltEWw7Tehc/SIeqzUil3yuJ/2sXpWBsSKN03FUKSjSWs4iUbldzR2ItSxsTBxGlj
         RNyeaIxqM/p/hAEobsobrq6CuTDn264EW+KzA5YHImPTWbbvsnzhCSLzY2wre3YfVLqd
         cFOUwLxa5p2YBbmuxlZ9zQ5dnhXpfbW8MCDL3PULX03XVxYFJDwPlD/nrm88UC22xNn5
         joFCahlQyrdbpQN0GJeDDyREhMTjah1fTo/idtpk9gyFvMzk04iVqxQMG6LL37iWQdPC
         q7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752445321; x=1753050121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNQNXDV+LG1KwYa30nsj5pHp/8wtAgv4sSv2jyxQ0YI=;
        b=HDk2evv3Sa5ZhoZ3TNFD7ey5hPbdjaRmJiFh0faHPKbXbQ967bgOB5S+0uBfDPlpkm
         I8i9QTSORsF5VLXFbxJhsn7RzfVV8kAuGUJsrrcb/8J6DVS10lKFFyb1NUkOiTNHUgwt
         ll7hQ5Sj4C86GT9Y6gmude1fF535ltA49c5iQhzv26uCe1QgBxTHbJUV3Eh91WLH/a9E
         sjSgHsTquZ8OkgiY79ujdfsX2BjiKBGKii3v4tMwIrzUQ1t2DNQGc0WshgT7oE91wpiJ
         Pb2isoB8OR45UZhV9hv6+NbQvNAsfRLNgLplV8AgRmAQMXCKTw4PpWYlIRJveTuPaPkA
         PjYA==
X-Forwarded-Encrypted: i=1; AJvYcCUM474qyCzC7mTCe5TNu17rIAZGKfST6KwNV+gsxJTorPepDTcRJWkEeW+wwm6VGdx0MkP+sxsr2T8eiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFwKDoYmHmz03b1lgPeP+b5f00Z159yYUiWSVdSrMSMyq04MjQ
	OYBiHriJTkQu9ykjZ8iRQ6sBAr1YKSzKGTGav9nVp2P4ZZP22+OEEWlwwKRjumSVeWQ=
X-Gm-Gg: ASbGncvCEOS29Sm+I3JiYoMhv0ZxBow6JJfav7d5BTNDWjDar6R2AY/eyeIG/Tr1EGT
	GRVuN4IZwhjfn6QPMoBqlLTn/BovIsOcB9p9yLwPj6EqiGd6r8Xc2Gi0sd85ZLjscvbfuruQirG
	hJEh9kZaDgocMS0VUPhGyAkyOeme0j1KS/ZEAPySf2lVZIgSXFC8przgdJRUoW559W7wD6jJf2x
	i3uEZOcyhQcjvGbJYY4lqkLTIF3Zh0vCiIZz5uqg2GutMK91SYJQQVIRCTHV4THCKc2Sp3rHkAv
	l7WYgZ7R6DK5sbXU/GGHQ0B9TZD16Mfz56MY6xw0QGaS7QYtaWj2Sk+8rNQ0uDcPmFP0FUpPPCJ
	T5gR9jNxMPpzgfQThZdne7Df6UQcDrEmWOfGisHE=
X-Google-Smtp-Source: AGHT+IEwQsLEd/PvvlHThIaSsW4kNZExxQdlVLZn5vrAx4CPWSh7+UlvjFpD889J6qWA4s1GSDuYiw==
X-Received: by 2002:a05:6820:2d04:b0:613:c7cd:3b2b with SMTP id 006d021491bc7-613e5f854aamr9473019eaf.2.1752445321545;
        Sun, 13 Jul 2025 15:22:01 -0700 (PDT)
Received: from [172.20.0.130] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-613d9d836a4sm1072154eaf.14.2025.07.13.15.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 15:22:00 -0700 (PDT)
Message-ID: <ceef9e43-5591-4c03-ba51-af1ccc68a05b@linaro.org>
Date: Sun, 13 Jul 2025 16:21:58 -0600
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/nolibc: add support for Alpha
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>,
 Matt Turner <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20250713-nolibc-alpha-v1-1-10216333d308@weissschuh.net>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250713-nolibc-alpha-v1-1-10216333d308@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/13/25 14:08, Thomas Weißschuh wrote:
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -709,6 +709,10 @@ int run_startup(int min, int max)
>   	/* checking NULL for argv/argv0, environ and _auxv is not enough, let's compare with sbrk(0) or &end */
>   	extern char end;
>   	char *brk = sbrk(0) != (void *)-1 ? sbrk(0) : &end;
> +#if defined(__alpha__)
> +	/* the ordering above does not work on an alpha kernel */
> +	brk = NULL;
> +#endif

The syscall api is different for brk on alpha.
A change to sys_brk or brk in include/nolibc/sys.h is required.


r~
