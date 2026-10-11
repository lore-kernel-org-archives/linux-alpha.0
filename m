Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14902466B44
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 20:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748821; cv=pass; b=U6EM+cDzYLbaTE5Z5x0yXYHvgg0ZAd/71E/UOmlUl8/WiqlkxJGVbozweHr9svTkeQZYO+XaHGs8WBUwv1lVPLIX9ImI/JezLg15fuECNPAnVUnCxxQYKhx/dHmOS7fnfPfzhxnxSZSd+2KlUnb5VelW7n1bkx3HiIm2bRW6D1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748821; c=relaxed/simple;
	bh=PafRVT+L1hTCA458bkWDsrr6ZsVGkP4Fi7cPDz2SeAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrmVkfDYQ1buamiq55iZ26I+KRuNA7ELVjRcknQuRbuuzdKhcobmvPgyaWDJhw1a5bgAVxPV8okTfOIkjME0iRal0qMynwj5srgvWGUBCXlJxumZZnybQ+Zy0Cxw4vNDTQZ1mHXw5zMrhjFqrmOaFYolL13hAldD0QnOv0ae9p8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcGrZgQ2; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcGrZgQ2"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533952f3714so16356001cf.2
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 13:00:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791748818; cv=none;
        d=google.com; s=arc-20260327;
        b=sJUJ6SfUh7YPsi06NMACFI4/LMZ0VcdAVB35PGbtP/KvOYwKWK076gvmTqVaXdcrTR
         0Z+4XI+G1vF5RFy/sUOd65YoDZ2ladifyble+Q/yWohhqyFQuQirznVfbmXaK56wxAyK
         zfWoqY7jBwv6iamtIDFy75tA6GoyFIB6TY4UYSGlHbDZ4PygwFKtCfPb6tHSBDuLrnbn
         //keaWtvnO9JfmVtvUJz76/9mPJv1KQYKlmFu50z4sGcAWaup1QLR6lI789Pqnk5gDZU
         QMvGZt20yq2N+L0UsiGIEaqgL7ihFwffWd+PHTZvv5xAzjdgCH+TzXnwHGhzLyOBCvGv
         OiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fHzd/PpmTpoi3aoYVl6YzROirHzRjHYEj9c77Sd2SZw=;
        fh=IudZMgOwgqOAj+wn1/SDMGB7Ny0o7ZmXVIGADjMF4oE=;
        b=Xz7Z1ydKRi2Sgpo+r3jM0Flj5qRm54tBZ95erJ9rrw59y0PM5iTyKd4Wkg/II3zpCS
         DsWAYzqaYFLAXEOVRZgco/tauEYbUUy96FIOZo+3ZnxROYmyDCZ1HUuii+ffSrMOvc6s
         y0k8MiHBR8HtbfDC25JEMtETnL/1C6zUYdRblWz4hjwLjqbNHyEobdECVE+9jsdSMLMV
         SyR7HO76McWaa8rrJfDKdiWGmzDcm4Hn1Ut8XfP6bDsax1mQgaXBW/+oLkjZW8l/AhpS
         ZCLz9j9uWiOI6GO/MqFy6XNDWp1Tsa24RIZCWTf2PK09p1ocCpITQGyxxLdSMJ+tRCiM
         jWow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748818; x=1792353618; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHzd/PpmTpoi3aoYVl6YzROirHzRjHYEj9c77Sd2SZw=;
        b=XcGrZgQ2BM8TnRQxhnQNbJrLJmeZMM2+O9M9yLPbMWKV/grJ8wWnnpp6qElUl+/0xV
         CDLfiGDvtyIrZ30pCK+SoUAu3Di2rAmq8zXsnjvg2HhnRNNH4njyKmB8KXUGD6NMpXWj
         +VEe+bpCUYPZEd43WvFC4JIou07zi/Xb9rNdB/TExQrWauMm1SgC23ySlNFJFVddtmSp
         OMYaHVotMkuEO5GY59OU5r89f+Ssj4IiJ4yVGo07nnXok35FywyDTmYQmHFZhsp6iKxQ
         QsUTUHN2yXg0Z3FLN2L2oeFKDLZPlJXKdJ1C3KftzUJG+qD/fh43cYMm14CcmoK2lnDq
         3jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748818; x=1792353618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fHzd/PpmTpoi3aoYVl6YzROirHzRjHYEj9c77Sd2SZw=;
        b=r3uejgf6HecVUz1Z73o7OO6OaxC8egr2jwN9TjfjRtxTwCob0nY4P7Uqg4pr+njm/t
         UqY1ma+jGEfhVPuweMPnyhMzxPxD7Er1sPE5eN4N2aemkh36W7I1nihnXYni93PWn0KL
         rB7oSp88Q9ntz8fiKx55aMGtTp5QjOeW2h8EuKsoqRa+dFycXOq123MzqgLOSmlz5k8p
         aotKdImvkFfG+YaKJHfLVHrbaeUBXRFtl84pkWWKSM+KD8Vluorf8GaRYRrnCdMy1Fvy
         6rThFRZYYW0ES4KE8LyOl2N2ZJRKd4nPIBw9c6iaBmsa0GI7mllUP5lAbdeta767YPoL
         0MJw==
X-Forwarded-Encrypted: i=1; AKwUvByIs7GX8/goR9rc+d1zuDi0+q5sjpYkqSJnCWxnM3zKGF7OMXmuwn+sWJ/cHKhuYHqtbRq33z9hhdK44g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJjA6G5UNHVu//MtWl3PZuYTNx39m5v/EjbUNtSsQFyOmSNFSqn
	s6DtTIn+u2yfM+CgTUf3cfC3KQTH+vqgGLRnSqQ8BbukhEHun7coXms5boRyPMvI/pSC4E1qTzA
	AtA1XaR4/GApD3ZBDQUAgETbPz+/hp58=
X-Gm-Gg: AYBFou02UKCR3AxON6+WuwMfpZr5JuYoLlPzKTguTxfDZd+PQZUNGzG9YAPcKNZtQpy
	ES+XRDk0WZMOq7bIdpFgbQWLWi4jXXPr2oUNeT7hMAVgFnLH+5gn0DwasjiIrC2T+kaLDIl3eG8
	nuEBFAcTARfFGRA0env2n/qW3R1xBY0RKroJl0P9t9kIFyh75+CH0nPE51kel0vSbCSdr9ajOz0
	APUBARm0ffzU2SoaQXwKXC5A0jqDzRCyARCvcxhInMnb0urj368hbULynsrodNbLRS1rd01fOAm
	VN6ndSqcJWUEL4ahJlGtW5gLBU3nQv+XeGtT3Vx4AiiLSmu8Xo0OeayTw/r3efOqNOqCzmBy0DY
	0drFjnmE6ljA8OgSk8XZ9Y6aNEzg15/CiEKEJpmkQzXx8kXe1j8VqUMXFuYwSuS7azws4azg=
X-Received: by 2002:a05:622a:2615:b0:535:bf6:320b with SMTP id
 d75a77b69052e-5359f066860mr125127841cf.0.1791748817777; Sun, 11 Oct 2026
 13:00:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com> <20261011191344.981000-5-linmag7@gmail.com>
In-Reply-To: <20261011191344.981000-5-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 11 Oct 2026 16:00:02 -0400
X-Gm-Features: AclHuK8gThSsTR6UPLB2dbtNxL1DaDdN0mPX8SSgu4DvGRlJWKXOsoPGo7emv4k
Message-ID: <CAEdQ38GnwLbEWicdPGN93=j1mNRpY_yO2m7iXJ12VRq5V3WcCg@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] alpha: decode and acknowledge Tsunami system
 machine checks
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +#include <asm/irq_regs.h>
>  #include <asm/core_tsunami.h>

Patch 1 already includes this a few lines down, so it is now included
twice.

> +     /* INV invalidates SYN, CMD and ADDR; SERR has no command/address. */
> +     if (perror & (TSUNAMI_PERROR_INV | perror_m_serr)) {

If SERR is set together with another error bit, this throws away the
transaction that the other error latched. Can it test for SERR being
the only error bit?

Similarly, with an ECC bit and a PCI bit both set, the fields are
decoded as ECC. We cannot tell which came first, but a comment saying
so would help.

> +     tsunami_clear_errors(&live);

This runs for every vector, and tsunami_report_live_errors() then
prints whatever was latched. Does a PERROR bit still latch when its
PERRMASK bit is clear? If it does, NDS left over from config probing
will show up at KERN_CRIT on an unrelated CPU error.

> +             tsunami_process_logout_frame(header, 1);
> +             dik_show_regs(get_irq_regs(), NULL);

For the correctable vector this is a full register dump per CRE. Titan
only does it under alpha_verbose_mcheck. The old code dumped as well,
so it is not a regression, but would you want the same gate for 620?

> +             mb();
> +     }
>
> -     process_mcheck_info(vector, la_ptr, "TSUNAMI",
> -                         mcheck_expected(smp_processor_id()));
>  }

This leaves a blank line before the closing brace until patch 6.
