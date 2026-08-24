Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D84644E055
	for <linux-alpha@vger.kernel.org>; Mon, 24 Aug 2026 15:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586316; cv=none; b=oGZWinxA6600/S86zPBXaw6cV/8gje/USfy1ELuPac6021K3+avE5xNJkZdVMIxJFh4WmnN2QRf5JA/CBfnlluAvt5vZ/5bfqPf/5bK8hg8a7hVWCWfYg5NNfgFKF+zS63qG757jQNVNi0SC4tKu0tIVg12F83FqCC2TXYWjio4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586316; c=relaxed/simple;
	bh=rH5ooTmhOET3vAsIUkA6yaGvEUpGPYpVuc1a+dr0RM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fal264AcKbiQF9GGLEG0bnSZrhY2K8k5wJrRaDnHOzMLfb2yCk7OhHyWlHgyzMJ4L8EgA7xNzWEzEne0d/q5iWpASibW1FzH9zJUerXCpLAShgy4OGEHS0NjzREDaUMlfFeLa16Zcyd0RCruHVgg6nIYBv2TnQVOoozDMijY6ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=XiWO3OjI; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XiWO3OjI"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e347638adso3358521a91.0
        for <linux-alpha@vger.kernel.org>; Mon, 24 Aug 2026 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787586312; x=1788191112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEtJVtkW7q375yAi3A0GskrIJ2s9H0yJ3yupt0Y509Y=;
        b=XiWO3OjIqdcETuZVZGtwjGh/ridNShPFkWNE3WtqLgW/OCUrW4ceSniPCnuw3SK9w1
         XTU8Ys9ZLukdPh1w7VDEanB/FM0sqiWMGyN4dR5evFWNqo6ePuO07HrlNh2fuCx4GNru
         vGoj5lnIz6IFL6b637DRdsu/jePBVR3paCUUy1VRsZi5Dp/5l5BDabEV2rm4s/++FuVi
         7cSrGkjkmZ9dSZmXjXXxqZfPXtq1iTfhvn/lNVGmVmKesYI+fa9ppS+0qqeikflC0VM+
         JFIvYdhKOwdGtQFELrlmbm4uwP6XS2FYISN62wP3zDXL1mZB+3qq3TjDJETwgSTW2eHm
         A9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586312; x=1788191112;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEtJVtkW7q375yAi3A0GskrIJ2s9H0yJ3yupt0Y509Y=;
        b=GEAYtQ7IAXGhPDZ1vDTMKU9z4ZEXZ4e6wZwhQKChN4XX2vWJPoq4iYtou4djRJorkH
         11DGfHKX5VtdeftVL6J0WEAWbqP6CDG9njbKz9Dqz80VK+6Vwgj5rapA03j7RDpcRg6R
         ytj5cEs073gmYGQXsEgleKXU0DB8z+8/WXcVXJa2atUhTpi+i9LtO9YUlTL9gr0sG2By
         vKecBJUFfqDTDIfXztLtPeo4FAJXK8CbzZi0g4RvOsTTIzJFvmU05M3nLrDqkwDmVlWq
         a8Jzke96MsWWk/GfAJ1IrkadIispjf1+iKCtggmrpPfouG4f3JaT1nbRRmU0zme7Wf8x
         wCXg==
X-Forwarded-Encrypted: i=1; AHgh+RqG6WFzOOScSRIW413/tPjQIw/lPCxdlEtgkZVNc1gi809LEo/F9JLc8AdRhqsZdPUlfEgq68RqHxrFhw==@vger.kernel.org
X-Gm-Message-State: AFuF++lHssKYoxlEp6RooCzpHCq3Dvc1YnGFRXQEfrSYtpA1Bauwh2gv
	dme0Ovr/8tP/KUolOSpfklRx/BXN7iKqV2wqEYtaQ80/f/cpibSoitxWFtHjLEMeDeYAA8mI23O
	OEuVU
X-Gm-Gg: AR+sD10MosqcQj+7GTovPGi/MgnR97cBnTRZyGP9KlCYDU8Z7W+gKb9AuuoE6KV2JBA
	XjxFVobb+5I8Z/wgjfe6FdXZIuCIMfdxb1P3ZM/IU/hYmyKDiCujLUC9qfVLyZODBfHuafqJcn3
	R7mvN14AYpRItt/iAUQy+LPbJXhyAe9OJNvWFGDoN5Yc3ygQ1c7fJoEWP/esZEvhsceWSTmT/cv
	6hp/fhp+rINayqI6uTBT7oPsV141aXQaugL7obzMRJNKjven8Vi+xIan7DKWN7+IgOv08bUUHxk
	RgUs8+8pz+8MmRD+76Jk/mirEWlcn9y/mvfXMkQuJE7nQggxndfYCOKhdJwXc5HngzpMqeQe0fK
	+sVfNNC8KNPUP6J/AItw1h7QwKxk0nh/LgltgptN4hI09rPHFGnCjHDGfREoECet8Bma13gfgef
	vm97LsXJPiEr47/mgR1F6+ROz7Q+f2t+kWMVPv10TTGy/qAm7RFnvmjqZa7+Is52XlLJhLK6vLN
	mFkYIvWdltli8o=
X-Received: by 2002:a17:90b:5867:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-395df4dcdbcmr39252435a91.15.1787586312489;
        Mon, 24 Aug 2026 08:45:12 -0700 (PDT)
Received: from [100.64.0.1] ([165.225.242.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b7ff6dsm23611a91.10.2026.08.24.08.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 08:45:11 -0700 (PDT)
Message-ID: <029cfde8-74fc-4437-bc18-b1b53d44cab2@sifive.com>
Date: Mon, 24 Aug 2026 10:45:09 -0500
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V3 1/8] mm: Make ptrval_to_str() generally available
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
 linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org
References: <20260818040041.1891769-1-anshuman.khandual@arm.com>
 <20260818040041.1891769-2-anshuman.khandual@arm.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260818040041.1891769-2-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-08-17 11:00 PM, Anshuman Khandual wrote:
> Move ptrval_to_str() inside a header thus making the helper more generally

Typo here and in subject: ptrval -> ptval

> available for new users which are being added later. While here, also move
> another related string size macro PTVAL_STR_MAX inside the header as well.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  include/linux/mm_types.h | 15 +++++++++++++++
>  mm/memory.c              | 16 ++--------------
>  2 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index b18c2b2e7d2c..a5b514e55dd7 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -2001,4 +2001,19 @@ static inline unsigned long mmf_init_legacy_flags(unsigned long flags)
>  	return flags & MMF_INIT_LEGACY_MASK;
>  }
>  
> +void ptval_bytes_to_hex_str(char *buf, size_t buf_size, const void *entry, size_t entry_size);
> +
> +#define ptval_to_str(buf, val)								\
>...
