Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256EB3DFC71
	for <linux-alpha@vger.kernel.org>; Sat, 13 Jun 2026 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781353532; cv=none; b=MZOJ62sYjup5L9S1MGXBmS6AiDKLoT0GFc0neii3foHy4jltKRwQ2GuhHFWA3ZEQSp/pBUIySYYDvSX3syezL8GGlTwVLHQ0jRIFdU72B8jWQfSmkehqD394FtdEJKrh6VGouECiMT2VYmI9rTCICErxHVfyuU0TBAAf9n9ikdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781353532; c=relaxed/simple;
	bh=CLakk+opCQ604PeVJ4oUQQ0fKHYH5ZbX22hDORMoS/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OYjzvGkr/Gc0NDo0ifnnROy6Rx30XkaGp7m9YJ8haopEAoSx1qpwdQNB96NSUdZfHuYhPP2WfTy1L6QZ0AkqXtgAP4gWdtYaYcCx+23BkaGV0McNTlOqyzbqJp9VnOOSM2/rLm77K1d+aR5hV2T3dB/auGQ71LAPtj9GYxC20MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWxYQmEh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWxYQmEh"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so18639845e9.1
        for <linux-alpha@vger.kernel.org>; Sat, 13 Jun 2026 05:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781353529; x=1781958329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cDDXIjsr5zUuEb2kKgGGrimrWwrINceaOBEv/AjB+r0=;
        b=iWxYQmEhenGcpCfQ6cj5wLTmg53MkqQzfqqp5pwa8kVUskY8ZzlYUi7XdtQTyMXMOG
         Ejk9+dwIu7rrGEAYo9JVf3GErMOFpfi9N1vzzYg3M3438xE4ZAbyCITGVPyvNgM4i1C1
         7hU31lKsodbvg2iqdl31rFWS3CKTQjxOXpG4isnfOp/omn1hkXIOGdBzzEgzog1H4k6K
         //64KUglMpW5Yq/HYl++TMUeO88aWON5bc/7wxPBYgwLojqlwx3DyZdIqWbKTNaXyxXF
         MKmIHWW5ksYZ0KDK1TRA7TwlrPk48pGU19PEeMKyFeitNUs+wc8JyRfErVw/pHL90hiD
         YrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781353529; x=1781958329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDDXIjsr5zUuEb2kKgGGrimrWwrINceaOBEv/AjB+r0=;
        b=kb+S4kcUloySBcvBEZ5j4cFHTC4c/h1Yeqe4pS1JexM/o0/mnv88n43CzWNYfnq6C7
         4Njkzsifr1TQz76mdsarVKHOQnyI6qFENDqY5YwdhQ0TuA6PuL0ndPRjgLRcI5va4alh
         Y1tdEiovtTSm95rjBoayDoFWwo0py4yuPccA3aXbDxNsCrYzzoaOt4benglefvgwWEX5
         HHN6JkK43hSC8QEIs+7Q9TbjF7/cuUPRgNJzy8BwSYOAAORwiJ2Nyukx/KHMFQFT3s2i
         zaZvepe/FZ0jnPjLOY4TyN+BgY2GtIVj1Rv7POBkET0qR4y7NiMx1X33KI6NOz31lVeD
         IidQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tuu95OzbDmq8wual2kRrTmbxfT1aTK/slpP4Kp5sZ8yV5Kj3uswUMXuOTMw9a8IpONPSWE55bvH287Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5LNxEk++Jo2TJ/Ph6kWxRtQ+xFrQ8hEP7goINUA8qBeyaqMXo
	RO2JHdcRu35rIaJ2fQ3XE7VcaabRDpFeyR0uUkE9J6VqvZkB0ZsZpG7E
X-Gm-Gg: Acq92OHcsnWZp/QzVpDV6a+9eEbEdj4U8DV0ZofxzqTqktqzlezHtX7hzbweu5pac39
	ZvIoABrNbQ5CaU+NbnmXcW0DzOCMxj7ZRM1edZ5wiBG4BYyk8Fj0DeYebGXWcuDYTjnp1tNhyOr
	AG0zD7zxn93FTshDXfbYebVooJOiouGjCobCl2IogCz4pxLXBXSz/kUZgh6gl0bdss1Yrems0Fi
	IuwYQQYPT8IuoerkRjPJk5MbaGKqK1vZEymef/hUmRs+mlFCIO3XuaKA2NLeKPykiygpn9qHbju
	huCGOo446xTggOg1aKEvkkXHSi4o4aBo0uTDFurX73k8mqXFA9FywAfSlPDV10TObQNm4EtlsdZ
	Ye/mN9CXI3BBA3Rl9rNI24nqrQYNn8yQpjy4Rnd9u/6AyKqgzoLp/oRA6NBD3XkhDhDazQmqHCF
	/F1TLByjhB+z5n4tAvWPw4uVqYk4EgQNJcLshfVLvr3qoEZaky7iSAi91sLCuLYeSFaChIRS6WK
	85fSTQ68MMI9c57euo=
X-Received: by 2002:a05:600c:e547:20b0:490:b58b:a8ca with SMTP id 5b1f17b1804b1-490ec50c366mr58510035e9.27.1781353529244;
        Sat, 13 Jun 2026 05:25:29 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922037ba81sm74662045e9.15.2026.06.13.05.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 05:25:28 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <dcc4f002-8ce8-4193-8e55-0dc6968a78e8@gmail.com>
Date: Sat, 13 Jun 2026 13:25:26 +0100
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] alpha: enable GENERIC_ENTRY and GENERIC_IRQ_ENTRY
To: Magnus Lindholm <linmag7@gmail.com>, richard.henderson@linaro.org,
 mattst88@gmail.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, ink@unseen.parts,
 macro@orcam.me.uk
References: <20260612203006.2265557-1-linmag7@gmail.com>
 <20260612203006.2265557-9-linmag7@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260612203006.2265557-9-linmag7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/26 21:26, Magnus Lindholm wrote:

>  config ALPHA
>  	bool
>  	default y
> +	select GENERIC_IRQ_ENTRY
> +	select GENERIC_ENTRY
> +	select HAVE_SYSCALL_TRACEPOINTS
>  	select ARCH_32BIT_USTAT_F_TINODE

Hi Magnus,

Selecting GENERIC_IRQ_ENTRY is unnecessary here since you're already
selecting GENERIC_ENTRY.

- Julian Braha
