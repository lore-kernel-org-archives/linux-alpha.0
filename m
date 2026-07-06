Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3872E8DE3
	for <linux-alpha@vger.kernel.org>; Mon,  6 Jul 2026 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357234; cv=none; b=td4QAhb9DKrqfMnGeSiHR4/FauOkCzCn7gE5W0+35rrshjO3GWxwaSVehps1xgCvzsafCvSklE+/q4F3pGsODz1gUtf8kRGnGKDud00OUHdXXxF93ygz6p4SWiDZ8TX6ECjWLvCNvSX1lY2JLRczn4cEs012DMRhDiFp42DO76E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357234; c=relaxed/simple;
	bh=+l6e+VeRLW7xzJmxVInFSOsqx9LIi5Wt5E8ntYb1c4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nl8bK5roEotFY7HphWAcFpakRP3zkJ/hFz+J/3hJhOfOSMjJLP8pkS8KPbq/9G+ts39Eje0BuAP5PAQln1ZT/eHlrhUb99Cs2P8AAxEHt7jkXjho2g2oEHBKqX3ALNfPYJ40e8C3Z8yYxBMShCrL275EduxAJ/5sNqeZ01QhfAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwwYkvaJ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwwYkvaJ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so3659866e87.1
        for <linux-alpha@vger.kernel.org>; Mon, 06 Jul 2026 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783357230; x=1783962030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0V25XMahcmii4A05+ZXdyvVIS5DOaF/YxXJrya9TUv0=;
        b=KwwYkvaJ8rakiMYzBvwhurSSB1kNDdlmFSxJQsjutWfh6MqK1e5SeDQuyoWArc1bdk
         9IgBqXkQ4KC9FfQ0bVR+rX2xjt5odbBjxUnmeM6k1ZhAFBZbO+sxpaZ1oabuKhgrMevN
         r6WJcoTLs9YPjejw7Qe0lOTwdHEjH4q4rW8z0d4tMSXiYeE7PlcB32aEePMzecxfbIUs
         lQdRFsbFCMqHErgwWyvxIPVis1MV7S2h8wGTquMWg1Pa79dB3nXOWHLcN0VwK/esLBB1
         JwRNc1f9X8cQuOnUzZuq9FX3ae+2mixSSGUQqyMhWZ1HejKvTkqUExChLYtl1I4GBNKW
         W7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357230; x=1783962030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0V25XMahcmii4A05+ZXdyvVIS5DOaF/YxXJrya9TUv0=;
        b=Aajc5bHt5uNpUYldcG27TBpFMOVHplAQ7Hf66dDt0wDMYSptSosdlw3Dd0DbaP2T5P
         DJOG8z+fu7SeL2WP5peqg98vPsSG2CQ3avdnzJoHttaJGRPjYQSPKVRiUYFEz0I7UY1t
         IKzxjYT5ACMG1uZrgyJgUJuf4To3lcml06eP2y6n8AW5h7XIRBzLC8Q3P0ZGUtN2gtaC
         uUEjjlNp3JFNrtIg9Pj2iAemlOAQDwCywDesp5iwaN0lVg/cU2zC+e6h3Vx8J7C+j9At
         Dv1K3wovG44BYVMCBDMBYeKiCW7oXgiH0VF2JZcRNOAGVNYBjpRGd8hPK1GqYzNvS5fc
         j4hA==
X-Forwarded-Encrypted: i=1; AHgh+RqcJRmXuXCzXWSUnK1gGyg+IqOCfMRQXU7zhPWC/T/dqlrmPJ+GaVpCt2QiGoflqqZBG7jG23fgdvvxgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Gw77zEZ6PEi8eenAP6OazONFRlsm3z5NGAfjuXHq/XhIwQhR
	z6QmciLmg9o/9VgQCazx2TlEU5iKhTQ9Qw8/uFnnzxJE5BwBwqBuIrd4
X-Gm-Gg: AfdE7ckOh6Afp195GdfyGQBWzIapy7Q92ZtuU4Zm5yCdZ+n4OfTZUQWFeIJolsjW6Eg
	XqkpzZt13lpd2JoO8tFePfPkhckk7c35+ZQYC7avSNnhLSU4+Qpzlx799il4ZZgPi0AGMNV+BMj
	L5jPzSDKIJIl1DDbiMxaS9n22wqmICb2GTBJuA7jRlaWSGfJ1K0xWZdna2VCO2GROT5v2yxJQhb
	8JDQJIZRirbL8E6e+u8Bjq00e9oGzS8oZ+KpzV1+pWivhfuMHI2D2YFbHazn+KTzc640S4UOHEu
	tC8asNgLiCRALhiGmzI6u9bVEmjmo2vjmhy3THzF6oLu5LajVohuRToCiIEG/Zo8PCTMV/KtHu9
	0kGiJYWaI+UGIKqS3PLHSKmazt1jmbb+kKSicJ2w+DwixDW4YTgKoI2f8sDcnCMzp7ZNN2DbNS3
	abZKC2WDf3sOuwzkG3DG0gxCh2Rm6FIHDDqveRM4IB0s6LMm2MFvvspILGU7pTIk2w7xYNIKH7M
	aBwh9ri7iWaTttYS4kK6JfpRrY=
X-Received: by 2002:a05:6512:6885:10b0:5ae:b8f2:a63d with SMTP id 2adb3069b0e04-5b007c59167mr177353e87.65.1783357229947;
        Mon, 06 Jul 2026 10:00:29 -0700 (PDT)
Received: from buildhost.darklands.se (h-158-174-102-211.A469.priv.bahnhof.se. [158.174.102.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bfd1fsm2961021e87.55.2026.07.06.10.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:00:29 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	macro@orcam.me.uk,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v4 0/7] alpha: enable generic entry infrastructure
Date: Mon,  6 Jul 2026 18:56:41 +0200
Message-ID: <20260706170019.2941459-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series moves Alpha closer to the common architecture infrastructure
and enables GENERIC_ENTRY. This is v4 of this patch
series, please see below for changes since v1, v2 and v3.

The main motivation is to reduce Alpha-specific syscall tracing, ptrace,
seccomp, and return-to-user handling where common code already provides
the required infrastructure. Alpha still has ABI-sensitive syscall
details, most notably the assembly syscall invocation and the r0/r19
return-value encoding, so those remain Alpha-specific. The surrounding
entry/exit decisions are moved towards common code.

The series first adds regset-based ptrace and core dump support. Alpha
now provides a user_regset_view for NT_PRSTATUS and NT_PRFPREG, exports
the ELF-visible general and floating-point register layouts, and uses the
common ptrace regset implementation for PTRACE_GETREGSET and
PTRACE_SETREGSET instead of open-coding iovec handling in arch_ptrace().
This also provides the basis for HAVE_ARCH_TRACEHOOK and common ptrace
syscall-info support.

It then adds ARCH_STACKWALK support. The implementation uses a simple
kernel stack scanning walker, starting after pt_regs for current tasks
and using the saved PCB kernel stack pointer for blocked tasks. This
enables common stacktrace users such as dump_stack(), /proc/*/stack, and
SysRq backtraces, without introducing a frame-pointer-based unwinder. It
also avoids relying on the legacy weak save_stack_trace_*() fallbacks,
which is needed by the later generic IRQ-entry configuration in this
series.

The next group of patches prepares Alpha for lockdep IRQ-state tracking.
Alpha interrupt masking is controlled by the PAL IPL state, so the
irqflags helpers are made to operate on IPL state rather than treating
the full processor status word as the saved interrupt state. The series
also provides ftrace return-address support for lockdep call-site
reporting and converts low-level platform locks to raw spinlocks where
regular spinlock instrumentation is not appropriate for the hardware and
interrupt paths involved.

The lockdep patch then adds hardirq state tracking in Alpha's low-level
entry/exit paths. It annotates PAL IPL transitions and the shared return
path so lockdep can keep its interrupt state in sync with the hardware
IPL state. This allows CONFIG_PROVE_LOCKING to remain useful on Alpha
instead of quickly disabling debug_locks due to IRQ state mismatches.

The final patch enables GENERIC_ENTRY and. Syscall
entry now uses C helpers built around syscall_enter_from_user_mode().
The C entry helper handles the common syscall-entry work, including
ptrace/seccomp entry processing, skip decisions, syscall-number
shadowing, and syscall table lookup. It returns the selected syscall
function pointer to assembly.

Assembly then performs only the Alpha-specific dispatch: it reloads the
syscall arguments, preserves the required GP/stack conventions, and
performs the indirect call through the function pointer returned by C.
Skipped syscalls bypass that dispatch and return through the Alpha
syscall-exit helper.

Syscall exit is split in the same way. Alpha first performs its
ABI-specific result handling: r0/v0 carries the return value or positive
errno, and r19/a3 carries the error flag. It also handles skipped
syscall restart state and successful syscalls whose return values may
look like negative errnos, such as legacy ptrace PEEK requests. Once the
Alpha-specific r0/r19 state is encoded, the path enters
syscall_exit_to_user_mode() for the common syscall-exit and
exit-to-user-mode work.

The syscall number used by generic entry is kept separately from the
return-value register. entSys copies the raw r0 syscall number into r1,
and r1 is used as Alpha's generic-entry syscall-number shadow. Restart
bookkeeping that used to be carried by low-level assembly state is now
kept explicitly in thread_info. This avoids using user-visible general
registers as hidden restart state while preserving Alpha's restart and
ptrace semantics.

Testing was performed on an Alpha EV68/Tsunami SMP system (UP2000+) as
well as an Alphaserver 4100 (rawhide) system.

For the regset, ptrace, tracehook, and generic-entry changes, testing
included:

  - custom ptrace/regset round-trip tests for both GPR and FPR regsets
  - PTRACE_GET_SYSCALL_INFO validation, including the reported user
    stack pointer
  - ELF core dump inspection with readelf
  - strace testsuite (make check), with the remaining failures comparable
    to the pre-series baseline on the same system.

Kernel tools/testing/selftests:
  - ptrace: syscall-info tests improved over the baseline.
  - seccomp: seccomp_bpf passes all applicable tests.
  - exec: check-exec now passes once loop block-device support is enabled.
  - ipc: ipc selftests improved over the baseline.
  - acct: acct selftests improved over the baseline.

Overall, the selftest comparison did not show an obvious regression
introduced by this series. Instead, the patched kernel reduced the
number of failing top-level selftests and fixed several failures in areas
that exercise the new ptrace, tracehook, seccomp, and generic-entry
paths. Some unrelated failures remain and need separate investigation,
but they are either also present in the baseline run or explained by
missing kernel configuration or test-environment support.

For the stacktrace changes, the following scenarios were verified:

  - SysRq 'l' prints backtraces for all CPUs, including syscall and
    interrupt contexts
  - /proc/<pid>/stack returns sensible call chains for both the current
    task and sleeping tasks, such as nanosleep
  - stack traces remain stable under scheduler and I/O load, including
    ping, ext4 writes, and background workqueues
  - no crashes, lockups, or obvious mis-unwinds were observed

For the lockdep changes, /proc/lockdep_stats shows debug_locks remaining
enabled, with no redundant hardirq or softirq on/off annotations observed
during testing.

Review feedback is very welcome. Additional testing on other Alpha
systems, CPU variants, and workloads would also be much appreciated.

Patches:

  1. alpha: enable regset-based ptrace and core dumps
  2. alpha: add ARCH_STACKWALK-based stacktrace support
  3. alpha: make irqflags helpers operate on IPL state
  4. alpha: provide ftrace return address support for lockdep
  5. alpha: convert low-level platform locks to raw spinlocks
  6. alpha: enable lockdep hardirq state tracking
  7. alpha: enable GENERIC_ENTRY

Thanks,

Magnus

---
Changes since v1:
 - Fixed skipped-syscall exit handling so PTRACE_SET_SYSCALL_INFO and legacy
   POKEUSR skips return ENOSYS/a3=1 only when no ptrace/seccomp return value
   was installed.
Changes since v2:
 - patch 8: add PTRACE_PEEKUSR support for FP registers and PC
 - patch 8: add/fix focused ptrace single-step validation
 - patches 1-7: add Reviewed-by and Tested-by tag
Changes since v3:
 - Rebase on v7.2-rc1
 - Restored Alpha's explicit FPU save before signal delivery in the generic
   return-to-user path, fixing FP state corruption seen with asynchronous
   signals and FP-heavy userspace.
 - Dropped the explicit GENERIC_IRQ_ENTRY select from Kconfig, since
   GENERIC_ENTRY already selects it.
 - Dropped the pci-sysfs bin_attribute initialization patch; it is no longer
   needed after rebasing onto v7.2-rc1, where Alpha PCI resource attributes
   are static attribute-group entries rather than dynamically allocated
   bin_attributes.

Magnus Lindholm (7):
  alpha: enable regset-based ptrace and core dumps
  alpha: add ARCH_STACKWALK-based stacktrace support
  alpha: make irqflags helpers operate on IPL state
  alpha: provide ftrace return address support for lockdep
  alpha: use raw spinlocks for low-level platform locks
  alpha: enable lockdep hardirq state tracking
  alpha: enable GENERIC_ENTRY

 .../features/core/tracehook/arch-support.txt  |   2 +-
 .../features/locking/lockdep/arch-support.txt |   2 +-
 arch/alpha/Kconfig                            |  12 +
 arch/alpha/include/asm/elf.h                  |   1 +
 arch/alpha/include/asm/entry-common.h         |  14 +
 arch/alpha/include/asm/ftrace.h               |  30 +-
 arch/alpha/include/asm/irqflags.h             |   6 +-
 arch/alpha/include/asm/ptrace.h               |  21 +-
 arch/alpha/include/asm/stacktrace.h           |  20 +
 arch/alpha/include/asm/syscall.h              |  18 +-
 arch/alpha/include/asm/thread_info.h          |  31 +-
 arch/alpha/include/uapi/asm/ptrace.h          |   2 +-
 arch/alpha/kernel/Makefile                    |   3 +-
 arch/alpha/kernel/asm-offsets.c               |   6 +
 arch/alpha/kernel/entry.S                     | 328 +++++---------
 arch/alpha/kernel/irq_alpha.c                 |  78 +++-
 arch/alpha/kernel/irq_i8259.c                 |  19 +-
 arch/alpha/kernel/proto.h                     |  13 +-
 arch/alpha/kernel/ptrace.c                    | 400 ++++++++++++++----
 arch/alpha/kernel/signal.c                    | 149 ++++++-
 arch/alpha/kernel/stacktrace.c                |  61 +++
 arch/alpha/kernel/sys_dp264.c                 |  38 +-
 arch/alpha/kernel/sys_rawhide.c               |  17 +-
 arch/alpha/kernel/traps.c                     |   8 +
 arch/alpha/kernel/vmlinux.lds.S               |   2 +
 25 files changed, 860 insertions(+), 421 deletions(-)
 create mode 100644 arch/alpha/include/asm/entry-common.h
 create mode 100644 arch/alpha/include/asm/stacktrace.h
 create mode 100644 arch/alpha/kernel/stacktrace.c

-- 
2.53.0

