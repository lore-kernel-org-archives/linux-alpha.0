Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6DF367280
	for <linux-alpha@vger.kernel.org>; Wed,  2 Sep 2026 21:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383356; cv=pass; b=VTZd1Q+Zin+L6+AAA3Iinjcf23pVAPlGswQj/+b+4WLPwWB11gbAH8ScLeceLMjKQnDAon1gNdT0UZDWltmibcCLMdOwo/Jsn5+S7dcV3vF/ERVLOtwmMo1A3JG75z6wS1sblUaXxDKMOGpFASuhe1jyR5qyiUyEluTMyoWCVfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383356; c=relaxed/simple;
	bh=6LAkCHWQ+Xh6b/xHtFhNwl5IQ0yXktFR8/LntIm839Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s1h0MnwUMqHOrlyXyqi4om5oRZFKEvIZ/kRy0bo3A8q2M/1B9piWLIds6sh9jn62/AMaY0YZFE7KSAtdcpDj4FuZQmRUTYQp0mwUNDtG2lVRWBxk3c0S2572VLRp5yQ+t00CPmfB6fVG77DG/CI8xNAK+tK+uedd8UrQyTvUYbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBl4TCqs; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBl4TCqs"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so2584297a12.1
        for <linux-alpha@vger.kernel.org>; Wed, 02 Sep 2026 14:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788383353; cv=none;
        d=google.com; s=arc-20260327;
        b=boouZ6/Li8l55XtR2bChdR7TV1Zz9dRBWfr3tnrJMCFss7yWRGRtVi9FD0+vEezVdu
         Us7M2r957XyvNcV/tsgd+WFTKkJ+t4PKYQ20dt1upZTTVKFKxS6+568ljTj9cOOOKxrH
         2Z4L5d5dxc2dw50ZFALoLFUnW3sqIQFl/287z8d5xxzxSqXAsOOJ50rlEEU7EnnlmjHi
         ZdvcqfZFBgQDnzOUXQJRElaH56PMdE4zUfjDyyl5JM2SZ5cWEiEMykvRFk5LVOOCVPyt
         NuauCn/v1gQ72LOzo2W0R0DMXdsMcYrf7lQyFuIQlsYEoctjlA7ovAmTwH7ug22PdkDW
         hbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITS+WCs3MQ+DxFTvKg1KfeLAgxV5qMgoTbk5uHwFoBM=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=YRsXVMSvIU1PwCGi5+Gx0DlWvaw7xnBMKgbysg9J78O1HqZXiI4Gw8dKGVZRl9b5I0
         cs1y3lKdeZ94jT/jLJ+/S1bMBFxIC+Bq91x2up3Lz3qMBH3yEkUZWYdL5ABt4/WX8gd1
         zRjwAEvo1yyAxpk5oizioSXkrPtOn3AQn0nsSBDQUvL3Wv//s4FByQQZnfBLLfcLk4zA
         b+9WFQXLvRbUz29Jae/TGKpDtYTLC/H2Czi+v+uRDSH1WJw/xSc1laEOjsIBeu22rNME
         CKE/RwM5WE29bnrC5RItjeNycnhS+Vpyik2PZjT5OsPFHjUD0Eziqudi7VTuDK5f5dz0
         dBdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788383353; x=1788988153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITS+WCs3MQ+DxFTvKg1KfeLAgxV5qMgoTbk5uHwFoBM=;
        b=iBl4TCqsWtNlLuYkGp4RYBv1wcu+8ol6hSmA3mas7QmVEkztcygaUgW6gitn+zt0R/
         zV4lLIC1tGkdMrVm30eV2QTtx1aBu+7LSJ09k7Xf5pBIgcV5xXGiGLoa043bbytU7ZAW
         wXBVMNnNTDkT23ZNbcLli+yhEdZ1JasrywTo/DVwfG9CsI6TrNnNVBbVlMZuMCE6PRwn
         lLGhUBkBwhBKcAfLvckVr/V7DNfsKg9N4qj6YxfwCJA4hpPEif2QC/6A3n+Pzfhv6N/k
         7xtMjYUqnThEpcFTgSTCNs+qEk9ttOzhop97G9ve65l2zLk7QEFBNvS0bpYuOYMfNEVu
         Po6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788383353; x=1788988153;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITS+WCs3MQ+DxFTvKg1KfeLAgxV5qMgoTbk5uHwFoBM=;
        b=AFMBznt/J7F9oYys/eL4JDVfejkfECE04V0ReHC8UkfBNZj0nG1nWLuUORELuHkYU+
         uIsgFu1dNhOBpJqCQLqJnpr5kH8UtoFvAsy+wzDVaSopbe9vj9ZKlCYrNusAmBub8fgV
         G/hm8ehkYwYklvwmen/6QpDEQUd5LCILu/knZtqPcItbTgh3EvfnC3V7jjg3MbLS8gz6
         EmlrZuFqIjTvPWP86D52KKe+YYKKcKJ+zzpFvJw5nemePQpnAALpV718/A1GHrvvlB3z
         7cZdd4dQNPYG+3xufuRyS6fgzuL0hpAnblNXPkfT5Y0b87rzvI+rhwMDnJoEhdSe/MoR
         jh8w==
X-Gm-Message-State: AFuF++kFkbe6BxgHZ6DyfZP+ia1Eajfb9AKKjo5smj3QHpNTv8dRUJWR
	a9aKDvfxPvfOaeb2SVX9PSYFF+0cu1pem7pHXFvxqnuexALdJL3BGOwrdJDB/KH9Rze1ZGEdimS
	CmZi9DAjAyu7OUK8O1x6kCaoC2TU8eQFBA5ErcJM=
X-Gm-Gg: AYBFou11UjSHRwH5350KT8opCnP81CTQLGI09Tq5tpgKY28RpAG5PnrW3pZ0qiD89a0
	PgT+2579qfTRh/UPXxXg6vIGSgVsxY3kGxGZAaAPT7SbIREKrTQxChmTY7+ZHbu+bUqfS75nSW1
	oM6K89DLeR+N/9zRnCVeQIrPxk1kt+Lm2FTOEIff4tqPWl3lNBAxfmBJ4RCOukNby3KkHKUbmrM
	/oCpz8SQ7xZS2XsvEQk4iw+AV1VBY0iL5LSzb4AcsIYMjXMt0VMymYJd3fIINEJstVZLx0Prc0d
	s+urdAELsflV6uJGUSy7rD8+YcUGMnWmZkgsxWZpaAQ56MbcM17LEBDkZ7l4L5c6UHMMqeeaQe6
	8CGSdAqofKsO5JKmj32S5OoCjb1PC3zZx
X-Received: by 2002:a05:6402:52c9:b0:6a5:f203:ba4b with SMTP id
 4fb4d7f45d1cf-6a6832e4e4fmr5407484a12.16.1788383352594; Wed, 02 Sep 2026
 14:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <96d45353c7c29cc3aaa3234bd960f38d2ed8889f.1788277742.git.mattst88@gmail.com>
In-Reply-To: <96d45353c7c29cc3aaa3234bd960f38d2ed8889f.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 23:09:00 +0200
X-Gm-Features: AcwNN1Vnd5jJKP2ps-BJtZ3f17q-K909CEW1Vx1QOhe1D2REOQkwE3-6KhQqV3s
Message-ID: <CA+=Fv5Q_=BTtgA7Ypq4fE+cu+5Ui_BKAgC4cW38CR-Owqwtd_g@mail.gmail.com>
Subject: Re: [PATCH 16/24] alpha: select HAVE_GUP_FAST
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The lockless GUP fast path needs the architecture to distinguish PTEs
> with no struct page behind them and to keep page table pages alive while
> a walker holds no lock.  Alpha now has ARCH_HAS_PTE_SPECIAL, and it has
> selected MMU_GATHER_RCU_TABLE_FREE for a long time, so both requirements
> are met.
>
> PTEs are a single 64-bit word on Alpha, so the lockless reads that the
> generic walker performs cannot tear, and no arch-specific
> gup_fast_permitted() or ptep_get_lockless() is needed.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>


I tested this on an Alpha UP2000 with CONFIG_HAVE_GUP_FAST=3Dy,
CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy, and
CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy.

The in-tree gup_test completed the get_user_pages_fast() and
pin_user_pages_fast() benchmarks with both read-only and writable pins.
Each case ran ten iterations over a 16 MiB mapping, fetching 123 pages
per call.

All four cases completed with ioctl status 0 and no failures.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
