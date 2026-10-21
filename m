Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792578249;
	b=MhWRhpFfF6HojpOo+ixhZpZdp9JbzvUvgl4WQTT7Yu7xiG2hSF3+OunFhx0CaIqek6om
	 A0+kbwYhwd6N5wLRMIFsCuG8iL3wmMHePUrG0ymAdhNSzik8sk1whwmBhCYtWAVkswDJL
	 3l+Eyo8hRIbrp54k37sQQax+XcclsHjd1BWZI3ek+h6SXdKonn2H56gKdVX0NjYDr5ewX
	 n+OrGSjB4CqyKuZVkN0MGOkPM8AS80hwe4wM9CHFcDDkf08tzxTWqo8WSBHXWQ7lT+uGH
	 siYw3Uxhu57o8t8sUR7WMaqMhBRTz7PWKFAkGfmMfGtLKaarPBoBvpDTyVzOTvbgbxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VOMZZkZ47LzRUwWzSV4zQRcKDwW70Ygvq3uLyPdNJ8I=;
	b=zFQ3Fs8yQOjzXme04/RVshiVq3/c2p8amurnWeB8/UUH1+2/lJbCAkZoVoEn568thfL7
	 E+aHS62BtV5JvXjcGMh7D5goKBRICrn6kckPXxkpwoypFh97BhndE1KItI5mrRFudJkrJ
	 nMU11A6GfPfVcbm0UTRjRcK8UkkOBpH8nLlIQ+fGK07vH7fQjh32y7bVXC7ea54I3Wrm0
	 SeRYXkuhI97BcZdpPgljENonUbNO63Qjn5Na11C/PVNDeBhztR68YNvw+iiwQ50WVeiJB
	 616wzxqVkG6Oi9M7LVOfOsLPHDveqp+q2dCDfE2/Ca/ZvNHgA2hl84e02+ZfJvZnIdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CWkfdWGz;
	arc=fail smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1794606A31A
	for <linux-alpha@vger.kernel.org>; Wed, 21 Oct 2026 10:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1794606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CWkfdWGz
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so760583a12.2
        for <linux-alpha@vger.kernel.org>; Wed, 21 Oct 2026 03:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792578247; cv=none;
        d=google.com; s=arc-20260327;
        b=msozcrWyx3o9YTxocDVBfV5oEgiZJs3mvxxr8D2C2sD+kp32WL3K+MZKXA/c1azqHo
         o1HYkAbVcjqJaMsIDOGyEAwtbVnzWigrcyc/rpKuIb++NvAmbBgLA4BnI5lFU7lHBwLo
         i25sor+EQbq8Mb8dE9VfslyeNeDKo8a+MQSWGV0/4+jzeEIO6p3kvEiWGpfZJPJGKPsl
         PyY4KO/xalAyBTTzhCfIk+VZXE3VuIONbG4H1/ddeyqqniY+2s5qpJCskBkWoThIjQlp
         LycmgdZwttTdhUfawRibX6ThHrcI+AP0z6fTs9ybhXhZcOVi0QfH2WESYtIcrFcDiB7m
         4krg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VOMZZkZ47LzRUwWzSV4zQRcKDwW70Ygvq3uLyPdNJ8I=;
        fh=wF6308AZlT3JKVX/4TRCFdU7EbXhHVHXb5AKg7HQUjg=;
        b=LAwQKh95Y3x7ctlCziI6Wug5IXjQMA1oyF/IZmaZVZedvDMrFXij45BuUO+AfAs5QD
         mD/dsTMSlb1qE5hfXOSgNK4+Vy7HbVmspgrmk1vRcHsk6bPhlBqKuLCmmcd96zHC5RuJ
         eDC4RJWw9/5UXt55V+BCnJc5KkowU2bJ3DZeOq2BQUk+dUDXD1SUYveCRjcgs+1DK8R7
         WUgZCtUkQS8dMO2bjMAHS3LM9XlNs9JM+JKunWIUUErZYIYMbCKeAttBzNeZ4M5CCovK
         D9uBcszj6BLKz1FWAJcg5FHgwS23r/A5WEuAasm5J06gnaxLGnJvRh/m4keDixXUKx2O
         o6qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792578247; x=1793183047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VOMZZkZ47LzRUwWzSV4zQRcKDwW70Ygvq3uLyPdNJ8I=;
        b=CWkfdWGzhYCkALaAxkWEy92J/p5bnsgNKnuhCsSudXjcKntuPfHyyYSbdMiAVUKF/D
         xXmU1nBAbvfTJZuKjeIep9ay8c36eyvAy5288F0ylX2jbnivSGoEeB6Xl41GbrodtbVh
         dJgr46KGTgeDgDiyAHtdLbSgURMpkHbSq2THqIpwTD1yhABfVr57voRbKx+aB+dEB3IL
         igF/ieRVXdgTCwos1/PbzzDinCSBGqBlGqtZp/gJfYCHa3Q5LlbJ74e4xSueFSZ9LRbh
         Swtg/9gs84xNb5ww1o1XtR/Aauz5GMcnZEEbSlK9rMzwJrWjI0u0AjKe6m0QD+EYEKj9
         zFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578247; x=1793183047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOMZZkZ47LzRUwWzSV4zQRcKDwW70Ygvq3uLyPdNJ8I=;
        b=2TgQSfwW0npWJ+eW2YEv2wQ4qp52A4XqJbRFSiUf7e0eENeesWhsd8oSMAJ3+PoLdd
         /p61RLn20J3eBKF1c6TIAPpGEVhfTCtuM+zHSUjSfhxNdHtmr0Mj4CbXatkefz9ckx0e
         E/29a1OEdmQA44lRyigD+eftldSYnEEkwl2nMHInh+ydxBLacDO3k1vnlBMdYbd3GzIo
         dP7DHFN2KytHfbbxXP2rq16nvZrHGRu5ULUkFOAyXw4+fNVFTCplQHLWcJy7DMDk1ghe
         bVRWIxhbLyZBXKLrp6rnQ1HWRGs7KOsMqG/ixX9L5nggSf+XgUELKQVBjed+lGxILPnB
         mN2Q==
X-Forwarded-Encrypted: i=1; AKwUvBy22Or20HCuS7txbeaktek02Z1I3cKhhjZU3A1SBVqGYZlonMNeSXva+CaD08aq5+8FsavFb1rxugYgBQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJFURqj5y40rgdMde2Ik/dLIW9k/enTiYb/KAj0fd8zx1HhLcIX
	YvQNAmtmPB8Mb8MY2x6NHgWUB7eeOxiA2LMhnf1KQgagVw+1TbDUF3r704Rnm/bR2JzXDhvmrtf
	563VKyPcUFwEVfP9o5hWfB2B8wXYAv/s=
X-Gm-Gg: AYBFou1e8/VHtJK1JqIT6NRZi6Z+ZHkUdtdS0s9l+0PldPpQQwUllO96mXCZIwXuRJz
	7Am1bFeDiycTya7gDuPHsz0PwvmSdkE2uuGsht2J3O8HQ7vFPLGrvkzeNtZGEB3N/UA2QZpF/s3
	iV+yzkTErtzHqTTvrWDFirOE5NyWF9ynrUDduOlP+aoGOagZgGIOJAlSzHRzQmUUOFJcAf1KZLx
	G2tdRowbYyCUS63v21cViiBSNl0p2ZK08EAz1SRo6G3P9dB/m57Hv1L1Rw8yoVN6XOEFAMQs3Pm
	eQ+sQk5MxW4Dr5fuVSoz0irc5KZUMLXbBoctUo2vJ+PrON1JpVSj6yHagIb2JoNayed8r+Vj8Pm
	Di8FohlPbakEdsXVWmFvXO1zzBG9XB8ZetxeW+xT3JQtyDdVK+0u63BcOyFjKt92s/w==
X-Received: by 2002:a05:6402:1952:b0:6b3:8018:7643 with SMTP id
 4fb4d7f45d1cf-6b408f17a21mr1001907a12.45.1792578246850; Wed, 21 Oct 2026
 03:24:06 -0700 (PDT)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-alpha-perf_reg_validate-v1-1-a8e8cc23ea7a@linutronix.de>
In-Reply-To: <20261021-alpha-perf_reg_validate-v1-1-a8e8cc23ea7a@linutronix.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 21 Oct 2026 12:23:55 +0200
X-Gm-Features: AclHuK_782kZK0_bPAJNGl8tM-pgq0N_Fyf-GVnQvK6PjIgABFx_7x0aoqI_f2E
Message-ID: <CA+=Fv5QWoVZqOR1uHTaE20XWBkXoVqbjTE6bF2iDvvJn6j5hfA@mail.gmail.com>
Subject: Re: [PATCH] alpha: add simd_enabled argument to perf_reg_validate()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Wed, Oct 21, 2026 at 10:18=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> Align the alpha function with the generic function signature.
> The alpha function was added in commit 9280e99d87dd ("alpha: add
> HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support") while the
> generic function signature was changed in commit a2c64c74c029 ("perf:
> Enhance perf_reg_validate() with simd_enabled argument").
>
> After both commits landed in Linus' tree the signatures now differ,
> resulting in a build error:
>
> arch/alpha/kernel/perf_regs.c:46:5: error: conflicting types for 'perf_re=
g_validate'; have 'int(u64)' {aka 'int(long long unsigned int)'}
>    46 | int perf_reg_validate(u64 mask)
>       |     ^~~~~~~~~~~~~~~~~
> In file included from include/linux/perf_event.h:50,
>                  from arch/alpha/kernel/perf_regs.c:4:
> include/linux/perf_regs.h:13:5: note: previous declaration of 'perf_reg_v=
alidate' with type 'int(u64,  bool)' {aka 'int(long long unsigned int,  _Bo=
ol)'}
>    13 | int perf_reg_validate(u64 mask, bool simd_enabled);
>       |     ^~~~~~~~~~~~~~~~~
>
> Add the missing argument.
>
> Fixes: 742f62b63904 ("Merge tag 'alpha-for-v7.4-tag' of git://git.kernel.=
org/pub/scm/linux/kernel/git/lindholm/alpha")
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/alpha/kernel/perf_regs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/perf_regs.c b/arch/alpha/kernel/perf_regs.=
c
> index 33ea2e831ba0..c5a55bfa15a5 100644
> --- a/arch/alpha/kernel/perf_regs.c
> +++ b/arch/alpha/kernel/perf_regs.c
> @@ -43,7 +43,7 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
>         return *(unsigned long *)((void *)regs + pt_regs_offset[idx]);
>  }
>
> -int perf_reg_validate(u64 mask)
> +int perf_reg_validate(u64 mask, bool simd_enabled)
>  {
>         if (!mask || mask & REG_RESERVED)
>                 return -EINVAL;
>
> ---
> base-commit: 2c455ddca7827ad8fa3a64fdbf5a60efb928b46a
> change-id: 20261021-alpha-perf_reg_validate-c9b0a144fd3c
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>

Thanks for catching this. I reproduced the build failure on current
mainline and confirmed your fix with GENERIC SMP and DP264 UP builds.
Both also passed perf register validation and sampling tests in QEMU.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

If you have a route for this patch upstream, please go ahead and take it,
unless Linus would prefer to pick it up directly.


Thanks,
Magnus
