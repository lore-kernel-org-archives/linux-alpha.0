Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742194;
	b=J2vxVbGrrQcvEo+lXnSQPWlUeKc+WIFWw9PlJiv3Syjmp0uYn6a3AsGOF6c4NaRKVMdN
	 QONWxCR5nU3pD2j0tCnjeDa3vvqxyaPmDSutSBHmwQerat6HdeCyOc600DZn3mQZynDu+
	 ChXuOcC8upgEO/Wwz8BbIlX1qYdbaAR8yZHynRrO2Wapn46timE4p+sjZ5br3XntI7Agz
	 y0X9rEnKQu/PcUQ0IyGhzkYe2fuc/mv5+DisWmFZylbzb7cfxR+k88uq4awCJg0w5n6gh
	 GPKEjWBjz3ZmKnVKx5Wy2CFHOKD57hkh/IDhz/hbXGDadhMCopWdLMS7pu8pc4XUI4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0yQ+xs6aEztTJgPOL/FRptwCM1FCU7FbXIb46UL6X3Y=;
	b=ux765qbrjNPj7OcZCk8IMdHc8SUo2O5e8KGendio7L6qa9IWsMUPrU+kIZZzz/Br184g
	 /2Aoa3InLni3FKL7mNIAzSJ/tkPvGqk6ChUmsexlW0I7ljCH2AN14zzfgSIvppvACQ4Pe
	 hsJBlN5xrxMB/dGtyp8XutWDYHDiFah0YOLBat0iQsJEJrUhrGXrPZ7AGrbZi/QpcLOlQ
	 ixTUElP0g3VKsm8iwx2fmn9H+kiANAMnB5rdtr5LBxERJz1cylIb8bWYrcrZNgfg7U11Q
	 haWifZdgCrv5r+VPzDaCopJuADRpWbZODByevdc03tAod1Yfx/jMR7linAupRWOuLCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zgsz6jtt;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C654606A326
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 21:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C654606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zgsz6jtt
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so7872896a12.3
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 13:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742192; x=1794346992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0yQ+xs6aEztTJgPOL/FRptwCM1FCU7FbXIb46UL6X3Y=;
        b=Zgsz6jttDrNE0nAEi5gAL562a7kaxEtzuezmnofWUEX7AIppECy3pNcKy0hCsIlsIo
         kOXVQSgsZcjgQlEGH5evjNMecUUPA7lKfxZm1t0uYfmBzPR9xQCTAM5Jf2M5pvArZ510
         u/+pcCNQ6BMg8P9fhMUKiO6OKFJv5EpnJe90C0E8Qg9efabCtXnrhfeG6Mz9P8pWoxjO
         lem9eiF3XVWGgdMYsPqVI1spiUp1X6qcN+wyORhJBGCl/ij6vCd+1HBh2ghskcPhZpi0
         5CXvAhEqKDQAmfN0lOO+zDZPvRx0z6sxASNib77yGQSZ/NYiDaNmFeTKDwSKCrclliOQ
         z4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742192; x=1794346992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yQ+xs6aEztTJgPOL/FRptwCM1FCU7FbXIb46UL6X3Y=;
        b=z4jnBwIDGUke8HRuAboEeSpfSuUgmUACvUNZzKNjHFwG0OhUOAeZENevt17Z8foYob
         /YvzVEAbanVs8k/m0SuZNHf9naJrSDSb0OfJqAO2hQjGR6GH0qXyGFYRJdeI4d5BlHfU
         2EK1dsm0bmT5UM7Fnl/smMTOHCkPJtRk4Rj3KXlt2ZDI982OYlZQmpOiZen8kp5I9QS0
         67C/REoYC6+azw9HfZUlWAB2ZNYloMTO2IvL+4d+h3ej16KDieCUiWcHRXI2XjmKtbAO
         TvznpQyTdZvlFJsGAxEM8162nW/ok0Eq1lABlpE5su7olbmyirbJeh9BYMEaQwW0bQug
         WBbw==
X-Forwarded-Encrypted: i=1; AKwUvByWaZdSFJE1zBpOmvr5tVXUn3iartv2QWickz7jN9PDztUScT3UwSHudrlz9unxuGFauFhKj7v/B3RhcA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/3Wxss5YdxfIabJnQY7MxDORwVxYcVDJa3388jtQ2Tma7EvZop
	dqvC7AY1Hjb+pCuOBjOSaLRbPO/fMm4a/f45f0gQIP/hEEcX6yz2Za9n+FglXIVaOM0=
X-Gm-Gg: AYBFou0rEgwTNUh05Q6QoRGGhr9NuNkvhR/G0UThlfSWhc3NKV0Kcl3xi4Z0HF/6fYA
	S58nSx1MiV767WYDz0Qqr/sk9jdaVZYXTBTli8gGMssUVSUOS7iKtCJSmt5DHK5bu/5scGCPLyy
	qsH31hc+QHMuQ3RbV3rFQPWx0O5s/yHmJo8Z3uxq6dyoCC0cJQSbVbJ8igzT4Dk3Bd9+64ayG+2
	r+bEk6W7rscmzVsepUt0t4dH15drwQBIQnoJ+HmZaYDMNIe55zHkQBX+M0cQPfjP5rd+F97U/DZ
	duYuHWiI7jwZbC4oP3z9WAMugEE+gVbENFB2ITn+QogLOnGQTxxdeMadrGP26P6hBy3yeVjQxYw
	GlqltyxXGTzNkXUlYwpIWFjBr1kSEQJch0NhsuMV6H1Hjl22bGzllZ1+immaw0Vw3QO6x3w+v3u
	o7wcutnwb3oXkMe3Dh/QG1/beWTi5Pf3UAdUww3T42ewqWJrRyme+io9Du8JUTc9GCuPFCN3m2C
	HoSs5HsT5ONJGfnvYsIUB1pjoDxEOkBWKFFadmFEt3RpMT4iJmn41xfBkjxPRBlCZm+etXOsFTo
	d5c6QYTQvkgTLlD726/tyEx7jhih+gPBrSf11CXyxW8gu4jKDG3XFl+TgeX8AtpAJV3lAIEMA/o
	P3dD9ZfQRJdRbpKtF
X-Received: by 2002:aa7:c693:0:b0:6b1:abe7:8276 with SMTP id 4fb4d7f45d1cf-6b4d33ab545mr7257113a12.2.1793742192252;
        Tue, 03 Nov 2026 13:43:12 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:11 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 00/14] alpha: fix entry bugs and consolidate generic helpers
Date: Tue,  3 Nov 2026 22:35:06 +0100
Message-ID: <20261103214120.1099893-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With GENERIC_ENTRY upstream for Alpha, this series moves syscall dispatch
and ordinary interrupt/exception entry and exit into C using generic
helpers, and removes redundant fork, core-dump, audit and ptrace code.
It also reuses generic memory-option parsing, OSF resource accounting
and CPU registration.

The consolidation work and its regression testing uncovered bugs in
saved-register oops reporting, audit return values, SIGSYS register
rollback, syscall restart eligibility and arguments, and handling of
skipped syscalls versus invalid syscall numbers. Patches 1-5 fix those
bugs before patches 6-14 consolidate the code. The fixes remain distinct
commits with their Fixes tags and existing stable Cc tags.

The fixes and consolidation changes exercise the same entry paths and
need coordinated review and regression testing. They are presented
together so reviewers can follow the fixes through the subsequent code
changes. The fixes can still be considered for earlier application or
backporting without taking the consolidation patches.

Patch 5 distinguishes the -1 abort sentinel from other invalid numbers:
explicit cancellation preserves a supplied result, whereas an invalid
number permitted through entry work returns ENOSYS. It tracks supplied
results explicitly, avoiding guesses from r0/a3 contents. This also
preserves small successful values and seccomp results matching the entry
registers. The C conversion in patch 6 retains the corrected behavior.

The OSF accounting change intentionally follows getrusage(2): RUSAGE_SELF
covers the whole thread group, previously zero resource counters are
reported, and CPU times use the generic microsecond conversion rather
than jiffy rounding. The OSF layout and supported selectors are retained.

On stock-PAL QEMU the rebuilt ES40 image passes all 107 skip/result,
91 portable ptrace, 30 skipped-restart and 50 forced-success checks, as
well as SIGSYS rollback, on one and four CPUs. The four-CPU run passes
all 18 regression suites, including seccomp (99 passes, 12 expected
skips). Patch 5 before the C conversion also passed its focused four-CPU
run on the release base.

The complete series passed all 18 regression suites on a three-CPU
EV67 ES40. The resource-accounting test now compares OSF peak RSS
with native waitid() for the same child and accounts for its final
voluntary context switch. Native controls reproduced both the low RSS
reading and the extra context switch. The corrected run had 8,364
concurrent CHILDREN snapshots with no mismatches, and lockdep stayed
enabled.

All eight focused strace injection and syscall-info tests passed. A full
native strace run at 80e661285 had 1,225 passes, 303 skips and seven
failures. Three passed on serial recheck. The remaining four involved
CLOSE_RANGE_EXCEPT, the separately submitted PR_GET_UNALIGN fix, the
Yama hint when running with CAP_SYS_PTRACE, and the getxpid syscall name
on Alpha. The companion ptrace selftest remains separate from the series.

Codex assisted with code, tests and descriptions.

Magnus Lindholm (14):
  alpha: fix saved registers in page-fault oops dumps
  alpha: report syscall errors correctly to audit
  alpha: preserve rolled-back registers for SIGSYS
  alpha: fix syscall restart eligibility
  alpha: distinguish skipped syscalls from invalid numbers
  alpha: dispatch system calls from C
  alpha: use generic entry helpers for interrupts and exceptions
  alpha: use generic syscall exit for new tasks
  alpha: remove obsolete core dump register hooks
  alpha: use generic syscall audit classification
  alpha: use generic ptrace memory writes
  alpha: use memparse for memory size options
  alpha: use generic getrusage for OSF resource accounting
  alpha: use generic CPU device registration

 arch/alpha/Kconfig                     |   5 +-
 arch/alpha/include/asm/elf.h           |   7 -
 arch/alpha/include/asm/entry-common.h  |  11 +-
 arch/alpha/include/asm/ptrace.h        |  13 +-
 arch/alpha/include/asm/syscall.h       |  24 +--
 arch/alpha/include/asm/thread_info.h   |   3 +
 arch/alpha/kernel/Makefile             |   3 +-
 arch/alpha/kernel/asm-offsets.c        |   1 -
 arch/alpha/kernel/audit.c              |  62 -------
 arch/alpha/kernel/entry.S              | 293 ++++-----------------------------
 arch/alpha/kernel/irq.c                |   8 +-
 arch/alpha/kernel/irq_alpha.c          |  41 ++---
 arch/alpha/kernel/osf_sys.c            |  56 ++-----
 arch/alpha/kernel/process.c            |  32 ++--
 arch/alpha/kernel/proto.h              |  16 +-
 arch/alpha/kernel/ptrace.c             |  48 ++----
 arch/alpha/kernel/setup.c              |  41 +----
 arch/alpha/kernel/signal.c             | 151 ++---------------
 arch/alpha/kernel/syscall.c            |  85 ++++++++++
 arch/alpha/kernel/syscalls/syscall.tbl |  10 +-
 arch/alpha/kernel/traps.c              | 118 ++++++++++---
 arch/alpha/mm/fault.c                  |  27 ++-
 22 files changed, 356 insertions(+), 699 deletions(-)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0
