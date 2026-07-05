Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767693815D0
	for <linux-alpha@vger.kernel.org>; Sun,  5 Jul 2026 14:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783260449; cv=pass; b=NgiQq4HkstCbBIZxWjs88uHcrDqx+7dSpSfdoobDY6ufbmUHYmBp/47Y2lmvSmVCUhahKkq74BFDQZFMHmUeLlBkNpJGmkM/avx1SFoNnZQ1Y08CFnpCe42c1nNUkoJc/bRYpI+/HkoaVNAMgKoKIZLvxiXW44tDhL3T65AHdqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783260449; c=relaxed/simple;
	bh=rJTLgXhHbzb6m4yuwfvd7DNNK4sQXEKA4fD/etrYkds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQQNTQbSnLn02CFYhuBxFutzbxHYFU9VIIMTS3sKqzmCLHIkKKyLV75rFRcpheLSvqfBUAjoGESpF4Y8GpnrUS3Oj0Bz34BAN8EePMVTaWovmPNLx8/8J7tO1GKGi1ZTvAeagOAjSKi8tPuCb1anadso8I/lwuTHXmagtPhxk9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uc4vM4E8; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uc4vM4E8"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69a50b818c8so494157a12.2
        for <linux-alpha@vger.kernel.org>; Sun, 05 Jul 2026 07:07:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783260447; cv=none;
        d=google.com; s=arc-20260327;
        b=pKXnZe6bp83Bc/3YJZaohk5As0K2nCqQY3UDh1BkMZKY2S/fXJkIXaQ2aYDwwFc0eC
         XkEgqE0TO4Filb6Fa6OCXt7boWrvcHiJrmrYmR2mh34cK2EVvIiFAdyc5TJbI7djd/Bj
         ci8UaF6ZEa10o4QTuZdag9OhBOgMpzViBMICZ4mPI1EAaZ7cAW77tva+YhL1XcdVSu34
         o2dy6mCWV0pnAx23su2/cyEf+zAMT5wwIZMc0QEDvV83p5zcbJBM8tC6eQrF8XKd0pQA
         EnCLvCXrxSbt5Ht6HiKFLT9EWatbYTzW9hOhfI6nIXcZliXyauieoKrZliIBLTuM8XmU
         nJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B3eDvtCGD+y1CcmjNg7OzcOTyUVb7vyb9rRqusXMVIo=;
        fh=OiSYg5qw1Vq6+hnNRllDvntx1PGsFe8kULBAx5w9SdU=;
        b=F8FbuaGV/puWG6HKRDq1yNWgCdnMhM3kH0fnX9pEMXUabgzfQJ3LY2xxhVavpeTu+s
         8XQQZ78HRb3jYyROkwhhv3r8/DaWXY7nHXUg8+9xjwk2MOWt9H1q8r+DKiP5Q2m5y1AS
         DQ/qFVcAGi1WqerOhStIuLo4nkBfoAEPi7ZL/loCU81ppujR2WSlBTEuMZeKoDGdWEZp
         8LI8fKojSVShPguV42yMx4iY9NEK5rpDeUn+FglAQrVyTDAJv0Yfk5dExx5GlAIUrI2r
         alupef0pQU8q2DQKvve8e37EOr+WV5lLbIaiFiSSOn1Er/xlHUfmOxBELxe645ZB15Fb
         O0eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783260447; x=1783865247; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B3eDvtCGD+y1CcmjNg7OzcOTyUVb7vyb9rRqusXMVIo=;
        b=Uc4vM4E8qyWYy7WgvXfIxbazhfL4kwaaR8mVFgvGClPJ1z5c/C/YPoXOvo2yJPkk/Q
         s7EpSopm/5suu5QbsVX+Etol5dhJl5WNg5Ct8ldnSL1LWgUmxuWEocL7HVnsPwjwFmrT
         QvrjpLJ9GUeQfu7AjqOlgT1BuOURjNjljo0LYVZ1tIsSiSyaDSA1pMOAZOcWnFGWpHnY
         APlN20/bCeMe5qB+rZ5z8iUIfrCW3opE+B16d3nytkTnylXNSgLnCZvIZumdEIkXHXiM
         38Hle2a51rdDHwPk1lLgHE2TXPumWA2shFQJQHKb462NUfIzZosEmnkAarPR3S+nqbDT
         HjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783260447; x=1783865247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3eDvtCGD+y1CcmjNg7OzcOTyUVb7vyb9rRqusXMVIo=;
        b=EuPi9lnJ17cgWQF8cn2p20NJ6QmO7dWNDU5qtdvvfzWl4Q2eihPr91S+8jxqG5bRTV
         mUWXDncgdQAwJG/HV9hgQ43EnIM5aAj8QO9MlLE9EtdwqSq2cXiJqC7Un4sZCPZ99O6q
         qOxwAwF7ltnzIVhqYYSZVw5zuPlpHdqKXPzWWg42jbXmrkpR2FYPwEt6QAUrXEbqflod
         rQqmmF286019F7btMafdWUosF0Rku8qI8kHnoX3UE2j4ETPJn2t9vam1A2Vg8MLSFfi0
         tt9tWhl3wSm9hdj1yFLCy9o2woBPmDFrTInAcKNHRLjZzaB5kV3TwZjjghxq/B8ZSRuU
         sUWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTw75LX9sT3/O0562rPse7HKbFhpErtvP5k7A1r8GHKvBjLK+Xa7xB8s6lOwJzNGym5e2yBbKit4Gsiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTilWDxNXdxAEzlC6eKB8rs07f2ZY4GHu8MEmaBnsWxM+pAhyz
	WglLgxrJlzLeAL1c2VBTz+L4GmODtlu7262QmsPmkg7yif6Wa9JyOCT7hObnIppJpG/AyNSBTdb
	Lxy10N5DG5MM5TEmstWFZl3+jfTvWrzY=
X-Gm-Gg: AfdE7clt1hLkGJ9f+jm6GMm2MHHzzzxG0ldbRr/qvyfY3URxrpMbOy0vvbbqt+qv4nW
	LlT2o6H1UQBBE1krkXU4aHTeulVg9BUJlWgXqB31XoQHHi/iPa6UbqTT0wVVGQrCQ1jalL3dl2E
	hS/jTGKkatt1zJa8vUKrHVfOVxmIZEQ44e7dB7k/k3tIHgYEQSxv43b/ycri1It6hVKQynR0tJG
	J0l/MAJdkcu3fDsFQGyWnVA8ZZrBiEyKE5XZT/xx8farQc+2r6Lu+UUv9p3V98ZgzMJzcqIAmS8
	IhSS1NAYf8xT/diQ+PAweUadVMlRgwo=
X-Received: by 2002:a05:6402:28cf:b0:698:b8ad:2349 with SMTP id
 4fb4d7f45d1cf-69a1a3b11f1mr2008890a12.30.1783260446501; Sun, 05 Jul 2026
 07:07:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612203006.2265557-1-linmag7@gmail.com> <20260612203006.2265557-9-linmag7@gmail.com>
 <dcc4f002-8ce8-4193-8e55-0dc6968a78e8@gmail.com>
In-Reply-To: <dcc4f002-8ce8-4193-8e55-0dc6968a78e8@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 5 Jul 2026 16:07:15 +0200
X-Gm-Features: AVVi8Cc4PBKfOcKFgVuC9sn2gI2MuUiDytmckrVOusHs6ldedPOG7qFPhRxHybY
Message-ID: <CA+=Fv5T9Z=T6g_Z6RDh22gxDi5F76K5P7+Bes7L635bg+7zuhw@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] alpha: enable GENERIC_ENTRY and GENERIC_IRQ_ENTRY
To: Julian Braha <julianbraha@gmail.com>
Cc: richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, ink@unseen.parts, 
	macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"

>
> >  config ALPHA
> >       bool
> >       default y
> > +     select GENERIC_IRQ_ENTRY
> > +     select GENERIC_ENTRY
> > +     select HAVE_SYSCALL_TRACEPOINTS
> >       select ARCH_32BIT_USTAT_F_TINODE
>
> Hi Magnus,
>
> Selecting GENERIC_IRQ_ENTRY is unnecessary here since you're already
> selecting GENERIC_ENTRY.
>

Hi Julian,

Thanks for spotting that. You're right, the explicit GENERIC_IRQ_ENTRY select
is redundant since GENERIC_ENTRY already selects it. I've dropped it from the
next version.

Thanks,
Magnus
