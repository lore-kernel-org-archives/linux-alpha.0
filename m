Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872B34483AC
	for <linux-alpha@vger.kernel.org>; Wed, 23 Sep 2026 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149774; cv=none; b=LLvoasQQz9Xin0kaedIAPePlcxDb4xatcF0O4eb+U45mHOrBtRab85OMsxaZpWK55gok7A5/vsW3qTCtswKXMeZB417y9jdNZA/Ia1hIBvH4fpe4AIQ5ltmVBf1TJOATj79zq6ILNSBBEF0tjSZICgHSXm+q9PXUClKn6S9FNTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149774; c=relaxed/simple;
	bh=oGQLVNiGhUc8VNEiKPvGwbPgWW2Pw/CQun9Ygsjk9Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jrdrf5ubUWBnB2Kohpo3ee9a9DvLRwA2BjlBOao1KG719bnOgtUXgXyddEDHSrOsPSnVG8+YFCWkCXQNKj0zXo868XchAcSnCwSsfre7C38xOWCSpH3JThHptUjYIPvDSQwEiiGNye5Ah83Lu4pxGsKr1r6/NOfYSiSM410b/Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1MPmpTv; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1MPmpTv"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9a59so968044a12.0
        for <linux-alpha@vger.kernel.org>; Wed, 23 Sep 2026 00:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790149768; x=1790754568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4CYeJc2tC30G46PWbGDTQoFKNpbcokZLpzOhUY8fwvg=;
        b=B1MPmpTvFgUFEhE6EjXKAd4OI6UFEC9527vTx3Gan6bdj2EQBiswYGHpycrV0icgq1
         P2AKLI7TmO8HWXtfWhzVFEZvt4C1CDbvOhpLtkKREUhYuN23ql/SADbITGtmAAx2d7le
         hRT1P026edwk2UPzfsduVCyqjYm19IfDG3MsDJ1STnvoSzfPUeHTwd9JuWtaK9nOg6ef
         1z5955C5wenZXQoBx7VtdFF1NNMJYKk3csGYQKMsObIWomRpffOOIiLWV0g3dUKycA8l
         6Bs6dEJxI1n2YS7cSP72yZIBSxpgad0riTUR94dLPMgz2a2EgUcXv5XnC4I3vEff33yh
         DhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149768; x=1790754568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4CYeJc2tC30G46PWbGDTQoFKNpbcokZLpzOhUY8fwvg=;
        b=q7SBhk5qRitDLE1zFBA06M+Es9Yg3qgdqa4HNXjxTcZoOqTmOcaxkVkG/asbEatwxd
         Y5p8uBMHEh8+kjzRFKIaTvUmwLiJyEUfK8FeKzBt9rdlo7G8uKub4XTXwwK3z5PYMXXM
         RqTgmtg7VNGfGMKyqGmLHq7KKdljQ65mCH17AVuXlwg9VPPMdZcgvVKfZ2zTJdo45fDZ
         jMlENzYMJvpBXnVHQFvuA6WPwXJzsKgTtgJTRhBxxqQ/undo2X+w7twRwpE0rdvmAirO
         SoylkJREYPdbcw8a6GVCuR4hBMnXd4D4hFlx3GJuXbHFV6KscK/CRuAtVkT/Oll9JD7d
         fd2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxKMX7lZVmvIl+ZfeaqJl0mW7J1vFFayowKBTthn2o8V47F1HwSUg6RbGltwtgYgkeCFGAvb8bck686Bw==@vger.kernel.org
X-Gm-Message-State: AFuF++mhS6njTN7bIUyPcrFuL/uJjgFwh8CXqfbKiWE/fGZZmiyiCO8g
	i22r+rPgH73JB446iOWjjd9K9ryxkG5x2LmSrN0QHhNWE6UsrtynF7w+
X-Gm-Gg: AYBFou3bJvHr4TrtPgkUjdNUTN8hqJ4crGxiHQkCM+x8zCyRCy5dCJgu1aFoaQcTRp6
	JBV9fj+fP6dHqT86cFkruSUM4WyXD83pDN1AZQjku+SO51YagoPL7fq+BgcTs4nWn6BpFJQarAk
	1eT+28QADGAcCiDfDVuenNlTEs9SrjyJWCq4QaWXz39LxqWjubWF4W7+usvrgLZSBsKkQihSh8W
	uABzNPppuWd7CLWTYvg26rUW0RjjDpML2VXPdJ930AIVcqt/mWB47thZWVZRKEjiyCDkY3IargU
	r0XUs3f4GaXxzI6mRHrsDK/gVXocaloMT8dy8Q4Iwrw+AZ0KS2UF9Kpe0pnA9T8zgBgZIP3b5zx
	cwOPbWeBw2mslEPEP8vr1qSg2et0TPf3jnkUHJdzyBLWsTZMGDAztnw04RqEuJnzWfTaPfEKiOw
	nD25hyLtKh2sa6zV09Qhq1UcHO3IHBsPB7M3mdvRsuH3boPXsoyRjMKbPweZKAIoqgnaOasJTxg
	rRPjAkfRmkRcj6aDre42vdoZp2/x887ilFwxraS
X-Received: by 2002:a17:907:1c09:b0:c29:583a:c291 with SMTP id a640c23a62f3a-c2aadf54009mr139454966b.21.1790149768087;
        Wed, 23 Sep 2026 00:49:28 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6f5asm64951366b.15.2026.09.23.00.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:49:27 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v3 0/7] alpha: fix stale TLB translations breaking copy-on-write and writeback
Date: Wed, 23 Sep 2026 09:47:43 +0200
Message-ID: <20260923074903.862898-1-linmag7@gmail.com>
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
  configured, completing the bookkeeping is safe. alpha selects
  ARCH_NO_PREEMPT, so in an ordinary build preemptible() is a compile-time
  0 and the hook runs everywhere; the test only takes effect where
  something turns on PREEMPT_COUNT.

The second problem is a targeted tbi() issued against the wrong context.
tbi() acts on the address space context currently loaded on a CPU, so it is
only guaranteed to reach an mm's translations when a thread of that mm is
current. current->active_mm is not sufficient: under lazy TLB an idle or
kernel task keeps an mm as its active_mm while a different ASN is loaded, so
the invalidate is issued against the wrong context and the mm's stale
translations can survive - and nothing retires the old ASN either,
mm->context[cpu] still being valid, so the resuming thread reuses it. Patch 2
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

None of these patches covers a task that borrowed an mm through
kthread_use_mm(), and patch 1 makes that case worse. Such a task has
current->mm set while ev5_switch_mm() has only prepared the PCB and nothing
has installed it. Today asn_lock stays set for the whole of the borrow,
because check_mmu_context() runs only from switch_to(), so a shootdown IPI
for that mm finds asn_locked() true and takes the conservative
flush_tlb_other() path, retiring mm->context[cpu]. With patch 1's hook the
lock is cleared when kthread_use_mm() returns, so the IPI instead issues a
targeted tbi() against the context that is actually loaded and leaves the
slot valid. Loading the context on the direct switch closes that window;
where both are applied, that change belongs before patch 1. It is the third
patch of the follow-up series:

  https://lore.kernel.org/linux-alpha/20260904162424.376504-1-linmag7@gmail.com/

No user-space data race is involved in the reproducers: every slot is
written and read by one thread only, and the main thread inspects them only
after joining the workers. The other writes come from forked children with
their own address space, so observing one of those in the parent is the bug.

Deferred-path behaviour after the fixes, counted with the counters reset
before each 6-second run of the lost-store reproducer:

	                       lost stores    runs entering the window
	  no fixes               11 of 40      13 of 40, 11 of them lost
	  patched                 0 of 400     15 of 400, none lost

Where the remaining patches are reached, counted the same way, on a
CONFIG_COMPACTION=n kernel:

	                                  thread of mm     lazily
	                                  current          borrowing
	  writeback of a shared mapping       51577          50688
	  reclaim under memory pressure       17609          14827
	  anonymous COW / fork                144237             0

  About half the calls during writeback, and none at all on anonymous
  memory, which is why patches 1 and 2 did not cover it. flush_tlb_mm() was
  entered with the mm not this CPU's active_mm 2934 times over a fork-heavy
  run and 632 times while otherwise idle.

  The writeback row is config-dependent, which v2 did not say. With
  CONFIG_COMPACTION=y, asm/pgtable.h overrides ptep_clear_flush() to call
  migrate_flush_tlb_page(), which rendezvouses with every CPU and handles
  the context itself, so folio_mkclean() does not reach flush_tlb_page() at
  all. (That the override is guarded by CONFIG_COMPACTION rather
  than CONFIG_MIGRATION looks like a defect of its own - MEMORY_HOTREMOVE,
  NUMA_MIGRATION, MEMORY_FAILURE and CMA all select MIGRATION without it -
  but that is a separate patch.)

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

  mkclean4.c exercises the combined SMP fix in patches 3 and 4, and the UP
  fix in patch 5. It needs root and CONFIG_COMPACTION=n. On SMP it takes
  both: the flusher kworker has no mm of its own, so patch 3's current->mm
  test sends it to the branch patch 4 adds, and without patch 4 the calling
  CPU - the one holding the writer's translations, and the one
  smp_call_function() does not call back into - is still left alone. The UP
  implementation already has that branch, so patch 5 is the whole fix there.

  A single thread writes a small MAP_SHARED file while background writeback
  cleans it, and the file is then compared against the mapping. It forces
  two conditions that are rare in normal operation on SMP: the flusher
  kworker and the writer on the same CPU, and a working set small enough to
  stay resident in the data TLB. That is also why this is hard to hit in the
  field - any faulting write from any CPU repairs the dirty state. On a
  uniprocessor the first condition holds by construction, so no pinning is
  needed there.

  On COMPACTION=y the test does not exercise this defect, for the reason
  above, and passes on an unpatched kernel: 0 failures in 103 rounds across
  three unpatched
  COMPACTION=y configurations. v2's Testing section did not record which
  kernel its mkclean4 numbers came from, and this is the correction.

  Nothing isolates patch 4 from patch 3; the two are exercised together
  above. Patches 6 and 7 have no reproducer for the bug they fix; they are
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

Testing.  ES40, EV68AL (21264C) Tsunami, 3 CPUs, on v7.2-rc2 and v7.2-rc6.

	                                   before          after
	  smoke test, stale-read check     7 of 9 rounds   0 of 9
	  lost stores                      11 of 40        0 of 400
	  writeback (mkclean4), SMP [*]    10 of 10        0 of 10
	  writeback (mkclean4), UP  [*]    every round     0 of 8
	  tst-malloc-fork-deadlock-
	    malloc-check                   8 of 10 fail    25/25 pass
	  ptrace breakpoint exerciser      -               result matches

	  [*] CONFIG_COMPACTION=n; see above.

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

  Matt Turner tested this series on an ES47 (EV7) on v7.3-rc1, one CPU
  online: no regressions in a gdb breakpoint exerciser, a fork/COW check, or
  a writeback test, on both an SMP-enabled and a CONFIG_SMP=n kernel. He
  could not reproduce the writeback failure on that machine on an unpatched
  kernel with CONFIG_COMPACTION either way, while confirming with counters
  that the unpatched flush_tlb_page() does issue the targeted tbi() against
  a foreign context a few hundred times per run. One reading is that the EV7
  PALcode invalidates by VA without matching the ASN, which would make the
  same defect unobservable there. Patches 3 and 5 rest on the contract of
  tbi() either way.

Changes since v2:
  - patch 1 no longer claims that the hook does nothing after
    kthread_use_mm(). alpha selects ARCH_NO_PREEMPT, so preemptible() is a
    compile-time 0 in an ordinary build and the hook runs there too,
    clearing asn_lock; the claim held only for PREEMPT_COUNT=y. Patch 2's
    last paragraph carried the same error and is corrected with it. The
    shootdown handlers therefore do not cover a borrowed mm, which is now
    said plainly in both patches and in this cover letter.
  - patch 1 records that moving the call from switch_to() to
    finish_arch_post_lock_switch() means the bookkeeping now runs with
    interrupts enabled, and why that window is safe. v2 described this as
    no functional change, which undersold it.
  - patch 1 now records that it makes the borrowed-mm case worse, rather
    than v2's claim that swapping the active_mm test for current->mm leaves
    it unchanged. That comparison was right about the two tests and wrong
    about the series, because patch 1 also changes when asn_lock is
    cleared. Patch 2 no longer draws the "no worse" conclusion either.
  - patch 3 says that its folio_mkclean() counts are from a
    CONFIG_COMPACTION=n kernel, and that COMPACTION=y routes
    folio_mkclean() away from flush_tlb_page() entirely.
  - the reproducer is described as exercising patches 3 and 4 together on
    SMP, and patch 5 on UP. v2 credited it to patches 3 and 5 and listed
    patch 4 as having no reproducer, which was wrong: patch 3 alone leaves
    the calling CPU without any local invalidate.
  - patches 2, 3 and 5 describe the targeted tbi() as guaranteed only when
    the target mm's context is loaded, rather than as failing on every
    implementation. Matt's EV7 result is that a mismatched loaded ASN did
    not produce the failure there, and the argument for these patches does
    not depend on which way that goes.
  - the mkclean4 rows in Testing are labelled with the config they were
    measured on, and the COMPACTION=y result is recorded.
  - rebased from v7.2-rc6 onto v7.3-rc1.
  - no code changes.

  Thanks to Matt Turner for the review, the EV7 testing, and for finding
  the CONFIG_COMPACTION dependency.

  v2: https://lore.kernel.org/linux-alpha/20260810193902.3286353-1-linmag7@gmail.com/

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


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
--
2.43.0

