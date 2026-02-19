Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33709327C1D
	for <linux-alpha@vger.kernel.org>; Thu, 19 Feb 2026 21:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771535453; cv=pass; b=py4k7HIX1Og0KLJEanWxLrAJo2VPyHJtVzGHpUw97EHj+6aTlFGoCNMvzv6UufrS/2883SHqA6uW9scxFma4mBNLqkHzmW3bV0CJEuR2ZPVHHjrCGtJtyUbK7Ti/S7BFEA4sLY/aJ+AugKn/S0RtFe7zOAUqGYHvDoZ6fUSBzsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771535453; c=relaxed/simple;
	bh=fpZ7gRgR5yXZ8I5e+42j1gtH36R1tRdAcQ0zAExzrq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sgjjFp3om94gYjgFePKUU+gLwjcQhGyyUvg3VfZse8ISgdPwq1ySnanB4rpIgvRFLGd+xG/PZ9igmRRKxFcFRonecxQ3mIBgIu3DFrccP5146UIy+oQDzZT/25dma3rJSV5ozei2/Ij+9HfahE5uSBUUpOOZ8rCd3Y8LM3erd+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDpqVobN; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDpqVobN"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65a36583ef9so2882719a12.0
        for <linux-alpha@vger.kernel.org>; Thu, 19 Feb 2026 13:10:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771535450; cv=none;
        d=google.com; s=arc-20240605;
        b=hZxe47FugV3A8PtLKAV4aUyJLzgzCFis/QE7T6Buf07/+ln0d6kdQTFaEA+n7UCZeA
         gAMWawYNJ3bYU/5W5wmltmt1NSms5SmNHhccoblTHQmWk6+lAUC3OVmGnuAJcSWC4ZtJ
         i4pFUdl5lOBQ9sXZeoK+aswCimKFg0SIItJcWIVesxKlws7NOGnzIobLpesCDhCYHGSW
         nCp9KkRCZ3Ylk4vsRPANlKGLfftGXXQS1DD7DAe024dLNUXo3qv2/jjsPI7kYzOU9Aa+
         6FlTHouVZB9YL9JK43JF/HEZVrenzx5MSaPDLh9xzljGxOK5wwD9psiT81FzP78ISgbj
         s3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fpZ7gRgR5yXZ8I5e+42j1gtH36R1tRdAcQ0zAExzrq8=;
        fh=L+eFkK9eHkGdTskJ1zPqRWrDmSizuPYdY9u5+LQ0Vks=;
        b=KHxvHZrul2yg/VQBPt9G5jdWpV9c3FhRhpdU0fYrux1CY04NSkfbOxWp1TqW7W1KOy
         XS8m/04FdDHP4Q3AZHO2mq3KRgloGn3OAomQOijV2xp3FWVCB08PbzLLC6JS1YfSaTvi
         t1wOzix+lE95z8Y5TuzGE7r/nxqDQ8SIiz6kCjhXI5AtPugf4JJ4PJPxh4AiHuVc+ZXB
         3n5goMJXdc5NcoFrkn57pMX0wHemXSeFz5Cy3f/XDC39HvvAGr0kCL6N285lxX6tWkRy
         LuQdaKBK0sD1gTZY36NTDdSh0HmxXbtjnIbOC5lWES/Pt/DlPRTxBUxYgHzGv5DdK3ry
         0CJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771535450; x=1772140250; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fpZ7gRgR5yXZ8I5e+42j1gtH36R1tRdAcQ0zAExzrq8=;
        b=JDpqVobN7ij8OdN2z4wzZJ63MDRmPhr+sUqk6NvZU4RyNjAX4CHmMMfYgfb3qSM6Nd
         f/m+S6TzdhcgOBdHMpILBEuezlKCusqxJ6o1gApp2gYnHaBmPyNAClq5RSvPlHU2WRqi
         nniIxc30NARtxgmFzNXFRzIce0Yk2vuSzlyT8VxyiceE0wKPpViV07C83O2QVH3mc7T3
         A3FOguG7s8Vv2fVsxR+3Guvk6ZdIXmJYQZjMs20yP5L9l8fPSFQLVNnIkBzeWLaIpQj9
         Jk2AlvXkPDpFvd6Q7lWb7qx5SBpPkx8FP2EKsVT/3hnSZKBKcXxBpawLnbUNuGlp/rgu
         pYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771535450; x=1772140250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpZ7gRgR5yXZ8I5e+42j1gtH36R1tRdAcQ0zAExzrq8=;
        b=N39t70ghOSnOC4E3tuWOQsRiwOxB/T4pjoUnzBm1QhY/Tc6FdqQj4poJBQK8lfGjQG
         JCODwgOqyl0uTG/VZeI68HZIpZBHfmsGiIxi2ufFLmoGcMdjU6BGRC6t3OrSWnK+vBKy
         SDpoSxh2oVa6fJWFP3ehlAbMxBNkGZCSKteAEEriCtVDdA256rGqfywDRFT6wDduh7w4
         RfzigkEZ45p/NjLIFxR0nAFl6buFuAg0jckXqfa4+wc/MEuN197iW+BfAOw1iw8B7nKr
         /MMeE1pokKCVu6qd8NjCRaE+ZhnUtc78mUM4lCHLJInm2kHIMghRKD4SAYl0LnHw9tOh
         RauQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnEq/TT71xRCmlSpHZQ2u91fPbRIA9lrgdajhU6gkwz0IJ1OUgkRpz3RMEwnOz6/s1zYeiOvtjTOarPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHBPOB2t4fCrd33m0MY0AQ7RF7JY0g/4GK80bNuRZ35shVnJ5a
	iI8SvqTP4XWD8oiZt2twowgyHbFT12Ca8tgBg1sGo5lnqLzy/kv5J2JFhIj2tJ6FrXToCflTWve
	3b3GX8cnpAbM9l3dgmwCv22uyw2/l8+w=
X-Gm-Gg: AZuq6aJnCoGe5jZ1gMlKiShn8sa5mQ+RtURCBeD75OfLrWCGipb/amuxkXLUVM71lkf
	S75bEh/BbVpQoaMbrQ9ecr/WVHjMww5droZyhjdhS4OJnGaeBXSHtjrfM6KRPqe3lb6185Jp+h/
	lHalJYu6mjHegP+A4Bi46FNERW9iSdOCEfyorZ6swgE3GoIHQNubvZSudfSjUUSZOxgycSRQ7kO
	DruEol72JdVjnksBR/jiyZ1tn3XRkVQOERE6hqCijlAMGC553vnmxS13pmru1rF6URjAnPU8WIq
	IssX/JEKoSELLAV4LVsheM5t45kMc6IUWefQqefS
X-Received: by 2002:a05:6402:254f:b0:65b:ffe3:c588 with SMTP id
 4fb4d7f45d1cf-65e4f3441d3mr2043584a12.7.1771535450213; Thu, 19 Feb 2026
 13:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205133049.526-1-linmag7@gmail.com> <20260205133049.526-2-linmag7@gmail.com>
 <14bcd6dd3475d97b030ecb7044646f1b10d3205f.camel@physik.fu-berlin.de>
In-Reply-To: <14bcd6dd3475d97b030ecb7044646f1b10d3205f.camel@physik.fu-berlin.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 19 Feb 2026 22:10:38 +0100
X-Gm-Features: AaiRm51-ZY8BJXRSrDU7OooVRBKsWMxJ2qmOeRGxEEWNNoeo73ep5SAc9Xi5Hgs
Message-ID: <CA+=Fv5SPxzvJ3OCwfawOtUkBNmHJF=CS_9_m=a7QoHCn5UbUvA@mail.gmail.com>
Subject: Re: [PATCH 1/1] alpha: add support for SECCOMP and SECCOMP_FILTER
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: richard.henderson@linaro.org, mattst88@gmail.com, macro@orcam.me.uk, 
	macro@redhat.com, mcree@orcon.net.nz, ink@unseen.parts, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, kees@kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> Thanks so much for working on this! Alpha and SPARC are the last two architectures
> in Debian that are missing full support for SECCOMP filter. Great to see that Alpha
> is now being worked on.
>
> FWIW, I haven't tested your patches yet, but I think you should also update the
> documentation in Documentation/features/seccomp/seccomp-filter/arch-support.txt.
>

Thanks for taking a look! I'll put out a v2 of this patch, including
an update to the
documentation.

> I will try to add support for Alpha in libseccomp over the weekend to test your patch.
>

Btw. I've tested your libseccomp with updated alpha support, real nice progress


Magnus
