Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B222D23B61B
	for <linux-alpha@vger.kernel.org>; Wed, 14 Oct 2026 02:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791943835; cv=none; b=RRakowF6mcn+IN6YtEZGIdZyHzdA39LFMSaHezXatX0FJ19lRVIap9s+IEwelchjOuFyF/XE8yNDjw1jsI7cI77m1rladQHe41CyFtnadlz56JHDB9FdtaPiPYv+TrmsfeGtM2qRnxtAbuJ+0MkPKRtNgLuZAmupje85C4QrEsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791943835; c=relaxed/simple;
	bh=KtaEU7sj2PuGXbpfM+LYFyZ89q0BnTG4FcH/WMxLoic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8StZWvU1WbKRABO5lNrbpADwpBTUlFxsl8xixbR0NLlJ/v7+tgRuk6C06ZC7tadQgUyFne5TjKnXJ9hGKAlqiahOEdQe3Wy+khvpYJNUay7+6WO9lN+MfJtAs7Si6oxOgyZQpdJDFOQX9ARA5yXidoiXXGNNqQmAVUkBH2R/Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+hhKPxc; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+hhKPxc"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-679334baa1fso2996486d50.2
        for <linux-alpha@vger.kernel.org>; Tue, 13 Oct 2026 19:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791943834; x=1792548634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRjP8gjRhD2hEIgMLkkzEH7pxode4Ix444M49K9RQmA=;
        b=W+hhKPxcYsH8ndYoCGFNnvzAYAGVoT1AMS0vbdF8gvMuVBr8U6GQ8z5e/CaH9jCuob
         5b0xMclUhqtzHRiu54phDUip2DNmgcBt+oM6v4hCCnRNlR6EZ2BOCIeBvITCgLbJF/Yp
         tPMoQK9TRIoXkGJBPw1UpAIQivN/+/OFC/QjPpj9cvsDfVDXUTajqxwr4XQ9RmLzcjeT
         ExUAk74kSucSSgbeaQiXGJF6bEMaY9t5VpzHfRdu7jxcTfqCfgjmT+rGgPn4w96hRrmJ
         sa+XIQhsdDcNZSPyXgR4KlXC5QvJtzcvnoqDleoBFmz9V4ovrgpoXq7TnaM6R9D852/U
         aT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791943834; x=1792548634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cRjP8gjRhD2hEIgMLkkzEH7pxode4Ix444M49K9RQmA=;
        b=JMre3EFWghCcR8UkZmc6o0TW0sLHxtAGZ66vHGn4jSHMrsHUpelzuBj5Bq7ZIBoBGP
         NUjAgC5Gu0Se0v+kFOOfYSqN5H8Fxgn4oPeQWrRUWBuFIJI/nUYXs2pgx7KCbZJXTIin
         pTHC1wHLdB1lZuMQkRNBxKII9kca4gNKc3sM6JoxLlW/+/qyclPEO+x2l8uWTvpAA++C
         OmtaZhLqjpWW6pi3jnYkDLz/TFLm1thYTm0NrkGo3Ow2Zy9Rliu3FIrqKf6HCSw2IxzF
         VTaiPZAleQfRgI6BG/YDbVngJnDlFBlzfB1cnoFktXKwQrDHFnFD+hDqAQKtPxksUs1C
         fU3A==
X-Forwarded-Encrypted: i=1; AKwUvBy+zia1OUQ3F55puXPyAybhBE7rPBbi9DajqM7cROiPkABYeKpie/18Kjs6anqShBX8Wj5oN1qw0tx9fQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5arr/ZIW7tTXt+/8/dmcAXSycrP+maAfVwQ5/tA3trY84Mrdd
	JEE3x7d7penx28m6PdJkqt0IN2mGnN2uiYLek4xKLZqpBBBpvzS8UApt
X-Gm-Gg: AYBFou1kKFquu+AWfJZfvhwMpJiw92fmCP99x0KHScBR6Wshp+6cOU5SeV9AChnnIbw
	b6BVj90BiN6ZMf62U+MwNImHq08gfgi3Xn4Ah9sn3/NoIh8AErIbeJYMvXiaNiDy+jFHLvxVrF4
	eXALBG3KgR219OoixPEaLXw7ZfR/9SKQA9E9efgq/NI5dNv7xuQ0ugqbUbq5XO6uEbV1wUeY21S
	Xamsid8pHh+GHHk6vS5ccstpDPvKH83AA6WplhxO38A6TE2mnffO7GgLA2sNN0nlpRq3z+VeqUj
	eN//Zb0/VET92Dkn9kPL3NJUv+aAQ39C3vSEuTuF5b98xwucHfaemyElagwnFWS/F7fFPQRwDVg
	3QFd+XtVm77W03sCoB2fMKLI3w1iaP7cwxp85ZV8cbfsHmAaSJrgbyCfHFgibSg3gePOD/z4W4C
	sorM6xdj6zOa6yCsClvuM2ap4MPjESYT0yZDmhKsJMEHgm34BijuPqW+4YPodb8C8T30ImaR3Z1
	e/6WjNDUJzvGd2/qyp079rxKboV5XB/
X-Received: by 2002:a53:ac94:0:b0:677:d477:b9f9 with SMTP id 956f58d0204a3-6793632c3e2mr4573867d50.142.1791943833687;
        Tue, 13 Oct 2026 19:10:33 -0700 (PDT)
Received: from localhost ([2600:1702:d60:1bc0::46])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67986ab3554sm529677d50.20.2026.10.13.19.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:10:33 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Subject: Re: [PATCH v7 4/5] alpha: decode and acknowledge Tsunami system machine checks
Date: Tue, 13 Oct 2026 22:10:19 -0400
Message-ID: <20261014021020.3842132-2-mattst88@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013211551.991723-5-linmag7@gmail.com>
References: <20261013211551.991723-1-linmag7@gmail.com> <20261013211551.991723-5-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 13, 2026 at 23:15 +0200, Magnus Lindholm wrote:
> +	/*
> +	 * Table 10-42 selects the ECC fields whenever CRE or UECC is set.
> +	 * Mixed ECC/PCI bits do not establish which error occurred first.
> +	 */

10.2.5.6 says the register freezes on the first error and only LOST
can be set afterwards. So mixed bits were detected together, and
ordering does not come into it.

> +	/* HRM 10.2.5.7: PERRMASK gates latching, not just notification. */
> +
> +	/* Preserve each chip's transaction and the NXM source before clearing. */

The first comment is not attached to any code, and the changelog
already makes the point. I would drop it.

Table 10-43 gives the PERRMASK reset value as 0, all errors disabled,
and Linux never writes it, so all of the PERROR handling here depends
on what SRM programs. What does PERRMASK read on your ES40?

> +	draina();
> +	tsunami_clear_errors(&live);

10.2.5.6 warns that PERROR read before the error reaches DRIR can
come back with INV set. On a 670 or 630 that races with a new Pchip
error we would acknowledge it with INV set and lose the transaction,
along with the 660 that would have reported it. I would leave the
Pchips alone outside 660/620.

Reviewed-by: Matt Turner <mattst88@gmail.com>
