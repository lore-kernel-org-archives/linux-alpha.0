Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627BE3AE713
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 19:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791489386; cv=none; b=SbO1kNY+00VV180Tjy6PtuYHfXkEjP2WZy8U27XTx1JSMyVsTblvgyI0R+rfqcEFyXMV8Y0ZU8BFCSjnhyu0xBVupor0uk+eEBdnHa69egsIHAc+JBjoU8YPCygBKq1V9493TrJPb0YeD/uNebRnVHkE7g2RZEDwCojbCLBkb3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791489386; c=relaxed/simple;
	bh=6i5Nlfba87m1QqhxRNI5xV+ZtUsTzyBFAGLoLBVx+yU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V1X4tt4HLMnHaQBW+wbchpLs9qPUpSKkc/ktbugvinJIVuhMgU4lR+k4zcjViYjupniu60aoAP7C/d83Hh/e4FUs3haqNVynw60Yoxou+HwPHqBlQb3VCDDD/Shg9KbHMxfegxypA2xHLFKkIt9L8x2qnkGa6WZHZ9G7wlSvfYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdktI/cq; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdktI/cq"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2e26719a0fso337198466b.3
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 12:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791489382; x=1792094182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJ+iUiT2zb+fNBjCflR0wf8az/tFXdBMwWqsoHP6ssU=;
        b=WdktI/cqUxvZoaaydBCRDLC4MJtTWvVUYCp717LsBW2Hv5cWTnBUVk3abm6PUDXeI1
         dN7VpLG/acHkKqzB963gjE+QdLW+Qsf4qQoI6f+9Gnf9x6K3ViJrHdj6wnbmGvin4U6K
         xH4gnYI9UkizWHzrQLNCm3TNKG3hQ8sAhq24fAIfz9Vl5CNT/OpzOJ+4mEJkyYmYv/Cd
         feGu5q44YVSsGEMgvLUIjN8L1l+J6KcY0+2UTR5z190wYIWBwBziiktfFeKedfMNHUl4
         bdsEjRu75+ZV23MdVXTC4HZYCE+pPgRtHA7kKHw+Ri5VJHt5dOCw95+nWc47E9Gpb64s
         rirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791489382; x=1792094182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJ+iUiT2zb+fNBjCflR0wf8az/tFXdBMwWqsoHP6ssU=;
        b=LRIaSTnXu4Qh3zStD8DW1YN+zHGfvNS+IwKF81vE3Sa2qfMq5PP3HZTfSpxETj/v3i
         2Pyay8Fp6pxpNO/9Xjyt93uvNMEd+HZSgN7YQEvueBLSsZIScSpMaq7wwWA1uMfh5JYD
         tbYwGBPYnunWjsmRbqRG0teFIw2ecY5Z7ho3CQSX9L6kpAZTabB7+cHQy4CKQ2X0Cg/X
         8Bw/Hh9m+BCASFcIlPTEY58iaf0Fl2+sxe7qQPekAXSzu3Nr2ZZRILvWWlZkVaLvDfQh
         K7hQGfLkoe4OeSIVdMHGOH2ChYYJQAEqm8nuRBc1OfFY1pFq9CwomHRTLjpDuEWd9+Ul
         gIyQ==
X-Forwarded-Encrypted: i=1; AKwUvByccycLegz/X4vmuDh2cZlzjFugHi0SLM58/qXv5T4zuT+K0KISffdC35seJ75o4o/FDe348H7ZqPlauQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nasocqeKVAI6cUU/7L4rzZe3gQyKLD7nO0kwtZ82HwtV9efugp
	uv7RG8L2UyviP/gUuP2pI2jRoaUZN7dnrUHgNJTENI+6wIsVH15BBICB
X-Gm-Gg: AYBFou2gVg/zpPtQG4xbFLhyOfHj2xSEQun5aAxJjOwWgLuJ3yX+AvtLJqgONRdUYoz
	itnNHv+cMlaOatSnJzkn38e9LUaJuV8c9cGEiTHkjYVlrlvBJuwWkMY14V1XsXhWLF8AGD5ggXZ
	DA1z0tBwZdZguYErt78zvsfQKZH/5IlVJrsLUzfy8bhE/akGeG/rsN7RC7KRy/4v6KDKY/hzfEN
	XM29T3eJKR3u+stPBOu7bcairWzpugOndkCNi3ubpXxcLSFUymkJJZqLFmpyveCF6B4TVCgtxsD
	BLmM6p2F4MmoCI6yNKHlung7unKNRqxxkkWAXGRKi7vkCQ3tToiBokGjXm8Cm94Ameu4X277cdE
	4FDQ6UFZssx9+xaSVnbEdl4UieFvrcWm8iu0/yGvuuZ+uSyyjgJZnq9jvBlno5MvwWokt7ZDMBy
	DcKidXzI2F40027pBmNYMLAurBVK6VV+RiTzMXaGJv8bMT4kXJGN/ak0bPisCYx4vI+y0x/3Vp2
	r+TlTrid+mMj7Fu2V+rFmjHXuFaUQW4SZg4H9k1
X-Received: by 2002:a17:907:9714:b0:c2a:ad55:b3fa with SMTP id a640c23a62f3a-c31a6dff0d4mr17443666b.7.1791489382292;
        Thu, 08 Oct 2026 12:56:22 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a4d0c2efsm9906266b.26.2026.10.08.12.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:56:19 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v2 0/3] alpha: load the MMU context on a direct mm switch
Date: Thu,  8 Oct 2026 21:55:15 +0200
Message-ID: <20261008195608.965266-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three fixes for how alpha handles an mm that is switched in directly
rather than by the scheduler.

Patch 1 makes those direct mm switches actually load the MMU context, which
they currently do not: kthread_use_mm() and sched_force_init_mm() call
switch_mm_irqs_off() directly rather than through the scheduler, so the
hardware context is never installed and the task keeps running under
whatever was loaded before. Patch 2 removes a redundant clearing loop in
migrate_flush_tlb_page() that patch 3 depends on being gone. Patch 3 stops
the TLB shootdown shortcut from skipping a CPU that is borrowing an mm
through kthread_use_mm(), using mm->context[cpu] as a lockless publication
of which CPUs may be using the mm; between them patches 2 and 3 remove the
remote context clearing that would otherwise invalidate that test.

Patch 1 comes first here because it also has to come first relative to the
stale-TLB series; see Order below. It was patch 3 of v1, which is how the
stale-TLB v3 cover letter refers to it.

Reproducing it. A KUnit test was written for patch 1; source can be made
available on request. It uses kunit_attach_mm(), which calls
kthread_use_mm(), and then compares the loaded context against current->mm:

	# alpha_use_mm_loads_context: EXPECTATION FAILED
	    Expected pcb->ptbr == mm_to_ptbr(current->mm), but
	        pcb->ptbr == 384 (0x180)
	        mm_to_ptbr(current->mm) == 12555 (0x310b)

  The kernel thread is running on the page tables it had before the switch.
  Here that was 0x180, swapper_pg_dir, but it need not be: Matt Turner ran
  an equivalent test on an ES47 and saw a stale ptbr that was the page table
  of a user process that had run on that CPU earlier. The kthread can then
  read and write that process's memory where the stale mappings allow it,
  and translations taken that way can end up tagged with the borrowed mm's
  ASN.

  The pcb.asn check in the same test passes, which is the signature -
  ev5_switch_mm() does write the ASN field, so it is the load that is
  missing rather than the bookkeeping. That also means a passing pcb.asn
  comparison says nothing about what the hardware has installed: writing the
  PCB field is not the PAL context reload.

  Do not try to detect this by dereferencing the borrowed mm's user
  addresses. Where the stale tables have nothing mapped the access faults,
  and do_page_fault() resolves faults against current->mm without reloading
  the context, so it can fault again on return instead of reporting
  anything.

Testing.  ES40, EV68AL (21264C) Tsunami, 3 CPUs, v7.2-rc6.

	                                  before        after
	  KUnit alpha_mmu_context         0 of 2 pass   2 of 2 pass

  Patch 3 was measured rather than argued.  Dropping the shortcut outright
  is the obvious fix and costs far too much, so it tests mm->context[cpu]
  instead:

	  fork/s, single-threaded    shortcut as before   1360
	                             shortcut removed     1050   -23%
	                             patch 3              1360

  Medians of seven, seven and twelve runs, spread 1352-1367, 1046-1052 and
  1340-1366. The unchanged throughput shows the shortcut remains effective
  for this workload, and neither the barrier nor the context marking shows
  above the noise on this machine.

  No regressions in the wider suite: glibc malloc-check 25/25 and four
  related tests 10/10 each, the copy-on-write and writeback reproducers
  from the previous series clean, and the same again under continuous
  compaction with 359768 folios migrated during the run.

  Matt Turner tested the series on an ES47 (EV7), running v7.3-rc1 with the
  stale-TLB series applied - v2 at the time, which is code-identical to the
  v3 now posted - with and without these patches: his own KUnit test 3 of 3
  including user accesses either side of a sleep, usercopy_kunit 4 of 4,
  kunit_iov_iter 17 of 17, and a fork/COW check under continuous
  compact_memory clean with fork throughput unchanged. One CPU was online
  for that run, so patch 3's shortcut had no other CPU to look at and
  patches 2 and 3 are not covered by it.

One adjacent problem is deliberately not addressed. enter_lazy_tlb() sets
pcb.ptbr for the borrowed mm without setting pcb.asn, so a kernel thread
switched in through PAL_swpctx loads one address space's page tables
against another's ASN. I have not found an observable failure from that
mismatch outside kernel-thread user accesses, which go through
kthread_use_mm() and are a matched pair after patch 1. Changing it would
mean touching the VPTB self-map behaviour on every lazy switch, with no
reproducer to justify the risk.

Reachability. v1 argued that KUnit was the only thing on alpha that
reaches kthread_use_mm(), and that was wrong. vhost has a kthread worker
mode, vhost_run_work_kthread_list(), that calls it;
CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL defaults to y and userspace selects
the mode with VHOST_SET_FORK_FROM_OWNER or the fork_from_owner_default
module parameter. The USB gadget f_fs and gadgetfs AIO completion paths
call it, and dummy_hcd supplies a controller on any architecture.  vdpa_sim
calls it. KUnit's kunit_attach_mm() reaches it as well. Since the failure
is a cross-process memory access, all three patches now carry Cc: stable.
Thanks to Matt Turner for catching this.

Order. Patch 1 stands alone: against v7.3-rc1 it applies to a plain tree,
it does not depend on patches 2 and 3, and it does not depend on the
stale-TLB series. It should go in before that series' first patch. That
patch adds a finish_arch_post_lock_switch() hook which, on an ordinary
alpha build where preemptible() is a compile-time 0, clears asn_lock as
kthread_use_mm() returns - while the borrowed mm's context is still not
installed. A shootdown IPI landing in that window then issues a targeted
tbi() against the loaded context instead of taking the conservative
flush_tlb_other() path, and leaves mm->context[cpu] valid. Patch 1 here
closes that window by installing the context at the direct switch, which is
what its cover letter says should happen:

  https://lore.kernel.org/linux-alpha/20260923074903.862898-1-linmag7@gmail.com/

Patches 2 and 3 do need that series. Patch 3 rewrites the same
flush_tlb_page() and flush_tlb_mm() shortcuts it touches, and needs patch 2
as well: while migrate_flush_tlb_page() still zeroes remote context slots, a
CPU running a borrowed mm can be cleared out of the array and skipped by
exactly the test patch 3 adds. The prerequisite-patch-id lines below record
that series; they are unchanged from v1, because v3 of it changed no code.

Changes since v1:

  - reordered: the direct context load is patch 1 rather than patch 3, so
    that it comes first where both series are applied. See Order above.
  - Cc: stable on all three patches. The v1 claim that only KUnit reached
    kthread_use_mm() on alpha does not hold; see Reachability above.
  - Describe the failure as a possible cross-process memory access rather
    than a fault loop, and stop implying the stale ptbr is always
    swapper_pg_dir.
  - Patch 3 says what becomes of a stale context slot: the shootdown makes
    a remote CPU that no longer has the mm active clear its own slot in
    flush_tlb_other(), so once those are gone the shortcut is available
    again, as long as mm_users stays at most one and no other CPU has taken
    or kept a context.
  - Patches 2 and 3 no longer credit patch 2 alone with making every
    mm->context[] write local to the writing CPU; the three shortcuts patch
    3 rewrites clear remote slots too, so it takes both patches.
  - Patch 1's comment names kthread_use_mm() and sched_force_init_mm(), so
    the next reader knows why the scheduler never takes that branch.
  - Patch 1 carries Matt Turner's Tested-by.
  - No functional change: the only code difference from v1 is that comment.

  v1: https://lore.kernel.org/linux-alpha/20260904162424.376504-1-linmag7@gmail.com/

Magnus Lindholm (3):
  alpha: load the MMU context when switch_mm() switches the current task
  alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
  alpha: do not skip TLB shootdown IPIs for kthread-borrowed mms

 arch/alpha/include/asm/mmu_context.h | 14 ++++++--
 arch/alpha/kernel/smp.c              | 48 ++++++++++++++--------------
 arch/alpha/mm/fault.c                |  2 +-
 arch/alpha/mm/tlbflush.c             | 16 ----------
 4 files changed, 37 insertions(+), 43 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
prerequisite-patch-id: 6e9d8cf8190164a8cbe34a879d5a18f23bc9bd61
prerequisite-patch-id: 94856bd5734d96521ef19e59cdb77af1d577fefa
prerequisite-patch-id: 9e39c93f5b7267d1e8ffd176988803681ba03eeb
prerequisite-patch-id: 7326de756f1a933cd3c44e4f7669c5a7c4519678
prerequisite-patch-id: c3f48cfa74e60b966610f88f73f7a393b5adf0b2
prerequisite-patch-id: 73a4faf81a8a0929ba8ba03a6d9a3286e0d9bd2b
prerequisite-patch-id: 55fb49cef84ea661b5340f14c56d73c04556f565
--
2.43.0

