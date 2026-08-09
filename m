Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB133B4E94
	for <linux-alpha@vger.kernel.org>; Sun,  9 Aug 2026 08:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786265730; cv=none; b=H8NXei69ysEkGWDcRrbI/Aiyy/2LBMwUaFH+9n9I5DbPw9C47wJmnq/9JWZ8mpEBtW+rE3J5JOAZyy1h3Pwsqj3efptBZca5zg87KrtQmlw5T8NgPT7g3LaZ0QuOZrVy1qnIo+Y7+vfER2XqeJoabUwcQT6pa1W6yUtR1tJSleY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786265730; c=relaxed/simple;
	bh=3ZjK6d4a+KyGOnSPPd5861tqE5kOk1RnyZZw4DBJHyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oTGBHJts1nzOTRScHLlwacUb6fUY7D7HwnBMWeJ43dw72y2kkUuYKZuGJ9hmiXrlVFAEA81KwEqGGlYmaPlc+t3rDkutOv8LTF9KoUv0b/WjLGmEnWO7gUi9wY37fWH/Heh+agiOyh0LlId0U7K/yVe+nDBgoKl6wHFp15YLmas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hswb4gA/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hswb4gA/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso1354395a12.3
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 01:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786265727; x=1786870527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o9Q5KVMcSKiTmkTnvVwqEadlXFVijKUOrEMkjCOQ7lg=;
        b=hswb4gA/x9aj5RddutERRx93zp4bSRb+qZi+DyhNTfiPkI3ME60yIZJmrbDcm1s7CT
         ule/RaAYDlWj4xFMAtUWzFAZBZaNBLsv8DJ6RBgLo5tCZxoco61tPtBTdgO90PXK3EGu
         V438Qzc0hKTxd9NOdPIzL+J4ZMX9y0kMzjt+cixnoRTZPisuq7vFKwz60joolQ/eiRYE
         LLD0CZA1Zu9y9xFAZ+Rba1B3pUlO3hQA/+hKGRrYGOELKr/NgDZxauu463rFBc8sbgbj
         lz9rtbSzzKKy1aMmWHsMe+kbm3OZgPw7FcKK2zP2Q3gln+uScTT0RTsCRanL8AdvSgOW
         8DdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786265727; x=1786870527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9Q5KVMcSKiTmkTnvVwqEadlXFVijKUOrEMkjCOQ7lg=;
        b=dHhZ82f8M6goAdC7CV+t2YK5t9ly9kR8mjDehxaMRcfv3eFHoZ2Gd7LTyC7rN31Y+M
         j2nLNT1JZZ4q087tiek6WkB4BT5l33MCZuaSBpA2a7hsnpO7W/XZyRXUjneYR85LiRPb
         OGX9RI6FPBtm0mmZfWiAQkv+/jUggEIJ4XrXbz+eVev5jUV48budiQnMCPAyG5/O/B+S
         E60cilMQE91rFx3hGtz88jM4xKSOVWseMRtA6kzG9j80SvtwJRF4lJDU93VEwY0j6TKX
         amKYmL1uGoF3am97HAIX7x5/PZtOhwJrIepyEocGzmkQJiwbgaBsPWVvinyq8RaVg/ob
         sLDA==
X-Forwarded-Encrypted: i=1; AHgh+Rqj56GbsYOMtFrrAIlzxabRtifZ6UYzQR1prGE/9AQXE+LUInFWl4dibVohdceehJX0iE7F1pM9bNKjaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztdVwL860I6qXGfWCfca+7e4RlLKqKuefFtGv7u2CGokSY83Ww
	sdiw8tfy5xPKKpOO/9mTJNkpdpgiG+33G6ctclygLoPl1vt1VV8FPSmv
X-Gm-Gg: AR+sD13sxIySfZFMPrfj1Hm7yVJTLor4GkhCvP7aSOiAN1KINYHcOIeFRDJdGu6oDoO
	y5d+/jiDQgML+8BpzjTY4CLsGLrxWcv3iILvmPClVK827sQ0il+GHDOLkCIF/OPvGx//eXdYQy3
	wo8LZ/T/vJd5WnVl95h5gjd2lbXN4dG2X1d3vo5lbbFucqZUt05+vMCOJPoTk8yZQCj0s6m32Lu
	VRJtYXewaxnmS+SesFUKzdfsV+a0iCQ3Fi4dWK59OYH7H6fljzHlZTjVlk8FCsF9uG4+hDinvl6
	49FXbevQNm07Z+WA1rdGyJvNfsvwMqO222ngA5GICOBpbYqPR8/PQs+YVLG91JqEDNQ3j2E8nQt
	Log8ACgmWKv4tGPyiy+zvqW/V5CSQFanmvTgs6HmF3Yo7wjr2y0mHqSK3Urj41R6w9OZam90KyD
	9ze9cyFpD5aT3nrJzQAo54CZqimKxBtH9RIabeYoAXLBwEiuVyorwl5zWqPB0wkyG3V65HxmYcR
	zOf90UtAvBU0R6+Ni3fv0eXs1Tc7jk=
X-Received: by 2002:a05:6402:4487:b0:698:3602:d0d with SMTP id 4fb4d7f45d1cf-6a1f249e06bmr6146217a12.17.1786265727120;
        Sun, 09 Aug 2026 01:55:27 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1f630a4afsm1606681a12.3.2026.08.09.01.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 01:55:26 -0700 (PDT)
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
Subject: [PATCH 0/6] alpha: fix stale TLB translations breaking copy-on-write and writeback
Date: Sun,  9 Aug 2026 10:49:32 +0200
Message-ID: <20260809085208.3262799-1-linmag7@gmail.com>
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
mm->context[cpu] is still valid, so the resuming thread reuses it.  Patch 2
fixes the shootdown IPI handler, patch 3 the local side of
flush_tlb_page(), patch 4 the uniprocessor flush_tlb_page().

The third is an omitted caller-side invalidate, covered by patches 3, 5
and 6: when the target mm is not the calling CPU's active_mm, nothing
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

Reproducing it. Two self-contained tests were written for this. Source for
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

  mkclean4.c covers patches 3 and 4 (needs root), and fails on both SMP and
  UP. A single thread writes a small MAP_SHARED file while background
  writeback cleans it, and the file is then compared against the mapping;
  every round loses data. It forces two conditions that are rare in normal
  operation on SMP: the flusher kworker and the writer on the same CPU, and
  a working set small enough to stay resident in the data TLB. That is also
  why this is hard to hit in the field - any faulting write from any CPU
  repairs the dirty state. On a uniprocessor the first condition holds by
  construction, so no pinning is needed there.

  Patches 5 and 6 have no reproducer for the bug they fix; they are
  justified by the contract of the functions, by the UP implementations
  already having the missing branch, and by the counts above. Patch 6's
  path was exercised for regressions by driving gdb to set and clear a
  breakpoint several hundred times, reaching copy_to_user_page() ->
  flush_icache_user_page().

  Originally found as intermittent heap corruption in glibc's
  malloc/tst-malloc-fork-deadlock-malloc-check. glibc is not at fault: with
  MALLOC_CHECK_=3 it is simply a very effective detector, and every fork()
  runs __malloc_fork_unlock_child() in the child, which writes to allocator
  state.

Testing. ES40, EV68AL (21264C) Tsunami, 3 CPUs. Generated against
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
  1472/1043/199 unpatched. Patch 5 changes a function none of the
  reproducers exercise, so it is covered for regressions only.

  Also run with CONFIG_COMPACTION and CONFIG_MIGRATION enabled, with
  compaction forced continuously underneath the tests: 368522 folios
  migrated during the run, no failures.

  Also built and tested with CONFIG_ALPHA_GENERIC and CONFIG_SMP=n.  That is
  how patch 4 was found: arch/alpha/kernel/smp.c is not built there, so
  patches 2, 3, 5 and 6 are absent and patch 1 is inert, and mkclean4.c
  failed on every round because the uniprocessor flush_tlb_page() carries
  the same defect. With patch 4 it passes 8 of 8, and the rest of the tests
  above pass there too.

Magnus Lindholm (6):
  alpha: run check_mmu_context() from finish_arch_post_lock_switch()
  alpha: only use a targeted tbi() when the target mm is really current
  alpha: fix the local TLB invalidate in flush_tlb_page()
  alpha: only use a targeted tbi() when the target mm is really current
    (UP)
  alpha: invalidate the local context in flush_tlb_mm()
  alpha: invalidate the local context in flush_icache_user_page()

 arch/alpha/include/asm/mmu_context.h | 28 +++++++++++++++++++
 arch/alpha/include/asm/tlbflush.h    |  9 +++++-
 arch/alpha/kernel/smp.c              | 41 ++++++++++++++++++++++++++--
 3 files changed, 75 insertions(+), 3 deletions(-)

-- 
2.53.0

