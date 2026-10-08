Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3B134E744
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 21:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494388; cv=pass; b=cv8u1hNWfi/6Kf6TO5Ao2emt/9KFo40yMLOZ7B7N7LB+5pTsCHaigfRhvZ4AgzGSKPbbkaw8Mk1dj0xP6veQft9pmB7dp5Risl+QagCfiLkiEXg0fHvlgeoWFUPKB1MHWxTn/6uK8P9WUTyPjMd3a+aXRa2eL8s9gOBnQQegQng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494388; c=relaxed/simple;
	bh=RyQawn+OV1mo2o7XZ+wloEFr6zblvaiDgZw4ztEBr1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NrlOSefPBWz/7zL2E0YFvmhzXlBA1Wg4ZWVdMP31hmncg2TIp9SmcJuorv5y75n61hjidH9eS+mM3UedRakZECo+vyBJQSenfk6BSncam7lFNF4FQaQei9Ru5gjUZCdl72qxTw5SYGOW1qsioT9h7bx77Z8jpgn9u71/WD4lNLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ja4WD4f8; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ja4WD4f8"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcb2ecebb4so3182073e87.2
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 14:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791494385; cv=none;
        d=google.com; s=arc-20260327;
        b=TObZGBm1TyS7hqeog8669t+bjMKZ2tICxfVxZbOs289y68ud/jKS9xQxR/obXUOmSK
         zWPohmVIk3kv+wuUI0iM97KfGmjA9lYMRPFXRVr9CRAPwWkNTo7MSk8+Wc8p316IJNDF
         KYMrX3VJi/6Ww8aoII0D4Yryv1E+pHfq5y52KXZMmjzOwMpFBkl4cGWyFbHTOh7rAENP
         ewqkmaMmrwOHb4hBYcVivoB4X58WyrzWZRZJ9IFFpcaJQiOmQPZre7L4pkWKB8J/m15G
         3Zt0dbpwwvTUxsj8ATGfk2rh9CBILMb52ASYNHP1YQXXXlZ7rhOS1V9UVkQMqelHs80c
         sHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RyQawn+OV1mo2o7XZ+wloEFr6zblvaiDgZw4ztEBr1g=;
        fh=gZWvgwCHjA5PuYtJnGgD85Ubtf/6GAdxE7NhMU/GLc8=;
        b=QAb8+c27EjwFiRjir0rAO3CQmEaQP2MPoRzex6Sj6IUm9iupPUYREi0iiDlVD2oaMY
         9u9AKVYh2or5cc1gAWrxdYZsVDvz5z3of9kMrSx2KhCYYqOyhKOY8W1fvQFJubXUqELN
         AY3h2W9MqHm5r8iOa/X3ekNHM68dQY9eiTfAmW4wif1rd0OJGALRxPQq2KzVb/Ckzvbk
         LcP9WOPG3ur7+rNCg4dME2p4SN2IkiF9LoMP4AuVb7UX8eRAX4pKX+hFfX0jaPkO0X++
         6GD+wp21i51rEUQjHzyG76eeE4xrhz7x0MOHO4lyT+FAnA/+bTgSxSTppbR3DAN8AcTb
         iivw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791494385; x=1792099185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RyQawn+OV1mo2o7XZ+wloEFr6zblvaiDgZw4ztEBr1g=;
        b=ja4WD4f8VJBVxV8fTXVRliqcL7E0Vq+0K/yxwnb/VrTN6MYQq41e28iWVPmRc96mYU
         mWp0nHDAMqXBicZPv6Um7S21c8aEXhmpGO4x7Yf2CYKt3+faXpHp6aA7k94gnFtZHq4m
         6YPnKROVnnqnbXaB3/VmOz+1YBXe7fNBjrwrbN7bn/Ux5wIme5P9+8yx7k5FmoxuLOQS
         6mtrt+hvyeGtmIbHHjhFSVNBYjqnzgOrQ+QUyacCOx46whmxdvV3UDNlQfe1mWH4Rm4T
         BnS8MUikQJVmM9wYZpzMPLeKDCvi0/Kpzvxe38dH57GiVyiRsBC1T4sXwgsFVfCvWKMq
         B2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791494385; x=1792099185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyQawn+OV1mo2o7XZ+wloEFr6zblvaiDgZw4ztEBr1g=;
        b=PzEyLwp++/KF5fXEoYhZmFfMRfpuFJBixULy8B1cbZxdFoy3hcDjnGVzf/M1KRDGWv
         T5e0r7vU/H+BB5OTX4SLP7a2BpTKpeo10LIF2sPtGmmsk8KkcwswgtZVlk/X6AeGfsvD
         C4CFUgchOrFA8MH0+v6yIZlKT72bg5fF6fDAMrX0f8sg4RuF4kU6UKs1Er906Y64wRus
         YU46k77SXvbTPCQsIz9hHjdjXuI55Ng/oPioyiJ25m+zEyvg6t43KeWgLudw9KEL3fS5
         L4+2nKZQjJB1BGfssclEYYEg19KOdOzvTdRa0blicJcSmPvdDOmHHPQCX30IaIfknLO0
         M/0Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8D84iXP/BOw+Ez0yrtjnal5Z2f83dLh1iZXgZN1arWQT7iW/tVfib4sLXEYxKUKl3ZpSSxTVBICDZUw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7MCO5SDLKrs444qFPB2l7N6rgQ9KFMvPBNCNSR4udGcDmeUFk
	ZP/MQyt/zlI2Krt3edQMhkMYJd6zXFvim/xmxiWUeJwI3aZ4DDn5tS6+UMIYX0FiF1LBshNcmE5
	6tEgFRlZyIFU3OUOuVK0G81qVoGpButg=
X-Gm-Gg: AYBFou3x5TxWEgmfcgha6Az78KZTPg48J88QGAJuLTz9h4zj1Cfli3WPkQxQ/aelm5e
	m4ViJqfYL3x+Gq+VGhZ18LptBJQ9IcP173Sqt3dPqt3OyFG/U6Y/eSCM08grnx26S84Vqa77ak9
	PaJstzP+Kbq41dZy5UuvghaxYARdVi2Ggnisle4+qBFhKifoeQ1kyvFM4c+vvDz5IYDJddysEqy
	QDkZyTgbqB/wG7lDjXb1wI8js4v/Ih4f3AEKugkCGehZhNBKs8B8lFaEk1LBpKfuK7Ztm/1CCTy
	4EP3QnpD1PGcVMZ1SlRWL4KtQzlvFefczl16YTJbPLowKotgcTLMk3mYqZcCkWbtXrKhvO7HmWr
	8fusF3PpRp57MVw==
X-Received: by 2002:a05:651c:a38c:20b0:3a7:e737:c401 with SMTP id
 38308e7fff4ca-3a9c2a6d715mr736611fa.17.1791494384639; Thu, 08 Oct 2026
 14:19:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008195608.965266-1-linmag7@gmail.com> <20261008195608.965266-3-linmag7@gmail.com>
In-Reply-To: <20261008195608.965266-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 17:19:31 -0400
X-Gm-Features: AclHuK-dPUM5_kwRdWjxFHFwkBxSpn8txFraCtvQgNDCuna8iJ8OD-319zdUQiY
Message-ID: <CAEdQ38FXFC43UHjh5W_Z4H5BtVxbM8RQS2t9a7jUjzfu93jpRQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 3:56=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> After the on_each_cpu() rendezvous, migrate_flush_tlb_page() walks the
> other CPUs and zeroes their mm->context[cpu] when mm_users is at most one=
,
> described as mimicking flush_tlb_mm()'s mm_users<=3D1 optimization.
>
> It is not one. flush_tlb_mm() tests mm_users before deciding whether to
> send the IPIs; here every CPU has already been visited and waited for, so
> nothing is saved. The callback has also just set each CPU's own slot
> correctly, so the loop only overwrites it, and does so while that CPU may
> still be running in the address space.
>
> Remove it. The shootdown shortcuts in flush_tlb_mm(), flush_tlb_page()
> and flush_icache_user_page() clear remote slots too; once the next patch
> removes those as well, every runtime update of mm->context[cpu] is made b=
y
> CPU cpu itself. That patch relies on the invariant when it reads those
> slots to decide whether a shootdown can be skipped, so this one is tagged
> for stable as its prerequisite.
>
> Fixes: dd5712f3379c ("alpha: fix user-space corruption during memory comp=
action")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>


Reviewed-by: Matt Turner <mattst88@gmail.com>
