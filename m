Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EC72F49F6
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 22:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302775; cv=pass; b=aYEGGlBEhaHwkiJvW4F+Rn3/FuubvgFGBKSK6gjFEMX+PUs4WQIkQ0cxT19VfG1A/nV4596bLjR+ojy7MfwH5H5sxecLFxKJLMBtk7mCMrhC49i0GsJBNPGqrjRfLb5sKY54tc3jxpUllHQxDPh9tD8v2PQ/D7SFgj53buXyngo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302775; c=relaxed/simple;
	bh=Y7wjL8aGKHfhrB8GHuhTYqkPVVwHctoCXeQ0PtR50jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjncHT2bbqoR011T16fqoZcxP8LNBau2TAj3IDykyWVJWnEaB6czVehva2QnN1UftRZbchb1eL9oVIHA5h8rxq3s/49bTkTMGOGAUyq5kjpaVksc+ylOuXTwQm746IdrF4vEOpGIxVpYC7O9rANhIX8gDi05Wh03c8YL742y8gI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDpr994m; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDpr994m"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso604760a12.3
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 15:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788302771; cv=none;
        d=google.com; s=arc-20260327;
        b=frPveKaanMWLw+bmRpCQ0WuBCFfoNJI6SA3nvss3xUglH6a1vpLPw2cnxdAHM4NGFq
         q3tjSHLypRD+E+DzLtwzNeCK7oQjtxQzm9aJ+rm8+rQHcxoBBkEIIXT0oY26J57zlIyr
         bSj+p7vQKrWDmMK8gYXz+qymHu8qsTR9UP1omrLTx2d/bgjz7g33AGr675+6UG1TpNYJ
         lCKRfN52J5cJPSmy77B1nHpD2N6dhIFJHArdAwr1ndg3BP3s/F4oMFsyPN4mII55MrxB
         6RTrWPCp9WkViYHlr1nq2iOj81t/zLXgeHgx+JG3680idaXg3Mq6dRBHkXmBMwXQriLk
         lN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJSSrp57ik5SuL/p9XOeoiBv4DaL3YaC46FXR+QQSdQ=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=qDWwzTYhfFHLitj7XliugOsRfRFBwUy4UtGDL55svqg9bsYhF9ipOJBVNggKE9lOAZ
         OY9CSv4ipUYQ39Podd4huKxPoPxRiSREk0UdEDagJUEj2bhwJW8mfeeugzfWCvme09wX
         neIzyVWY4YQlhQf850l4SgpmmJr/wd/sFefSl0HrgUXCD4/cFIj5wsmykn+awNJd4B3m
         xmv3hr84BGbJUeMIfy9v3jQhf+vYhA+YjqoQm83TnTgM3A9vO8sulASSYkNkzRdn7ruz
         NXEN+YO9Bbi3/kaw50Dt1mfuxvwJ9L59dQqD+AFPfSSQS5snqXW4mIiHY5cZlCV+64gY
         5jvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788302771; x=1788907571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJSSrp57ik5SuL/p9XOeoiBv4DaL3YaC46FXR+QQSdQ=;
        b=hDpr994mTzyhN1uBUQSgXLk2Si0zmstdy8S1b0jLLvhC0k2yzaeRfQOvT9vu4hzoh8
         vXPgvteRDTZBGVN1agQsK0StCi9rFXezXZn0nCSb2nbDjOwmX3yI8el07q2QVH4hC6tK
         V8oXbuvyECcY1b7bKKFuVCR4G8FfMokgFeSVKOuJPTK8nAH5VkCg/x8hI8sk6mnsoN0i
         KWpasmhA+ec4tPN9roC+/ug+xmFqtSqpWwbddnAFd3K6Ia0OaE40Z67iEAhEO6TR69Q8
         Pk+He5WiL21Q2CXrbUMaQ25l+Fe4MmqB7n3Z698YPT4Yppzlmwr67E3Tnc2lUmKco5yI
         4qIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788302771; x=1788907571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJSSrp57ik5SuL/p9XOeoiBv4DaL3YaC46FXR+QQSdQ=;
        b=EYxozXQzMVp4W9RcIAx4xWwngMFcQrQxvl63bUziaFNUPmsQnHQUnJNC+oDZSgO+7v
         YtH4n1f4F0gViqs3cgAeNwY99Uq2TTKSMzNbsTMVBMLDt88KtqLcjOCQ47N3nL8p7uOK
         rT4TOVBld4fvmlN3L3ARaQt9aOgF/Zqx2FNhpPR7b8KfAY2gymdH+toVN6e6I1willqw
         eJcrciYUrsUW2TEYYk9dk9VZ0/cPtIPbg+x6T/hFrXeoKDJHCuOmS3Sp+YsP33saWEVl
         lgv/BgMDcVc9BrwjHvry5iSgIaJTfHX8Grg5Wh1MgJu4z9juBGvIzznEdFPnIdXImFSv
         0NZw==
X-Gm-Message-State: AFuF++lk6gXRO9dGmS491fm2eb10X6FaOM6SfKD1pANYzMjFWKA4bD99
	SroRohx3neormTho4pOY+XyRX1fsHGPVGCi4c1LE3nWGCvQDO7e+EPcjg2mtX6V7mU6/8UC3ju0
	/WL6A7wgQM7xzIBjSUsknzvsa5gaP4RA=
X-Gm-Gg: AYBFou0mn9IqjY+z6NQZ9ctH+FBt2/An0eTD9bUjWXE07nzIDCfsnDvomCg3VDLqhOQ
	3hRHn3kHRhsWFpA5iDb4ZkmfYo16q28s26WU000uctAmH+92rjwp11A7aBWvBeHMaUC8cjuAoil
	vRQuNTUkfNlqgu1IOlVG42SFDbeK2Ncz0AdaPzIAxDS8vla5c3i9HAteRSe8np4UaIna/UEAhKt
	Un5KmYr4Im3ZUbg5YIhBsMPJz0dvPZH+p6wWX8t57hg+++CjBkFkTAw3UELQsJuA7D5HkeTD9UA
	kbLFL2V4uFHXH3zSB9KFuhlu855bRPXHYqG1PpPoBBo2rGONvGwUbNsZ04Z5OyB0tkR8Rr3rJA2
	ZnS2pGSuiGVN44GD5V71q9Or34UGBHuOqw/MVilptq0E=
X-Received: by 2002:a05:6402:218a:b0:6a5:f912:b092 with SMTP id
 4fb4d7f45d1cf-6a68257bd75mr526660a12.6.1788302771360; Tue, 01 Sep 2026
 15:46:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <5ad0fa4995f9b0e6aa4af672e987a9b9ee43645d.1788277742.git.mattst88@gmail.com>
In-Reply-To: <5ad0fa4995f9b0e6aa4af672e987a9b9ee43645d.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 00:45:57 +0200
X-Gm-Features: AcwNN1XTceI-OuMu6yihuXuFe37xXWvWHcZG-GNRzI3Cp5FuDhD3aeZfLumOfus
Message-ID: <CA+=Fv5TE5z5MUObofTPJE5jpbBLS+ntgg+6B8A9GJibK=GDPkg@mail.gmail.com>
Subject: Re: [PATCH 14/24] alpha: add ARCH_SUPPORTS_PAGE_TABLE_CHECK support
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Add the page table check helpers needed for CONFIG_PAGE_TABLE_CHECK
> and select ARCH_SUPPORTS_PAGE_TABLE_CHECK in Kconfig.
>
> Alpha does not support huge pages, so pmd_user_accessible_page() and
> pud_user_accessible_page() always return false. pte_user_accessible_page(=
)
> checks for present PTEs with user read access (_PAGE_URE).
>

This patch does not build with CONFIG_PAGE_TABLE_CHECK enabled on
v7.3-rc1.

Commit cf8771ca4cdb ("mm/page_table_check: Pass mm_struct to
pxx_user_accessible_page()") changed these helpers from:

        pte_user_accessible_page(pte, addr)

to:

        pte_user_accessible_page(mm, addr, pte)

The Alpha definitions added here still use the old two-argument API.
The same applies to pmd_user_accessible_page() and
pud_user_accessible_page().

Could you update the helpers to use the new three-argument signatures?

Regards,
Magnus
