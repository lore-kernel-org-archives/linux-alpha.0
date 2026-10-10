Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CBA1A9B24
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 01:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596218; cv=pass; b=WNWA6yTAtdJb9RrBjhtKJpj+reshiELVP9JMPqI/RsbAZfOmzJ2pA9z7JvRDWTDdLAShegjuykobcPhcRRKUGRpRcY71kRGm/+fVfB6kPnrQUdOT5AH9VJcIVnLpMjLTnOSlpzAfiDwXgGvo+uAadU0FZMcirPM+50Ej502o8/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596218; c=relaxed/simple;
	bh=cCKP29rpvusNEnTOFbhYPSA+xq6qRaYZGVi8GUipOqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2UUddnTEzsgdztotjDkz4QjoEVywdaDfAbQHIjmS2LP4yLMLRm2Rlni6MrL9X3z0vQqjiF3ztUjk7dJIl8/GT3ftQEuEePQCOcdTFzStN6RzqSJv8Gqk3hAgwGS12wZ+9UGkst+J30O+UNszSFmhq5pTZZxbT0W6UU974TYl/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhq75/JO; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhq75/JO"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso231799e87.0
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 18:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596214; cv=none;
        d=google.com; s=arc-20260327;
        b=o9a+B8FbPpnzcJxF57Ho1H5r7kBe74UsWxFbI2EKMvV7gz9CIQqRy5pX6APw93EkVu
         YWLd3lwpyUV/R2EEJM2DXiPrGxhhEiQF1Ci+xs8y06r0J2Gpdqyl9+hW8cxWoiXZSafn
         xFfUuXPGtIQ8w44eyzbc2ScrnUyNXjLaMddIUzDd5fBW1oN54WVykEjGJE4rfdXTWlCz
         gKjs+pb3vXJJ9tbF1qx6R9ndJXqBgS3u4T+0Wk0BfJuhSGNLeTzGRC9ocMTcJOAdYX5d
         JLNX+U3mGv6Of3dJjhDKd5acpDz+TIesKef4TrEyQ7CFe0Uad44YAQngOVJyC+EOdxza
         7wBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cCKP29rpvusNEnTOFbhYPSA+xq6qRaYZGVi8GUipOqI=;
        fh=VtAXX9Xs8mXIESGWbWcjjUj9PeP627eueqNyLIghwV4=;
        b=b+/NjR000ERunIuocTsF5EKTLwuiM/Wr8y28F/EhcDVtztveseU6A0fI8Gj95tyADy
         1vkv4p7PSOYBG5c9FqBN5u5FUW+hn2XqOPoOLLh1sp29x4oQmx/PJ5KRef5Rt3Z0F71c
         d1u2sTgCZV0bIUJeeHnOTlT5GpfYJN+6Veov5PJrUjVj5Y1I88rJpiLhlxgPDhTq93Sw
         tqavcc+DCjkUBznjXFtAMxc3tHt77bFvzjGBbNKhaPGt+rEs5g4vCo3SIco5Zrm/cXWg
         C3J0IoD5Ayn9lkydpgnh4aMv0UcJqLFQ+XN8QBMJEf4qaLnIox7HPYtDGJgbL1emlFV2
         gZzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596214; x=1792201014; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCKP29rpvusNEnTOFbhYPSA+xq6qRaYZGVi8GUipOqI=;
        b=hhq75/JOYHN3XLr3GVGXMeIVml6DyaJXHyQ/kfUGLQhHme0dNnzeRFslk2wiz7+Ei6
         sHZe+LvlvAOaw79gDA2Kqav5uQKD6jH9yR8KRwDUJ9ybax0RdwGzMNQTdimIX2uzxsTf
         QzmsLjxWjVQMu4A3dQ4584ZijXHLWxQagelGYl2+LIUMh4K3P6c3BJOwRAU6/r2Cp86o
         q5MfMpSqdxAcxz5452LGYLOl/v/OR25CE+jwMtMSD9bst699G+mpmgPQH6qovkat86J2
         YVszUfgna/iCmxzfO67DSGUkFutqLS0U6PLD6HVz3zzq8OaibvKA6CNezDhBobkq09IZ
         reBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596214; x=1792201014;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cCKP29rpvusNEnTOFbhYPSA+xq6qRaYZGVi8GUipOqI=;
        b=PsuIWe7stLYExMK9LR06mHuPa4ikgZYOSC7qijXNCeF6obyszXefdCKwL0OpJO24iI
         BDPhrof/3JIytDT1XrfcAOl7kHNltFB2sBPmOTTr/mDwWvaH6+E9ZWuIwrQZJaryL9Iz
         4bq4yFjvLZadwsDNc/NX+P/YTNlSGpUZnZMlredgjJyJhfBUy0HKSETjudha3qNuySIF
         LCSJsMKYJ54xH9mkk4htoQL5M6htAaRQNPowQC7Gc/6OcN7+IW8Xejn8I4KlCAnRtbvQ
         Imjw3/8CyeubZ2IfP1aZW4qqpo5viTh0ODOjPCOrMya6AytwvyiSckgFepoWMjiZVRKu
         Wj6A==
X-Forwarded-Encrypted: i=1; AKwUvBwZ4Ft8tmER26bmojCnsIfcabbw/n5Kj+NatDDApvw9yw7/hO/KQKhJbieB2hXoL4yUbrPD02/5970u+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIktj6zkIOBpF7EjUDHzh/u4Pg3U9LT6OaVdg4O9FW2faWxld91
	u0ckl/jcedrzDbG9huBPU9oJxvaKp3c5py2fHYiH1DWSHMSCf+rJj212sE7VbtKlmOf6T/kdoLf
	o4SQVnRH84COxIZQrEFmPpTly8oefV0A=
X-Gm-Gg: AYBFou0CquGFqxD+t1lHDX5rffoO8Ehdr2m1P7O+8PBsXvRnO8/Uc6r/ycFfF28iOeo
	fz+3QtAc2qSdEOEvXkUTu/akYaSrVlZUb0fUp830lCDuIjMxCy4sUXx4f/f7tj5eOCiFLyAf/Qf
	BpXlI5FUl4i9YisGt50flKze/1Ty0c2iUx03TsrWOtdCSblIbyhCvIXcESyfxMZLg+0m2Svhkgy
	SYKuwD6I4Ifz6I3VavewubV/4WHCfGTGSdOxh7zI027WoDn0h/+kkvO6fdKt511yZQkh5Y1clQT
	DH3PRfThHWnUKGnEtvSE39iPlSrguvAg9Ufkf8TkdK920qUKc3wyua20GYGQHVJD+TNlvl4J2Yi
	1CPH91dcKLCKm7ww2GUKzfA5c2gojwF9lr2M6/YMy9zbE2TnAbRYxZdEXcyBwucklCDxhK/s=
X-Received: by 2002:a05:6512:1155:b0:5bb:7beb:20c2 with SMTP id
 2adb3069b0e04-5bcde8d90d7mr1158511e87.67.1791596214342; Fri, 09 Oct 2026
 18:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-2-linmag7@gmail.com>
In-Reply-To: <20261009115627.969047-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:36:41 -0400
X-Gm-Features: AclHuK-xm6LTymfiAIGE6e8DP3SPIsn13v67ibUTejFrZS92rV6Tnp6fVj3D4Pc
Message-ID: <CAEdQ38FAO=9V5VLbNCTE+8oyA4hcd2kYL0t=UYHkHTpWBj_-FA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] alpha: move Tsunami machine check handling to err_tsunami.c
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Subject: Re: [PATCH v5 1/5] alpha: move Tsunami machine check handling
to err_tsunami.c
In-Reply-To: <20261009115627.969047-2-linmag7@gmail.com>

On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> Move the existing handler and PCI error clearing helpers without changing
> their behavior. Build the error objects for ALPHA_TSUNAMI so that all
> Tsunami configurations, including non-generic Shark, can use them.

> +obj-$(CONFIG_ALPHA_TSUNAMI) += err_ev6.o err_tsunami.o

Nit: nothing in a non-generic Tsunami build uses err_ev6.o until patch 4,
so that half could move there. Not worth a respin on its own.

I built each patch with W=1 for GENERIC and SHARK, and the tip for DP264
and EIGER as well. No new warnings. GENERIC boots on QEMU's clipper with
two CPUs.

Reviewed-by: Matt Turner <mattst88@gmail.com>
