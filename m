Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C6C3C5848
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 20:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791492568; cv=pass; b=ACjCZLXQ/XZsL8x+4Pa+TGoNkVAf/zUp7VXI7wpNXjnCRIEosU43RbgN4W9BQA+g6IRxslYO5kA7qMFIio/cRx20Fg2r6eHRtlH2l2q0YjXXwJau8ImGoiKjsUL0zEE0dsmo1UtANU6WDWxyuEho45oZekIG9M4hdHEzSM76s+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791492568; c=relaxed/simple;
	bh=Ga599ZX3Mr76ihAc61srmvnaS4ilVrwnaph9aVtQkFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxDEN55S+ayIpnBXVWgBg2Q3nwNK2KNFBhOv/wZRq1ofZRJeDJrRk7NNg9EZB/YFC5+6EjE2noAnnUpPNRAWXw8pJAEqNnNmHCr/2UXje/9zTJqByLcWk2rUFaydpaz5t4b4OThMMD8f3O1osrpEUsMBSzxqVHf4OKlnUb3TuYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3QA0cX6; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3QA0cX6"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bc18f54abbso1490368e87.1
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 13:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791492565; cv=none;
        d=google.com; s=arc-20260327;
        b=bzjcsd0oJCqqhFmSLgvU8IO4pBVDSXLHpW5VTmDPmMCUauz8QFLRLvVYMT1paeQgFC
         3Kuq/A9NgqEIQG9sZvpS+Aal+au5NQf4jjFPVsZN40Vi6PJ0/hfaOG7qr61YWfRS1ckY
         u27GU8wnm+pxex9A5Jrln1DJMdRlxcpEKw7+ITaf4fx9i0eSpiYC5sqF4bkI6nr5EC+t
         koga1bxQ9HLQRvMePNkER4sJkrJ0Ae59ekCtZznxSR2DEjxfYrLMQsPr76cg//NrwFwV
         OQJrlL1xlJus9aWFFBFVKxHZGPK1tbbBKijtOLAPhyH6Vy04XpJ9g5zZiI1FEcj+LwiB
         Y5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wf9eR6XwQKqDw7hx5JDyY1pAL9RLJYxNR29Noi0v2B8=;
        fh=JU6kmNSW9X7K4DWG44Kkz5eTDOoCYxmiI+AR6+yOEwc=;
        b=sx6tRaQywTs55IPVkPRjFfz4l1SHyPtmuLKXZh0IRmDjIJx6gPAuNdme9aJOmBonTN
         v8G8bkP8Plsjlez5llshF+Al1PlPOKVH4PWrd3Fujl5Yz7IxeWUJX1yAjA5LNx26RgEB
         UUGQG2hm6GroPsS0bIljcSUQrn98oHd8Kb+aM/VZKlSqaTQtSxpQ0sHxIUSxgEG9yVog
         /Zky0TyPqYdMvAu3FrNTvdgm+LzRfNjZx7+9+tJNWklzXvjZh8wzRKjqUGSIdjwnZaK8
         zgE1xqPjQ0NLz/1JvC0xunTgF3+NxS1Gkdphza4AmcY3BdAqn+5eWHlS/CioJIDBp7CP
         Sutw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791492565; x=1792097365; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wf9eR6XwQKqDw7hx5JDyY1pAL9RLJYxNR29Noi0v2B8=;
        b=c3QA0cX612HlJvtnCqhM4+5CuqbY8IhawoA+JrZHPhFofIWdZFzL0cJ4Hh6yVdc9dE
         txXhqBNBBPGjB+aoUZ20DrSfZgVvX4xbhhdnpRPcoQiab8CDrRMdbsMuUHWY5WlQN+8c
         VS7kAhqM0sUfsZ/q21jdnhLVjEwoyvM6KRsJx/Stv4dNieTAljyL/6H0N00x8GHNJp6n
         g25KA8Ue357QXI9e6d/w+oOcxEGMQEZIcJKkARD21QxQeSFcF+bM04V3Y/3dkKKluwt/
         lExA+zpa4Q4hE2mbD9Eh72UzIVenPrmtrbPbuH8j3oqx0aOx+VAv4Y8RVSMWIrnzPKXH
         b1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791492565; x=1792097365;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wf9eR6XwQKqDw7hx5JDyY1pAL9RLJYxNR29Noi0v2B8=;
        b=iuMm3PNc0K1Q5mwc5iTKyZWO1b1ZbWcckipeStVNJ2D1rAw6a+ymgcM4HUlVen8ka8
         rCfANL157gmhAYSnL5S3KC2eLXmRlOriQpnhzoTdSQYoMyUiMyYXPNaXDZXZnMWh1zUr
         LU1dNY+9OfuQlUj7Gsse/sOLLEb6Man69aON6eRbrSAksXGQU2Mw4dQVD7JJa3i5bli0
         4vEUIiVcyldLK6XvVhGp0QUjPCKKKQgK5eFdFHRRAbCzNrz6JLRBanGbiOqjfYfMDf69
         KiuYceDxZW3yrkugLeGKmdcBNypG15b0vYrvDg/GuIQiEhsc8uFT7c6FbekMtaBxvRZW
         83EQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTPHLsJLyNN6R2I2QVZKmnUUo0TVqhlSVwlAU54rmptzwvmOcjsUMJycfSBTMIJgMpMSr9QDwbvYoMhA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLtQSMxkKHFgtPFAETY243ggGWgc1Guep1+yha8Wr2+cZ/xanDJ
	+fdHlaiLMQB8qKpuXCqyjJSZg/r80FJNGbwrynVLpVjwQMSbTJIGbCVAtW4Ea6ECZpJCtob+Ug/
	pqPlr5HkoNVhfRA2pMkmq+TGMGVioQeg=
X-Gm-Gg: AYBFou1FI1eGsA1jOhx3R1dWM3qsup7bUrTEh9jLZ924laQCSekhLE+86wMv2Ek+zIj
	ivBGmrVAb7nnxivFGeOw5U0n3LhMAcq18AFhpGJ/x+g/Rg3NbDDx8RBIbASBw2yIKb2ftmQ9jpO
	gZNIVmOm+CeahTKkIRF0Ui2/Ft29k9F+wMDWaXPMtFKSUKGWrVo64LO5LcWjxiG7fdBLN0VGq1C
	ReP8Wz8LYQn8zmqa00rDLJsc2Y9OQK/p/mtuTi0JPwW9Am0OyDMwXyAawU2qrQoArxRv6mexW5A
	jZfJsbaW3uSFMdC6726qFntrSGGyIB4PaeO/z7Yji4Ez6/0v11kW/Yxgaol426eHSFkJ5P6uXiV
	Colgqq18hiyBGUw==
X-Received: by 2002:a05:6512:2245:b0:5bb:42a2:31fa with SMTP id
 2adb3069b0e04-5bcd0743f51mr2355277e87.60.1791492564814; Thu, 08 Oct 2026
 13:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225110548.31431-1-linmag7@gmail.com> <20260225110548.31431-2-linmag7@gmail.com>
In-Reply-To: <20260225110548.31431-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 16:49:12 -0400
X-Gm-Features: AclHuK8_vOoVjkuMythyEP1pi3zO_VYWRP3KEuAAd4ZRgtZfVlu8c9OpH9_kgB8
Message-ID: <CAEdQ38F7RstggOKabd80tr2gofrMMAT0N1agN-RBeybxxJWDVw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] alpha: Add support for HAVE_ARCH_JUMP_LABEL
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, skhan@linuxfoundation.org, chenmiao.ku@gmail.com, 
	shorne@gmail.com, corbet@lwn.net, glaubitz@physik.fu-berlin.de, 
	macro@orcam.me.uk, macro@redhat.com, mcree@orcon.net.nz, ink@unseen.parts
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 25, 2026 at 12:02 PM Magnus Lindholm <linmag7@gmail.com> wrote:
> Implement static key (jump label) support for Alpha.

Sorry for the slow review. This looks correct to me. I applied it to
your for-next (the arch/alpha/Kconfig hunk needs a trivial rebase) and
it builds cleanly with W=1, CONFIG_JUMP_LABEL=y and
CONFIG_STATIC_KEYS_SELFTEST=y. I have not booted it. A few comments,
none of them blocking:

> +   select HAVE_ARCH_JUMP_LABEL

Please keep the select list sorted.

> +static inline void alpha_patch_text(u32 *site, u32 insn)
> +{
> +   WRITE_ONCE(*site, insn);
> +   flush_icache_range((unsigned long)site, (unsigned long)site + sizeof(*site));

On SMP flush_icache_range() is smp_imb(), so this is one
on_each_cpu() IPI round per patched site. A key with many sites, or
a module load, turns into that many broadcasts. That is fine as a
first version, but it would be worth a follow-up that implements
arch_jump_label_transform_queue()/_apply() (HAVE_JUMP_LABEL_BATCH)
so that a key update does a single imb at the end.

> +   if (disp < -(1L << 20) || disp > ((1L << 20) - 1)) {
> +           WARN_ON_ONCE(1);
> +           disp = 0;
> +   }

With disp = 0 we write a branch to the next instruction, so the site
silently behaves as a NOP. I would rather return without patching (or
BUG) than install something that looks valid. The comment about what
other architectures do can go.

> +struct jump_entry {
> +   jump_label_t code;
> +   jump_label_t target;
> +   jump_label_t key;
> +};

Optional: HAVE_ARCH_JUMP_LABEL_RELATIVE would shrink this from 24 to
16 bytes per entry, and the module loader already handles
R_ALPHA_SREL32 and R_ALPHA_SREL64. Fine to leave for later.

Small things:
 - <linux/mutex.h> is unused in jump_label.c.
 - JUMP_LABEL_NOP_SIZE is unused.
 - ALPHA_INSN_NOP has two trailing comments.
 - There is a stray double blank line before the include guard.
 - The commit message could note that this relies on kernel and
   module text being writable (no STRICT_KERNEL_RWX on alpha).

Did you run CONFIG_STATIC_KEYS_SELFTEST, and load and unload a module
that carries static keys?

Reviewed-by: Matt Turner <mattst88@gmail.com>
