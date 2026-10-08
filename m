Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B066F3A874A
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 21:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494634; cv=pass; b=TCVXhLlQWMfqbpveNQGNIwUF3WdbyD1kpXY/Eoo6SxCLdDDbTGywSANmksRr12MWK8Hxea7k8PBc8mzUyzA9go9VYRSoxGMVLOnZhwHcwjdvgkGvZkTO4CU9mmh/8itDJ0V7y4lwGFZAX0EpYUsgNDeumVD61e6QnrfYONY+FsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494634; c=relaxed/simple;
	bh=M6CM2xvKkSIlGXfDQ5IHgePPERx3aiPmGN8gZP5u0+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GF24L56eUQ2n24p7dU4mj22Lq3Ummi9r09L0oUB8fQuF8Vr0iZ2QLx4Hb+gIn0k8MqC1WpQzfBOYEawb0ZakDMkwBozsxx+89yrl4owz+6BOupE0A4jzUl43g6N55+9nhXLmxBlw1T2kMnbgrkujJ9nQCIBc1DqPbDcRiwEr5cU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jg6zPswR; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jg6zPswR"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a76ac0bdafso9243891fa.1
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 14:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791494631; cv=none;
        d=google.com; s=arc-20260327;
        b=hIvCm59gwDfuB/GBjcIFgOMd62jYl2rwKCz8u4PGIMsn/ZIPg7QLgJmqQcEW5SfjhG
         RvYXwfW9cAGxtugDRg3wTddc6wLvUhvrMUZZDH6+rvhLkD4oz4aZv2UY48jJmKNaGZRV
         eU3mBmsgkQCHg+gwbjEkVP2R9vXk9ORQgtTHehbRCLkQL/kEFReb5fu/Ln89HEugEJ2z
         XDIxZhY199onpYTcfxrb3mfL+MLBPIYw8Bv7jjzZHUUXORmY10hh2vg21FXVeRSqCbmO
         fAuXOcPwsSqD9TjzAj4rW8a7RowFkdrrc3fzhOKxIcH/cKVGCLpnkvkdRq4OhScT1Mtp
         b5OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M6CM2xvKkSIlGXfDQ5IHgePPERx3aiPmGN8gZP5u0+8=;
        fh=xYM9sjTh13mzgz61I1bNuIJD1x4N+ok8lJ58bO+c3o8=;
        b=gy9uHjWKEn1Fhgq/z9B7MXRBhtiD8iFVUPoyyyNYFPfHYxgHrcD5dK6XCGjj5AM6Lb
         ax8E0rbDDEp9nSqC0oFzzEYDjwFe6FSEk5/AlZT7c73mvnMsfSndfsI9AFFpbXXvIYuX
         7dRfOfvRhn/oe5+dssGXPp/DriZkdLnxEk/sOudSJbvRVSzoR3UNPFx8GWcy+K9F4RFF
         OCW7J1WycVl7IsmPXcokRekTxYM9sZbPrCnOGx838X4I44l9+hxJLgjiEobfVnrZofLq
         HrJGZNqwtAZStZGfRu8dskTHheRpMcLDaVJ2StxNNHOYxlWFf/zt9M1NRFNl23IJpItL
         r3Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791494631; x=1792099431; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6CM2xvKkSIlGXfDQ5IHgePPERx3aiPmGN8gZP5u0+8=;
        b=Jg6zPswRk7LD3wZsJhgpW4eZOLFNFHVaJC9q7DLrP9cMsnLVynY0AiMQxOQAD/Hxzj
         gDp/NMiDTeAg2ce+GZTMcrD1HYArtanEzTdOMPe5gkSg7DzIbC3NmgwvIBx94LVeH3Mb
         qwDe9BM+GUthz2PW3BQVHce7VLFdfyanxMMoefDY05qu1KDfVXztfn5tZDpaRfvWeDVJ
         BvzfRKNb4aDEDtMD4sVPj7TXhj/nZhbA9irxlhrSiMOT1AvWG254rI5D02wdpn2IWGq8
         kC0ykcXH+0+K2Mco6XCYw9YPcL6u/K/B5UTyffxvCtTKq9/ndIvaVkcqzb1l6pRrzJfs
         IbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791494631; x=1792099431;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M6CM2xvKkSIlGXfDQ5IHgePPERx3aiPmGN8gZP5u0+8=;
        b=HPayLbah8rudwm4BUVQv7FurqLyArvDl/fQkmmZ3jVMOHfmFrCqnngfOOJj+DdPeJ/
         /mGcOp6zArh1CBBmaR7tMDKPuXZVvBdB0NvZ1eLvSIwjswj7j9QLfB03Xo5zMuKFvQn+
         X2ImOTQM9pWYuByDTIwKFAVOp++h05XGQctMTrwcW3upaxzYf2kjCtQSrujiOCDvyCjs
         dF7lu9aUPFzwF1huTbXGnPq8QxfQCLEKYeMffOmPb90pWXdLnw8AYeztsjsqF74MyPu5
         sef8OLYSGdVGtuDE7zEU+9/J/YNPYiyssc/Dyzc98CRYMPorPHzaxS+HqsVbQ3puqia5
         P3Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzNVDxbJfleFeqHw46oC54RhS62uucb8xF4hZzMUx2QlGQoWXhQ/PJhBtw7p+Y8jCQtEqnbeWMKGC5/4Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLNyGm66P37isla6qmRhHXwJFU9YmAe42vLGMGwAAn8C75J1FOG
	iXDjekZeUqToeK9MziT2ykiXh3T5Od/fNEf+agWFcGvbApDW8MGPxppv3A40JrgPolopks/tqQO
	Vb1xxA8ksvx9nZD0AR4lyaOIAi55fJpY=
X-Gm-Gg: AYBFou0HUIjJJoWC+hPih7VMdpo66dsh19VR8OX6PGoLYQJQXFRwZ4SMe8ylrs9XvXS
	2yP1cI25CuvSIx0XT0dwYulq8N34cgMnsZcYEg5F27L/rMrBIMSs0ZPYT0OWSYqgmkZ3YLoqlEI
	4ISIhFcziXr9hxtxDg/B9PCGMtVNrDYa/A4bBtVA9qTHWPWpvd9Ie9lDAUbssbg2VRsHaPhgLJv
	QaLOOYIagoXpTKztCDhSWBa6l20tifaySBJSOIal3OTad7HmbCBVaFSFOZhSkz9ooGR4mLtJxBC
	uoeWRU+WapVuxfcY8FleStu5CEpfRoqiyXnD0FGYHqSDKrzoIeUK6NW8RVoGzOiyhJvlmfYPUyY
	SadR5BJNkB+Pv1lw=
X-Received: by 2002:a05:651c:542:b0:3a6:5b56:8106 with SMTP id
 38308e7fff4ca-3a9c2c3095fmr906041fa.22.1791494630493; Thu, 08 Oct 2026
 14:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008195608.965266-1-linmag7@gmail.com> <20261008195608.965266-4-linmag7@gmail.com>
In-Reply-To: <20261008195608.965266-4-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 17:23:38 -0400
X-Gm-Features: AclHuK89eYiVBvE5Lrwb__hHWrXIWel0f50BxkAl9nePVtCBE9ELUZ7tgaAtMas
Message-ID: <CAEdQ38GMc=aH6yQpSGFvXpNZSmvrU7uzKqDN+T2W8GfqDchQMQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] alpha: do not skip TLB shootdown IPIs for
 kthread-borrowed mms
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 08, 2026 at 09:55:18PM +0200, Magnus Lindholm wrote:
> A
> CPU that does have the mm active keeps its slot, and that is the CPU the
> IPI is there for.

That includes a CPU that only holds the mm lazily, idle since the task
migrated away. ipi_flush_tlb_mm() and ipi_flush_icache_page() test
active_mm, so it takes flush_tlb_current() and publishes a new ASN
every time. It stays visible, and each flush_tlb_mm() from the
single-threaded owner sends IPIs again until that CPU runs some other
user task. munmap(), mprotect(), fork() and exit all go through there.

Testing current->mm in those two handlers, as ipi_flush_tlb_page() now
does, would send the lazy CPU to flush_tlb_other() instead. I have not
measured this.

> A CPU that publishes a context is in turn ordered before it goes on to
> access the mm, by two different barriers:

check_mmu_context() is a third publisher. Its __load_new_mm_context()
takes a slot from zero to nonzero after finish_lock_switch() has
dropped the rq lock, and nothing orders that store before the return
to user space. An smp_mb() after the WRITE_ONCE() in
__load_new_mm_context() would cover every caller.

> So a CPU either already holds a
> context and is seen here, or it allocates a fresh one before going on to
> use the mm, and a fresh ASN carries nothing over from the previous
> context.

There is one way for a CPU to run the mm with its slot at zero. When
ev5_switch_mm() allocates a new context it does not set need_new_asn.
With the stale-TLB series, finish_task_switch() enables interrupts
before check_mmu_context() runs. An IPI for the mm taken there sees
asn_locked() and calls flush_tlb_other(), which zeroes the slot.
check_mmu_context() then finds need_new_asn clear and does not reload,
and the task returns to user space on a live ASN that
mm_context_elsewhere() cannot see.

Setting need_new_asn in both branches of ev5_switch_mm() closes it,
since check_mmu_context() only reloads when the slot is zero.
