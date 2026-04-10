Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2743C5540
	for <linux-alpha@vger.kernel.org>; Fri, 10 Apr 2026 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828410; cv=pass; b=Sla9CiS73J4vheMevbslyR6mFt1wLLNCzhSRLVjtXqpNkzRDf5JnyXhXyDLXxZ8Jx7/nDgTvIaGVzVGvB2UXhBNz0g9lDGAgJuxjfgxNF24I/zJLEX4Uq4bNDmq8weNTuu1DEWQakH9jwIKKXJDQ/lRiSHaBIwEVkQ7JRGA4VFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828410; c=relaxed/simple;
	bh=LSR04DrYd2CNPoGkLuzcgQfT1tMVn5ZfdEM6iihG19s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqZy/a4QJwX0jVFfYOv+4T829tR5fWVxIZ2I+CtAPBiG1ekabAsRRGA2pMcL97lx5RLwGR+X0sje1228no3aHCQNzd1naq9JG2YaHryk7Fi0BPSQqzSDb40sR7cgtTmj3lTjbEwl0P9eZh22HOCMoWM8+79a3TuW0rpiroHJd/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WXkk7MjG; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WXkk7MjG"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1279eced0b9so3035205c88.0
        for <linux-alpha@vger.kernel.org>; Fri, 10 Apr 2026 06:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775828407; cv=none;
        d=google.com; s=arc-20240605;
        b=FF0NLZxA4eFXzv3tzQFEAWmwYEgNEBm5LeV2ryT2oFVVtRWOUVzVkdmtH7mdHPsm7u
         g4Ju2oS0YqRVHZuRGoa4XqHI32/hFEP464M+a7I+46B086mjNPRDEvxjvPiQj2mHag/L
         eqgEw+iux4rnMMWOprkWxGoo1MrlALpl5WFMemoSe3TO4ovlEo3+AyCDD6yHy/eXP/FR
         NRMbljLPeWNzymZXSA6sVv+iQ1skadNHWBEH/pty++v5zVTp+O37+FV+/IqaRmrjbCTU
         dk5IhAAmZp8e9BCHZm53D4ehIvcMk+5z/zJVcCaqIMtOkPcabZVj9OrH5JAqNAwj8unB
         dE/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=;
        fh=piq3gKnyjgXGETJHKiCD+2wv7zsyesQTybvBy9EAgtc=;
        b=kgvUnf7OLUIqTHkodRICUETsRstidt6GoclxG5PE9zsf9vPMHJpB/8o45AQyTaZvSk
         3Q3Zy9d86TvcIF4dENrMUYlbUSqcPo+FBmPYguVM0kVDxM9k7AoZsRTTZ66PN0xVMwzP
         QtzYpOU1Oga7PhbWPUXPeA+OT+y3bLFdpzYzRBU61bUdzUKT5NdeweXAy+zPQLUxu7Tc
         JqfO9NYIEPEyNdQp1oflaH1MjEGlf1up1GRPrQJNwNXod2o+P3zGy3m3hS+Xgk31XS+b
         x165fE9XCXY2w7Wvz4m6d4tjhYuX9GDAP25clbrJUpxAMZKgVNyrs2FX8PhMnSQ0xG0A
         WFhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775828407; x=1776433207; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=;
        b=WXkk7MjGsWCUHEg1iU7liVQxxmn76Z2Blc65Af4B1zix0M2rF8QfzApVNMifY6ss0I
         o28bXJ2WoZKKs4P+RMYVL7Cyz5rTozkqN1LFEZKxQrY0UWy/+P4MTVZ7JlV/GmTfYw7g
         BHdpmSI3dFIhezek0dIMEojwsl7VI9CpBDtWrVKxWRCyxE8FKu9tCx05MK1Z19mpDbLY
         UAmVUcxpvcLdZE3bWKkeviuFv+z6weHemrn+Q1dbNj19BdhmlV3lYWFxMcZ5yjPYSXjG
         1ICMvCFl+bVV4g0F5SiLzhG+oRaoJBenKb2hyA5tkvyV436rK7zq2Le6HAfSbviCkDzM
         W8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775828407; x=1776433207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=;
        b=Orv9b+Dbj84BMgdkeQD7Fmrqa2Np3CpHSSaxgsdLbo/+OU0drCA4DxEtRranGIxBos
         Sm2CetM3RHNW5KC+2ErJ6aHgcH/cbQ8yZrU43pWaHN6qwiN46dyJZCgnneLwGuFnwyOQ
         7/quo4PuQI9sjXNccGEIwFq7mSiQIWImVehw0AydUqJK4duDNhzWQxL1htDcFB3FFXdE
         Ts4EMjzO0a120+KzOrF9KN7tOfeZp8oqtIYVLyH8dYI/lseI/oVsLBPWqhifYkxtyC6f
         xyYA/Yg/B4xHaZVstLYWDGwtDuEz99ZkSIx/c36ucwou47NXVT7YaSUh1NLCq4ewLdrR
         kmyA==
X-Forwarded-Encrypted: i=1; AJvYcCWA90+2KmzJTq8BgqJ8U5CJuLZobrQ0j3iRlb0AEk/m109nus86AJZ4lN/n+D0jjnkveO4qHvLIms7Ing==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKZYmepV3OtnUsYmH1eLrm7dpJ6UhH5bbGvgI7Y5tzRsf89U6g
	HVuUAbNcUqUpcn4+QbLlzm47koAWHMQCHebJIPb0gMna9w0UvtMIkp3GYGsgoLWH5f3BN0pKTNB
	bnydJXfSc0VapIaLjvcOLNwc5A5/cy685bQ/O+D9r
X-Gm-Gg: AeBDievFFcIcAT4t1fdCbUpwDOaUPeozeJO61ow9QFS02qMbvp151RsSe7ytlLV+n+T
	aZJ+Iq/o95hySYMs4M1uQsYq3bK46WRXdvar5eL/AEWZFDf/mhsPZTyvWJEr0nlwi16vGhxMKhY
	rkV4WHHXy/FnXqImSoJJp/uFAsMPxFGUiqRhCWbyn0EVk0Axip4bNNCbw6blmvlORDSuakKgYrk
	sl2Z8obYGQxxgXOSccYQbPPSt6rcC++cPj5FKYUPSNEgUhC0YWFfrPF08zqXHMYEmmUXh9lwOif
	7P5TtpOYRuP1vc4WtK9qYCRTf13zfne3lcwWCpWhp8P6Pifu
X-Received: by 2002:a05:7022:fa04:b0:12c:2ed4:62fa with SMTP id
 a92af1059eb24-12c34ef907emr1882312c88.32.1775828406651; Fri, 10 Apr 2026
 06:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.862164111@kernel.org>
In-Reply-To: <20260410120318.862164111@kernel.org>
From: Marco Elver <elver@google.com>
Date: Fri, 10 Apr 2026 15:39:30 +0200
X-Gm-Features: AQROBzBE-9UxDQG5mMJLgipEeL_Y5pwE-Y_PUrJGxDBLilqBu51b8lLzxdip708
Message-ID: <CANpmjNO1vsO1LT6xijhz3nsjQa+_A=9omfgOSz=aGn293-LqTg@mail.gmail.com>
Subject: Re: [patch 19/38] kcsan: Replace get_cycles() usage
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	kasan-dev@googlegroups.com, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
>
> KCSAN uses get_cycles() for two purposes:
>
>   1) Seeding the random state with get_cycles() is a historical leftover.
>
>   2) The microbenchmark uses get_cycles(), which provides an unit less
>      counter value and is not guaranteed to be functional on all
>      systems/platforms.
>
> Use random_get_entropy() for seeding the random state and ktime_get() which
> is universaly functional and provides at least a comprehensible unit.
>
> This is part of a larger effort to remove get_cycles() usage from
> non-architecture code.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: kasan-dev@googlegroups.com

Reviewed-by: Marco Elver <elver@google.com>

> ---
>  kernel/kcsan/core.c    |    2 +-
>  kernel/kcsan/debugfs.c |    8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> --- a/kernel/kcsan/core.c
> +++ b/kernel/kcsan/core.c
> @@ -798,7 +798,7 @@ void __init kcsan_init(void)
>         BUG_ON(!in_task());
>
>         for_each_possible_cpu(cpu)
> -               per_cpu(kcsan_rand_state, cpu) = (u32)get_cycles();
> +               per_cpu(kcsan_rand_state, cpu) = (u32)random_get_entropy();
>
>         /*
>          * We are in the init task, and no other tasks should be running;
> --- a/kernel/kcsan/debugfs.c
> +++ b/kernel/kcsan/debugfs.c
> @@ -58,7 +58,7 @@ static noinline void microbenchmark(unsi
>  {
>         const struct kcsan_ctx ctx_save = current->kcsan_ctx;
>         const bool was_enabled = READ_ONCE(kcsan_enabled);
> -       u64 cycles;
> +       ktime_t nsecs;
>
>         /* We may have been called from an atomic region; reset context. */
>         memset(&current->kcsan_ctx, 0, sizeof(current->kcsan_ctx));
> @@ -70,16 +70,16 @@ static noinline void microbenchmark(unsi
>
>         pr_info("%s begin | iters: %lu\n", __func__, iters);
>
> -       cycles = get_cycles();
> +       nsecs = ktime_get();
>         while (iters--) {
>                 unsigned long addr = iters & ((PAGE_SIZE << 8) - 1);
>                 int type = !(iters & 0x7f) ? KCSAN_ACCESS_ATOMIC :
>                                 (!(iters & 0xf) ? KCSAN_ACCESS_WRITE : 0);
>                 __kcsan_check_access((void *)addr, sizeof(long), type);
>         }
> -       cycles = get_cycles() - cycles;
> +       nsecs = ktime_get() - nsecs;
>
> -       pr_info("%s end   | cycles: %llu\n", __func__, cycles);
> +       pr_info("%s end   | nsecs: %llu\n", __func__, nsecs);
>
>         WRITE_ONCE(kcsan_enabled, was_enabled);
>         /* restore context */
>
