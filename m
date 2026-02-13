Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77A834B661
	for <linux-alpha@vger.kernel.org>; Fri, 13 Feb 2026 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770973215; cv=pass; b=HKuLgeKhLXSui5OPajTFrcuVKRo36dB1MSJXWprfGW8/QjemhYts4H4uKGt4U9EI2OI/HxLtQd2hPkmGl4qSekTeh9kEA43lPoIUx5ptj2A43Zq47+GDwySf88vAjBN5ClToXYnwPiYnfaKGaAx1cJr4s2ixvHu9ZyBRPYOpY2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770973215; c=relaxed/simple;
	bh=lZYvmAEQsAPc1t2GOeZu2HnGJhiCzficu8nXzXlyUG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FmjCfzk8qgnBd+DxjTsUpRUzJaWvPz509/UAuLIrXvKSN8dFcUpkkZ96DFIAiQDik6QUXaVvwOCIt/jqGpPWBTeVZHSB6Rj9CHx6U/OnbJ/lYs1rK2EmtG5XkTgZilngUPMBIc6e5dzMFzSkP5A2nNHjvbpOe/tRXV10fQo5IMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4dfJOvh; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4dfJOvh"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65a35fc8007so1123844a12.1
        for <linux-alpha@vger.kernel.org>; Fri, 13 Feb 2026 01:00:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770973211; cv=none;
        d=google.com; s=arc-20240605;
        b=flX/jiRDovgQiKjLjPYnzTOCW/6JJUQxGaEFZSKH2P50G83cmnm5S4eS1FU2lHp/rd
         esAkiK6Y/12iD69smu/g1ZiyIAH/dry9aKxTKIvNf9ZzfQ7esbh7AM6Ql3rLJZD7T6MT
         TX4T8LhuYt8htgfSKxYzE9QAJ/+TU/DZF29f8thvCLcheSofLvKLN3lbs8XnTh0JUqXG
         /pPyF39dStUoT421aYNDRQK8zynwk4RyhVeFTwjOEX5uQa0nk7papKpmSRVzjx4J+UeG
         ZfpFXBHMQxV1x0LtmnZps7TcxJ6Ma63NHFcnXGkI8NmJ1hXA5iRoVTtYgwN33EUwr36k
         4nyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DDe0gGOEJ9baNVpzaTE7PnYNn+4MgjnjseCR/TA0WB4=;
        fh=6w9dxfvpQkEZLd/TCAl4/C01lGKbjoA6hkvhL6kINFg=;
        b=kJ9iIaL9RX6gXQ5ywxKBw6m68QQgY1wqQzgqs+jn/KhdScXbtiyrL/RLNS27fidxyi
         F4SL88m4Q0sPTkcim0JcjJTcCyhubVjMfsa7PSdXScl4JOmkj3ZDYp2TF/NpEIm2qR9k
         wDCeTpQ2rLxzskwqP4A44ulfp/r/tY5I2MzthXtyjJOt7NGT2MjG+3SJHohSCtJ4huwe
         MBloG2k7bWrsvGyvI1GJiW8vWVEYA3mcojjphg5lw79l3p/QPlSADlSE6oIWyHXdHELB
         AbtELrWB2EmBrqMvvm/xPe7n+fDAkQtn3Whb2IW3U47p0Q3z5NXtp+PctYnWwnSzQahQ
         6q3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770973211; x=1771578011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDe0gGOEJ9baNVpzaTE7PnYNn+4MgjnjseCR/TA0WB4=;
        b=e4dfJOvhabgyJ8WeATqYJQNrvheWei6tBaPkUuMo/g1WrEhd6Mum1Eca6E4nMlH8Dv
         /rMRajGRbpA1Vqv8tghqd4xfxMsTQUTSgHJ3vmIFxbwUdPukgSoCFuJ3zlkIOczT4Z6g
         eZEcXUWkl8UbJGvpJ4WNzoTCaIvi2fkCgaOi4NECi532ZYDoubFrbIHm47aVFI7UVJc+
         35Ui7zfiRQmDK7W2VYjaKK8iy25tSDTLQFk8RqxImEsQgVUCakH8tAaI6gPiWaUdBliT
         rqE5vJkfw+e1JfFgHlFvRU7WGHbV3CE3jDuqrPjYj0YBHQYn/Kr5dIIcyKKT35dWp+cj
         kl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770973211; x=1771578011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DDe0gGOEJ9baNVpzaTE7PnYNn+4MgjnjseCR/TA0WB4=;
        b=ZMwjWg5NbBQiGZPKBPFLJa5JBVsVjk46fTh5yqxzxJMVK1B8jlXVjnNvj0Q1ep7sE0
         nFxNLr1dWo9WihoelhYaNQwBTiUZcVcD48Xz89tihAy4rST8w4THEA7tseAunCS6gxD2
         MV3OG1BiQ1uRjXHtifuqQG0Fboy0Y+uCFTGA7E59A0+eZepSOKpW/zD1pajGjaS2W5Tt
         ztUrreK+6fIBuzVWtwnEMRNNDri7x6TwzCpdy1g3Xd53wsabtEbBKqBP9Vm+GYQ++SPo
         4jCMS2ns07W7G+E/31jWive4WzFug9JDcj3E8DxYCKRO/kUGPVkcA28hNT3l+Al/Nb81
         f8OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWuFIdapV+YQUKup6l+/u59aBP/UdZb69Se4JtSczu//GTAsBgjeUUG7lmqlxvNLdGpCV6JShIMUk1Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8F3r1chZ3Ivp0RreGqj8MfhsEGSMJg94omCk6/IKoPMVK5/jR
	/sz8Bs4K0fLsXpNcoFtkvjBj9BujmQODx7lenO3STqeMdarRHd7MKdtYKNgRfGrGDF0tmoba34U
	z0plIRZiFz/dFFDGc8Lb3z/VkJJba+IQ=
X-Gm-Gg: AZuq6aIDpRqU1W/9hLEPGep/mF8JsG9mM3kLVU9OnsizziEXovNzkfmjNpZpObRluUT
	mKXUkCS7u/VhPRz2qDwAyO2cTnc4bCk91nALWm+798ne7m3BV46hPZc2ShTyY2qRcB4UR8LytaP
	i0bwmSWL282Mny3Y1q1eStuLgKIBkR6O6fEBtXmpQj3q7IvgQAAMEGsmh+iG++4IqMl7McAj7Gh
	oCk9D6rv2xTXhKTx6kQKJg/mgZPRMEosv+gb6Kx6yedx0jD30cORVVsvW8yf2HfzGtUxZJOe6rg
	dMrQRaCeh0NFlKFkz2BZOZ6vClIhPbRE6gyALpv6aJhImzcKM1c=
X-Received: by 2002:a05:6402:5213:b0:65b:a76d:6fe2 with SMTP id
 4fb4d7f45d1cf-65bb12a08d8mr550262a12.18.1770973210726; Fri, 13 Feb 2026
 01:00:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213-alpha-page_table_check_pte_clear-v1-1-e037e3e1e50f@linutronix.de>
In-Reply-To: <20260213-alpha-page_table_check_pte_clear-v1-1-e037e3e1e50f@linutronix.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 13 Feb 2026 09:59:59 +0100
X-Gm-Features: AZwV_QjyZO4U-wE094XLWnXSf1UFq9BHM4Vgy0irOZNp_xKMsu5RbIHzfTQIqx4
Message-ID: <CA+=Fv5Q2PckE6EfyQJY-N8RMAsYG=wBkFLCB4+8pN6G5ZqWP3Q@mail.gmail.com>
Subject: Re: [PATCH] alpha: add missing address argument in call to page_table_check_pte_clear()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 8:35=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> After the merge of the alpha and mm trees, this code does not compile,
> as a parameter is missing in a call to page_table_check_pte_clear().
>
> The parameter was re-added in commit d7b4b67eb6b3 ("mm/page_table_check:
> reinstate address parameter in [__]page_table_check_pte_clear()").
> The alpha-specific code was newly added in commit dd5712f3379c ("alpha:
> fix user-space corruption during memory compaction").
>
> Fixes: 4cff5c05e076 ("Merge tag 'mm-stable-2026-02-11-19-22' of git://git=
.kernel.org/pub/scm/linux/kernel/git/akpm/mm")
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
> This should go directly through Linus, in my opinion.
> ---
>  arch/alpha/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index c9508ec37efc..e9368c54be45 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -289,7 +289,7 @@ static inline pte_t ptep_clear_flush(struct vm_area_s=
truct *vma,
>         struct mm_struct *mm =3D vma->vm_mm;
>         pte_t pte =3D ptep_get_and_clear(mm, addr, ptep);
>
> -       page_table_check_pte_clear(mm, pte);
> +       page_table_check_pte_clear(mm, addr, pte);
>         migrate_flush_tlb_page(vma, addr);
>         return pte;
>  }
>
> ---
> base-commit: cee73b1e840c154f64ace682cb477c1ae2e29cc4
> change-id: 20260213-alpha-page_table_check_pte_clear-e583fa765111
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>


Hi,

Thanks alot for bringing this up! I noticed this issue yesterday when
trying to build from the latest git. This patch fixes the issue cleanly.
Sounds good to me if this goes directly through Linus, if not I can
take it through my tree, just let me know.


Acked-by: Magnus Lindholm <linmag7@gmail.com>
