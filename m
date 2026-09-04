Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906794F055C
	for <linux-alpha@vger.kernel.org>; Fri,  4 Sep 2026 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539084; cv=none; b=PSaJHklZiHFdhrisATEgEatg1jXH0OaX1WOa1xjmG1XzUxZQu7AM+6/ELl8LbD8IasgerCGuhHHC3o/w4JsHXl0lOV5vptnZeMZL2HfKZEV/bSo9KksdD5PPrXK5Bo6tgRLy00VdTWUxzYz9SOysCtXviu9+TV3kO1nWMBCZbsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539084; c=relaxed/simple;
	bh=hf5dMmUnqPpzPdsGZVnBKf0db0q1BjhZ6EJ8ijLarCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JYtksYlHZOcM4pihUfOXS3DSWIb4pk07x9KTwxjBUl5s1F1H0lHMY4l1I6pjDwzbkfYPym6AUN8RjycrJWFEDwJYgF2pnzLXKBi3OpZT0PJQ4ETlLG16Z3uBjFOPxVYvuWNec7COpSOS5g0H6WF3fSvG0iIAH8GTGtfqcl+iac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2EQE3Kt; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2EQE3Kt"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2533d83e3bso202182866b.2
        for <linux-alpha@vger.kernel.org>; Fri, 04 Sep 2026 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539079; x=1789143879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2XRThQt67LCC120ZSHWxwuTYmoUdCWvzW9mqaIXjQA=;
        b=H2EQE3Ktymf3Tv+6ruWojbzYEF00JJbDVEzRsr7RWahOhROqEJGjYATkdeCyhs1zL0
         qASWLeGZJgJqiSw/1Ij8GGYfqJol5vxXUOqhj0AKLIMp57UQDanGZR4cL9Xzi6N+jm0Z
         hUxvqhdfH0x8jcGirUko0QjQr1aVbM4dWMo4uJha7a4iUvu5Dv7Geomy08Ld1RMS00cv
         GE0eovRvRZW2O2iY3ozKbDF3HoYuZlJbqtzEEgrxi/sUTCkkEaDPw0B75v+Pb2ABingO
         W9p0jf6ZX2AuM8+UTBg4x33psRaF/9UNa9eJnL99dFyfrhN59PR/Hx9ypXL8BEOdFnts
         lRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539079; x=1789143879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2XRThQt67LCC120ZSHWxwuTYmoUdCWvzW9mqaIXjQA=;
        b=UOPZEvUaq+7nUMZkE3kx5DJBiGLHBtF3mJ7u3Bge4oluS7zOQP/D/sz59r03Lo1QjJ
         8TuDqgbO8m+i0tCyUXjnkwxvwsMYRFUNguCmrN5W4JCpSu9i6BGVeF9HfLHQygpkY5bb
         jShFS6grBOXULxdix0/IP+3Xh39Em0M7GI5/yDxNK4cvjvq5NVk+FndKLkZXAyjyVG3g
         9GwzsmGJm/b4NzP2BIDI3pp1iBXp4cCdyvhKt+CNsQquBJJi6Mup8Nerg34HYDWT/JVH
         DJxGB8sugfM+pqHG6+7ZdTzaqWAxRob0Eb5CFCuxfnZOp5sLpAEAUTX1dkxJMJWiQlqh
         ncIA==
X-Forwarded-Encrypted: i=1; AKwUvBwn+7oEJ3Spc1wuKVYselHIls5ajtgWIj2TeYZxC2DPjMMN0SOsUQYStOfJHPJT068dsfVBn5dFEc3eVg==@vger.kernel.org
X-Gm-Message-State: AFuF++mHf2g02eBRfaxiC3wCjVhrP1qsBRvmLTM1CNX5V4WTEtvT3I4T
	b1ST9up1zCvnFhxGbbP7g1VUaJ0QF87iM0Nbp/czDDkjzlwV0f61uVIN
X-Gm-Gg: AYBFou11eqUtIOcq7j8J3Xqf9+X4nkVTr0F48apiIPdRj3lWUw9PWncw9u8aPLdhMcF
	gfLqGN/Hnc1+WmGAbpTrl7MxKnol5dZOtZpGZkDHvoITz9oyvplBzbtk9ZtES5EevRjiTyGiW0v
	LvEo1v/mARLSe3VSuq5wYuNi6ARmNIDMzBCAXKIaLfwvOy9OZvf07lqMAOihai/w3efrlhaQIHM
	2DRvZex6r/xJiPD3ZWaD4N5wTAFZxWGmF8hz8Tsu7ILGTEb8ba2k850tc7j85KJl4M0o8xhAI3F
	SECAOQ+4Jh6AIqfIqKZbbwCaou28Ukf07GBArIRR2hLRrYVcQkH/7QeUCmbLahhpi9n6lFZ+V2Q
	Vq4kJjI7+/nOYwd3awA3o6gQlOMwESqYzilmcFSNmfl8Q35KZggxJehtdiESfc7ypQw9Tme0WOs
	Vz2+22/O2wy80kbI8krKhEhhL6jK3Fns6Mu0mUx28wWZbDbqETBwp5x5vbcnFs+0yM0jjOdUVVQ
	OTyHRHU5QyyRH0e/WIEn0U+wAm91+w=
X-Received: by 2002:a17:907:9724:b0:c12:b2db:873d with SMTP id a640c23a62f3a-c260c9715d3mr467427466b.5.1788539078783;
        Fri, 04 Sep 2026 09:24:38 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8bacsm132556766b.17.2026.09.04.09.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:24:37 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 0/3] alpha: load the MMU context on a direct mm switch
Date: Fri,  4 Sep 2026 18:23:28 +0200
Message-ID: <20260904162424.376504-1-linmag7@gmail.com>
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

Patch 1 removes a stale clearing loop in migrate_flush_tlb_page() that
patch 2 depends on being gone. Patch 2 stops the TLB shootdown shortcut
from skipping a CPU that is borrowing an mm through kthread_use_mm(),
using mm->context[cpu] as a lockless publication of which CPUs may be
using the mm once patch 1 makes every write to it single-writer.  Patch 3
then makes those direct mm switches actually load the MMU context, which
they currently do not: kthread_use_mm() and sched_force_init_mm() call
switch_mm_irqs_off() directly rather than through the scheduler, so the
hardware context is never installed and the task keeps running under
whatever was loaded before.

Reproducing it. A KUnit test was written for patch 3; source can be made
available on request. It uses kunit_attach_mm(), which calls
kthread_use_mm(), and then compares the loaded context against current->mm:

	# alpha_use_mm_loads_context: EXPECTATION FAILED
	    Expected pcb->ptbr == mm_to_ptbr(current->mm), but
	        pcb->ptbr == 384 (0x180)
	        mm_to_ptbr(current->mm) == 12555 (0x310b)

  0x180 is swapper_pg_dir: the kernel thread is running on the page tables
  it had before the switch. The pcb.asn check in the same test passes,
  which is the signature - ev5_switch_mm() does write the ASN, so it is the
  load that is missing rather than the bookkeeping.

  Do not detect this by dereferencing the borrowed mm's user addresses.
  do_page_fault() resolves faults against current->mm and never reloads the
  context, so with a stale ptbr the same access faults indefinitely.

Testing. ES40, EV68AL (21264C) Tsunami, 3 CPUs, v7.2-rc6.

	                                  before        after
	  KUnit alpha_mmu_context         0 of 2 pass   2 of 2 pass

  Patch 2 was measured rather than argued. Dropping the shortcut outright
  is the obvious fix and costs far too much, so it tests mm->context[cpu]
  instead:

	  fork/s, single-threaded    shortcut as before   1360
	                             shortcut removed     1050   -23%
	                             patch 1              1360

  Medians of seven, seven and twelve runs, spread 1352-1367, 1046-1052 and
  1340-1366. The unchanged throughput shows the shortcut remains effective
  for this workload, and neither the barrier nor the context marking shows
  above the noise on this machine.

  No regressions in the wider suite: glibc malloc-check 25/25 and four
  related tests 10/10 each, the copy-on-write and writeback reproducers
  from the previous series clean, and the same again under continuous
  compaction with 359768 folios migrated during the run.

One adjacent problem is deliberately not addressed. enter_lazy_tlb() sets
pcb.ptbr for the borrowed mm without setting pcb.asn, so a kernel thread
switched in through PAL_swpctx loads one address space's page tables
against another's ASN. I have not found an observable failure from that
mismatch outside kernel-thread user accesses, which go through
kthread_use_mm() and are a matched pair after patch 2. Changing it would
mean touching the VPTB self-map behaviour on every lazy switch, with no
reproducer to justify the risk.

Patches 2 and 3 have no Cc: stable: kthread_use_mm() is the only
reachable caller on alpha through KUnit's kunit_attach_mm():
lib/tests/usercopy_kunit.c, lib/tests/kunit_iov_iter.c,
mm/kasan/kasan_test_c.c and drivers/android/tests/binder_alloc_kunit.c all
map user memory that way; sched_force_init_mm() and the driver callers
need configs or hardware alpha does not have. No ordinary alpha kernel
reaches either fix.

Patch 1 is different. migrate_flush_tlb_page() runs under plain
CONFIG_COMPACTION, and the clearing loop it removes can fire from ordinary
lazy-TLB retention on a single-threaded process's previous CPU, not just
kthread borrowing. The compaction stress testing above exercises that path
and has not caught it doing observable harm, so patch 1 also carries no Cc:
stable, but for that reason, not for being unreachable.

This applies on top of the "alpha: fix stale TLB translations breaking
copy-on-write and writeback" series and depends on it: patch 2 rewrites the
same flush_tlb_page() and flush_tlb_mm() shortcuts that series touches, and
does not apply without it.

  https://lore.kernel.org/linux-alpha/20260810193902.3286353-1-linmag7@gmail.com/

Magnus Lindholm (3):
  alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
  alpha: do not skip TLB shootdown IPIs for kthread-borrowed mms
  alpha: load the MMU context when switch_mm() switches the current task

 arch/alpha/include/asm/mmu_context.h | 11 +++++--
 arch/alpha/kernel/smp.c              | 48 ++++++++++++++--------------
 arch/alpha/mm/fault.c                |  2 +-
 arch/alpha/mm/tlbflush.c             | 16 ----------
 4 files changed, 34 insertions(+), 43 deletions(-)

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0
