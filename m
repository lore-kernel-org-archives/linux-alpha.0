Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9909345EDC
	for <linux-alpha@vger.kernel.org>; Sat, 17 Oct 2026 03:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206883; cv=pass; b=EVkIyfexHktSlUpz9/mWEl6fObmKrryv677nmUaGOUVSq7yt/80p9mNAHRIllUUFWnb+0dJnDRTljFfwyP3yzdSD6X3cSsjNbGbD10CnaRiEr+lVtGGfIbnOgdvemcB3glIW76HXlRsv/jduv61X9gBJr4RLsCEy8nL7gEbYH7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206883; c=relaxed/simple;
	bh=LEJB3CMsdWhcuO9Uznal2vKEOhdcLtR+2E+o3nG3VQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MUrjpImu1Xh7UnLr/tLj2loQ5Gz9j2Vg88BLXTwHJ4667I2INVQwXBFqIFWGLfm7fDodV3SOaF20ok5pHY9b55JyqNlGJYopbuBTrO0St3VZybRUqRm0pdmorpDoPg/tLMlW+kqcOsin5Vw2KQW3JqUfIJiCT2srAOTOK45rRZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yb9M1TXW; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yb9M1TXW"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91791ec1b83so4682096d6.1
        for <linux-alpha@vger.kernel.org>; Fri, 16 Oct 2026 20:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792206881; cv=none;
        d=google.com; s=arc-20260327;
        b=XpqF0Y+QNgVQAdFCWWXMRhHXB3AGZu7t63ttgGoZdJoqo62LmFrsWAlOJW5vV8i/8S
         wV31ImmOHXb4kaktC1smRVL2M088+8lFyS6XONdT7y3mW4UP6Dicpq4hOxINZDXV57gp
         6mrkWjLFqbuXLMW80/dKDjutYPKNVCMLpAxWJZtcUHk7mQBE06SpC/QHTlT0PXBM8rdw
         1kwctKaVnOTTDh+GMH79rf6edXmoQAWDS53PURbq6H8RxEGn/LfEwjhOaUfeILqAHt4V
         oKz9nKNsHJnLf54SizLEwkjzMX4JZUrxK0mnz6Y0tOarA1SgycDxmnz+kDELAb/OcBmy
         vmtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LEJB3CMsdWhcuO9Uznal2vKEOhdcLtR+2E+o3nG3VQs=;
        fh=Zf9VgYVdKpgV+tznc5kPJkIHkw4cUnY6ORo8H6CGtDU=;
        b=P/trSEJ3IODEb4kQSsoigiPEGAOO6CBVG/3gDKugVwEFzwhlgrYPKQ/oOIg/OP7nOI
         b+H4POhUwjjZ+h4ocE/P1tV13EDXOVIHZiwLNJ1RlXOw1VH112XMD5afpN8YZDioNeuH
         FnspCW1Oa+DbB2C4vDIxmL8eIUHv/HjXtRdmNax0isyWLSUHfT6IQWh7HKvKZSd+Hb2s
         tALR/iafS7JYwZxnIFfxuvl2+BAE45dew5YZ+QeDjm825/bLR9BoI/Wyf+jrBDPTMwlu
         pCRQIVP7GPwUjMZ5ntMa+u8Nh9mz1/NtsPOM6dljFb5NQ94TUsEGCMM5bLyHeSEQ4YB+
         OpiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792206881; x=1792811681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LEJB3CMsdWhcuO9Uznal2vKEOhdcLtR+2E+o3nG3VQs=;
        b=Yb9M1TXW5wciV1PBzIYfL7B/1Af/PGyPShKeVxsnzRSoWVILCYuQj2NK62WtF0Px0h
         awAAPwE0DSxGzUeijRRAbJQeNTybz5Sdn0VmdEfO6tuidpho9kpze8ahaALHxr02EVyA
         oMxCq6OLcHLbf2fHLmt7U287dAvIc+2Uf+NQsfqzMwTqquKyvHHGBPrqnHLYM2VtLXab
         hRi+WF7XS9aQ9xMgS6kcApfRMUns2PtnP4bYgdTHLFr9c5l5pkQIG9KW4zJGsGvd9n8+
         D3U8v4wCTpeGh+FnLz9GB/GSfujEUXKVLtCKV7F6HuYx0VeqgXAKlJU0/a2fiKc8VBco
         vOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792206881; x=1792811681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEJB3CMsdWhcuO9Uznal2vKEOhdcLtR+2E+o3nG3VQs=;
        b=esPNchJ4XJZki9jSj2KB4ZfCen/npOtYsjZzZEgjgwmlDcRH04SK1zKStPhTkV5Zb3
         CJMipSZI+lHSuol26x//9MBSuZqLv1yktZsa0qcVLBsT9Y5jK+T2/ctRpdVPgLq2K0Tf
         6OdE2C1Y39wnQckfxnCKt0YWjaJHUXhmB2/jrCky0QkKmRwAH4KzlX9iQatIdcllhMgz
         dTAfhL0RD80yUBvfea/KNKGpEbxTH4zwypRlldbmWu56B5A8kALegZPCCXtIbNMqNwto
         qSuFXv5bbjHLNIJShTV5lcFNHptWEJY3A9YwPrtcLLfl72zxPUI4M/rFeXINbpEspkH3
         057g==
X-Forwarded-Encrypted: i=1; AKwUvBw0FffjVClGpH6sm4klqrqg6117x/Bwt8yZqJcmAOU0QuEFIYGVt67v3Aui5Qr7oupbXB9Aa66UinZYtg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIRP4GvpteiGSbscR34NhP8Ao3oFF2oGW+hxv5BHRPNPuI4fWgq
	uZInCptNKSjEbtwSxrYk+b35IIGfoBw027U+U0RA2tSXjCcYw2JR+H7+Rl0qPgEvGMzGvkHm4j2
	SfTbVKwVx0V74fqo6mA7s4cm1IXnagGKC0slQ
X-Gm-Gg: AYBFou2u+91O3gFTu9/sLRoeLAh9SxeFEqNtm0pQgdyPGmVILKY7EAlP5B1XXtMma8W
	3nJCG0YAv+I+N9hjJj/5AIQ56Map1dTCqPmWiaQOvecZ/o7sXHeuqu9LroKH4EqP8hrf3sHf9PX
	q5ZtZEwH/PhBd/0Z5irQomZguNy0QjnlwIQylL6MBRIYXYc7TEhbnG7RklgIUxN8xbbA6YIkoWf
	3VzfkK1XP1uh0d9Ru3EfMB4327X37l9psjCkfbr7RBX85VrMjLw8vdyGpU6DOY1ZwNkt0G2ryPV
	sW/lRexM8h1sMST+6RN79ko8kEQs8i1PnQlIqAfu3HerN+msPz9pHqxdmwAXp6PYyg+ajFOAEG3
	r4prGKodjlIma/hUv094uCjxiJANfWA1zyMy3ZEA=
X-Received: by 2002:a05:6214:860c:b0:91b:852e:28d7 with SMTP id
 6a1803df08f44-91bdec36a8amr33004946d6.4.1792206881499; Fri, 16 Oct 2026
 20:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015102353.999695-1-linmag7@gmail.com> <20261015102353.999695-7-linmag7@gmail.com>
In-Reply-To: <20261015102353.999695-7-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 23:14:24 -0400
X-Gm-Features: AclHuK8b-1N0Kck8gq02GK77qViHsl9hk9oOSmLb4AnO9XSbIW9ppfwvemwHfkg
Message-ID: <CAEdQ38Fd5ozhu7ZZCw9zJhH8JSQAKB6SUmoHxTU_w3PXw=g=eA@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] alpha: add bounded Clipper console-log scanning
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 6:24=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> Clipper console logs have an HWRPB byte count. Bound wrapper and child
> traversal by that count before decoding embedded processor and system
> logout frames. Print the wrapper name and event/halt timestamp, halt
> code, and recorded CPU ID for processor packets.
>
> Acknowledge the log only after a complete termination packet. Retain the
> firmware pointer on unknown or incomplete wrappers and print at most
> 1 KiB of raw bytes using print_hex_dump(). This avoids the generic
> scanner's unconditional acknowledgment after a parsing failure.
>
> The ES40 record observed during testing is class 5, type 4. Its wrapper
> layout is unknown and remains raw and unacknowledged; it may therefore
> be printed again at each boot. Successful decoding of a nonempty hardware
> log remains unverified. Keep console scanning independent of the live
> machine-check and environmental handlers and restrict it to Clipper.
>
> Console environmental payloads also remain raw: ES40 Service Guide
> Table D-18's sys_offset conflicts with its field offsets. No register
> layout is assumed for unverified extended subpacket types 6 and 7.
>
> The scanner invokes the payload decoder directly during PCI init; no
> generic subpacket-handler registration is needed. Mark its helpers
> __init and retain the PCI init hook in sys_dp264.c.
>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>

Reviewed-by: Matt Turner <mattst88@gmail.com>
