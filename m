Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D541743B6D1
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 19:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390822; cv=none; b=YEa9OVtzIdbjOMyUtEAjCMTjf0EcRl/H2yepYCD/72OBAl6guggwdWT9eLEvO3GzvJ/xuD6jkyX+Z10Q4DeHa8nrK7eq5TQVhHzSbQmNvuBLlIf20O/deiU1IpenP+dSS6Y+EI49M5++ZHl6bH+Zg7TDj2O6wYKCO6InA2+SrUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390822; c=relaxed/simple;
	bh=JwJadvGrdJbe+rhdFg/yz2ShOyxtbb+400a4CXWLRcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t5yxCkcbiWL1I2v+YivDQl06KYoMO1cf6T0TDWk0kv7j0B20ejry7xIzYgHGZ41wPYWf2YCygFAo8bu6+9NyeAjRdR5L0UpjwzOMRlBsDM7CDgJVQkwD0TLpXV4webh+DbYL9nZE+WGQW2uJjEChBaohg3QRG2pCNq+1HPYvsg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJvSkNWh; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJvSkNWh"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1c4c7ddaf6so332930766b.3
        for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 12:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390813; x=1786995613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=atWTTSKo0q+wI8bhtu1CeeRvFi1ZyOTgaTpokxHK8XY=;
        b=GJvSkNWh172LzeyfLz8skkvKYFlcYCr6PnKfmkPBYBJ82Ru8T+k5xzvqMIc4oekBYY
         Wv3K12fLFWPm5tu/C5eQ9VfgoyMU6Zf6TBa4J4v+3rPpeDh66Hpgjbfx6EPzflQr/0xd
         v3BrVr9fZH4cC9fGd0mAU9DmWaP8hPxLWhdWjil+j++muX/Uj4zIa/paZ1lxwL22lRFQ
         LtigEvZWrPUt1eSLcoyhvhi2wNpBITf5vyun7mTQxGYNuolhc+YLAKTFzNTnFFqIaUuE
         0uetcz7//EfwzvBj6MRzc90t3OLeuG41UhHUC2JAoBIZFjQuOHPBHvHgmtHicgYg8tmQ
         igCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390813; x=1786995613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=atWTTSKo0q+wI8bhtu1CeeRvFi1ZyOTgaTpokxHK8XY=;
        b=j0mSp38nerH7w9GW6BASq/wjL6fHxdNIZbnJJE0EWhmdO1Fx37EhUYw3t5z+BtgwdL
         dY7KRmTXqAE4WjOS8aOltyXSK0MrXkF0z2CtQGl2DgSkPl7HSD/xm65f443yUfKR0Kvn
         VDKV8TGFsqDxtYRAq1TIZQTOJxksBo8gEZw0gxXm53dYKCk6mHVQBHye2Z2ntCyE1AKN
         zBI+kd9VO97dFfqxAz7KoiQjKk0+OiaXXptB1VUbjP/SHjJyWP196vNXVpv0EPveoB/v
         yEhMb1TFEDgiQQvWx5/Lldfm6gdYD2cAlHVpqVmODKueja5N8D2kZHL2KHTSoNzbv/T4
         FG+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq79ok+R0HIuRSzMKHfzS/0os2winEh3ghfSKsDuVEgMOe5kOqv3eh0C76ZhWvjzzrfOqO7hcGO+AkhsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2VCP9J4++vgQykjbpDTAX9xGj/B5sEEPZ3e3DcRqRLoxdxsp3
	aqOYm7V3sN4lzaEeeQmlV7QNLTWL+2TA/1ijWxBhNYUhdz7X5RGrqPeK
X-Gm-Gg: AR+sD10jhuAtc1yQ5Vu7YlyVsZMhgbsg00WX0P1RZKIS4b98i1rR76zv0Gv68Pl+RSL
	+oGiN2i6Y3/hRU5JkS+LDar3rn1JyOIJBHh6eQWEL4q4fOjEvucHpV/ycH/eTfgEuAhvC05Dof8
	LwD9IK483zxC+9Nxpk+Dpg43oKop2dx5dtfjFJJGQtAOwcZpk0jyEFP16GvWMrXTxvYW4pfdG0y
	JfBlBUPdHoeqcvoGx6vMMhZ/5p4IcxH4vGU3yXA7ZTEjBoymt1bENk3rMb/O6WsozK2E5SPN5m/
	smE9jS7tUv8WFCNnb+K8dmscdHlz3By4vpulPKcBwzhXk//8mc16r2CGTdtpoXe7mLv72QUw+VO
	q8Oze61Kqazidpq5V7zO+kJ9xUaC7xA+5N0ku5DtV5R0cxgcIldtOnwamx8TRcLSLt2CrOrwCOR
	PjS1SQwCX+4lBovXnJQqkLQ5pPIThJOW9Tc+A9M4a7gw4gTun3aYs9HCYkiEZuOOtB6kEqTRJfS
	ZHc5hWxcVK6SERlGghWmiwMLgY9H3APid6rMCNVNQ==
X-Received: by 2002:a17:907:3c83:b0:c12:67d2:3d6b with SMTP id a640c23a62f3a-c20c68f3e90mr235429566b.11.1786390812951;
        Mon, 10 Aug 2026 12:40:12 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a29a84sm449928966b.3.2026.08.10.12.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:40:12 -0700 (PDT)
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
Subject: [PATCH v2 0/7] alpha: fix stale TLB translations breaking copy-on-write and writeback
Date: Mon, 10 Aug 2026 21:34:51 +0200
Message-ID: <20260810193902.3286353-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Alpha, stale TLB translations can break copy-on-write and shared-mapping
writeback: a multi-threaded process can lose stores to its own private
memory, read data belonging to its own child, and lose data written through
a shared file mapping. The copy-on-write failures need more than one CPU;
the writeback failure also happens on a uniprocessor.

Three related problems are fixed here.

Patch 1 is stranded deferred-ASN bookkeeping. check_mmu_context() clears
asn_lock and acts on need_new_asn, but it runs only as the tail of
switch_to(), after alpha_switch_to() returns. A newly forked task never
gets there: its first context switch resumes at ret_from_fork instead.
asn_lock is left set and the task goes on to run user space with it set and
interrupts enabled, so a shootdown IPI arriving in that window takes the
deferred path, and the need_new_asn handshake meant to cover it never runs.
finish_task_switch() calls finish_arch_post_lock_switch() with preemption
disabled, on the CPU that ran switch_mm(), which is where that bookkeeping
can be completed.

  kthread_use_mm() and sched_force_init_mm() also reach the same hook,
  outside the scheduler's preemption-disabled switch tail.
  check_mmu_context() acts on per-CPU state, so it can only complete this
  bookkeeping while still on the CPU that ran switch_mm(). The hook
  therefore tests preemptible() directly: where migration is possible it
  does nothing, while where preemption remains disabled, or is not
  configured, completing the bookkeeping is safe.

The second problem is a targeted tbi() issued against the wrong context.
tbi() acts on the address space context currently loaded on a CPU, so it
reaches an mm's translations only when a thread of that mm is current.
current->active_mm is not sufficient: under lazy TLB an idle or kernel task
keeps an mm as its active_mm while a different ASN is loaded, so the
invalidate hits the wrong context, and nothing retires the old ASN -
mm->context[cpu] is still valid, so the resuming thread reuses it. Patch 2
fixes the shootdown IPI handler, patch 3 the local side of
flush_tlb_page(), and patch 5 the uniprocessor flush_tlb_page().

The third is an omitted caller-side invalidate, covered by patches 4, 6
and 7: when the target mm is not the calling CPU's active_mm, nothing
invalidates that CPU at all, because smp_call_function() does not call back
into the caller. The UP flush_tlb_mm() and flush_icache_user_page() already
contain exactly the missing branch. Their active_mm tests are left alone:
both load a fresh context through __load_new_mm_context() rather than a
targeted tbi() against whatever ASN happened to be loaded, and only the
targeted tbi() depends on which context is loaded.

No user-space data race is involved in the reproducers: every slot is
written and read by one thread only, and the main thread inspects them only
after joining the workers. The other writes come from forked children with
their own address space, so observing one of those in the parent is the bug.

Deferred-path behaviour after the fixes, counted with the counters reset
before each 6-second run of the lost-store reproducer:

	                       lost stores    runs entering the window
	  no fixes               11 of 40      13 of 40, 11 of them lost
	  patched                 0 of 400     15 of 400, none lost

Where the remaining patches are reached, counted the same way:

	                                  thread of mm     lazily
	                                  current          borrowing
	  writeback of a shared mapping       51577          50688
	  reclaim under memory pressure       17609          14827
	  anonymous COW / fork                144237             0

  About half the calls during writeback, and none at all on anonymous
  memory, which is why patches 1 and 2 did not cover it. flush_tlb_mm() was
  entered with the mm not this CPU's active_mm 2934 times over a fork-heavy
  run and 632 times while otherwise idle.

Reproducing it.  Two self-contained tests were written for this. Source for
both can be made available on request.

  alpha-cow-smoketest.c covers patches 1 and 2 (pthreads only, ~40s, needs
  more than one CPU; confined to one with taskset -c 0 it does not fail). A
  failing run reports:

	stale read after COW fault       FAIL
	    thread 2 read 0xdeadbeefcafebabe, expected 0x1000002   <- the CHILD's value

  Two details in it matter, because getting either wrong hides the bug:
  slots are 128 bytes apart so several threads share a page, and a thread
  writes its slot once then reads it many times, since a thread that keeps
  writing refreshes its own translation. Its lost-stores check fires in at
  best a quarter of runs; the stale-read check is the reliable one.

  mkclean4.c covers patches 3 and 5 (needs root), and fails on both SMP and
  UP. A single thread writes a small MAP_SHARED file while background
  writeback cleans it, and the file is then compared against the mapping;
  every round loses data. It forces two conditions that are rare in normal
  operation on SMP: the flusher kworker and the writer on the same CPU, and
  a working set small enough to stay resident in the data TLB. That is also
  why this is hard to hit in the field - any faulting write from any CPU
  repairs the dirty state. On a uniprocessor the first condition holds by
  construction, so no pinning is needed there.

  Patches 4, 6 and 7 have no reproducer for the bug they fix; they are
  justified by the contract of the functions, by the UP implementations
  already having the missing branch, and by the counts above. Patch 7's
  path was exercised for regressions by driving gdb to set and clear a
  breakpoint several hundred times, reaching copy_to_user_page() ->
  flush_icache_user_page().

  Originally found as intermittent heap corruption in glibc's
  malloc/tst-malloc-fork-deadlock-malloc-check. glibc is not at fault: with
  MALLOC_CHECK_=3 it is simply a very effective detector, and every fork()
  runs __malloc_fork_unlock_child() in the child, which writes to allocator
  state.

Testing.  ES40, EV68AL (21264C) Tsunami, 3 CPUs. Generated against
v7.2-rc6; the results below are from v7.2-rc2, and the series was
re-tested on a clean v7.2-rc1 tree with the same outcome.

	                                   before          after
	  smoke test, stale-read check     7 of 9 rounds   0 of 9
	  lost stores                      11 of 40        0 of 400
	  writeback (mkclean4), SMP        10 of 10        0 of 10
	  writeback (mkclean4), UP         every round     0 of 8
	  tst-malloc-fork-deadlock-
	    malloc-check                   8 of 10 fail    25/25 pass
	  ptrace breakpoint exerciser      -               result matches

  Also 10/10 pass each for tst-malloc-fork-deadlock, tst-malloc-check,
  tst-tcfree1-malloc-check and tst-tcfree2-malloc-check. No measurable
  cost: 1470/1038/206 forks per second with 0/2/8 sibling threads against
  1472/1043/199 unpatched. Patch 6 changes a function none of the
  reproducers exercise, so it is covered for regressions only.

  Also run with CONFIG_COMPACTION and CONFIG_MIGRATION enabled, with
  compaction forced continuously underneath the tests: 368522 folios
  migrated during the run, no failures.

  Also built and tested with CONFIG_ALPHA_GENERIC and CONFIG_SMP=n. That is
  how patch 5 was found: arch/alpha/kernel/smp.c is not built there, so
  patches 2, 3, 4, 6 and 7 are absent and patch 1 is inert, and mkclean4.c
  failed on every round because the uniprocessor flush_tlb_page() carries
  the same defect. With patch 5 it passes 8 of 8, and the rest of the tests
  above pass there too.

Changes since v1:
  - patch 1 also drops the now-redundant check_mmu_context() from
    switch_to(); finish_task_switch() runs immediately afterwards and does
    the same work. Its changelog now also records that after
    kthread_use_mm() the hook does nothing, so asn_lock stays set until the
    next real context switch, which the TLB patches rely on.
  - the old patch 3 is split into the current->mm test (patch 3) and the
    missing else branch (patch 4), matching how the other two changes are
    already separated.
  - the uniprocessor patch is renamed and is now patch 5.
  - patch 7 records why no imb() is needed.
  - in-tree comments shortened; the reasoning lives in the changelogs.
  - no functional change from v1.


Magnus Lindholm (7):
  alpha: run check_mmu_context() from finish_arch_post_lock_switch()
  alpha: only use a targeted tbi() when the target mm is really current
  alpha: fix the local TLB invalidate in flush_tlb_page()
  alpha: invalidate the local context in flush_tlb_page()
  alpha: fix the local TLB invalidate in the UP flush_tlb_page()
  alpha: invalidate the local context in flush_tlb_mm()
  alpha: invalidate the local context in flush_icache_user_page()

 arch/alpha/include/asm/mmu_context.h |  8 ++++++++
 arch/alpha/include/asm/switch_to.h   |  1 -
 arch/alpha/include/asm/tlbflush.h    |  3 ++-
 arch/alpha/kernel/smp.c              | 15 +++++++++++++--
 4 files changed, 23 insertions(+), 4 deletions(-)

-- 
2.53.0

