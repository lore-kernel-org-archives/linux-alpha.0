Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555163B14BE
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 21:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494928; cv=pass; b=LFBIucj+8DqGItOuv6E+y4oJPH4bCzCLjuTMjqxqng0xqx3vIRb++r5BkBlRELEU2cbFEl9MbP/VOty+PZIR+gBEqdb4xgPnDNLES8YWEJr7ffZR6p5VfcRSJLNnSnqdNP+c2c7ARSmj+v6lWW+qCBOgkEcky+YAddDTjDWjSzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494928; c=relaxed/simple;
	bh=fUZzaM1SKbqdW3JJHyHXI4KVGCOzVMsele/HgdjkKFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9eLRDzaYggcEDkqpwOm6oc42YOlNgHiml8epRPc5/k2SmHnQWAMxOS8TDxbrefat/O2+AcdaEYONyOXjs+0LJs68ElkMgt+KgkfQueEX9Ew9bQx/aoX4ZD2irSdTvUQUfEWKne5L2yke017NV0YHWRt3gG797Xo0Uun2ZNnHOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boMZ8f53; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boMZ8f53"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e4e37788cso301402485a.2
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 14:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791494926; cv=none;
        d=google.com; s=arc-20260327;
        b=L0wIW2WSqXXTzYejj6pvSu3TFtN5Xglx/bMOBpZ6wGRX90k2rg1xqxRPZepDP4/JbK
         pA7kl3qfO1ADqmDibLE54i/jtUd0e3I4nk/m40eMbghpHfNrOyRWnkFpfKeWrmUlLv+E
         FASLpIRD8ioOQawgjjLt5x0ULN9aabaYzkjKm0zhBwJc/6XiXWtrHArEIwaAwp8zwtKj
         aRvOQJvQGLZ1eLsoOsOcxi83FPROg6RtGs0Z31qGEsZIj9olhgpdR4G0wv5lQJjjH5+b
         uTmvwUgxAo5PhIOQgcqk4vfECqCuA7fnPsnc5u0Ffff7jpTvhjVZdjMHoppVD/6ryDSg
         i9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fUZzaM1SKbqdW3JJHyHXI4KVGCOzVMsele/HgdjkKFk=;
        fh=QqkcREdPJXcGRvXh+4hnYgZPdJyWIdWdAyKBQ4so0RQ=;
        b=r7PbfcWT21Hn77eMkv9JQjGScIXJsJYqmSPuYZ5DeJzVRrmxuD3JwlvfzB1kvqflJn
         /7zAYi0hhhk9QJrZHJQhGJM/fojA9wyWEUDXQRM0MbUabw3tFVUj8WMiSFPfgptZo7DN
         J7iWvtp5tIk5dnIBsJ7CEGdHbkHK6oioeC4tbNnkGX5612Ieb6cqOp/lV5XQAZ0XkMfy
         VD5keo09QATG7oDQJZmN8+gPIgH+vCpInZpvNfiT6w24JvgVy4nnMRsZMt32L9ZCrx/T
         csAuChEHD1IMNaakECaBHbHZVtxeLp4/k+Wj7Fl2ryUFEYGmuypzGscgXUtXsIShym2K
         YFCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791494926; x=1792099726; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fUZzaM1SKbqdW3JJHyHXI4KVGCOzVMsele/HgdjkKFk=;
        b=boMZ8f53+xBhpSoVelH00iqF8x10h4+meXcCUWzBHey8LjNmIfIVbqZmmEexbcTvFG
         he446YJcgGPHFugkGuT+roTmak2ktCciJDrvpot1x4uFeglIt5J51H2kVJr6dNjYh8i5
         waL2C81DMo+uWA4Y9xJ8oB6HoZDVO/v9z7g6gEgQ34I1GhC3xgITDexMZcsg6JpfDvms
         oW9iR0m4gngNXJdKONDh86YLKQiehEjEwd4FR2hevPc1K4zNDMShkzfzitIOyzUS36SJ
         7pXGO79LLqfEyk8KtRfUicykue68ch1AanFvcdGVPhJYB7o++Mqq1aLlj5LjIFgB1mqI
         k3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791494926; x=1792099726;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fUZzaM1SKbqdW3JJHyHXI4KVGCOzVMsele/HgdjkKFk=;
        b=ihlCmrJ6xKGXgHtNYRzn8t8+ZnD5lZFaR6mC35DMf0ePe1tDCbvCGc/mHG7XLSRWOd
         ckg+634yljXXEZhQ6wRD2D9/vLqwiSpIQmIQ1gLTAnBwcciV+aKev39DH1fax+q9U96W
         Qam65lPF4nYdyRFpi0SuTvlwsj+G8AbMjxgfFjwuO3AufscHu1uHII+9SXm4jtVSUP6X
         cyKE7EnANLzarHLRf/E5b6W5oetRI7DbI2gmJ++IZkslHTU56z1+p7WGWYY0Ro7fU+Lx
         VEExfS0vdv5jr59yAWEBF5rjTzg0PcFTtUQK+wQ9kkE+CPs43ZA/q/xvdzVgG8NvBCQw
         PzoQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6dfDUKLb+cUF504+w2jlOpWF+7kYID1lTQm59sDpn7ypj7Y9PcoEV2WCK0Drw15nmQQ7HMkDwJS/VAw==@vger.kernel.org
X-Gm-Message-State: AFuF++mXFyQoOqsRItzM8boXATLjScRUHifd0ysegzImdOqg9vfYSDUY
	xoLlA9djVU5BW0wLT3CxwW+vjb0MyqmEkK6isDalG2NegNx+Alx8/Pfxqi15hXQAOxRa9gnGBom
	ewYtJSvl7IMrp4JrKpGXugEKl+f/qfFE=
X-Gm-Gg: AYBFou3vjojPBQ/UMvKX8V6Jod0zYSQ+pWKh9GwIY4OQyo8kzS7bItUhKC60zbVaJpO
	LPKF+kuDk57nFeaHn1AbDefubZx8Xu5nG0N+sMktTfkjz4Xp2WusD+bPhR4cTXcRE5CtfwzBYzk
	oZAq1RL1WdgL40UOGFkE2BWecB7qPvDJETcGYfg/pgbp0/zEdkJqeitbppA7tpB6v8A9koVX7Re
	mCd95mJ6cclCTsXApPGvdaBL7V9RxA6uMj3AQBNV7GDcZpylXk68Q9DGhXkZj/IQqrRid1TL6E7
	bTKrpbE4+lxqJbWP78+0BRrj6NhWIuLhBiVS1R3Lltm2lCYuirAa9IpepV6lf9nGqh+XLe63XTk
	2/7qaZu05RFFSkA==
X-Received: by 2002:a05:620a:1b82:b0:93c:88ab:3482 with SMTP id
 af79cd13be357-93e9b733306mr1312623185a.29.1791494926142; Thu, 08 Oct 2026
 14:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923074903.862898-1-linmag7@gmail.com> <20260923074903.862898-7-linmag7@gmail.com>
In-Reply-To: <20260923074903.862898-7-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 17:28:07 -0400
X-Gm-Features: AclHuK92lc0jnVJwnxxG37gDnBiAxy_73BctfMhsZYZmEx4Gt4Oo78g8F0khWvc
Message-ID: <CAEdQ38EVzFdn49rBj9Et6JFGiE0amUFbxunqzP1qf4FGZLS=VQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] alpha: invalidate the local context in flush_tlb_mm()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 23, 2026 at 09:47:49AM +0200, Magnus Lindholm wrote:
> The uniprocessor implementation in asm/tlbflush.h already has the missing
> branch. Counted over a fork-heavy run, flush_tlb_mm() was entered with the
> mm not this CPU's active_mm 2934 times, and 632 times while otherwise idle.

With the hugetlb series applied this path gets busier: every hugetlb
flush there goes through flush_tlb_range(), so unmapping or migrating a
hugetlb folio from another context ends up here with a foreign mm.
That might also give you the reproducer this patch lacks: move_pages()
on another process's hugetlb mapping, with the caller pinned to the
CPU the target last ran on.

Reviewed-by: Matt Turner <mattst88@gmail.com>
