Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A1231ED83
	for <linux-alpha@vger.kernel.org>; Thu,  9 Jul 2026 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595845; cv=none; b=o2bk80p4Xzuxk6HjxopyvCg6ytF/udDVyyCUjERLm0+stsbyvKEV6UQoAWNsiXmUjjBcPVhsH7eaLOoBjJIsDnO9ZUGFpp2SKKuIixDdm3ktJyG1mklGBFkNKopYSFZuxsU2QfXU1EbtssaRvf3Yqkcug3PXdFcRGhsW+qvJoUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595845; c=relaxed/simple;
	bh=nrb0ag4EBTliR8HEhFNdNbVVIK/JUBRD2JKlM2G1ar0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUAcz6eXza/na8ItjxTmj1haE4k89Zii3wH+H1Qljt7mmwcM5bI+MDntu8SpeBzGBcF74nrWQ0SPIpkjE3Yt45ivJZik9ayVlhzHfNwmWKGKlc/qOqtzdaL1DTQd/8S0Wx2jH2v6dXGP1lwX02vpvr6NeFWST8xNSib5TBTpL1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5+SzP63; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gtO1PuCP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5+SzP63";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gtO1PuCP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AwxS51660749
	for <linux-alpha@vger.kernel.org>; Thu, 9 Jul 2026 11:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6mSNoqY3wyokI6LMIu3gKte85FSyTicRshSy0RusydY=; b=L5+SzP63bgPAWhp4
	W0cUVg2l9n9I+4k0Akz43rpejx4oS0/IbbWAmLMXE7C9F37E36sY/GsXk3zuJt0e
	7WRl8xWn74pDgWLAKB7VqpUweKGfDHpjZadrDE/thxVaWuDjHJ729famrINqKMDx
	0upb87A5cv2e3e9cOgTo/VDABpH4Tf/6q96s0WSa2IFCTqdWIxx3GVEJhdklhdir
	gMzNGoVv54cFMR8lTrj5sNzMMQDcUrBjV8bPTBpznG6YMJOrkgy1v18t2RPVEfx/
	2v3dDdCotvg9oshrPidheW6ip0HZ0YECDQHkCxRsQPUi1HLjdw3FRE6oVFrVR41W
	qvGWIw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vug4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-alpha@vger.kernel.org>; Thu, 09 Jul 2026 11:17:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c19493ac2so11529961cf.1
        for <linux-alpha@vger.kernel.org>; Thu, 09 Jul 2026 04:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595841; x=1784200641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mSNoqY3wyokI6LMIu3gKte85FSyTicRshSy0RusydY=;
        b=gtO1PuCPVSA3pcxofYSwzSptyCP8fplhGA0gMAQmi2dxDkJtaOaut5/NCmYMcZ66yp
         ANnNK9rb7kxDIPXzoyfVDt947Ta0of89XonsQf2ieDZ9TcHUuSK7ZKUfimsVYxjXJTJO
         kU43zaFkytMyc1foFpfmHGxGayaY8QZw1+eaUTZKTy4oMk9XSsJBa32zlN6H29CVuyNA
         rSSfYeAf1jGHIDl5pyypQVfyjMATyRCcOiIdur5rcViEEVLFcOtNuI1/WYo9Ufcvo0Rn
         vPZTO8rXfaXRIYTdSlFwq71J1495hyT9KjxVzsTQBjzpTY1aK9RZGnpINh1izwamCSLB
         k9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595841; x=1784200641;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mSNoqY3wyokI6LMIu3gKte85FSyTicRshSy0RusydY=;
        b=LC1Llp123QEk5daW+J1d9oqxvhR3NAAYhERCPqAEIp98w+kl7uPK+qoJZEFU3VcoU5
         vQ+RrBpFctLXJ6ycYTHsL+8eqy8/3hqJ797F0hHl7Ml1OHK/stLxxqyfAFK9F/Q52BmL
         wFGPwecZaYWt3EPV0ZMmcT7wlBxVhpjLTk7gcZPcLO2CZ8DtrdfZFQdUnWxiPKH8cxeV
         do1qPk/5OP2gYg69sLBa/5K66pEyBJSSepAbAEW27CU8T/N4w4z7LP+2dY52Ffr/9dkp
         5G+9dC3uTP4BVdRSuTYn+7KKfi26KULVrsbYQIuPvfKw3JqJT4XoBTkb850MKmSPodpt
         sTJA==
X-Forwarded-Encrypted: i=1; AHgh+RrxYE0c20qwxQ/dOesEFIBQXzx0T1+DdCpGTTyJzzUYpG5LI2geIQNq4UC+Recj8TOo0DySoMtC5j1MrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtVSFQFeN9hJUaqoX63brrS9NT6wYUut48xf/Uq0jPtB5BhQ0M
	FZCOz3V8PBDdI/2cGO3XOviwHSrCz90NgLnl426X4NF5AaN1vrSn1G7fcrentnedwTinIQTTymi
	Rwljx2lIHac/o6IvoocNo1k8WaRBHM9yiS9iG67iA5K+1vL1euhsut6X11Vn/UsLpQg==
X-Gm-Gg: AfdE7cmIeiVzJmHvC2p64DshXjFax49cXB8r4SW9LJXlcpgMCGBIikAfr7HWmrk8WIi
	cQR0CtKRETeSTGa7y/VpXuhzk7vLC4ZZ3VfWKBNbHiWKp+vO069F4yODge4bpKsP6HrFjNiurmu
	JP7M1rU0a/1idJxyuAcoGvRVbHv+8NxrSGXUGzJXqfNS8H1pP+DlBd62OaHtLLOVru3Jwwg8zn3
	4AG68M3hT1OdBP2LHs3c2XDgwluT/jM1NaeGXCnQUQ+cS2HqoNruFwwyNuWqbVBatN/C7KfEhyj
	iaexs6cb+1sWBQ2oV2293z5CD74m8uBUAM4wKfB97rT2MI19Qfy+wHfzbvoQ+kxnnlYHfd39BfP
	6RqZxZ3pGieEI6W4ZR+xh8SG2O6LTGC8GalM6zCzYJx35e4RddnR7DNH3R9Puqw==
X-Received: by 2002:a05:622a:c86:b0:51c:7b11:41b2 with SMTP id d75a77b69052e-51c8b51c97cmr72542011cf.78.1783595841180;
        Thu, 09 Jul 2026 04:17:21 -0700 (PDT)
X-Received: by 2002:a05:622a:c86:b0:51c:7b11:41b2 with SMTP id d75a77b69052e-51c8b51c97cmr72541381cf.78.1783595840774;
        Thu, 09 Jul 2026 04:17:20 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6cccfdsm54034235e9.1.2026.07.09.04.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:17:20 -0700 (PDT)
Message-ID: <8d15c107-30b1-48df-9e69-a7e8520f4e36@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:17:17 +0200
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 07/18] s390/syscall: Use
 enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, Thomas Gleixner <tglx@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
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
 <20260707190254.030598804@kernel.org>
 <499eca86-8def-4044-8b69-8f290528e10f@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <499eca86-8def-4044-8b69-8f290528e10f@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zO4ADq6IMswPUIbGggugEwFjfyRYX8rS
X-Proofpoint-ORIG-GUID: zO4ADq6IMswPUIbGggugEwFjfyRYX8rS
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f8342 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX3YZEFDE30A4t
 zber8yBW31rO5W3ukPvGdm2+kDRdtxOP6cbSQcznDrO2lbO3ITyfxOwq2YgpEufG34gYuVDlctb
 euh+a2hH+Dsp3Qn/pUqWF03va/HhNqD+iqHqx9sjnVcSMOtnz2L7+bcEuOVh2HhSvVRtws5SLvJ
 J75SCO1elw7qDj00ulC+7IEHHtwPKfE+8LpaBJfNnnLM1w6SEZy6wRG5BRwEaLQE8HNPnHlfd/p
 wrvEzw8SlRYQ/ei4bzqlY2XIMhSao7RZBifX5O7/FRczjQS3VhZpaPGleV6WQ/3pCtz942AJdY8
 qQLadIFndqs75VohOP8UJTW756HJyPELLs3Qgzf9AwI/GggdB5KEPTmjO55ZXzhjVxdxYGfNOFT
 vaRcWt/x/RQ8WKPVekHVngoDiBmCYgj77NTZyyaTsQDCGgfbh4+mJ4IDy8TZc659tJaLR9Qjk57
 cFyi8qku88TtyMwPn4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX8NHy1v/Wz71v
 /B4k1uY6tVHrNtoe/yZZHrsjTkts39Q+pvmYBO7PFgpe26GUJH1eGb8fJGrbgVZL6FAN1ukvlvn
 q0qlGVlxsBU7QyPqda14Pqpjn/TtuSo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108

On 9/7/26 04:46, Jinjie Ruan wrote:
> 
> 
> On 7/8/2026 3:06 AM, Thomas Gleixner wrote:
>> enter_from_user_mode_randomize_stack() replaces enter_from_user_mode() and
>> the subsequent invocation of add_random_kstack_offset_irqsoff().
>>
>> As a bonus this avoids the overhead of get/put_cpu_var() in
>> add_random_kstack_offset().
>>
>> No functional change.
>>
>> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
>> Cc: Sven Schnelle <svens@linux.ibm.com>
>> Cc: linux-s390@vger.kernel.org
>> ---
>>   arch/s390/kernel/syscall.c |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> --- a/arch/s390/kernel/syscall.c
>> +++ b/arch/s390/kernel/syscall.c
>> @@ -97,8 +97,8 @@ void noinstr __do_syscall(struct pt_regs
>>   {
>>   	unsigned long nr;
>>   
>> -	enter_from_user_mode(regs);
>> -	add_random_kstack_offset();
>> +	enter_from_user_mode_randomize_stack(regs);
> 
> The #include <linux/randomize_kstack.h> can be removed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

