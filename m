Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672D941684A
	for <linux-alpha@vger.kernel.org>; Wed,  2 Sep 2026 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341165; cv=pass; b=Y0HrK2R5WYleGConHhmBqkYJBbr8WhElbMoklW3VeWEEqrkrjPX61uu97ys62tp5CIsHf56WN4lH4uZSNGd+cP+Aae/4JNsW5ZyWCudkoXO0pqupEsaO/T6fzh+/zQCJ2XWJvSP2J5/K71BQWPE674AJ6xpTRWJEPgAzTMos3JY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341165; c=relaxed/simple;
	bh=cCUWfn06UMRU6TRNAb8tmxA0a3adzcLoZTCZNoCsaoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPr2Sh5r1JB7nAPPXeNxnUDFzUdOqqZJ1IeIU2c42S0GbIzsxRFYFZznPcHM9ibRsgpWv7R9qYuzsU2BXGhUsT63vJNq+CO0iNqHymSNcGGZnBshH1nAzNHLsN8pA50kpg6MQhFsYg/nrMxTZbQA3VdNdQD6L1ylTKRll5xh9co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJTy3tKf; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJTy3tKf"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so1409118a12.2
        for <linux-alpha@vger.kernel.org>; Wed, 02 Sep 2026 02:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788341161; cv=none;
        d=google.com; s=arc-20260327;
        b=grXzOEISlpy5ZPrGY2AwCoHHiotrNFV0Wl+G0pEAgTZSOkZeMoTtLkhMnfMoB277Q9
         rWcbsjR++g9PiEqti6x1Ds6zJu2AYxtUtAjTu8VDB+bVww6TkBpxjwZtmruAnUqpImLO
         9BxzbVzrtb2leEvyDPNy/1sGyEaaMWYsz3BV8GkJ2ZArD6jz+9qZYfKs46JEEU23c1qK
         YmATzg8PgA1ds3qicMiE3n6yRbFgqC6WNooE1ikmCbE8jL3b/KnGiaXLGzXCMtwtUg5Q
         jWdgES9/vugEtCKY5sUQXbptG/hKjM5M0oJI37tjGbrYju45I3iOauMlwSScw/GdCIt0
         aNFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hle8i6U5Zki0AeMEcz+0X3ReRhMA1qAerae52zLL4jU=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=iJd22jprhRV5gCwu8OQ1DkZsrk0Ld/3Qemf/eiwwm5dIJjyhwAES6uPHCeYoiv+PVm
         lsImWiK5t7Zl0cQaGtCNcRlextcxhMjHSCxUK+tBT9G9D4xyNE6a6PJ/P36rmikZmNfB
         1FOj4Yf3KdqHNqrREwghsenBz4W2XCAF2i+2mGkIY6lhdAVwQRaKImfjbuamRLjaXmVC
         CYaF0CAlAHu5FpKfBbRWBxLzTiivQ2PRo9VP0Vz48D7OUh8A87PxqOK1vVrhtyG1gmQL
         3gNZxE1KCMmJJp1QpTPhThma539o3TxKVqZImRKZS7QQsF81SkJ4WKJSOPZ4zz9w21pV
         FTkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788341161; x=1788945961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hle8i6U5Zki0AeMEcz+0X3ReRhMA1qAerae52zLL4jU=;
        b=tJTy3tKfo6CdOzYaFoRb8dtOF4vPhSskwFJf6NiD/oPdgvNaUoOeluD2V7ee1sMRJI
         b5g1zx3sgptRSd6f5473Xd4bJFfrSveSKYVcTvQ8pIPju0sbsDOm0zy45hiUC4h+RBJr
         zJKiC2XrXYEi3GrsBphYSKyDrbIZURCq13NEVxG8w6tJmgAjdWOxJ30jwT4cFT/RG4aQ
         13sYqKivNDP5lsD5kesfrKcBQWQAIPoi//d60YqkvVHZnRW6Lkem8dx8j/aj2IfqR+qZ
         WO5ZgeTi+ESIVmaGs4tM+snI6o8qGcoMdAurqpDh5gfBUvaKDthYYNEvts91qu9Zyjka
         rrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341161; x=1788945961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hle8i6U5Zki0AeMEcz+0X3ReRhMA1qAerae52zLL4jU=;
        b=Dsx9C8n9QFU2aVesPfdb8kOp5W2+YN/uuP9se8CwoI1CDHb0g8Z+HLEf3Ufvy7zLIM
         5lFAHmL9wbcm5LJNvs0cRjoydb+QwxLCwrOahK40nLp9ccuAoIgmOlJiwc6hFx69Jym8
         /sPMMa80M2d6KnkUd1KZTEdsTwJEZZeFaF7nbLF3cXzMeBApKF8raLNZAUi90Ny0jwES
         rU/dAkuuUfdIyJDoqiBb362Tt2pY2UjCu0ulJqtkBqio1zFs+l0fQqXtNPXHQBf/u8SE
         ktuH+BO2miEj+bZn6xS8W+z6RgaCXNwTTMlB+K8pxJERoEt6C1V+4lvKybhiJG1Cfapp
         myYw==
X-Gm-Message-State: AFuF++mtgdxNE4Vxoyl8n8YL+VdJdc2oSgb9Y2q9jSBY0zYXVIe/iHXB
	Et3WaxfbyqJLOYCXsudhSh4DnWVg1XrfRjVuLwil6Vn8Z6rHENAQjFDERFty3Cp4wcGhPF7wpOu
	aKLMlwI96fhJjMc3efWCi+8MNVjuIcHs=
X-Gm-Gg: AYBFou2orudJkXDnKg1eRociuIn4M8lTTTVeJAOGJUNMkgBxzArj6OxC64syZL61LUQ
	K6A/6oUlN1RjVZhfgQllQrgnKgGduaN1qyMVjvR7zKjZCj+5nueAR3vlYRY/JhVukfOhg/yyhbq
	U79pVba8LD5/CsmRvxxJjkADZ0RNGW/oiaVdpia/ezbSi5shiOyRVkZNh8VuDSx+yLFxI01oWpo
	q/zfy868GVTR87HnLsIvmuJizUsEue6g4SHKsYTgRKRkZCSVvp3LZqoQXIzvfA3SaJ6EkHYhVVc
	fofs6vqOrvEKwHnfqWocKwBksn1jWE4LdCk6MCQfMWMpj7RLP86BSY/rL4jJtLZoA73uWAlbsJ+
	nMXK71dTeJfAAFCQkcmmLaP3JKaNjfXE=
X-Received: by 2002:a05:6402:44db:b0:6a6:6346:af03 with SMTP id
 4fb4d7f45d1cf-6a68234c350mr2119123a12.5.1788341161195; Wed, 02 Sep 2026
 02:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <a24c28c35c32335822ceb977dc3e860609c50ca7.1788277742.git.mattst88@gmail.com>
In-Reply-To: <a24c28c35c32335822ceb977dc3e860609c50ca7.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 11:25:48 +0200
X-Gm-Features: AcwNN1VHt8YKe3SoQU8DzJLTk-9J9GLSJswVYEvwz3fWJMFoEX6-Et02RNfO27A
Message-ID: <CA+=Fv5SbH+Qtr9R7O7ujth3pYQp4W6x9ZOX15Sf96rRYUT=wYg@mail.gmail.com>
Subject: Re: [PATCH 11/24] alpha: select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha has a clean split between user and kernel address spaces: user
> space occupies 0x0000000000000000-0x000003ffffffffff (TASK_SIZE), while
> kernel space uses KSEG and vmalloc regions near the top of the 64-bit
> address space. These are strictly non-overlapping.
>
> This enables optimizations in BPF and tracing that can skip address
> range checks when user and kernel pointers are distinguishable by
> address alone.
>

I tested this on an AlphaServer ES40. The kernel built and booted
successfully with CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy.

I verified that userspace mappings were below TASK_SIZE
(0x0000040000000000), while the kernel text was in the high Alpha
kernel address range:

  0x000002000025a000  highest observed userspace mapping
  0xfffffc0000310000  _stext

This confirms that the observed user and kernel virtual address ranges
are non-overlapping.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
