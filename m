Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AE9410D01
	for <linux-alpha@vger.kernel.org>; Thu,  9 Jul 2026 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595763; cv=none; b=mNmmVW82rS9opuOvRE1h/yzqYy6gtfhj/GZdreOSvzC1LhCq3mNJb5qe412xo3j5tKrI2fNFQ51KhUo1TzF196mCh/w1Wrnnuc/AfwqQGEarJ4yAZ2xkWzXsz/zklIj8nUzbI2qT/gXIgE/6fEqLrhFQliLwGYlTU62tXsOd4LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595763; c=relaxed/simple;
	bh=2OZyqeCMlAjx4K2K+b/k9iOm6BK8Cqfe058LfZSp27I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQEOTOVXPRxu4qkgqavJ3sX3O+TBh4sGeaEigJIDt2x7+d98R3ugQTAAShsZb16dfC/BK/icInKNPaTeQRhAqvGR0DB9GagmihFBvfnpUl53RO9yd8hmNlfdRL2k2oZbSHoHJ+l2Sy4XBHHtic37tIbDxSAQQRcLaaLjWLCa4P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULLpdAqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMSp+MCX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULLpdAqj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMSp+MCX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxIqK1521545
	for <linux-alpha@vger.kernel.org>; Thu, 9 Jul 2026 11:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/QNMVWz2zbU62zSNYrI+1kG+0GMg+VxTcjcEiOFHtg=; b=ULLpdAqjhcPbhl+a
	9wkFVF2/lY0nTNUibaezE3oRQ6lteQ4HDVcOfqHDE7vtflCsPuubuaBt22suHv5C
	J/GboNexxusvk46SeLD4YSCgJibhGpTyBp7Ew2CmZmE5Kc85FL5xmUGbwX2SNRRm
	AUKTk+C5LBwuGwFJB3/1RH6SX3HPCEtPeI30OoMKGubID5ux/F8g5HbF1COPW79s
	OzhxWi76MMCFcorNKYBBg01ItlLF46P4rAQRFOMzzGhz1/Bz8zCwIh87EUtM9Vze
	DADpxILacbIASbBx5FZNfW6HGEmYrVnOynweeKBYk1Yd0I8v8nqfQQ/58XsDZx94
	8Wm00w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwbvxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-alpha@vger.kernel.org>; Thu, 09 Jul 2026 11:15:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e820609d9so76114885a.2
        for <linux-alpha@vger.kernel.org>; Thu, 09 Jul 2026 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595759; x=1784200559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/QNMVWz2zbU62zSNYrI+1kG+0GMg+VxTcjcEiOFHtg=;
        b=kMSp+MCXIXJE0DIs7pFLHYpvXnsnX3iIWZtDgN0i1fJWjnjBoz1NYPDmjbbQCCRNEK
         vscp+wRWlJNCjh/XanhPMyB6cllBsqrXbJaR+3Yim34KJ+QqVhYiq4XnmxXbcn3+kzYX
         htjTdXGkRRCxkvb6URsJhgktwib3kHT7eKtJttgS7TcTyMyPpdBJUvP2lYCZTsqMbzT6
         53EbRfFizqInCSE9LMw26TK3JlfoQcPT/Fcg6Pw9vXT5ycRhoHqWKtMQJQ6LJMNItBsU
         p5s3qJHEUsH+n8X9iO9VfJurTdzfT3D39Xrh9IZvupN59Nvf5nehBIKJmRnYljAv7uS5
         Bxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595759; x=1784200559;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/QNMVWz2zbU62zSNYrI+1kG+0GMg+VxTcjcEiOFHtg=;
        b=W0tcMo/pehfF/bMfglhCteEYuPTtTrhsSQAF6zx5GXIALFQaV3sv58G+E3zZ2tOxew
         +pEtsvR2DzHDh5kT7ae+6TifgBff2z5FaiYOIbPtBEZiSsFlbXROsIvmOyw3OH5RfXJt
         p6u/49+xHI5YZdssH4bdp80VOSfXYLvn6CKC7Q3RBa+uw1WAjgBzSIPSUTmr//rHRDME
         iErmDyMwZeiNfV13KA/n/RDWcnmSZzDdv/g9h6z3xfudNVTd+Uy7djwC3PB1t3KTYT8W
         Tm8bFh5pMgTf9K2Ap/9T26MX84V2B0vcSeMcVmEaDxYRXWHB6OVD3wk7XrMGv1AP07M4
         R1tQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUubrDEpdweVAex2H6CGQv4+y5LEZDwZFRSY6sAjqR9ZTS/qSycFDf/nV7Xlm/6PKJGHJ2MPq0nndaLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFc0e+MofqRkher9bYDSu/LrTc4ZvYbrO8sN+VMaDW9NVRa5qK
	Pk++Rv9mnd7iKaDQ6qGxSY/Ub9xcFP20PasV8ICJxqI3qSaNRu+XxkrvfVY6r1qSPgWT/yrY2pS
	OFW7tZsZ8JwO8WvZwTJjQUpxuD1YpN7EzylJ9p55qPP8z8Bpo0j4AqzqObnlZHXHHEg==
X-Gm-Gg: AfdE7cnJKFqXh8XlvdxmixrjZVX6aT0VPvuboAL04dcJwqkNslWaqZVXslSWRv8Snnc
	LrysVSyRDbh8K7SzEEL86dFBfNsjIv3B94JqaY3fiDscVcMthbL84Su5ImsGrqHatbzSwvE1uPd
	QMrkRhpBAzA0duapxjbhlzRI5YX7sZaXiXU5/79k03F2DaRxNY55ZKFREQu9WgsXhUnaEOYWHZw
	vFdsrwyPIJ83cEzwLwirx3PYQAt77rreudq8I0CapGAJlLdY+EbWBf5th9lNeW4WKeort7hOUFV
	YIhtlgP3SidX4THlW8v3xULOt0VNdFMn45fLIxQKTNzi5duMGSG2hMd1M3sq5sYCOAEdFYr/Vgu
	Go5B1GJ7WiiE9JWfK2WGx6jzZeNepsAL1qHEW39qJQojlfjss2SEmXQAr5KsNQA==
X-Received: by 2002:a05:622a:1113:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-51c8b2dbe87mr68191531cf.28.1783595759086;
        Thu, 09 Jul 2026 04:15:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1113:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-51c8b2dbe87mr68191231cf.28.1783595758685;
        Thu, 09 Jul 2026 04:15:58 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm50274140f8f.24.2026.07.09.04.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:15:57 -0700 (PDT)
Message-ID: <cf26fe68-5a8d-4d6e-b9f9-d69faa8a6012@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:15:55 +0200
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 04/18] loongarch/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller
 <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20260707181957.433213175@kernel.org>
 <20260707190253.865955911@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.865955911@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX9aENzHu3DBm0
 AqoVurmEt3e699bQBJxVOxEfRKH1NBHB/uhU4mxQhvEbGL0FkuXKTV4kvttP0+OSB3ZW+ROvfvt
 /djLlaPVAaazjVNrBYDP5flbLZs1QV/LQRQpWLOIuTXxgGTqvhQg368PraF4acXgTLqDJz4W83X
 aHFAeh+F6ujHJTa1wYAjtoOo4ufcWmJmne5+1co42QxWuDBdyXCY34uY6iYW9dWbUy8WyXv7TWC
 mY/nqM+2ZRzcuTrQoEREwLj7vA3BAX+TvLu/16HCIJpACqqAnEdQKxfAjIq1T7TSN+g5Jvmzvg2
 rmUyMOX3nasDFAq/WI0Rl8fGBBZ9D6841RiD4hMBmQ1I2C1pAbeExVSzGUmhA7a6JxYodNgLSc1
 mwmp29OtMbYW08V+isLnAlepVlbeXB2hzOG4YsubXFgM/+7/xwUqdPAgzL3Q5/mfFn9wN3oPkza
 vVW/0s3JEZWKWAYTD3w==
X-Proofpoint-GUID: W2YyIiv1Ah7hXaU2yVs1oRR5ywC_EDRx
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f82ef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DoJJhcVa48uSEvU2-xUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: W2YyIiv1Ah7hXaU2yVs1oRR5ywC_EDRx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX75/Dy6xDEbQv
 W//gO/JjK4px1pd4UbNWUjagFcC+3zH/VWLREvZ/Ibhw/8p73H4Uaz3nMFnAL9RHeWfDEwCGK1m
 KkbYyafni8fQxige+LTY/RGIWAzFOy8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1011 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090108

On 7/7/26 21:06, Thomas Gleixner wrote:
> syscall_enter_from_user_mode_randomize_stack() replaces
> syscall_enter_from_user_mode() and the subsequent invocation of
> add_random_kstack_offset().
> 
> The advantage is that it applies the stack randomization right after
> enter_from_user_mode() and thereby avoids the overhead of get/put_cpu_var()
> as that code is invoked with interrupts disabled.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: loongarch@lists.linux.dev
> ---
>   arch/loongarch/kernel/syscall.c |    5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

