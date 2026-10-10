Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820C43C060E
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 14:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642344; cv=none; b=nhmbfvGg6H4Op7XAx5j/yQn201kwLrp9Ud3o0r0BvvbjLHUrLzO+WhtdZM0MMvXLyghSXhE4t+ZMoN+rFp9svRD2j9rlFnrdxBaBTdGXJ+0Qajpu1BL5Ymv5H7M06EYoNUryZ5zBdka0JBO5T9z48i8eLZOttTnhe12wnShFtsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642344; c=relaxed/simple;
	bh=kbdm4Ym5qJRwvrjOgxLqcG1Is4XjtEeKBnHu2aTQMFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z+CWZGrqZH4a139+Pnp1XSd98RpUYK1bXMI4jhJ6k8LY2t6jv6vESpm5Yqlj6PbX6QFaJG2bqZbc6n5RYtLZlj4sg2Vrq9b6Ciy2oyucj6D4i+rmOYgHRdTpwnVNQzrqKk0vA5de9uD2HbF83PKtCxxGuwdtMavKzDBhJuseObs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqNwofWc; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqNwofWc"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ac76a02368so544054a12.2
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 07:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642340; x=1792247140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6gf4AvJGePyPCf6LwjuBFdxDT8Bmj/BNKhhCD6oh7A=;
        b=LqNwofWcA+WfhdS++dxNxcXYBg7+UjcTR0QIy5IuzelNiUPfC5JPhgCps5DT3GqhEV
         jX8F8e35Cv4G4FQZ0SBKslaHCP4d4EMszKF3mbiLCDbefzMVAUUKD6lSZ3VLaRpB6xo6
         4G3ITLXs2vrj2XbryeEKhnO4jUtiRsmWfJPlCJ/CzFGvi82HsGgmoOPqdOOvsa6OWf5A
         qTwBKLK3zkRMAch1OetcrLH/L/CaR5chBaMMSrsj+v+1OYhjHPveKfGKt1KqpbFRDY80
         SBUTVnyLFT1GDxOTkiTefNygLHEDlZ7yOHgtyHOgJ+Z4YhazfFTs8TNdTuV2QKHxEgzu
         i9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642340; x=1792247140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6gf4AvJGePyPCf6LwjuBFdxDT8Bmj/BNKhhCD6oh7A=;
        b=eu45uNI7LHrOVgvb3eC45yox/KiyIPu5retcX1TufcuoxT+a38MUrkgJ/k/WKDTP31
         8AwYhCBZMN2DQTC6ddyuEpfz/nbMMpiY81qAJr5l28azPsHAuYqXIzVoIBQ6Dn62QE3h
         ck1sftTje5bhRwQ/2/049zyfptPbwr6OPWDX44HJPzvdPZxOlpO7UP3oTt6BbEruSs0S
         V5k2AJ0PvQoR/r7SeFXgiSTIs/fKpQ8tsBfECRk1vncMcavlhxveVKwNI22LUboCiXsO
         +JBGIBFUbKjLxxEZJ4pBLZBXfiu5+n/Daxx195SlzM8Gc9iKuCplsLI2ogO7ZB9x8edq
         PdaQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8QJC9wcbyGnPtqXogtpjSV1GpKshpJXooOvYBk3VKdWGF8r4fFniXv65Ns9R1QYxXuMeJfAI8cs388g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKSOufwo4TRZOEY6LPAPU1vYQTBWink0/KlSVLKIU2YGqy3RPmD
	o2pt6O87mOFsMK4cyt7HIOVDSZg1A630I8/qckyjPBdYcOtRYAcbuVt7
X-Gm-Gg: AYBFou11iciSi9CB7xwtKl0yF6iCgPaYiX9essmJqpDjEyTdHnZVq56aDtedQi4dJC8
	h8QZqeru2Xqg9GmlZg1jdw/Y5nAjW1WeolxC2RMydJNUt6qyFPpL1lTSCsF69hl72Dz/A3Fgim8
	2Q2KfnJKbaxdk0+c6nf2aFAAuM0sJldk1knM9q787VCW/kAon1GQxVCpKUDxkI2QkasxZEBcGw2
	pr7ZwbLjb5LnAFSn4UpSLVnkUGmi64GaJ2VB0fO4tcpNLoZVUVuGEMQh4be1OIUarKz26yjnmUS
	xzK9tfgh/8R7R1YttiL+YokJDS3AdmuQQR1tTn8xX8aZ5ithzuZQZAsu9yF+EyoFh2w6vjGw2OX
	Yn0ddCW2tfoDYiFHXLcnBlUawh5xnufWAzkIGUUK/aEdxfYQWeD0cv9N+3zFXOyQ3IDAibqh+US
	OM4gQDBKo4VGAmApXAAkM9VPMuXwPZRoBPj6M/NPGhVVN0zRIjk9T/GtdZ+rWvz42iZLEToA7NF
	m4zW6TBVeE87x6aQ+Vyhi1phM/9pSlvaJwIAflq
X-Received: by 2002:a05:6402:2350:b0:6aa:af44:3e8a with SMTP id 4fb4d7f45d1cf-6b17c25596dmr4500014a12.22.1791642340386;
        Sat, 10 Oct 2026 07:25:40 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dfff40sm2635586a12.34.2026.10.10.07.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:25:38 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v5 0/8] alpha: fix stale TLB translations breaking copy-on-write and writeback
Date: Sat, 10 Oct 2026 16:24:26 +0200
Message-ID: <20261010142533.974797-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Alpha, stale TLB translations can break copy-on-write and shared-mapping
writeback: a multi-threaded process can lose its own stores, read data
belonging to its child, or lose writes through a shared file mapping. The
copy-on-write failures need more than one CPU; the writeback failure also
happens on a uniprocessor.

This is the first of two series, based on for-next at 33465f6ab697
("alpha: support the remaining kernel compression formats"). Apply all
eight patches here, then the two patches in "alpha: complete the direct-mm
shootdown fixes" v4. There is no interleaving or external prerequisite for
this first series.

Patch 1 moves here from v2 of the direct-switch series:

  https://lore.kernel.org/linux-alpha/20261008195608.965266-2-linmag7@gmail.com/

It loads the context when switch_mm() is called directly for current,
before kthread_use_mm() can reach the hook added by patch 2. This closes
the dependency that previously required applying one patch from the other
series first. Its functional code and Matt's review and test tags are
unchanged; v5 expands its comment and changelog to name all three callers.

Patch 2 completes the deferred-ASN handshake from
finish_arch_post_lock_switch(), including the first switch to a newly
created task. Its old location after alpha_switch_to() was bypassed when
a new task reached schedule_tail(), leaving asn_lock set.

The hook runs after interrupts are enabled. Set need_new_asn whether
switch_mm() reused or allocated an ASN, so a deferred IPI cannot leave
a live hardware context with a zero slot. This is also required before
the second series uses those slots to decide whether to skip shootdowns.
Drop the preemptible() guard: Alpha has no kernel preemption and the
direct-switch callers do not sleep before the hook, including when
RCU_STRICT_GRACE_PERIOD enables PREEMPT_COUNT.

Patches 3, 5 and 6 test current->mm before issuing targeted tbi(), since
a lazy active_mm does not establish which ASN is actually loaded. Patches
4, 7 and 8 retire the calling CPU's context when the local current-context
test fails; smp_call_function() only visits the other CPUs.

Patch 4 deliberately precedes patch 5. The missing else branch must be
present before lazy callers are routed to it, so no intermediate commit
loses their local invalidate. This matters on EV7 where a foreign-context
tbi() appeared to work. The full-mm and icache callers retain their
active_mm tests because those paths load a new context instead of using
a targeted tbi(). The second series separately changes their IPI handlers
to retire slots on lazy CPUs rather than keeping those slots visible.

Testing

The combined TLB v5 and MMU v4 stack passed cross-build checks with GCC
15.0.1 for arch/alpha/kernel/, arch/alpha/mm/, kernel/sched/core.o and
kernel/kthread.o: ALPHA_GENERIC SMP and UP with COMPACTION=n, and SMP
with COMPACTION=y, RCU_STRICT_GRACE_PERIOD=y and PREEMPT_COUNT=y.
Full ES40 kernel builds with COMPACTION=y and COMPACTION=n also passed.
All ten patches
pass checkpatch without warnings, and sequential application reproduces
the committed trees at both series boundaries.

The combined TLB v5 and MMU v4 stack also passed an ES40 SMP run with
three CPUs online and COMPACTION=y: nine lost-store rounds, nine
stale-read rounds and ten mkclean4 writeback rounds on ext4. Compaction
ran throughout; pgmigrate_success increased by 7424. No new kernel
warnings or errors were observed in the captured log. This exercises
the migration path. A second boot with COMPACTION=n also passed nine
lost-store, nine stale-read and ten writeback rounds, exercising the
direct flush_tlb_page() writeback path. No new kernel warnings or errors
were observed in that run either. UP was compile-tested only.
The historical results below are from earlier revisions.

Historical results from the earlier stale-TLB series, on an ES40,
EV68AL (21264C) Tsunami with three CPUs, v7.2-rc2 and v7.2-rc6:

                                      before          after
  smoke test, stale-read check        7 of 9 rounds   0 of 9
  lost stores                        11 of 40        0 of 400
  writeback (mkclean4), SMP [*]       10 of 10        0 of 10
  writeback (mkclean4), UP  [*]       every round     0 of 8
  tst-malloc-fork-deadlock-
    malloc-check                     8 of 10 fail    25/25 pass

  [*] CONFIG_COMPACTION=n.

alpha-cow-smoketest.c uses pthreads and forked children. Each thread owns
its slot, and the main thread reads only after joining. Slots are 128
bytes apart so threads share a page; writing once and reading repeatedly
avoids hiding stale translations with another faulting write. It does
not fail when restricted to one CPU.

mkclean4.c exercises patches 4 and 5 together on SMP, and patch 6 on UP.
It compares a small MAP_SHARED mapping with its backing file after
background writeback, with the writer and flusher pinned to the same CPU
on SMP. It needs root and COMPACTION=n. With COMPACTION=y, Alpha overrides
ptep_clear_flush() to use migrate_flush_tlb_page(), so folio_mkclean() does
not exercise flush_tlb_page(). Earlier unpatched COMPACTION=y runs passed
103 rounds; separate regression runs under continuous compaction migrated
368522 folios without failures.

Matt's earlier ES47 (EV7) testing on v7.3-rc1 with one CPU online found no
regressions in fork/COW, writeback and gdb breakpoint tests on SMP and UP
builds. He could not reproduce the unpatched writeback failure despite
counters showing foreign-context targeted invalidates. The fix rests on
the tbi() contract, not on every implementation exhibiting the failure.

Patches 7 and 8 still have no isolated reproducer. A gdb breakpoint
exerciser covered patch 8's path for regressions. Matt suggested
move_pages() on another process's hugetlb mapping, with the caller pinned
to the CPU the target last ran on, as a possible reproducer for patch 7.
That is unverified; the proposed hugetlb support is not in this base.

Changes since v4:

  - No functional changes; only comments, changelogs and review metadata.
  - Drop stale Message-ID trailers from patches 1 and 3-8.
  - Mention do_shoot_lazy_tlb() in patch 1's comment and changelog, and
    explain that Alpha does not select MMU_LAZY_TLB_SHOOTDOWN.
  - Clarify patch 2's hook comment: kthread_use_mm() can call it with
    preemption enabled, but Alpha has no kernel preemption.
  - Refer explicitly to patch 1 in patch 3's changelog.
  - Rewrap patch 4's opening paragraph.
  - Add Matt's Reviewed-by to patch 2 following his v4 review; retain
    the existing tags on the other seven patches. Matt has now reviewed
    the whole series and compile-tested v4 at every commit on SMP and UP.
  - Update the companion-series reference to MMU v4.

Changes since v3:

  - Move the reviewed direct-load fix from MMU v2 to patch 1, making the
    TLB and MMU series applicable in sequence.
  - Drop the post-switch hook's preemptible() guard.
  - Set need_new_asn on both reused and newly allocated ASN paths.
  - Put the missing local flush_tlb_page() else branch before changing
    the current->mm test, as requested by Matt.
  - Rebase on for-next and update numbering and dependency descriptions.
  - Mention the proposed hugetlb caller without claiming a new reproducer.
  - Drop the old review tag from the materially changed hook patch;
    retain tags on the other patches.

Thanks to Matt Turner for the review and EV7 testing.

v4: https://lore.kernel.org/linux-alpha/20261009210449.971057-1-linmag7@gmail.com/

v3: https://lore.kernel.org/linux-alpha/20260923074903.862898-1-linmag7@gmail.com/

Magnus Lindholm (8):
  alpha: load the MMU context when switch_mm() switches the current task
  alpha: run check_mmu_context() from finish_arch_post_lock_switch()
  alpha: only use a targeted tbi() when the target mm is really current
  alpha: invalidate the local context in flush_tlb_page()
  alpha: fix the local TLB invalidate in flush_tlb_page()
  alpha: fix the local TLB invalidate in the UP flush_tlb_page()
  alpha: invalidate the local context in flush_tlb_mm()
  alpha: invalidate the local context in flush_icache_user_page()

 arch/alpha/include/asm/mmu_context.h | 28 +++++++++++++++++++++++++---
 arch/alpha/include/asm/switch_to.h   |  1 -
 arch/alpha/include/asm/tlbflush.h    |  3 ++-
 arch/alpha/kernel/smp.c              | 15 +++++++++++++--
 4 files changed, 40 insertions(+), 7 deletions(-)


base-commit: 33465f6ab697abceafd9a340067a544d551c4412
-- 
2.43.0

