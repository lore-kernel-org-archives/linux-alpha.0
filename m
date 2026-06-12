Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC7E364E84
	for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 17:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781286883; cv=pass; b=sr5o8625+RVu81GT8ABQNSZxvc8Hg4y1IwdSgdPaPXiarnlkHC3oAVgtYW7q7ttYXHebBdSSiddisy7BKfwBSIQWp1mqwfWY/vY+1syZ10kvpLzn5s/PELtrsf5L0o/dZGHLEondY+XF8fFVwNiV8Q4Vzt5RdG34hMW4pedlmMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781286883; c=relaxed/simple;
	bh=Kef/RIjFwF248K9LD9WOH5roNLDNqNwW3bBqrwZKd7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JwYJt7VOlreFFq5eWiycGoYTRHH7S+I13+WU+yOoRfV2+vfouDTOowuJYuEMLg7nWKmNgeMqKo2ojL/E/j0Lulpd/yG6VSwlYcSTewQbflGrbf7KqQ1T5O8ru1I5GYXHtj4ezhN49g/Z+XGNrWcA3GwsIS7FBjyoZkIwiQ3iQk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpYXW0FR; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpYXW0FR"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39666ac91a2so20565731fa.1
        for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 10:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781286879; cv=none;
        d=google.com; s=arc-20240605;
        b=TKged2l0xZAURm4MpB88unSYPO4zDYEOfwpQZBZygOCKHHVpStHXtzhPSUX/zqhBuF
         ymvhvd66S0qawT96JW+KH5oSDy12aNB1ishffCU1aQAC4a1hhca8Sp2TaVZH+2DIQzSw
         LoKOIQKSpwnem6KsUfhO+D9JmFJZnNX0alCHZ6j7R1zzXDm/xkE+ztu15RV5I8+djYJS
         OVTuRshLF2iBHHg0LFvJmfvFbaFp1BDCUQOu15mUKng2oDjdI2ll5jhJtcOBzLdVAPl6
         //8Gim63XzZ0dR+t/Q24kg2JgApJyFxnteqWpJD48RugqQJUWW5B1xW3GysG3zDLJ9Jf
         Fibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OonCpcP5z+GlnavFF/EIwotrjJJn1chYl414ZjgCZfE=;
        fh=CJrefY0lnWYp79KsMN7GoZ8QGGMw39zmrtcE3tRZ8Uk=;
        b=MnWu0rO6s9uGHC1nwWkP0h14fuINuXrgFfJWsI3WoO14zQT/Uz+WMH+q9kgWWoUW/q
         8ZIw/AEMMsHlQ7k1/58qcuOds4DFmNU9HrEBtl4Wx2i66PVJWJP0OB48hqgxZS0T4iyc
         Lp/5q7/COZOPitbrbasxwS6SX0Wm2xTIrKL+IlzSAZAM1336ozJu7kspeWWdoK8wECMt
         r3LjIoAyJcW0uGSPQAZsw0ku3l+c40IAO1zrozuQCNkMkeUtSg99k40H+DFh/wCQwkHv
         wntb9WTjYDnsL0DAOXVe9Ak1GGU9bMHuv2zjQhMweWOp2S3KFp83T9foNScpzTijFZ81
         CYMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781286879; x=1781891679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OonCpcP5z+GlnavFF/EIwotrjJJn1chYl414ZjgCZfE=;
        b=DpYXW0FRvFa0DdqjhkkkKCMISjs4wHXoap9CUo+cI3/1f+Yn41K2lCKkpZ0T4WpLw+
         Whhh2EWYDzabrMXpV8beiUOd6s8wZ0V5sTNNxuUsUhUjtXI82Sob5d4WJ3sJgW5v9bu+
         daU0G21mp/D7JT2qkgoHXEaRCERkgEGXhVsRL8rGX7GFyUSIJL6CwNEvsBOhuJP2wlch
         GJs4NLgZNqkHZIacs25PNiuyOCq5nE3qR/NfZ1TmeMuepKGwftXJzCN8oS28ip0Y4TtP
         u5oqhEdVmb+C4RViK4sGmU84XFERePS5DHH9xiGGpvWPVn9q7BbWFQuPGqp7y3zOunyQ
         oj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781286879; x=1781891679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OonCpcP5z+GlnavFF/EIwotrjJJn1chYl414ZjgCZfE=;
        b=VQU/816PbaduQ7i0bx+2QfxZqugcBLU0moF8QsF1zApFd+/V8n2Tmz6gK8p12sokSp
         8BJMTm/MIpmaVTMznMhto5B9Pk2wFsFtFTdcANjbrf5px3LXDrMgLbY6YTD+DZLrJytE
         N/h52dbn4teg4XMzW7WB5H6dYhHstGFimJNnnOPrCedE0QdKDyFEF261CBgE7aGAH/s0
         cADmgc4wMzw+o4cQLddLeksaQvasdLIaRX9r0y4LNspTKaWkTlQbiyIzq21yr7nbXlTu
         a0jlKCyWpJ6W4bAJje674Cswj2Pu53BvXRvrQuzQy7ggmzhpMMLWwmqM2f9ums4vQ1DA
         UIXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/L5tEg+7aPMZCk7VAEBZ47nZWfXJe4Im8vNUv+cq44ZaNDt/t93c7pnhtwogkZay8KCQs7mp1C2eb53A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqq3lMt2oH0eh5kpuTur6AXpR7jzhV8YqhfoyRQyR3/il7Gsox
	of9voAklDdYPheEJLmKsMLfg/PJwBjGrd7jQRysKUZq+r+GpvxhJhERj61ZClZCq4jVKbrHObwN
	Fhu5zPTyRmUPIoggHThkztZmW2VzU+9w=
X-Gm-Gg: Acq92OEhYGSXCSyZie56OSXZ9X6kry3s8D91ubi0SgGpmEv52gwUbe/UY8lYwNpWJCn
	pMqmxWOsiHd7ahodROJ+nxR1nPcWf9kNEwbETHquAi36wP//1e0eLbcZopc3MKRAWaCi8QsKsC2
	70jJgB4s0Miy98qsXM4QVAM/upLXROzUlYa52piCORVXYuLocHcb8fh8eAj+ecJYDhgJ98ftH49
	Ca0jtlu7/jzkcV+6dbgYQqnYJZerC2KONpYOGlhCPCW3VqkRGs4Lz9BWK5US88KfFmT/Z481Tb8
	0JcOxAPcLyQ6ziujpjcyZSZhIBQ0KOPPpyyVLuExzw==
X-Received: by 2002:a2e:a591:0:b0:38c:c0de:d58f with SMTP id
 38308e7fff4ca-39929c0dc57mr10352141fa.14.1781286879202; Fri, 12 Jun 2026
 10:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529142322.1362438-1-linmag7@gmail.com>
In-Reply-To: <20260529142322.1362438-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 12 Jun 2026 13:54:25 -0400
X-Gm-Features: AVVi8Ce-2efleYrQWNBv35pN-uElLfu0XT7XrPvMfTDn-HDYZYTsu8fSeu7pm3U
Message-ID: <CAEdQ38GqXH3TNQD-S65C7yFLGOFK1bN-2MOfGCxO6PP2ZgQcFw@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] alpha: enable generic entry infrastructure
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, 
	ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 10:23=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com=
> wrote:
>
> Hi,
>
> This series moves Alpha closer to the common architecture infrastructure
> and enables GENERIC_ENTRY and GENERIC_IRQ_ENTRY. This is v2 of this patch
> series, please see below for changes since v1.
>
> The main motivation is to reduce Alpha-specific syscall tracing, ptrace,
> seccomp, and return-to-user handling where common code already provides
> the required infrastructure. Alpha still has ABI-sensitive syscall
> details, most notably the assembly syscall invocation and the r0/r19
> return-value encoding, so those remain Alpha-specific. The surrounding
> entry/exit decisions are moved towards common code.
>
> The series first adds regset-based ptrace and core dump support. Alpha
> now provides a user_regset_view for NT_PRSTATUS and NT_PRFPREG, exports
> the ELF-visible general and floating-point register layouts, and uses the
> common ptrace regset implementation for PTRACE_GETREGSET and
> PTRACE_SETREGSET instead of open-coding iovec handling in arch_ptrace().
> This also provides the basis for HAVE_ARCH_TRACEHOOK and common ptrace
> syscall-info support.
>
> It then adds ARCH_STACKWALK support. The implementation uses a simple
> kernel stack scanning walker, starting after pt_regs for current tasks
> and using the saved PCB kernel stack pointer for blocked tasks. This
> enables common stacktrace users such as dump_stack(), /proc/*/stack, and
> SysRq backtraces, without introducing a frame-pointer-based unwinder. It
> also avoids relying on the legacy weak save_stack_trace_*() fallbacks,
> which is needed by the later generic IRQ-entry configuration in this
> series.
>
> The next group of patches prepares Alpha for lockdep IRQ-state tracking.
> Alpha interrupt masking is controlled by the PAL IPL state, so the
> irqflags helpers are made to operate on IPL state rather than treating
> the full processor status word as the saved interrupt state. The series
> also initializes dynamically allocated PCI sysfs bin attributes for
> lockdep, provides ftrace return-address support for lockdep call-site
> reporting, and converts low-level platform locks to raw spinlocks where
> regular spinlock instrumentation is not appropriate for the hardware and
> interrupt paths involved.
>
> The lockdep patch then adds hardirq state tracking in Alpha's low-level
> entry/exit paths. It annotates PAL IPL transitions and the shared return
> path so lockdep can keep its interrupt state in sync with the hardware
> IPL state. This allows CONFIG_PROVE_LOCKING to remain useful on Alpha
> instead of quickly disabling debug_locks due to IRQ state mismatches.
>
> The final patch enables GENERIC_ENTRY and GENERIC_IRQ_ENTRY. Syscall
> entry now uses C helpers built around syscall_enter_from_user_mode().
> The C entry helper handles the common syscall-entry work, including
> ptrace/seccomp entry processing, skip decisions, syscall-number
> shadowing, and syscall table lookup. It returns the selected syscall
> function pointer to assembly.
>
> Assembly then performs only the Alpha-specific dispatch: it reloads the
> syscall arguments, preserves the required GP/stack conventions, and
> performs the indirect call through the function pointer returned by C.
> Skipped syscalls bypass that dispatch and return through the Alpha
> syscall-exit helper.
>
> Syscall exit is split in the same way. Alpha first performs its
> ABI-specific result handling: r0/v0 carries the return value or positive
> errno, and r19/a3 carries the error flag. It also handles skipped
> syscall restart state and successful syscalls whose return values may
> look like negative errnos, such as legacy ptrace PEEK requests. Once the
> Alpha-specific r0/r19 state is encoded, the path enters
> syscall_exit_to_user_mode() for the common syscall-exit and
> exit-to-user-mode work.
>
> The syscall number used by generic entry is kept separately from the
> return-value register. entSys copies the raw r0 syscall number into r1,
> and r1 is used as Alpha's generic-entry syscall-number shadow. Restart
> bookkeeping that used to be carried by low-level assembly state is now
> kept explicitly in thread_info. This avoids using user-visible general
> registers as hidden restart state while preserving Alpha's restart and
> ptrace semantics.
>
> Testing was performed on an Alpha EV68/Tsunami SMP system (UP2000+) as
> well as an Alphaserver 4100 (rawhide) system.
>
> For the regset, ptrace, tracehook, and generic-entry changes, testing
> included:
>
>   - custom ptrace/regset round-trip tests for both GPR and FPR regsets
>   - PTRACE_GET_SYSCALL_INFO validation, including the reported user
>     stack pointer
>   - ELF core dump inspection with readelf
>   - strace testsuite (make check), with the remaining failures comparable
>     to the pre-series baseline on the same system.
>
> Kernel tools/testing/selftests:
>   - ptrace: syscall-info tests improved over the baseline.
>   - seccomp: seccomp_bpf passes all applicable tests.
>   - exec: check-exec now passes once loop block-device support is enabled=
.
>   - ipc: ipc selftests improved over the baseline.
>   - acct: acct selftests improved over the baseline.
>
> Overall, the selftest comparison did not show an obvious regression
> introduced by this series. Instead, the patched kernel reduced the
> number of failing top-level selftests and fixed several failures in areas
> that exercise the new ptrace, tracehook, seccomp, and generic-entry
> paths. Some unrelated failures remain and need separate investigation,
> but they are either also present in the baseline run or explained by
> missing kernel configuration or test-environment support.
>
> For the stacktrace changes, the following scenarios were verified:
>
>   - SysRq 'l' prints backtraces for all CPUs, including syscall and
>     interrupt contexts
>   - /proc/<pid>/stack returns sensible call chains for both the current
>     task and sleeping tasks, such as nanosleep
>   - stack traces remain stable under scheduler and I/O load, including
>     ping, ext4 writes, and background workqueues
>   - no crashes, lockups, or obvious mis-unwinds were observed
>
> For the lockdep changes, /proc/lockdep_stats shows debug_locks remaining
> enabled, with no redundant hardirq or softirq on/off annotations observed
> during testing.
>
> Review feedback is very welcome. Additional testing on other Alpha
> systems, CPU variants, and workloads would also be much appreciated.

I left some comments on patch 8 regarding implementing support for
floating-point registers and the program counter. Other than that,
this looks good.

I've been running this on my ES47 without any obvious issues (other
than my ES47's general instability, which I'm investigating).

Reviewed-by: Matt Turner <mattst88@gmail.com>
Tested-by: Matt Turner <mattst88@gmail.com>
