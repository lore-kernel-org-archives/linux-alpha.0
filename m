Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385C33E49DE
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 15:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791731367; cv=pass; b=C9OkXZ2uvAzhV62c8sa/EMtrL/dDvw+IseaGRc3uy10xIXdx+OilLzgpAtS9zCEucpMecMCus+vTgIzGA0PTfBB8TAcXmigO83hIKl13W38RcQQjQQ3kQLb6+DFri895QS7HcxXQ4ZBMC+Kk/OdX4h7oJXwvbvOO3PmoiIFkjJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791731367; c=relaxed/simple;
	bh=K2AzJvWmFuXl8WjO1KJdfYR7kz6Z7a6AQW5/wUEyPLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLUe2zKBT3aY50a2WTquW+e9sKJVuE4B0eZ11olfsEgcpvJViyoAlfmW2JpQ5KfcztRrM+VOFpdIJILtTZyI33jVKz3z4wzg70gBrY36wKbqdgOB3NHfXuL037fWaB5nuyUdaXJp9XKFwwa0Br8USZ0QQRrF/ejUDla3ZImxBNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLiUMiyM; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLiUMiyM"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so1721628a12.1
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 08:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791731364; cv=none;
        d=google.com; s=arc-20260327;
        b=knvKf6c0ZxXorP5EEYAX2rugjm4qE3j8fqj+dE4aQVXwBE5svgrhANIcghaR+bAviw
         rn+VAeqBxZR5PatwlMnHvw3KGcjDAMC2HlsP8CHod05SijSqgxbjD+SWWHwUdZ01KS43
         jOHym1S3cdbeEtRi1gY6FDGV1Am8JS+Ahw/qu8ThxTuTnAe4BoUKk6Cn2pU5igK9pVr4
         O+7yc0y39pS2NWI3h2oaKG3PGtDkx2eYQRKowLKWd35Uza/zTAAQ2YzeIS+v8pcVz9Js
         m5tV30q9tF9Pw5k0CbNGXIr2OckxwnUSKUjdNke2zK7ODioF3twitaOC3GJdFXrJvA6o
         Wiug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7EhW3wTNjaZ800qY5zEi7YbceixPkrVlHD9ZpRRBYLw=;
        fh=WBgUEg7Lzd91cIyk0aUbW0rO0Dkky4Q7wDH/wa5iGTk=;
        b=bAJEZNfb9BkTJaz7AKs3RLCtbCwfeIINP2T6lYShTGjfSEMbA2l5K6GHI4SG9XwioH
         3OYQYW9oDPJj+EIigN4rcoVGpL6ifVpAoCAo6y5nkf6VjvGExhaFyAHLKB2e8vxINQnH
         XG2JvjD0ERkY/LNv1E1+M1sxf3S17H+dEpWV/HFBRsRlFl/luu8kSRHe/gwdVuLhWAxM
         CAvKOdlPZKPteYKkHH8tS2erPzTpylw3uy5hlgNNlUlOhmNMKnutaNTzvsMPzFVB+k3S
         /8ElPWBpeItxBwh++gUpwy3+DcjZmqm6uUDnONxbZ6k3zPavM9jaOVPGCj47yuc7msjp
         PA2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791731364; x=1792336164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7EhW3wTNjaZ800qY5zEi7YbceixPkrVlHD9ZpRRBYLw=;
        b=SLiUMiyMYNurvQ680L3ZJ6V+ZKEf1XXqvua4B1/2rH2K2/FrfI434SD3YBgpTR3ETR
         GsbTPksS/99xr1/T8BQsabOhpdNsfXfsG/4oa1fUSZ4lwyYxiW+hGBNQiVQdAyPhJI+0
         pkmiVkKlniBBU3GW/CYWdys/5eCfE4NSaVBrXzctIRoWGtDAetLhRH1BTTiHXTw0Ct9Q
         7XTXf3cx+B7b6csmBgH/LBVpIwwlYhZwUrsY3AAiT6fwdcEAmJaiXtkzxp12dSqAacxF
         bpLZ7pI7WpFSD+PwOMz/RakkyUvKybCeVnUUVOFpilTDisBKfJJxRCQcwRgIsQH9GAys
         p/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791731364; x=1792336164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EhW3wTNjaZ800qY5zEi7YbceixPkrVlHD9ZpRRBYLw=;
        b=jxIbMhgVLl/+lCOjH/h2ZJWWwzRQpNxaaZE0v0AmrCtqyZDwnkFAmHc8+YC4y0X0N3
         devFr2RyHmxA0zGj+CW65M9QJg+0yXB49d1GKMV4H3SeCL6YRQmS+NdVGW1xrR8wlsyD
         DckbardMWE+iWYQA9VoSqUD1pLyIO0AYFOB3pXVwrx1Dxmwb9KkSlNNCie91BzbX5pbA
         OwySfuf3F8Vug7iWt0FFL3Gxn76jjgRCmxpx/ix3ytiePVGXSIJkMWEQ1RUNFcltda4a
         fb5Ob7YGIGcybZOSTI6tkfmbWCg0ICp34iXkrDMXgAnBdXl1aYEijXPRnPWMhaDJb3fS
         7JZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmYRhbpLYUeyv2+4wX7dnw+uv/qYdwUsJiDAojEPj0oYfa7N3TgRZcDRlsKrjZsc46+BoG6d8lkUHCTQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJzKHcR59OjA6ftquJH/tj6ay1pM8j5/IwsyGkKWbcdSPtlz+Bi
	zZmWJtqte6u5OLn/2etHb2Bb8YGWJnGywUGGqywmvybXhDUZz1cMsckcL/yamgs9LuSN61XCT+Z
	6p0ACbK3wxjQXg933dWJe6LSIlJdxNZM=
X-Gm-Gg: AYBFou2Q1jVlJ1xQzaD9d+cf3id4s1jpRDNE56SX2QGiKRZua2VJ8E3fd53pw4s8HS0
	Xk+oJsEbgMjCfOpHpOpbr//gXZXXbX1E8JlzHdqxwCViSoEid2ZAjVPnVVd3Y+h0Mw5j4LskKgA
	N28RVBfmfY3Go6ijnxi9uYg38y0vos5V5jKsxOwnoTswIHmv2X9/mejDyW8Gp1eJiOCPaT8Hnbd
	cBqoMxPHaqSL8PFsY7vM2+Xrozi4qnfMJwlyl7VqzjQpkeSiRS00Y+Bbsiyy+NcAn3D6ehtokJt
	kLVQW3XIMuo9MwI6hL7QsbGvjBe+hmBz5onHtQwXj+8eL8wE6JKfBTIR4tArxk7u9hwTZGzPfzO
	0clKlnBVURgrL3UEPy4POkZfrw5nYxyQGryLzpe5iRg==
X-Received: by 2002:a05:6402:4490:b0:6aa:ea1f:7e64 with SMTP id
 4fb4d7f45d1cf-6b17c25d5acmr6953116a12.15.1791731364388; Sun, 11 Oct 2026
 08:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010144621.974850-1-linmag7@gmail.com> <20261010144621.974850-3-linmag7@gmail.com>
 <CAEdQ38Hqj9+5vui4j6s2-5OihgtiQGSM9L93RTYdp-PfGK0_mQ@mail.gmail.com>
In-Reply-To: <CAEdQ38Hqj9+5vui4j6s2-5OihgtiQGSM9L93RTYdp-PfGK0_mQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 11 Oct 2026 17:09:13 +0200
X-Gm-Features: AclHuK8wAlJ2w8Hi5NCVzVlnkDCQzMFOzN9OC3Lxue_fENNRoRcIedsjd9ZKdVs
Message-ID: <CA+=Fv5Rxgc_9Q=b+7hj5w=hY5-CWx7aKsSAs4vcCAo2xGedDuw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] alpha: do not skip TLB shootdown IPIs for
 kthread-borrowed mms
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 11, 2026 at 1:34=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Sat, Oct 10, 2026 at 16:33 +0200, Magnus Lindholm wrote:
> > This requires the preceding removal of remote slot clearing from
> > migrate_flush_tlb_page(). It also requires the stale-TLB series to set
> > need_new_asn on both the reused and newly allocated ASN paths.
> [...]
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Cc: stable@vger.kernel.org
>
> With that Fixes tag this will be tried on every stable tree, and the
> dependency is only in the prose. The hunk context includes comments the
> stale-TLB series adds, so it will fail to apply rather than misapply,
> which is the safe outcome. Naming the prerequisites on the Cc: stable
> line would still save a round of FAILED mails.
>

Thanks, fixed in for-next. I've added the prerequisite commits to the
Cc: stable annotations.


> > +             /*
> > +              * Ordered before any use of the mm by the mb() in
> > +              * arch_spin_unlock(), when finish_lock_switch() drops
> > +              * the rq lock.
> > +              */
> > +             WRITE_ONCE(next_mm->context[cpu], mmc);
>
> "Any use of the mm" is slightly too strong: swpctx loads the new ptbr
> and ASN in switch_to(), before the unlock. What the ordering has to
> precede is the first TLB fill for a user address, so maybe:
>
>                 /*
>                  * Ordered before any user access through the mm by the
>                  * mb() in arch_spin_unlock(), when finish_lock_switch()
>                  * drops the rq lock.
>                  */
>
> Fine as a fixup, no need for a v5 on my account.
>

I've changed the comment to "before any user access
through the mm" as suggested, and refilled the changelog paragraph.
No functional changes, your Reviewed-by is retained.

> > +             if (atomic_read(&mm->mm_users) <=3D 1 &&
> > +                 !mm_context_elsewhere(mm)) {
>
> Not for this series: once every slot has a single writer, I think the
> slot test is sufficient by itself and mm_users only narrows the
> shortcut. Dropping it later would extend the shortcut to a
> multithreaded process whose threads all sit on one CPU. Worth a look
> after this has had some soak time.
>

Interesting, that is for sure worth looking into.

>
> Nit: the changelog paragraph starting "Order the slot reads" has a short
> line at "Also issue smp_mb() after" that wants refilling.

The combined TLB v5 and MMU v4 stack has now completed an SMP compaction
soak on the ES40 with three CPUs online and CONFIG_COMPACTION=3Dy.

Regards

Magnus
