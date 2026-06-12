Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709612BE051
	for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 20:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781296407; cv=none; b=LswkoDl473xG/8OW+Ln+DtSGf9cQJyo+nH+5LS2ETPZcZymzNwwvzp+v2JPXxtXrcx99TAWkdffs46ghcvW5V1rYMqi4o0oMalDmrqojzeIQKd3e7tx2f7/UtjsNO2n+FB83ujmdE4aGqmmfoDd9Cosl1Y+B8y5JGR7JsbvjQ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781296407; c=relaxed/simple;
	bh=QdfAwhEAaZtrQx4UvQgYOabW5wZmGm9byXcpn1dc/c8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dXqPhB0uza/pOtAYXSGGrazciPS3F9vQVnWp4ufz9IOZ2sPo220UsYaSesznYsoA7h6B/pSR3aAdwQhdsvgPQj46yIV9ZwC6E9MDB78m/+xf11xMCUda+rBtp65FCJTVtpDrpLXLevSsBTlnc81cpkImOxBjmx4kJQUUsPH6/m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHxzW+6L; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHxzW+6L"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39677234558so12312061fa.1
        for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 13:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781296404; x=1781901204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=83oyIPsXGnKHRkJ4QNlu3LspiqSZz+Cr9FC0lT7oks8=;
        b=HHxzW+6LaHQ73RYiNtuf5f26abQ4LojS+X+Q2k7M5MBLnNVgBrlOX/8I/tgUCXnmqU
         HkivV5U9Lsrz63A4tj5z/8JzJTbTU9ZkmJnjCtNSxi8j/6yhuq8MnF2OkdKTIcX32Qm2
         LRiW6Mqq4tEyLfc7UAvHPBbuseEpCWLz773k4axyre3dKd3AS7/r3URSzuqFiNHXWM/4
         BjXdDkDWI4IWaGqgrVV6Xu4lvUVGq6dBGY1JVqdH2xyduO97UDeRZFcOoehiMqdR2kLz
         efipg6Wfrjx9XRpsPCFNRPhT6GLGNyD+Z1HVQrufTklVeY86xW/D6C3NA2RLUfHf2xqw
         CpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781296404; x=1781901204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83oyIPsXGnKHRkJ4QNlu3LspiqSZz+Cr9FC0lT7oks8=;
        b=H1getvdOqgUfwJ8sHb3lvbgw04oJjIFAMLKAgRUdpE0Q+gGeX/lKFKyp1lNN+ICPi0
         IWdjoDAwSRft3g1lleKfxNjpeOnrzT8+U3Jud4D7JKfbMvOMfqVn9RXjrc2RJXV5G+eM
         p4DsyEISLX28BNwq09m4YHVfSxn2VbR1jK7edS+34vQuITaVs+rnWy62zXWw8sqzndnR
         a6gT+i0hprdrPlHTHxy5qF2DHVgp5M4kp9cJmwI6YkHCNQfdRWqxKWD7OJaJ123buvRp
         A0gDzPig7jumLQcgjLgOF+asZkzRlXbWVl2o5+xg4lIF+bLrynT/pFBEunAmHgoq7tPv
         Ybdg==
X-Forwarded-Encrypted: i=1; AFNElJ9Sq4H6ra/9e43v18lZ6Wx59zzu5E59YKzgNUBA7nJZ7M0sa3jZhyrqYTM8xW2TBugl8E+1/1ruyJntmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc6na+8sCfMywxkrs9UCd/FR/KLb27GKQjhr1czZ4LtI/IIzAj
	p4ulPqjgvYgysHv63qFxkC9sswEDPvkiQTHZrQRJUMPyhfeEW8Bu/GIh
X-Gm-Gg: Acq92OGXqdKDC7JMTmO2n67nuphP0R8yRiBZZh2eHSGV8omtipFOtIurNoNsbYeNzLV
	z1OmprH7TDoPyydn7iU7ldwHBqJSa0ezsiplDtN3Xz7SoFJLinKFCHn58a3sEVqtBRTDdXLzH1F
	o0SfMQDPSc2OVdk3iELdkEn/IrVCOUDyVzwaZF9rnMTS15Nvi7s5srl4BgISvS4n0mmipSyltO4
	zy/Z8cBq4gejlDirI4BKhISDEpFWZZLmkhLFLgqEmLQBBKQzbqUHiINXRWsRSKkt28Ci2iuvIPw
	/5DGQQEns/pM5pj/VMG1JJ6uHOTCAyD6aGyoOESbaC40lZhXrYk71Z1hqj64izHw4N3zji4KyPc
	g7I6IrmaT0DdXAEnA1/+a2EwCMeTgfuHJ3WCvWFvX+0V0cCxKTH87a4kT856kN4dN7gtzpyiyjm
	Y11Ax0uWM7uJabK2yosEnC3kp4LtTAYGpt8KXinE5JPKrQ2shiYp3/KKKQI/ndjcK4il0ynL3WS
	KMpdeAk925ErCtm0u/P+T2vfzprMVZj
X-Received: by 2002:a05:6512:b8f:b0:5ad:abf:1e1d with SMTP id 2adb3069b0e04-5ad2db24ec4mr1316191e87.8.1781296403354;
        Fri, 12 Jun 2026 13:33:23 -0700 (PDT)
Received: from buildhost.darklands.se (h-37-123-143-144.NA.cust.bahnhof.se. [37.123.143.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161e70sm788949e87.5.2026.06.12.13.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:33:22 -0700 (PDT)
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
Subject: [PATCH v3 0/8] alpha: enable generic entry infrastructure
Date: Fri, 12 Jun 2026 22:26:48 +0200
Message-ID: <20260612203006.2265557-1-linmag7@gmail.com>
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
and enables GENERIC_ENTRY and GENERIC_IRQ_ENTRY. This is v3 of this patch
series, please see below for changes since v1 and v2.

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
also initializes dynamically allocated PCI sysfs bin attributes for
lockdep, provides ftrace return-address support for lockdep call-site
reporting, and converts low-level platform locks to raw spinlocks where
regular spinlock instrumentation is not appropriate for the hardware and
interrupt paths involved.

The lockdep patch then adds hardirq state tracking in Alpha's low-level
entry/exit paths. It annotates PAL IPL transitions and the shared return
path so lockdep can keep its interrupt state in sync with the hardware
IPL state. This allows CONFIG_PROVE_LOCKING to remain useful on Alpha
instead of quickly disabling debug_locks due to IRQ state mismatches.

The final patch enables GENERIC_ENTRY and GENERIC_IRQ_ENTRY. Syscall
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
  4. alpha: initialize PCI sysfs bin attributes for lockdep
  5. alpha: provide ftrace return address support for lockdep
  6. alpha: convert low-level platform locks to raw spinlocks
  7. alpha: enable lockdep hardirq state tracking
  8. alpha: enable GENERIC_ENTRY and GENERIC_IRQ_ENTRY

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

Magnus Lindholm (8):
  alpha: enable regset-based ptrace and core dumps
  alpha: add ARCH_STACKWALK-based stacktrace support
  alpha: make irqflags helpers operate on IPL state
  alpha: initialize PCI sysfs bin attributes for lockdep
  alpha: provide ftrace return address support for lockdep
  alpha: use raw spinlocks for low-level platform locks
  alpha: enable lockdep hardirq state tracking
  alpha: enable GENERIC_ENTRY and GENERIC_IRQ_ENTRY

 .../features/core/tracehook/arch-support.txt  |   2 +-
 .../features/locking/lockdep/arch-support.txt |   2 +-
 arch/alpha/Kconfig                            |  13 +
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
 arch/alpha/kernel/pci-sysfs.c                 |   2 +
 arch/alpha/kernel/proto.h                     |  13 +-
 arch/alpha/kernel/ptrace.c                    | 400 ++++++++++++++----
 arch/alpha/kernel/signal.c                    | 146 ++++++-
 arch/alpha/kernel/stacktrace.c                |  61 +++
 arch/alpha/kernel/sys_dp264.c                 |  38 +-
 arch/alpha/kernel/sys_rawhide.c               |  17 +-
 arch/alpha/kernel/traps.c                     |   8 +
 arch/alpha/kernel/vmlinux.lds.S               |   2 +
 26 files changed, 860 insertions(+), 421 deletions(-)
 create mode 100644 arch/alpha/include/asm/entry-common.h
 create mode 100644 arch/alpha/include/asm/stacktrace.h
 create mode 100644 arch/alpha/kernel/stacktrace.c

-- 
2.53.0

