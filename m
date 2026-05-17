Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E505131E84F
	for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 21:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779054002; cv=none; b=m9bUf5VR34yrkjKPI5PXZcKW4r/KejDXDEXkJZsH2UFzg5KwS/pHbRHO3VZRbZwMwFXbonrlEqy29GVZevZ5vNLHXFDLPt0fFhUQhzDot6DAapDI208y7vh/z1eATYH4bK2vHV2vdfmzrB7op2Fz47sMxxq3uaIq8wjNJzLL2wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779054002; c=relaxed/simple;
	bh=/yujYzh/VEoO10PH6kI+lqKssvJ4Cxgb2p3W2gzOiG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HXu3mm5rB142qTSdkreJer1pmHnT+8jUx+wAwhU0fvn0qxOVGjownbaQlCWncw9PNDwPc4xPU2QBA/L/xpgurEy3pzUMVgRfqD36HyhkKuPUMfMp95oFSdmW1TdE7/jzXw36rxcb0IcFFOn94bC4LTwRFRg1wUWZb/9pdbYRWEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pn3FMcl0; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pn3FMcl0"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa0cf8bca3so1706649e87.0
        for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 14:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779053999; x=1779658799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iz0cTrfiY989F3h8vG33Dyb4UoEDmV5PO+DhGeooQmk=;
        b=Pn3FMcl0Gp/M8J9iRSyu3C3yl1nmi6ehnq0qC1jyWRJykyAU8d1yn/efLd7EOBb4Gi
         rzWKtsGStz+hTtoA/sWtRtkKctjQ0wHMUcEVA5UnA6LvybdDIwjgdzTVB3VtvjrhuLKB
         lABg31MZC02OojvO79G/o1GJuzOHAZiICxr4ha9+rrU32deaCRPf0wEnIWa17UZx7KIv
         1yDPCj+R5b0JnFropUgPFnJSxSVEvZ6UIvlXZnMl0Z3WtXU0QjA3MN67irUs8ONfvTsw
         eX1s4bhEY565KhJW480LnC17kakkMF77VrcbtkbcyHV9rClBovRSgicgQQnxMrtrWasl
         lWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779053999; x=1779658799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iz0cTrfiY989F3h8vG33Dyb4UoEDmV5PO+DhGeooQmk=;
        b=cPIqCA3ULVCUYWHKiVCNUQ/4ggITEdaQZAXVw8Y+/a9gR2ph91fd2HVbFsq8i2P/aW
         ZGukBA4H66nP0cPbQCR+SK54A6+pgvZpHSkPDYAXJFjK2YlO08zQeeS2eaMEnpaAG/nD
         9VNhhNRg1oW7Q77SEKQlTOwDLfuYdFT73+fvyCHRD6G52ga/fmRfvT+jk5QOM8AEdTHp
         F0iBW1I21CjcTU8YmQQcaQ3zbq0SBJcMX/f7LI//uHvCP98vWumKpuKvGr4GW7Z8/qQu
         iDFdR1KzH0JD5BuxKc1UDCkCXF4CV+4gJBhVWbx7IfUD7jtT0zW0mP2TGwL9aNAuXk/q
         6gKA==
X-Forwarded-Encrypted: i=1; AFNElJ9TwQYZNn/mjxWtKYqC2bERV/tsGhNtcaSahKa8kJMF8J+zAf/pHBhLW0KXxEDpIHdncLcb61dBQPJ1ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE0+G7Ir6f1EE7KiNOuUOPKtR+mbjNb72v39G3ecV1QXKQtFPR
	Y77QG3APAJ/t0+F3Sn++JYtus46mQ4TdkOp8VsFU3I1T9MMl+WOkcU4A
X-Gm-Gg: Acq92OGFs6d3uPYYY8NycIrowSgCGSFcm/hM13c/lWcB5n1eN5SwoHPh3Jc1mzsS89L
	DUYeKF16PAtJZ0X/B+NLSoWPLpKB1kcePoKJzGqzf+7f52l4MW2kpg7vX0FQ2vAf4s+JYXnrD/S
	CdubbCyXOTfdyIAlpJBKei/4Wd9KfE9pLSKEYO6zEoAhLdhlTnPPz4+qATSXoe8khxE8iDYKtdV
	0qzogRU9bNIAW0mwx8Rt8DY+zFEZvam+P/eTMXCRSyRVC9ozg1vQ91wYK23ztifPThaOHoqYxf4
	pG9AVrjLXhXcFX7cRP3QfPKu9GRF/pFD1LFsGD0An7dPz0yZpwdTkrrUFFe5qZnDMBUJgPcqA30
	rg6OIIKen0XRhEn7xtYKYdKZf3DD8Tt0kb/gqM6eZkHAl0NoLJwCUr74njYtFvOo7Jpy6yQ/lGV
	ARv39aI4OyFrx/jQoy7T731W4iY2lf2i+XuUyAihrqwyy8gHJB6Hj0YNG4RDjUaMTE/hK5J2qnn
	uusfbYxXw2JTPWjLG9bHRHLKqHxJwyDkLwsfouepg1y8A==
X-Received: by 2002:a05:6512:b24:b0:5a8:e363:6f7e with SMTP id 2adb3069b0e04-5aa0e73d776mr3594039e87.17.1779053998828;
        Sun, 17 May 2026 14:39:58 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91c1558f3sm2890076e87.77.2026.05.17.14.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 14:39:58 -0700 (PDT)
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
Subject: [PATCH 0/8] alpha: enable generic entry infrastructure
Date: Sun, 17 May 2026 23:36:09 +0200
Message-ID: <20260517213919.347523-1-linmag7@gmail.com>
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
and enables GENERIC_ENTRY and GENERIC_IRQ_ENTRY.

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
  - tools/testing/selftests/seccomp/seccomp_bpf, with all applicable
    tests passing
  - strace testsuite (make check), with the remaining failures comparable
    to the pre-series baseline on the same system.

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
 arch/alpha/kernel/ptrace.c                    | 405 ++++++++++++++----
 arch/alpha/kernel/signal.c                    | 143 ++++++-
 arch/alpha/kernel/stacktrace.c                |  61 +++
 arch/alpha/kernel/sys_dp264.c                 |  38 +-
 arch/alpha/kernel/sys_rawhide.c               |  17 +-
 arch/alpha/kernel/traps.c                     |   8 +
 arch/alpha/kernel/vmlinux.lds.S               |   2 +
 26 files changed, 862 insertions(+), 421 deletions(-)
 create mode 100644 arch/alpha/include/asm/entry-common.h
 create mode 100644 arch/alpha/include/asm/stacktrace.h
 create mode 100644 arch/alpha/kernel/stacktrace.c

-- 
2.53.0

