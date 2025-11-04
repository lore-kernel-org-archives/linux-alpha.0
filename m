Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF962261B78
	for <linux-alpha@vger.kernel.org>; Tue,  4 Nov 2025 08:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762246320; cv=none; b=Ve5v2dss5cGuY7yDtQ2jcthQIfpRPDe51r3S1Hf/hmlWaTRog90FpVa2Kv2Sp0rbZiSxjbWNAjUALlJK3k5xWi0tOHj/tBouFgtABQmgr4HobO40Ge3Rfy2k+T5iW0eP30FWblRl6MO3InRFiWyu3ZoW39+UoPIDQBUt8lkXcOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762246320; c=relaxed/simple;
	bh=KXSxoWGzf9FiNThpJFkgtS4aFzPKFrUrk/LtR659nb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZu3cwh125KrfQgVl0pLRBEP5/35Kw9NR/jJp/UR4Lx+pTXtNiXFe4KdisJODOREVvYphT4A+AFHoBwm5lLjPOO7jDsP3mJFpIEt2Df0PmXz7BvCM6Ai8oy+rq+l90rp+HyfwjGDqOLsn6U/5oAiCLaohKsuRacpI/b8RRELuqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NL/20NKc; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NL/20NKc"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640f627d01dso101313a12.2
        for <linux-alpha@vger.kernel.org>; Tue, 04 Nov 2025 00:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762246317; x=1762851117; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KXSxoWGzf9FiNThpJFkgtS4aFzPKFrUrk/LtR659nb0=;
        b=NL/20NKc03oYGU/KMHiQ6UeeDvFCkdkdW1E61Gu8fpGeta0GZGZEf9G7+OjnZ6O1cf
         yHs4adZhmFDNv1CxSL0tgeX0q1J8n0Vaz5j8NKaFbxdLoUCmialp1N9Ar5P1Z0XESplV
         yoxUT+++oRhM31ToqmB34wrHC2iJbv+1FzO5KYrBmbmWfuHyRqdQVv+LLDf8UHOhWasv
         sF12bUWL8KltOeNqOcvKnyAcLk/HIK595o1BYHLPvX7X20srBhHZKa1ew5OwX2pYZPBu
         IxV9/6df0AxF/ho54Ac0Me1kCXjpAC7mjrorqIGHBhmyO0NjozKs9ONTTpz/bkRJLbf/
         L2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762246317; x=1762851117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXSxoWGzf9FiNThpJFkgtS4aFzPKFrUrk/LtR659nb0=;
        b=W3uEq7RDp2M48Ura09byVcC7zI3bL6RKZjXQClhm4j5f+xZmqF+NdP0E8Vjwm7EwHr
         EnmqU2N8fyRz5EAmRKA/OmquZZI4fdBk808Jy3rGD3HpzqkMPd0z9YGxdRwC8Z76dtIb
         8CaUjCLbaHFPgvjE+t+cZRyj/MAA1yaXu62sQh/nlR7AznJ6OHYYa/S9UbeVwPGxllEg
         HfRoZ2GwiwTbqaOsKTaMYluEh/y2c3Lv4U1OA5Y3vrTAWGhlVRK9t1niKUJbY082iCuv
         fGQ6bOVmjif1Q48l3pSweVIkySYWqroQEjyYrcQMbuKu1g2lM4dK57VSEuVUj4ZYhbEa
         Zqig==
X-Forwarded-Encrypted: i=1; AJvYcCX3L07XTtZ4bsNTTnfR33AP9SojG9k5cLNsjWjJtIkCZ0cXptuoxPHRY3QVqnLfGk7VpKno/6Fs/ntM6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL/1Swj6WKR2BdxD1C1y0/BpwCuZgUIALyFreUEtabR19ugmeH
	WBKbLyaPfdwbmaPDOFgEd9iQu1Qugas50dWZDq3M5w+FTJoVcCrT/BvSxSQJidWdgg6DYEhgYZL
	8JBarBNDRdMkEhNJfPvBlmJLgWYj5sKk=
X-Gm-Gg: ASbGncveusJ8+koQ8bVNP0kpO+eHwL9/ohRCoUC1suDnzxhE89PEQeNadBNtZuHoXtr
	WskwDMEOyvPf9re5PIHQ7WNxgknh5gI7gyzHr/1azLCVuf0yv0Tx+HmTFpMD1DGQeHpeqdpWyk3
	zNomWX6+90FRZGLwua7TK1o6l6/+CUV6tgNqsTvxXEjgv0kJ/5Y0NtMqGyFFGeu04oWp98l4iwn
	vtBTAx+3SQggTPfomnmydJLQfNgBJTAS3Yfh2yL3+J3PKM45cR6dz79UnpMTA==
X-Google-Smtp-Source: AGHT+IEuqli2bsyC9TZE1Wp+7k+jk5S8Rm/0j0s2XRVfDbAJBgWcOZYiVeocIGE8iJ2maBEZG9erjme0ZgDgEPc0Flg=
X-Received: by 2002:a05:6402:13c2:b0:63c:276b:1504 with SMTP id
 4fb4d7f45d1cf-640770bd004mr13656405a12.19.1762246316995; Tue, 04 Nov 2025
 00:51:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103213656.25912-1-linmag7@gmail.com> <0ba150517e0fd331f1227e068fd37e6e6ea42228.camel@physik.fu-berlin.de>
 <CA+=Fv5Sdf732mc2c_xGDsJqq2pS-EQU5d0XLBR7v-0GdgFC5EQ@mail.gmail.com> <69590ab694891d84acd2b4a4317c2fa8d1a98344.camel@physik.fu-berlin.de>
In-Reply-To: <69590ab694891d84acd2b4a4317c2fa8d1a98344.camel@physik.fu-berlin.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 4 Nov 2025 09:51:42 +0100
X-Gm-Features: AWmQ_blH_3s2dU33LPzAacTZYIaA1MBELBLiqo8cW1mDoEMW-zIKGOiUQdDalQI
Message-ID: <CA+=Fv5QhoHsS2EC_QR-zANZdXTPeQmOLoP1w4LNmgYNqryKb+g@mail.gmail.com>
Subject: Re: [PATCH] Alpha: MAINTAINERS
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> That would be the v2, you already posted the v1 ;-).
>

You're right, it's an occupational hassard to always start the count at zero.

/Magnus
