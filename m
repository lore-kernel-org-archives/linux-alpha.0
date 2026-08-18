Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FB748551F
	for <linux-alpha@vger.kernel.org>; Tue, 18 Aug 2026 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787077768; cv=none; b=OP/IMuESzrbiFMixuvs8nbV1dmGsKBgMFEqSpUvMRo2yvEE4Ogxe9lIPOUteHE9w5XOJ3Tm/blpI/uQNS4GmAvbTv8PY2mtGJcvswWUPV2pbDgC6vTSoZNe0CgHowfMF1JYbY1yvcG9y6RJa/DUU4udV2j+tpP88BAWu9HdMzCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787077768; c=relaxed/simple;
	bh=/xTGWENdgB65RCOlGQm2HYt3JYs2IniuLwfTCbHWbeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XdMEYoSySg+WOgvXdBFyEQFqXi2F/s9E2AsZbSRf/RSVkfjUxsNj28EoPS9wWCQftUg2AmjSpx+F78qa5I8aCDvJRselFXePasAYUEhx1AyNCWRp1pnRGrcV9TlxuK8ZLBdsepsGZSBMGy4r6JxjmO/MN4cAaL9z+cF55n9BNhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGhLG8BM; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGhLG8BM"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c20e70a0962so12211866b.2
        for <linux-alpha@vger.kernel.org>; Tue, 18 Aug 2026 11:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787077765; x=1787682565; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tP/0lBq9gdgFDbn/7AYy/lXrcqTgy1xpt21MvvxaMAc=;
        b=bGhLG8BMyjzmr/gSlmPeWSAmH8weIo6RAoXS/9ERkvnrKBobKR6p9nvxVJrWXIqlse
         z2JwZR6yqgnSh4arRGQsTha0esroJnZiR6Gh1ODZG3ssJUw/Hj8F7nWjEi7WFaq+HanM
         HysVXHmI5ciOairYsb4lGS7hdpKRw67WTyGaHAlSFwtR7rd5gPuFL0TXH7DsHfxR0Uyr
         QEfoViL67yWsbcLEuBat2Skm/VFCS7i915XdpA8WCSkj/w+99UIrluDFCBFzVCgDgY7p
         7Oxx4UuGT1zJYwOAEboKwdQSyHE3MGhz5Efkl9NaWuHQw//JSiyfcO8RIt3S6AVXeN82
         gipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787077765; x=1787682565;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tP/0lBq9gdgFDbn/7AYy/lXrcqTgy1xpt21MvvxaMAc=;
        b=MYHbPYyAvGeSvOhmqSmiy8/d2lYRnqgGlj2nHpn2yguKg5qzRRPcPErMoMASznTnct
         EBVKyhHfPN0WbX1+h1bG0YOQuOA/cHjpQQfotGcfiKKyKK3jDVfXuPFAVGyKHH73tKbR
         7TQ0GVk9Js0A1ydR474QuCNEphwDUMp1w1uifmhulU6pIM4PD6h6ipTeW7hTw8IjdUi9
         7vTFBijGxKcc+T+/YAuonJTHlEfAIa392lOsk7DqWlClF3J3q96UMGTYi2ICpNhDne41
         u6hvP498zSosnifbTEi2lXFtJNFgqrA8quWnhQg+3FnVW/dWZbO0sUR/DichjAFpZT8y
         aP6g==
X-Forwarded-Encrypted: i=1; AHgh+Rpm5EW0QWekhAmlg3r9LDO4CuDNyU/XDMxbOJLNK/lSEaTmi/VzoL8YCyg+ZDVaJgeJ/GtGCwbLoJ1G1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL98FLprjyeh7NvvhgKlJpBTPUy6eZQcyC2PX9wHEPuodtNDxQ
	4FurhYoZe0paJBM8WKF3xx7dymlcHHHP1jvO/rj1VewrxtpkH8AXw5tu
X-Gm-Gg: AR+sD11qP5GMKHgC/H5ebq5fhefKYWtYatGGGXjQGGLcvESeFgCsIO2GhRjza/Cci1f
	Nu9l9F7w7w4aJR8uvpuWiLMRnq3XvvvK6pibL9xWPLTUOO0Z3cUJb/lqxw9x0sKgOz5I8oKlkU6
	DuNdNWUFG2G/m5pFSO6FKpyrBuKkdeDI8JHiCA2r86Bvcuiat6lF9fON259mzQItns7UAfLHLju
	luoXJQYApiWIQED03a2+STE3Cu7ug9Vz1oVZ5EUdHnvquK8pnvRZWeVMlyt1/wp+9TXGIdOnBPu
	/LAOtBRwMVFC1rRNX2ekYgTNZs1w9jyItkKpfW367IX1odzxONu+0vXsHgzcTkTaDNOrrHKezIk
	7Lluzq8vGoLpFBE29lfbETaopzdw2c43V1Ft1HDyfOlnNdfuUOtbb11Z4rym1IHb0muzAqr1rWZ
	ZxoreRiF9MgB33ILM6OwrLqw4RKvwk50P1CmnT1IvzXNsD8SEUUKOTGt9nrKede7qB1KVIECAq3
	Rpkhe+8zQb9RCdTxE1MbADRGMnnxuJ++ExL
X-Received: by 2002:a17:907:3d08:b0:c20:af9d:4544 with SMTP id a640c23a62f3a-c221b18684cmr27944466b.6.1787077764878;
        Tue, 18 Aug 2026 11:29:24 -0700 (PDT)
Received: from z440.darklands.se ([2001:9b1:ff:d701:3cb6:632d:c577:8661])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b73be8sm186847466b.35.2026.08.18.11.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 11:29:24 -0700 (PDT)
Date: Tue, 18 Aug 2026 20:29:22 +0200
From: Magnus Lindholm <linmag7@gmail.com>
To: torvalds@linux-foundation.org, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mattst88@gmail.com, richard.henderson@linaro.org
Subject: [GIT PULL] alpha updates for v7.3
Message-ID: <aoSkgrrgIY29ioTS@z440.darklands.se>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

This pull request contains two fixes for Alpha floating-point exception
handling, two clang-related fixes, the preparatory changes from the
generic-entry series, an interrupt-entry lockdep fix, two Marvel/EV7 IRQ
fixes, an RTC fix, and one header cleanup.

The generic-entry preparation adds regset-based ptrace and core dumps,
ARCH_STACKWALK and lockdep hardirq-state tracking. These changes are
useful independently and enable previously missing debugging facilities
on Alpha.

The final patch switching Alpha to GENERIC_ENTRY is intentionally not
included in this pull request. I am deferring that change to allow
further testing and to reduce the risk of conflicts with ongoing
entry-path work elsewhere in the kernel.

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v7.3-tag

for you to fetch changes up to b39c748d9db0c6f3ada5e7cef7f56415827d5f81:

  alpha: read $gp and $sp explicitly for clang (2026-08-16 16:00:00 +0200)

----------------------------------------------------------------
alpha updates for v7.3

- alpha: read $gp and $sp explicitly for clang
- alpha: pass -Wa,-mev6 only when using GNU as
- alpha: annotate hardirqs-off on IPL 7 interrupt entry
- alpha: run the remote RTC access in a worker, not an IPI callback
- alpha: don't leak hardware-fabricated FP exception bits to user space
- alpha: fix ieee_swcr_to_fpcr setting FPCR_DNOD unconditionally
- alpha: enable lockdep hardirq state tracking
- alpha: use raw spinlocks for low-level platform locks
- alpha: provide ftrace return address support for lockdep
- alpha: make irqflags helpers operate on IPL state
- alpha: add ARCH_STACKWALK-based stacktrace support
- alpha: enable regset-based ptrace and core dumps
- alpha: marvel: Fix lock ordering in init_io7_irqs()
- alpha: marvel: Fix irq_set_status_flags to use correct IRQ number
- alpha: remove unnecessary architecture-specific <asm/device.h>

----------------------------------------------------------------
Ethan Nelson-Moore (1):
      alpha: remove unnecessary architecture-specific <asm/device.h>

Magnus Lindholm (6):
      alpha: enable regset-based ptrace and core dumps
      alpha: add ARCH_STACKWALK-based stacktrace support
      alpha: make irqflags helpers operate on IPL state
      alpha: provide ftrace return address support for lockdep
      alpha: use raw spinlocks for low-level platform locks
      alpha: enable lockdep hardirq state tracking

Matt Turner (8):
      alpha: marvel: Fix irq_set_status_flags to use correct IRQ number
      alpha: marvel: Fix lock ordering in init_io7_irqs()
      alpha: fix ieee_swcr_to_fpcr setting FPCR_DNOD unconditionally
      alpha: don't leak hardware-fabricated FP exception bits to user space
      alpha: run the remote RTC access in a worker, not an IPI callback
      alpha: annotate hardirqs-off on IPL 7 interrupt entry
      alpha: pass -Wa,-mev6 only when using GNU as
      alpha: read $gp and $sp explicitly for clang

 .../features/core/tracehook/arch-support.txt       |   2 +-
 .../features/locking/lockdep/arch-support.txt      |   2 +-
 arch/alpha/Kconfig                                 |  10 +
 arch/alpha/Makefile                                |   8 +-
 arch/alpha/include/asm/device.h                    |   6 -
 arch/alpha/include/asm/elf.h                       |   1 +
 arch/alpha/include/asm/ftrace.h                    |  30 +-
 arch/alpha/include/asm/irqflags.h                  |   6 +-
 arch/alpha/include/asm/ptrace.h                    |   7 +
 arch/alpha/include/asm/syscall.h                   |   7 +
 arch/alpha/include/asm/thread_info.h               |   7 +-
 arch/alpha/include/uapi/asm/fpu.h                  |   8 +-
 arch/alpha/include/uapi/asm/ptrace.h               |   2 +-
 arch/alpha/kernel/Makefile                         |   3 +-
 arch/alpha/kernel/asm-offsets.c                    |   1 +
 arch/alpha/kernel/entry.S                          |  32 ++-
 arch/alpha/kernel/irq_alpha.c                      |  87 ++++--
 arch/alpha/kernel/irq_i8259.c                      |  19 +-
 arch/alpha/kernel/proto.h                          |   4 +
 arch/alpha/kernel/ptrace.c                         | 320 +++++++++++++++++----
 arch/alpha/kernel/rtc.c                            |  37 +--
 arch/alpha/kernel/signal.c                         |   9 +
 arch/alpha/kernel/stacktrace.c                     |  61 ++++
 arch/alpha/kernel/sys_dp264.c                      |  38 ++-
 arch/alpha/kernel/sys_marvel.c                     |  25 +-
 arch/alpha/kernel/sys_rawhide.c                    |  17 +-
 arch/alpha/kernel/traps.c                          |  18 +-
 arch/alpha/kernel/vmlinux.lds.S                    |   2 +
 arch/alpha/math-emu/math.c                         |  88 +++++-
 arch/alpha/mm/init.c                               |   3 +-
 30 files changed, 684 insertions(+), 176 deletions(-)
 delete mode 100644 arch/alpha/include/asm/device.h
 create mode 100644 arch/alpha/kernel/stacktrace.c
