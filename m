Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AC94BAA0C
	for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 17:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826466; cv=pass; b=DrfSaI7yVTfwwukWuqzt1/sTpxmn+76/xLiSaIsl6/pyynyNPF9MlwtPMJnROulC0nDat5HYHK/qLYNT1Bw+eDW2PdNLd/OdqJg9zlUKGVPPzwTclqonU0w1BNu66EiA/QhOhJWK26gDR/TIav5FG2RsMvImFhLQNjbefdTlUHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826466; c=relaxed/simple;
	bh=NAHjeGgZ3zAuGz0muoly9fF6Hx+UWmxL0tmIFC5MVuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXTr085qDp4TwN84upY67Bjz9L0DZkHfGxn+3/fQzdneiiczn2gpDAHHW+dilkOIe4nzBzO4Z8J9M8hrPjoOV3lzpggMRNfaN7bo5QeAA9bWanbPneE2lj3Q54UOKL+1+FXr8dWj1hY1ZGXgHZEw7OmzxwAeTjL3x3FxUhSNJoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1+K5kqK; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1+K5kqK"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3085964a12.1
        for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 10:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791826463; cv=none;
        d=google.com; s=arc-20260327;
        b=BcZKmOnKkySBNwFYQUjrk9NaEwWbKdDAiBNdNYqxef75WJ5QBsfaYAs7TsDylMrQwA
         i5q1b+Fj9HE8Xalt0uwM/A2G5Peig0sxd+bPQ9YnG1WZ6c/7TKYYFVB0kG+5ZMa+tpT8
         O/ujgV84Y4PvBdkxvD+otWBxSC76Kaeha/VdIj+2EFetI0JgwPQqEBugwJEPrPYe1UGo
         NOdMzDm64o8OScBRUt+tyfgRbHiCMV32eCltzh0bV53srivxwNZk5uRnnfhy/e3fbjzQ
         gNyhC999QRanL1A66sIQwhR51z+UvZilPbTG5W8KaJW5YolxTDftrDendbsMBfS666AB
         NEaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=henkAkl7u761gKlux5gr52zn0ik2NkHxM17QmChnkBo=;
        fh=QrlWH0Srdbhcg8VYZRnNXNaWwYRXmtkk+LI4tLKb71A=;
        b=k+ikSCHBnurh+6LNY8F6dLl4Z9NoIb05G7K5V7QHrCMW13ylm2oHDgWc3nsscXkGhy
         w18K4upxj3Z+TKN4sCZxY2jhbgmswFeWfj8X3/nYfomvriffTTGxnyXtOdIW41mH5TaX
         XUNeZ7hwDKrYtssFbE3Uoy8snnpvmG+lorDLEh3YgmISi1rEE2leVquW/fpr2KGkQyht
         SenaM4ZRAIH5OAgSRJBIdw3+GaeVu43Ax4jzggOQRKLASKxTen2DMl7CQkhToAzWzbQb
         O21nkZ0izmuPmARqj7xZs+bWYbcXflL6+/bm9qGLKfjRSp5xuEQ4/6H7aBa7zOPjAMKY
         Qpnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791826463; x=1792431263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=henkAkl7u761gKlux5gr52zn0ik2NkHxM17QmChnkBo=;
        b=G1+K5kqK3xniCRDcPw4xiRznvoC5yg95pry3/lHWF6hA/uJJsFN23nJk5LAG5S6cfD
         vmLU3OiIsJJqHPqKnKE1bD/XduHJA2x42ku3y9X4jxJ16P3IS0YUVo3OCxxPHTfjseu3
         +y6tDhkE040YQny+nRSc25aGi4OTC74hg6RtoRx792EgwskxD8bJsA8zQwVfRSMY9dRv
         VGt7eD1vEfR8lzU9xqWVAmJWuYk7EM5svpogxR7W6lT/kfY/kw9esi1MWUjcMfCBq95Q
         ZpCDvzV6BU29z8ADNSWiZxK+FgQPiZibr3ne1IWn3xGxOIp2LDeZqluIZyqPEw3kEg/P
         MBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791826463; x=1792431263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=henkAkl7u761gKlux5gr52zn0ik2NkHxM17QmChnkBo=;
        b=nLv+4fl/w5yZPVayxJODGQNCG85hvVCyyXJSbkMXwKZoc7LgKd1nt2PirBIWPhKdxe
         2QjfMp3F+9zvrY7gCoIvPZ51YLPBTR+AqHQCVGHsMBrg3jdYhmRSQmpaDbMc982DvT8i
         iy8HuCVjfpCfVihyVstrS/gHfcnqtCMyXb6XUALIFsZ049W9HiV+WlSSboY4piTt1Kpa
         1Fu4BFKqkDKbNFcHF67fm3DT4dz+A//hcl8jiELO0Zd3+ZysKuFAwmk/ky+CePy/v1QU
         txNBlnJy5r0OoRQVY0xJxraVmnC/fdT/7XA0T3cmqx3qGm/XkTmcjT2e7FKTzzhrli8q
         ebmw==
X-Forwarded-Encrypted: i=1; AKwUvBwolDF3bCHSwf5SGzQFMId++7EGD8HziBDqMbDIY7HXd+cHvydGbeitqbfsHr7MOodBl7zSff22AsT21g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLX3/YBpTJuRV+0hS7OWd8IFqW00AwERI2VZYXFbSL9VVs1dMof
	qJjF0dnBx+hN2yBpm637jVFF/Lygyg1G28u2pi8kmFaKVVbUthElmCqA07VHPbbxH8WNluJLSuj
	on58gWPYyZ04C/fhROkEtG7II9M+KZhs=
X-Gm-Gg: AYBFou367Ou3cuZ6pioDJGLH6EubzS4dhu+lmrGdIIG+1rnrf+gR8t6xiDMS+ieGkeE
	0jr59RGrmq6YNzE0sBGsISz9eowXdw7Vzdo0IhEJx3evuBkpHo8Y+D0CIG4mopBOvlYmtXweIwW
	w5eaieRaHZOW+fsN7eOJR5EksRpUCRf+oZiWwiqaMeco1KOxfmkrV3NLDZxuB6uPL29sBXT2QkA
	7i/6x0OsXhIbM5w4LiQ+u3l6MpkmERupQvhZSHpsSxZfKSXwyhyudoe7nbagtZBaKyfO2jhTWen
	YRdoo420MTheNkr4tcpW2V06f/hKzOdIRXdo700FnOr8hQTdEEjMYfhEzctyC0c6QnlOoRHrbbU
	aGmyA0E7uagKxYv5HBadVnhKA/0Ttx6NYrwqCw2qthA==
X-Received: by 2002:a17:907:1997:b0:c2d:c98f:4824 with SMTP id
 a640c23a62f3a-c31aa057064mr966455366b.30.1791826462665; Mon, 12 Oct 2026
 10:34:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com> <20261011-alpha-perf-regs-v3-v1-4-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-4-eaa625a39712@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 19:34:11 +0200
X-Gm-Features: AclHuK-PwSMImsJT1HaG65lEZ2a3K4FcOsF41-r_kcaxLM87kRjslrSwrNkGcrQ
Message-ID: <CA+=Fv5S8-Zk8-LUpZnWiBfTGSQXthepmRc_-a9O+pEPmVW0mRA@mail.gmail.com>
Subject: Re: [PATCH 4/4] alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP
 support
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 11, 2026 at 10:16=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
>
> Let perf sample registers and dump the user stack, which is what the
> perf tool needs for --call-graph dwarf.
>
> The register indices follow the hardware numbering, so r0-r30 map
> directly to DWARF register numbers, with pc after them. r9-r15
> are callee-saved and live in switch_stack rather than pt_regs, so they
> cannot be sampled. Without r15 an unwinder cannot recover the CFA of a
> first frame that uses $15 as its frame pointer.
>
> sp is not in pt_regs either: for user frames it comes from
> user_stack_pointer(), and for kernel frames (PERF_SAMPLE_REGS_INTR) it
> is the end of the trap frame, as in stacktrace.c.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  .../features/perf/perf-regs/arch-support.txt       |  2 +-
>  .../features/perf/perf-stackdump/arch-support.txt  |  2 +-
>  arch/alpha/Kconfig                                 |  2 +
>  arch/alpha/include/uapi/asm/perf_regs.h            | 45 ++++++++++++++++=
+
>  arch/alpha/kernel/Makefile                         |  1 +
>  arch/alpha/kernel/perf_regs.c                      | 56 ++++++++++++++++=
++++++
>  6 files changed, 106 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/features/perf/perf-regs/arch-support.txt b/Doc=
umentation/features/perf/perf-regs/arch-support.txt
> index 4c9a5a012075..7d736d678fd4 100644
> --- a/Documentation/features/perf/perf-regs/arch-support.txt
> +++ b/Documentation/features/perf/perf-regs/arch-support.txt
> @@ -6,7 +6,7 @@
>      -----------------------
>      |         arch |status|
>      -----------------------
> -    |       alpha: | TODO |
> +    |       alpha: |  ok  |
>      |         arc: | TODO |
>      |         arm: |  ok  |
>      |       arm64: |  ok  |
> diff --git a/Documentation/features/perf/perf-stackdump/arch-support.txt =
b/Documentation/features/perf/perf-stackdump/arch-support.txt
> index dd362b5cb638..17b84ea7769d 100644
> --- a/Documentation/features/perf/perf-stackdump/arch-support.txt
> +++ b/Documentation/features/perf/perf-stackdump/arch-support.txt
> @@ -6,7 +6,7 @@
>      -----------------------
>      |         arch |status|
>      -----------------------
> -    |       alpha: | TODO |
> +    |       alpha: |  ok  |
>      |         arc: | TODO |
>      |         arm: |  ok  |
>      |       arm64: |  ok  |
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index b2c359b947f6..8fafbfabd1e5 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -41,6 +41,8 @@ config ALPHA
>         select HAVE_PAGE_SIZE_8KB
>         select HAVE_PCSPKR_PLATFORM
>         select HAVE_PERF_EVENTS
> +       select HAVE_PERF_REGS
> +       select HAVE_PERF_USER_STACK_DUMP
>         select NEED_DMA_MAP_STATE
>         select NEED_SG_DMA_LENGTH
>         select GENERIC_IRQ_PROBE
> diff --git a/arch/alpha/include/uapi/asm/perf_regs.h b/arch/alpha/include=
/uapi/asm/perf_regs.h
> new file mode 100644
> index 000000000000..da96a31b12fb
> --- /dev/null
> +++ b/arch/alpha/include/uapi/asm/perf_regs.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _UAPI_ASM_ALPHA_PERF_REGS_H
> +#define _UAPI_ASM_ALPHA_PERF_REGS_H
> +
> +/*
> + * Indices 0-30 match the hardware (and DWARF) register numbers.
> + * r9-r15 are not saved in pt_regs and cannot be sampled.
> + */
> +enum perf_event_alpha_regs {
> +       PERF_REG_ALPHA_R0,
> +       PERF_REG_ALPHA_R1,
> +       PERF_REG_ALPHA_R2,
> +       PERF_REG_ALPHA_R3,
> +       PERF_REG_ALPHA_R4,
> +       PERF_REG_ALPHA_R5,
> +       PERF_REG_ALPHA_R6,
> +       PERF_REG_ALPHA_R7,
> +       PERF_REG_ALPHA_R8,
> +       PERF_REG_ALPHA_R9,
> +       PERF_REG_ALPHA_R10,
> +       PERF_REG_ALPHA_R11,
> +       PERF_REG_ALPHA_R12,
> +       PERF_REG_ALPHA_R13,
> +       PERF_REG_ALPHA_R14,
> +       PERF_REG_ALPHA_R15,
> +       PERF_REG_ALPHA_R16,
> +       PERF_REG_ALPHA_R17,
> +       PERF_REG_ALPHA_R18,
> +       PERF_REG_ALPHA_R19,
> +       PERF_REG_ALPHA_R20,
> +       PERF_REG_ALPHA_R21,
> +       PERF_REG_ALPHA_R22,
> +       PERF_REG_ALPHA_R23,
> +       PERF_REG_ALPHA_R24,
> +       PERF_REG_ALPHA_R25,
> +       PERF_REG_ALPHA_R26,
> +       PERF_REG_ALPHA_R27,
> +       PERF_REG_ALPHA_R28,
> +       PERF_REG_ALPHA_GP,
> +       PERF_REG_ALPHA_SP,
> +       PERF_REG_ALPHA_PC,
> +       PERF_REG_ALPHA_MAX,
> +};
> +
> +#endif /* _UAPI_ASM_ALPHA_PERF_REGS_H */
> diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
> index 4ea5c189e60e..0c04b89676ed 100644
> --- a/arch/alpha/kernel/Makefile
> +++ b/arch/alpha/kernel/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_PCI)     +=3D pci.o pci_iommu.o pci-sysfs.=
o
>  obj-$(CONFIG_SRM_ENV)  +=3D srm_env.o
>  obj-$(CONFIG_MODULES)  +=3D module.o
>  obj-$(CONFIG_PERF_EVENTS) +=3D perf_event.o
> +obj-$(CONFIG_HAVE_PERF_REGS) +=3D perf_regs.o
>  obj-$(CONFIG_RTC_DRV_ALPHA) +=3D rtc.o
>  obj-$(CONFIG_AUDIT)    +=3D audit.o
>
> diff --git a/arch/alpha/kernel/perf_regs.c b/arch/alpha/kernel/perf_regs.=
c
> new file mode 100644
> index 000000000000..10afe4e205e9
> --- /dev/null
> +++ b/arch/alpha/kernel/perf_regs.c
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bits.h>
> +#include <linux/perf_event.h>
> +#include <asm/perf_regs.h>
> +
> +#define REG(idx, field) \
> +       [PERF_REG_ALPHA_##idx] =3D offsetof(struct pt_regs, field)
> +
> +#define REG_RESERVED   (~GENMASK_ULL(PERF_REG_ALPHA_MAX - 1, 0) | \
> +                        GENMASK_ULL(PERF_REG_ALPHA_R15, PERF_REG_ALPHA_R=
9))
> +
> +static const unsigned int pt_regs_offset[PERF_REG_ALPHA_MAX] =3D {
> +       REG(R0, r0),    REG(R1, r1),    REG(R2, r2),    REG(R3, r3),
> +       REG(R4, r4),    REG(R5, r5),    REG(R6, r6),    REG(R7, r7),
> +       REG(R8, r8),    REG(R16, r16),  REG(R17, r17),  REG(R18, r18),
> +       REG(R19, r19),  REG(R20, r20),  REG(R21, r21),  REG(R22, r22),
> +       REG(R23, r23),  REG(R24, r24),  REG(R25, r25),  REG(R26, r26),
> +       REG(R27, r27),  REG(R28, r28),  REG(GP, gp),    REG(PC, pc),
> +};
> +
> +u64 perf_reg_value(struct pt_regs *regs, int idx)
> +{
> +       if (idx =3D=3D PERF_REG_ALPHA_SP) {
> +               if (user_mode(regs))
> +                       return user_stack_pointer(regs);
> +               /* Same kernel sp approximation as stacktrace.c. */
> +               return (unsigned long)(regs + 1);
> +       }
> +

Tested on my ES40: register masks, SP/PC sampling and user stack dumps
passed with software-clock, page-fault and hardware-cycle events.

For context-switch events, however, regs points to the per-CPU
__perf_regs[0], not an on-stack trap frame. This therefore returns
a per-CPU address as SP.

I reproduced this with:

  perf record -e context-switches -c 1 -Isp,pc -- sleep 1

The sample reported SP=3D0xfffffc00045b4310 and PC=3D0. The missing PC
predates this patch, but the incorrect SP is newly exposed here.

One limitation I noticed: for context-switch events, regs points to
the per-CPU synthetic frame, so regs + 1 reports its address rather
than a kernel SP. Alpha already lacks perf_arch_fetch_caller_regs(),
so perhaps synthetic-event register capture is better handled as a
follow-up. Could we document that limitation here?


> +       if (WARN_ON_ONCE((u32)idx >=3D PERF_REG_ALPHA_MAX ||
> +                        BIT_ULL(idx) & REG_RESERVED))
> +               return 0;
> +
> +       return *(unsigned long *)((void *)regs + pt_regs_offset[idx]);
> +}
> +
> +int perf_reg_validate(u64 mask)
> +{
> +       if (!mask || mask & REG_RESERVED)
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +u64 perf_reg_abi(struct task_struct *task)
> +{
> +       return PERF_SAMPLE_REGS_ABI_64;
> +}
> +
> +void perf_get_regs_user(struct perf_regs *regs_user,
> +                       struct pt_regs *regs)
> +{
> +       regs_user->regs =3D task_pt_regs(current);
> +       regs_user->abi =3D perf_reg_abi(current);
> +}
>
> --
> 2.55.0
>

Tested-by: Magnus Lindholm <linmag7@gmail.com>
