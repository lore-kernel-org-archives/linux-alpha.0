Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37DE3815F3
	for <linux-alpha@vger.kernel.org>; Sun, 31 May 2026 08:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780215906; cv=pass; b=Dm7yhZ4BdJPpIOLOAk8vYN3pas7jCr1BAcaQg4yXxjuXRc0GvO9vOidj46QbGwCUL9ES/q6LJcMCvMPdgMxZVn9YpLyDfzr+I+2BGJuK5lh2F/fjw4dAxpXK4A2ON1G4Xii+SzrZveu+VKitoz/c4Eyk/+LcB9OBOYFA+ZqiELE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780215906; c=relaxed/simple;
	bh=05VF1vXTmt+ywoFPbxUsnTMuO+H/dS+s63GkMypYQQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRAaqyOn4AY2Qv0RzqVjNQCoC6w793SnJch/n2VzTm8E4DudHA/lx7DBE3TrV+oaBaEs51T9+m2N2PnwmCoKymRdSe9naqcDm7cdHAX0CLfR7DK6BEiE4ubPCM2DGburJ8EKe75U0Jdaj6Jjlb5t4Nu5LABsI8TcNUqRv1jTVhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMaeWzqs; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMaeWzqs"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68719234fd8so2781618a12.3
        for <linux-alpha@vger.kernel.org>; Sun, 31 May 2026 01:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780215903; cv=none;
        d=google.com; s=arc-20240605;
        b=ZuJ8mcXUa/sah2gnL1icHdo49iNQeEdfnPmVV+Y3Q3T1s+XprbzQR3ZjSrpjKXmvAo
         fFh/wAAOLF2Q+vaZlTkbtiLkTCFf0tIXvf77ox7I7zRx6d3JoeT2Zs5luQpszLHu4AxS
         nXTX/31fwt9yOj5Kw+QfmaITS8MPLEINXyl2qLIoawdqY60xUC3UdNhM34aY96suhYEX
         uEwh3q3e0ZRXOp8b6i2SyPsetPqRmsP5L4Uyuxis+WvAZoNVWAS5bMle2LvtP27Ac/LG
         KytnjIhMADGJuIftc1RZn2yv5T6ddAD6L+zndbxwivulCWifHma/turccbzD5w9IN4MT
         1QOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=05VF1vXTmt+ywoFPbxUsnTMuO+H/dS+s63GkMypYQQc=;
        fh=tmBX+aPsPvWWI0/mu7FvC1ZrcD3yiffMqPI6Iqs+Hy4=;
        b=lqyxnFEX9rVp+zFtzUXl/+6ci908ThEDJp5DKbaGAc3NvpwRtMht8nqF6aRlvCdphr
         VdPSSmQU7ML2fB2NENtxBvxTuHg4X7WvgZjJNIRicbQHaANzUo5lh1L5HuBQUkXiQCdE
         mb6V/fyouLHznijcRpFkTw0E2cdUqssdfjeDzqcFva+RXzWHiF6nFIm+uGZ3zPTZARv1
         zY8NlEN6GFXl/+OWz/h9r3mqk1zKXMcLy8wYADKNSy+UQ7wXxQouWV60PqtWtj0TBzPa
         J5nnY1LJqp7jbULrIc31OfmKVctYo7a6KEYF1Yx2iKPDEltgKfJQ3NCP2Jl1fa/7ZRyo
         8KFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780215903; x=1780820703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05VF1vXTmt+ywoFPbxUsnTMuO+H/dS+s63GkMypYQQc=;
        b=PMaeWzqsgZgPr+T2Yv21y00/uNuBi2ZupeFIG99xxDop3TiVsaAPeEodNO8yyrzuOp
         I7ZNKW1tQnyoj4TpzuJNjBVRA478GFR0m5DSaMOEJ2vbygQAX3RD5jkhGv5zA95mJxCI
         TGrMB7nRHRJ/rzA6NST49ZCF2xh6dQcsbGqpat+gyturdi4w9Qi4aF5cCXQmfcZjYb2A
         HSViPnWKEhWSSPgISIws/Gcx3RPhQEmNR8Ium57SBVPXQMVXx4OdaPRjrVy6laWzfUbC
         uhiQQZku2RJ+2w3SGvoTnc5LpvrCHcwOYvCJMawhiCr3ULk9/JJsKdZJQUoaVs+YV/K8
         y+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780215903; x=1780820703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=05VF1vXTmt+ywoFPbxUsnTMuO+H/dS+s63GkMypYQQc=;
        b=JuWsDneYmaj5atDh3hpUkRABJMhQo4Qgua+mWYVE13s5ND9+k10B48vhbGJwnqtww/
         vadTR8ni69borJdHX8ukEUB0BEBDWcnyVzCpUrsDnuXZXsd1kWxYrSLGtDELAoAYafuM
         tGVtowR/rqjZdmGy1zRPf8sLVduviWAFktV69wmE+S124NkEQCZK8pN3fp01aBIgZrg2
         ytAIN7lAIiugFTHCYP1j61fPKFKWJbdcNinbKscLoH2F3tyj3JXTBoyO//TPomYLnYl0
         m/0qYCovkPDTF6ERfw5ehowBlhfwfv0zcEuH6Q4UW342hg26j0UWSdkdElYqCHvtpf9L
         BaZQ==
X-Gm-Message-State: AOJu0YziCWWgbHxzxFNdt52H3u2maKPJ0lw+RZ9D1Bv7o7D3ACaD/LAF
	pkxNxEuZ9fMuTyV7gilOtZd/SWyH+BdakWMD1rl4euCUhi0I0AcP7bi/W+A6xS6u1kXVKkCBzVL
	jI4y3GGozaaeRXMmUpLDBgyBos6Dj4ciGvDvm
X-Gm-Gg: Acq92OFKH6oVTBm/9YeHQHvwTzcdGm5rV9CWkNHnG4jOGVBhe19PDAFB2gTwtpgR2pl
	TM5JAk3hhC+05nxUIceUcyX7ygc+hRdkNVYEFhAmtruvJxJ/JTAAGkdJZzfjLu/RN8UoUKNBfU1
	BF9nXwX4YcdNhK1dJYjbbWJXFdeFW/sPB1O5JzXm+NbFcp7rgWrdYSIeHiPB0qKQdVlmhqjTuOW
	MTb2Out0yQth4iDImRgAdzTDRoWNAvU3uRuaWWWq/f+QN7cqLiQLGma/78v45sGfheIYIZ0IrVf
	prhmqLLhFpH5GTrSL7x5Yeh5bOPMTb2iZ4lA6Wcm6NoiTiA9m5I=
X-Received: by 2002:a05:6402:2b88:b0:68a:f2ac:4677 with SMTP id
 4fb4d7f45d1cf-68c8a370852mr2892092a12.5.1780215903081; Sun, 31 May 2026
 01:25:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530202544.59231-1-mattst88@gmail.com>
In-Reply-To: <20260530202544.59231-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 31 May 2026 10:24:51 +0200
X-Gm-Features: AVHnY4J6hIFq7rXhmMvRqH7SVo2R4ziaMMx6JgFw8NlLvwZoKCwUb51ZgHvxgzM
Message-ID: <CA+=Fv5Qq_6gyZPqzW3o4NziiuoYiV3YGcM6-ZtRUAB1ms88xdQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] alpha SMP fixes for EV7/Marvel
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@unseen.parts>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 10:25=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
>
> I acquired an AlphaServer ES47 in 2010, and it's never been stable --
> deadlocking after random amounts of time. I could never make any
> connections with load, uptime, etc.
>
> The only dots I could connect was that the git test suite would always
> trigger the deadlock.
>
> I spent some time over the last week playing with Claude and have found
> *a* solution. With the first two patches in place, I've successfully run
> the git test suite 6 times in a row. I've never previously seen it run
> successfully without deadlocking the system.
>
> The first patch is generally applicable (not specific to EV7/Marvel).
> I'm unsure why this would never have caused problems on other systems
> (or why it would only be relevant for EV7/Marvel). That gives me some
> pause.
>
> The second patch applies only to EV7/Marvel, I believe. tl;dr: IPIs seem
> to be lost.
>
> The third patch adds some accounting to /proc/interrupts to report the
> number of lost interrupts, confirming the problem from patch 2.
>
> Please review.
>
> Matt
>

Hi Matt,

Thanks for working on this. This is very impressive work, and it looks like
you're close to nailing down some long-standing bugs and making the Marvel
platform a lot more usable with SMP kernels. The lost-edge IPI diagnosis lo=
oks
plausible, but I hit a few issues while reviewing/testing the series.

First, after applying the series I hit a build failure. Patch 1 adds:

extern spinlock_t alpha_smp_ipi_lock;

to arch/alpha/include/asm/smp.h, but that header can be included before
spinlock_t is defined, e.g. while building kernel/sched/rq-offsets.s:

arch/alpha/include/asm/smp.h:60:8: error: unknown type name 'spinlock_t'

Including <linux/spinlock_types.h> from asm/smp.h, or avoiding exposing
spinlock_t from that early header, fixes that part.

Patch 2 also appears not to be buildable independently: it updates
cpu_data[].rescued_{reschedule,call_func,cpu_stop}_count, but those fields =
are
only introduced in patch 3. Please either move the struct additions into pa=
tch
2, move the accounting into patch 3, or squash those patches.

I also wonder if alpha_drain_ipi() should disable interrupts before looking=
 at
the per-CPU IPI word. That would avoid reading ipi_data[smp_processor_id()]=
.bits
before local IRQs are disabled, and would keep the CPU lookup and pending-b=
it
check in the same IRQ-disabled section:

local_irq_save(flags);
cpu =3D smp_processor_id();
if (READ_ONCE(ipi_data[cpu].bits))
handle_ipi(NULL);
local_irq_restore(flags);

That looks safer than reading ipi_data[smp_processor_id()].bits before
local_irq_save().

On the design side, patch 1 says it serializes all synchronous IPI operatio=
ns,
but it seems to only wrap the Alpha arch TLB/icache/IMB users. Either the c=
ommit
message should narrow that claim, or the serialization needs to live lower =
in
the IPI/call-function path. The patch seems to do: "serialize a subset of A=
lpha
arch synchronous IPI users, mainly TLB/cache/IMB flushes"

Also, the series does not apply cleanly to current v7.1-rc1 directly.
It appears to
depend on the Alpha GENERIC_ENTRY series:

Link: https://lore.kernel.org/linux-alpha/20260529142322.1362438-1-linmag7@=
gmail.com/T/#t

which is still under review and not in mainline yet. Please mention
that dependency
in the cover letter and include the base commit and/or a lore link to
the prerequisite
series.

Finally, this adds a global spin_trylock()/spin_unlock() around hot paths s=
uch
as migrate_flush_tlb_page(). That has no impact on non-Alpha architectures,=
 but
it serializes these operations for all Alpha SMP systems, while the bug
description is EV7/Marvel/IO7-specific. Can this be justified for non-EV7
systems, or gated to the affected platform?

Thanks,
Magnus
