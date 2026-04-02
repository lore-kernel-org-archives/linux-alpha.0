Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B5839C632
	for <linux-alpha@vger.kernel.org>; Thu,  2 Apr 2026 08:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120273; cv=none; b=ZJYKSgNtBqAbkaTcYfShSogWfLNvhMJ/hCJUYT/Ml/IsjkAAMxkUIz2BGlfG9uT/7dyGoif9kBVTnWhM96V3RpaCFazO2iAnD3QesRID0FsXi3ZykLYZKTyWzkMG+S3rz53v0ZrLZoIXJa8FBA4xYeITxK3opKH8mIDUc/3Ffuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120273; c=relaxed/simple;
	bh=7tyJ0+wz5LzsOmdaY0Yimnd2RzEPrZZv3nZHEii7oEs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=roUQmyRcrCM7+5TMopO4IaFK89GsnrSWlWfaTUL+lrB4MTj0wr8WZ11n6AerqPdu67l2yW+qfNhyxyMWwqrjDapYfxDZkNTb/226z/011pxhU9Uy0rOhJWNNG5cFBDHrSCWUSExPIVu5seLIHPMCNtWbIAq/NEHB5LxViYD16/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N43yz0Pb; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N43yz0Pb"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso5763315e9.2
        for <linux-alpha@vger.kernel.org>; Thu, 02 Apr 2026 01:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775120270; x=1775725070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnQTQFMkaspyfTBlP7NJBNzFuL146lWNPT7LvqeL2XU=;
        b=N43yz0PbY37tKQwLI7fxz/TezjohnBPHceaTDSIHXJZ3lR+l7erEdzyuYI3/5fRC/P
         aKbwZiXH/cRosXudrYOUKNUT8TPbaLVOs6PeIW/HuQH5TsnCf4Fm5Sgo24YdKsa6ii/U
         /fju0wbiv5lfrFjides8gma93qJvGrmo2JqMyd4NJj0a7E9wY3w+nIAyjyJTMEfvk7PG
         g3zBjCmG4+hbFTu/luNZzrq8m7P9/XsoiMeRQT/rmz73FwKb6JnSjpaUqV0ZmOFNtuUi
         vKFA8PaRd5wgturtCUT32KaTz75xIUFFg4zOpfG2jjDwyipSacuYVDVzYgsXBFUpnDzh
         LkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775120270; x=1775725070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LnQTQFMkaspyfTBlP7NJBNzFuL146lWNPT7LvqeL2XU=;
        b=ieQyit7MevjX3SO6d8bF3cBM6VPP4i1h22nFjLHZGPPLEsKiAByk8NiJ8YAuhgkgQ/
         7Mvo3FSAs2PP41+htqCi/Fq6V4CNc5Du2TGin41y0hUWrN3DfgEt3Ux9JtyBaD5eOpXb
         nsQiBWp6VMg7I7lecAHVd+QfbLZZg8aC+d2kNYda0MxcoqgnDDGDH0guR2FKH2q8CLV9
         p8XIfSoQ8jhXuddhOp5OAQRNt5luzUFrEByJUitUidoNyWSRrtKgHAI65KJR6s2zOIri
         czuEv9pTlYLuuuByqT9qDymxPScNpaoRNjzerAL98XaPDlY/Bx+YtWsgg5TcwQlecS60
         PNDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZoXR6X08k/2nGM3mph5YuHjNy1e24ge8TbQm6c8734p+pSg4HFMyDKSTAxnHq+nhqDT8n5pYGMvrxfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ThF6pxh4Ypb1CGRx9mS9/cs7BwCiVPDOFI30yjr1D9BvHbEw
	ZFSEYSiD34g7fouZOCE97EsKOQMdxDkl7MPZOzCT4RQLwt8KqVKdHmTl
X-Gm-Gg: ATEYQzw6zKt538ashN1TelHyZudgiHleM9tDWBfpMUhMmVp4aqsV2pKq+TGHjbt++c2
	GAs5JZFLrWi7YSN1A7kybrgIDNv9oStcTm5VS0An3qqKd3yEZ6NWTdI2EpuHuKQCkFAzqfA622I
	o2LqRzYmNMGP32642Y5/xT6WAq9AZglUpSaV0z4E8R4MLyzZG+vXf9vrN5nqWwfMZ1uBtomTrPH
	ArGAxVc6roqKk82R2yeGeAgWGAxuQxd1n4xlo/gHWotipet+YsdjWDHEoGQotlKrYuRfrBHF4Jq
	zNTAjFK3+mMcJYEidGmp0vaXRl6/9UoBwoJ2OAMcMoReQZqpbbXhE0WCHSHtdxu/sXWrLu+2Fo0
	Ms/8y6viQMr1L9CRJxQs2lejMDZNz4liGcMAlikJT05e5kmptCfxRaGxYdZZSmVBLCGVcKdpbXX
	Y5mKCk9bsq2e8NTZ/ScS+8va6Z81ZNtPQQCXRUHngSWoVin+MEgi7izoJ8TMpM
X-Received: by 2002:a05:600c:630f:b0:487:288:1198 with SMTP id 5b1f17b1804b1-4888359da58mr102555095e9.22.1775120270131;
        Thu, 02 Apr 2026 01:57:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e735532sm217845265e9.0.2026.04.02.01.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:57:49 -0700 (PDT)
Date: Thu, 2 Apr 2026 09:57:47 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner
 <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Brian Cain <bcain@kernel.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Christophe
 Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max
 Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, Jakub Kicinski
 <kuba@kernel.org>
Subject: Re: [PATCH] cmpxchg: allow const-qualified old value in cmpxchg()
Message-ID: <20260402095747.6efbd456@pumpkin>
In-Reply-To: <20260402-cmpxchg-v1-1-4561e2c05d2c@gmail.com>
References: <20260402-cmpxchg-v1-1-4561e2c05d2c@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 02 Apr 2026 14:56:01 +0800
Hangbin Liu <liuhangbin@gmail.com> wrote:

> The old value passed to cmpxchg() is semantically read-only: it is
> only loaded into a register as a comparand and is never written back.
> However, the macro currently assigns it implicitly to a local variable
> of type __typeof__(*(ptr)), which triggers -Werror=discarded-qualifiers
> when old is a const-qualified pointer and ptr points to a non-const type.
> 
> To avoid this, let's add an explicit cast to __typeof__(*(ptr)) for the
> old local variable in the cmpxchg macros. This explicit cast suppresses
> the -Wdiscarded-qualifiers diagnostic.
> 
> The new value is intentionally left without a cast: new will be stored
> into *ptr, so silently accepting a const-qualified new would allow
> callers to store a pointer-to-const into a non-const location without
> any compiler warning.
> 
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
...
> 
> diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
> index ae1b96479d0c..b4b8dac759c4 100644
> --- a/arch/alpha/include/asm/cmpxchg.h
> +++ b/arch/alpha/include/asm/cmpxchg.h
> @@ -234,7 +234,7 @@ ____cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
>  
>  #define arch_cmpxchg_local(ptr, o, n)					\
>  ({									\
> -	__typeof__(*(ptr)) _o_ = (o);					\
> +	__typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);		\
>  	__typeof__(*(ptr)) _n_ = (n);					\
>  	(__typeof__(*(ptr))) ____cmpxchg((ptr), (unsigned long)_o_,	\
>  					  (unsigned long)_n_,		\

That looks like it loses the check that 'o' has the same type as '*ptr'.
Maybe this works?
	auto _o_ = 1 ? (o) : *(ptr);

  David

