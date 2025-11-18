Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B718D3502A7
	for <linux-alpha@vger.kernel.org>; Tue, 18 Nov 2025 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763466919; cv=none; b=f9vCl14rbDDlB9qpCr6O0/Iq4g3kzw+DvqfsAQIFzQc9e+RuRft7Tfr9C+zK+PINV7Fwx0RwHX1x7D1hyJ5EoQXuVDIr9X+sTBPKKmJhgm+mYt0lkZRpMA1R8lePgdqTwicyefUa1aH8GQUP1pYY87peJtqSW25BVZN9i12CNA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763466919; c=relaxed/simple;
	bh=jneRGbDx8iaCsHjcSO3LMYs6xm0P9/PiTsbxJnh68lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DvR5wvbfSezxRTgTVZbTVox/IECP9xRWvNgjvOKCSdY4EiZheMw3n2qPsJ28FLAW1fwBt81rwQsVaOebli6fJwCwn2lM6FrWq8BZOTwuf4CHYj115S0y2BAETiHgNc1aPSuXHe3BkkRnxX7BN217VCxVeyYbncFt/OBHTq6EFok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6KXI7E3; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6KXI7E3"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-297ef378069so51526015ad.3
        for <linux-alpha@vger.kernel.org>; Tue, 18 Nov 2025 03:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763466917; x=1764071717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9v8UiKRyyvD16t4ENb8APUiQmIzVsGi/FebBj0lOkJ4=;
        b=I6KXI7E3s+zxub0ZQ8DsKJnuOVjMhxwRG1aNuLxcBoUfiTvnon5mLGucGki0piBkZy
         4x6EIJhKAVqNx5p0F3BA+RKBVamh+XetjdT128/kPHI5nxiC8p3Yb8kbniJnbmPlSL0n
         Yr5Tr/JcYUk/X1P5cL8hI8MEx761x9YPnBURS3SllkAFBC2RA6ughuNysbBCCnT94HNX
         UfGJ7XUBidSBM+rr6WFaK2omGalqaHA6VQFPSVWBwL0dLrMMdE00U0Y2IWb9CxBSw0lK
         nQYpXqKaeNJEOHMRtPwfUq23h9h3alGc3Vn/nADz5k7Fw4erwAEuKls0Cfq8UO0Du/BD
         TMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763466917; x=1764071717;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9v8UiKRyyvD16t4ENb8APUiQmIzVsGi/FebBj0lOkJ4=;
        b=r4CZV8FwIubYrvKPGTpq6j9JeJRFE6fk4Q2pkmA6GKPmTQANUkqSQG67A47ZW13Jtf
         ja3rSyV8+xlEutw9rvjSKdDzIF2bcs4VQdi2c9KdkdCYlHbQoymop/+zR4opcHlXtxZi
         1zuU69NkTG6hQva6yAHgflruBQdA2SqON7y0LNSzAiqFdBiKmycRCYNlU+92ckEzl2p2
         PJIroN2jX7R8B3r62z6UM3kQrA3aPrgVjx902H/jvViuBEh/SsIZVlwnxerN+4fV0De/
         fnjTuf0azuWC4JsruKG1Fw/EqE+DpMGCX4az0Lium7sxQWtXQ8ZaJIChJ6P0oMAnUWkJ
         LX4g==
X-Forwarded-Encrypted: i=1; AJvYcCXSBh85DLm77UgEk6kcnUz+a+QXesfAqlsCWO5F3Y6Lf6ZLEnr1WqHSGMYFyVxQQGGzZcYRC6irgT5IUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz3OHsK38Z7tl87NTwnpPwJHbCWqpF/p7epGFKZ/yjpSJpjWja
	vmFEgnL6MK6L/02ITtH8xeI2GcBaIdOcS11eril8cjqfFYO4MISHZaf9
X-Gm-Gg: ASbGncuZXgZ0N0907MZkRhAKIpzfoGvhlxSgDFZJJayW6gmSD0mrpESVsqKujE5hJVM
	1+3bYmAi7kLm1NI4f0JMmQVDPmk8xpjDSs/27MmZYp59ZQyFhpbuu+eqaJSYzSGtPTpGk9t5gPa
	pX85hJozYM20FTC6z455MQQtrrxcqAURWjjPLNy86SdBKyU5+WVwqsNj9o7xB8p0hBXJrq9EwHB
	ZJOU1vnUNWaR++bupA4+nKU2VRIeAzN/JUqSDz9r0Ct/c/Umeyl3l4d6hN7DUdBQPnvv6WNBleK
	IAkm+z2ucYLEQNaQcx/FLKUGqbyU4ssNyIHMg43ybkkhfLga9q/GVY2X5c/+KRXuTcYrmRrkZwB
	izUgx18LI0eYnS8VjlcRPZ16qJMMF3V0kMWfuw3yTdPTI5qgbGQnPar0x5ShUgjeVvKvZ2a8/AI
	xtMktzceadrAScxYPKX0CGDqy7XmlvGkJf6izJPr72qcbSUA==
X-Google-Smtp-Source: AGHT+IGaNSdLxRla9oY02zDdWZQ+dAcjdxohCbg81uqIYBMI/Z6QJtGDDVm6vwOhGnWyaCl6P1ztwQ==
X-Received: by 2002:a17:903:1b2f:b0:295:3f35:a312 with SMTP id d9443c01a7336-2986a6cfeefmr183341175ad.20.1763466916628;
        Tue, 18 Nov 2025 03:55:16 -0800 (PST)
Received: from [10.255.206.79] ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d17sm172235585ad.72.2025.11.18.03.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:55:16 -0800 (PST)
Message-ID: <f7f0ca8d-bca2-4a3e-8c45-85cba1b0ff18@gmail.com>
Date: Tue, 18 Nov 2025 19:53:50 +0800
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] enable PT_RECLAIM on all 64-bit architectures
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, peterz@infradead.org, dev.jain@arm.com,
 akpm@linux-foundation.org, ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <83e88171-54cb-4112-a344-f6a7d7f13784@kernel.org>
From: Qi Zheng <arch0.zheng@gmail.com>
In-Reply-To: <83e88171-54cb-4112-a344-f6a7d7f13784@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/18/25 12:53 AM, David Hildenbrand (Red Hat) wrote:
> On 14.11.25 12:11, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> Hi all,
>>
>> This series aims to enable PT_RECLAIM on all 64-bit architectures.
>>
>> On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of 
>> empty PTE
>> page table pages (such as 100GB+). To resolve this problem, we need to 
>> enable
>> PT_RECLAIM, which depends on MMU_GATHER_RCU_TABLE_FREE.
>>
> 
> Makes sense!
> 
>> Therefore, this series first enables MMU_GATHER_RCU_TABLE_FREE on all 
>> 64-bit
>> architectures, and finally makes PT_RECLAIM depend on 
>> MMU_GATHER_RCU_TABLE_FREE
>> && 64BIT. This way, PT_RECLAIM can be enabled by default on all 64-bit
>> architectures.
> 
> Could we then even go ahead and stop making PT_RECLAIM user-selectable?

OK, will change to:

config PT_RECLAIM
	def_bool y
	depends on MMU_GATHER_RCU_TABLE_FREE && MMU && SMP && 64BIT

> 

