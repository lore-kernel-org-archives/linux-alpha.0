Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A111D7E5C
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 23:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791675285; cv=pass; b=NaB5NErLVSyd+0vwG14zyIGGax7w6Gz0Eis3d32AQ1/M1gdjeurjQPonbxo+hqN8NYWc+48J1u7BtTuz3XEWJjYhLnxRrV+PZ5ySHDy2pTBwmmbg03SQdMI7A23tDq4TpkpDsWXhM/IRsIyNGX+7gC6agp2kREQ4S4VGcIajm/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791675285; c=relaxed/simple;
	bh=cKoxBc8OwSXHhNz7B2JU/p9iKVamOJWx79yNaew5iLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSK5w0ZSrge0kmRUbXgdkl1gVpOgHOukCAZlWz5hmoYGMKU3G0zkAB7A6Mhu3Cqex8cLiU1okbblt22WXRm4ABtdAPg0LrPuZcxMdgf/MYgEPjsoO0G8We/GibKKzQ2XcndvDzweYYo7Vo2Dkg/x6PnIXwsJ1AQqeW9wxWt9K0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmHL4DSg; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmHL4DSg"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a98fcbfb1dso6295401fa.1
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 16:34:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791675282; cv=none;
        d=google.com; s=arc-20260327;
        b=Aa4xetw1bhNDnRn6DZc+nb1DRMwOwviHyt9GVuAhDw21v5GcQT/IgYjk3tTIH5zhXS
         NDGl8OXHo8rVHOBINktlVLXDEhNTf1Y7UrwtWlcLjMsqw2d59vIT4mDM5g0ssDnbv2FG
         s4bVGIXkDHjd/mq2mhQPHZ9ZZpTwe3bjLmvg+lxY+PqY/zNANY44FTJQIyO9zvJviQ2d
         5D2qW8Oqkp1x+N3R/wI1gYL9hkN7UBtw6kyx8CAKeZ0yax1Q+ur/Lk9KKfbR+pX5E+tU
         ytW4CEpRBEqoC1IU1lkD8ZcQoW2zatb5czkJdnxkFZTAXCJf+Zv0SsDvBZMpXnyz292m
         I92A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=feaWuaZZCYs3rhB8MCR/+Wo/5xzqgKKqMklPyeWAgMw=;
        fh=Hfe5woDkZZncwB4MoSYn6AR6AIZrYFEzrDltWyUiSZI=;
        b=FtW8TSrlblnR6EnbN9WxC/nj3F8c5NzMfVRoAWfyZOrSxl5FpmKDPfvJpX99qSwcYu
         o06NiiAuPDL7cXpPVKKlw8jnKYgnPiNJ+3pkrNqItmIdhj8hQKzNgw614m1QYOkrhjqC
         UBTIpljEI5NplS2f+LwEBAGZ2aW/Ih0TDyyiVJrhnD77JKhWelFMo6c/f6541EdMIsXF
         Li347izvijLLQb0LzAMUM61gWIuXmy3ijRzf9x5UqfRpwdXcCtfC1vpCdvFf4GjG0S3L
         0coWwRkLV31utLV58HMXzcX/9wUMSKCA5xpctBMg2kWAtdbw/Td0JLLd7FLpnswKozdb
         m1Cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791675282; x=1792280082; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feaWuaZZCYs3rhB8MCR/+Wo/5xzqgKKqMklPyeWAgMw=;
        b=bmHL4DSghHuZ7XQ3jdECRR+i9hdWexkN9bDtZu10oph5xghouphz2KaEgyEKcVH59V
         s7JD81NzNxhhPKujC+E/lYkm7dRQXoXMkTYAphaOTqWjfzud3675t5JWvPZKNjgrOsUb
         iWevaTvrt50eHtVfWYvXnbSaVpm+ZMH2qZIIhdG+FjO9GB8sLjcmx45VnWeYlRvkWuaR
         gitlYeSEzo6g3AN7lRfSekMqLew9fSX+83+PyeMH4ms5W73ZgTPk0v7Iap5I3/OVMFYX
         ZrqusnoAw+PwrfADMcUdbwSbFwA1OoMWuuvaKX9ZVN5wjFcghO1RxRQDzpoQhyAIr0+k
         nb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791675282; x=1792280082;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=feaWuaZZCYs3rhB8MCR/+Wo/5xzqgKKqMklPyeWAgMw=;
        b=h4jGCzNVIetGoXlmtplpGBMkUNR19VXTOiznI3AwviTN3NyQspb3LLnmqj4vm/GDnh
         vx2jjP4qo3JX0UEJ8sjJpWVd9iFJbr0D86jtrvVKlslw8yVW6IXzk3t2Bmez4GnB+Okl
         31ykn5u3wZ17EBZgvHEEc4af+mH9v7fA9j9xq6iVoNdUo3JlFa2IBHYKSoV1Dt2652xD
         WZdKQ6M4WZdNHsmhVEOzQCCdLmLpLJvJFtE8dh6MijqYLDb+5GgYGKerkhsAColfElTo
         IBGu80XtCXCBKf4jC3vx5Gg37s3bF0Z+IlPxClGA/0Krs9bbZytG65I8uaeMnLwXHloB
         illg==
X-Forwarded-Encrypted: i=1; AKwUvBx8JxoMumERrM9zsKwLiW1hXJ6r73u5p+eBuT1LZjQ1f3bVx0b9791y3pCIEtZUT7CCNbxksp1wR+8GPw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ0AJc+iuqWFJJ8oho7JdNpOzrDailUz/aN5GPEteMmvK6WNTN
	EaoVr71cG9GK5zx7GxDGDzgUNH6LdwyHUKg3uJmncBUdePh5v6nKdeydp9tRjTuEyW7PbQGuqTZ
	R13ykugMdPmNXGFXv0y5DlgPNmCo+cS0=
X-Gm-Gg: AYBFou0Kl2f8+XuXSoqZldJEl7qUTMjaNnd4DllWTb6XJsH/B7TF38okp9cBDIXFccY
	UTBH8KlJ0EJynI3b/9zH4nC7zKeYXngc+6bwlyxBIP9ZmVEc40Okndnm7bK9+mJBzb6MYzcekzP
	MMGQcWQE7xJc6ZWWiczylp0QpthSQZyU3iQshYKTlcKzHeRd57lOcZaN8nTIM7gvPTSZ0Ry+gIj
	U3/5sQpkv7oVaQI/0NWapZlyA0PX0PQrpLUYphaNId7jb7unbojlsagtJ6QjiVtY5QjsyWc9yjb
	JHN8/LCDXDQnVD/U5Ur0D856KEqDIeaN2pmY8NXsnxdvxvJRRpRhZ8SH4tvUR04RlqRODJgD04N
	cbvrPk37PIu/CnFc42U4UCuB5167z+nk/TI+w5LA12T9DyVEkpxEIAQQAZsEe/yCCN5ak9dM=
X-Received: by 2002:a05:651c:31c4:b0:3a7:713b:245b with SMTP id
 38308e7fff4ca-3a9c53852b2mr14841731fa.18.1791675282027; Sat, 10 Oct 2026
 16:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010144621.974850-1-linmag7@gmail.com> <20261010144621.974850-3-linmag7@gmail.com>
In-Reply-To: <20261010144621.974850-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 10 Oct 2026 19:34:29 -0400
X-Gm-Features: AclHuK_YN5BbixM1IaQoBobT0UPvBKLfq6NBtNaSR9PNTTL89qZ7WbJcHOjtcBg
Message-ID: <CAEdQ38Hqj9+5vui4j6s2-5OihgtiQGSM9L93RTYdp-PfGK0_mQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] alpha: do not skip TLB shootdown IPIs for
 kthread-borrowed mms
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 10, 2026 at 16:33 +0200, Magnus Lindholm wrote:
> This requires the preceding removal of remote slot clearing from
> migrate_flush_tlb_page(). It also requires the stale-TLB series to set
> need_new_asn on both the reused and newly allocated ASN paths.
[...]
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org

With that Fixes tag this will be tried on every stable tree, and the
dependency is only in the prose. The hunk context includes comments the
stale-TLB series adds, so it will fail to apply rather than misapply,
which is the safe outcome. Naming the prerequisites on the Cc: stable
line would still save a round of FAILED mails.

> +             /*
> +              * Ordered before any use of the mm by the mb() in
> +              * arch_spin_unlock(), when finish_lock_switch() drops
> +              * the rq lock.
> +              */
> +             WRITE_ONCE(next_mm->context[cpu], mmc);

"Any use of the mm" is slightly too strong: swpctx loads the new ptbr
and ASN in switch_to(), before the unlock. What the ordering has to
precede is the first TLB fill for a user address, so maybe:

                /*
                 * Ordered before any user access through the mm by the
                 * mb() in arch_spin_unlock(), when finish_lock_switch()
                 * drops the rq lock.
                 */

Fine as a fixup, no need for a v5 on my account.

> +             if (atomic_read(&mm->mm_users) <= 1 &&
> +                 !mm_context_elsewhere(mm)) {

Not for this series: once every slot has a single writer, I think the
slot test is sufficient by itself and mm_users only narrows the
shortcut. Dropping it later would extend the shortcut to a
multithreaded process whose threads all sit on one CPU. Worth a look
after this has had some soak time.

Nit: the changelog paragraph starting "Order the slot reads" has a short
line at "Also issue smp_mb() after" that wants refilling.
