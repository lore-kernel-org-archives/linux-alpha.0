Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C574138A2A1
	for <linux-alpha@vger.kernel.org>; Tue, 13 Jan 2026 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768299577; cv=none; b=n1baKrAGC7aqO31T2uMuZa0jdPrFgfnvEK8Z3JBj7KAST2VkvY1nvWKmX4BVpNnt6Y4nh0+9t+zyTMure1AAwXLlNqHxE0XUC/VgnntbEv1mI0tbSJqzkQ+xTHO+/mK/uX1hePwY9onc3bMlgm5ccMaII3nf3Dp2qDa5iBvmeDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768299577; c=relaxed/simple;
	bh=39NtxAeqpXvhawaLycQSgS8a7QXmm9U/xmb9EyW+PGc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aLiHbyQ/R9umkkCOfWXb10BTB9AUwlHQWtCvBrXdT0cE5B69B+ATWHwaf/bAekTGscY3ELKh9EFIdbtDoiI1UynzsrWXaH6ZSGkaXEx+a4IzfIPQdhPGNRToqj/ok8a3LaT5t+YKpoLCK+JGYiBV3PSI1CAzz7UE9K3J96CH3yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViZcoV0N; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViZcoV0N"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59b72a1e2f0so7215932e87.0
        for <linux-alpha@vger.kernel.org>; Tue, 13 Jan 2026 02:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768299574; x=1768904374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=ViZcoV0N01xJpwy0khBNerDcEKcMgko9Oa7uP+pNw+ZPYQMQMbS8BWGpwy30TPDcU4
         ODbK18rwrx/+1zFEx1LMWksB5rTmYXed7Uizqj/hnYZFuy3SKxL4VJZzncfKJejhEwTz
         1vFKHdFyz2Y9LeZ83yitxDpJo5SpcmqtfpUux1QbYIJ0qYQszRMuJTQGpWOC8HZ+Vxqq
         t3bWIvAisNd80sALWCgviHbzCjrf1SpYtWBTNGH/cJRSCZK6NJOGOqtOUpsZP6sAtjh7
         a+7xFHLXmzRvI6ZvkmwbQrKqOY2Rz1Usb3aZBaUxSEKgWruheFDnpguJPwz9lKCdQZ2e
         YMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768299574; x=1768904374;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=CBwS4rK2GjeTedJTyr6ab4qjpcn7b15ZOlisWMwDLPbPQcfKJhCwhtKe7UFAIA2ajA
         U7tfE4ZvN+v3ggKupsM3ZizGLiqBZraEQdIe+C8y6o6uB0XOk7pFHYdm+Sv9djwZj5Sg
         BZDXgwThmyXdfuTBNKbDUQJsKGbs0i9gD9owkk7fBXwBgLEx3xcq66sGG4m53QxncXsP
         2tEdJeskBjIaMV2xlqecm/O6MZeTtvljB+CzlGiUbA3DOuXdAJ9hGqy5rf8lcUAyp4EP
         Pm0yJrNAe4eTBh/JzZpiZBkNm6V3nLjbT4xR9H2BNKQMvEwggBbn9uDlNz28qxCkZvky
         ukhw==
X-Forwarded-Encrypted: i=1; AJvYcCXj1kgH+zgbv6dxXw1vSVWxFZvejwvs64hNWbV/nvU2nWD6QW2/MmFSHrLCniFeeAP/O1tcqkcOo/erRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGUlEtGBSCkkwRqI1h5aPQvE0StxLfrv4jocDHyHR70cw7/4bG
	KtBggMcM3e08YINO4ybt9XDbldZnCqLf54W7eEeo40ACGFN4Zp1sYqSo
X-Gm-Gg: AY/fxX52ezt/zpAX+bJisB4VE9QFtsGvu8iGcQq2pnVwox7hI4fVoOdza6IoYm2VQgB
	LYBgJALGrTvZWX6ZKVyFU6CFC/7VIKr8lIM0joTZmHKdrW5QOAFvCxsQc2jES+T2qNR/AI/pZOE
	xN7A9z8R8dX7X0yR9wL5IRZR6YgTE4tItmmF3J/vEWIFpC3ELNiEeeH2VnQaWfZXE5w+blbCvMA
	/233Wgy72iOTh//ZLdSUUqA7ioY1s0OSpglXNos3+io5ao15yftd8YbjHELGcqeiWvsIJf+Htgc
	oz2JsCOP6p//F1m4Li6RKk4FQ0MSUdgT3Ph5b/2/vfn95huyQj51ofywZBtGFI/9Wtye2IIT0M2
	ZnSIfml52hqOOHx7adGGbwOo/KmnAPter2ujveeI+yLhi6jdk7r2ovjZCqD89W+bgd68qZ0f76Y
	p8STWjmHq0uyggXn/M5JnS/H4OJEIyGd5MJo7QHTuGbFp/HxUk3r/CsL3n0Q==
X-Google-Smtp-Source: AGHT+IEOoK2sWcGzQ5k4NJjsFR/RmdeWAB9vvZrFfNJ0u+S6dsEFK74/fdYnqiqEV2XmHMt6sJ390w==
X-Received: by 2002:a05:6512:138b:b0:598:e851:1db3 with SMTP id 2adb3069b0e04-59b6ef05760mr8236951e87.11.1768293628066;
        Tue, 13 Jan 2026 00:40:28 -0800 (PST)
Received: from [172.20.10.9] (mobile-access-c1d2ca-216.dhcp.inet.fi. [193.210.202.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72f3ae82sm4416299e87.71.2026.01.13.00.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:40:27 -0800 (PST)
Message-ID: <f861a1c6-7ec7-477c-bc42-f9aaf6724bed@gmail.com>
Date: Tue, 13 Jan 2026 10:40:22 +0200
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/29] arch, mm: consolidate hugetlb early reservation
From: Kalle Niemi <kaleposti@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Ritesh Harjani <ritesh.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260112142323.495fc43e662e7d276b0fa371@linux-foundation.org>
 <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Content-Language: en-US
In-Reply-To: <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/13/26 08:50, Kalle Niemi wrote:
> On 1/13/26 00:23, Andrew Morton wrote:
>> On Sun, 11 Jan 2026 10:20:34 +0200 Mike Rapoport <rppt@kernel.org> wrote:
>>
>>> v3 changes:
>>> * fix empty_zero_page initialization on arm
>>> * fix ZONE_DMA limit calculation on powerpc
>>> * add Acks
>>
>> updated, thanks.  I'll suppress the ensuing email flood.
>>
>> Kalle, can you please retest sometime, see if the BeagleBone Black boot
>> failure was fixed?
>>
>> Seems we haven't heard back from rmk regarding
>> https://lkml.kernel.org/r/aVrUDeSkqqY9ZCtS@shell.armlinux.org.uk.
> 
> Hello!
> 
> I will test this v3 patch ASAP and reply results here.
> Collective sorry for the delay; I have been busy!
> 
> BR
> Kalle

Hello!

I tried this patch by cloning 
https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=hugetlb-init/v3

Boots succesfully on BeagleBone Black!

BR
Kalle
