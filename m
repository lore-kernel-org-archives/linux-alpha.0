Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A053D1A98
	for <linux-alpha@vger.kernel.org>; Fri,  9 Oct 2026 21:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581118; cv=none; b=TN/TxztTcTA3j1BydE6i1f4NFxBEnFriMqra1fFe/yNKaad3oCHZm9wzhGC3w77K19Zhb1uY7ocpE86FWAtX1kQJPmvQyhKFZ4wIQQBLHT7Kh6gicZaPfGfY/sRlVyShngRrmOzVfHcXXHCk/hyH+Shws1k/13bBP+jV/PRGuVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581118; c=relaxed/simple;
	bh=mHTKMt/1Mmu8IZrp83hDF0LKpklBxUcJJ7lOZG5GtyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JZu+Han0i8BwniLKCfaI/scgVyTeXbkx4yHtIr1nLtCI9gswcvtXi0bEe3tZiGWWwEZkVHLy3B/GXE0LtiGP7WMuFEMsuHD2lpKS96VNsJSH74fYBusQ8dMU2dZfSjHal0OjHMdCyuq+S4XsnY5lzkavZ6w/NwJjwp2mZKXu5Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYQhgx2V; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYQhgx2V"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2dcbcc546fso28597366b.3
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 14:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791581115; x=1792185915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1mpJQM9gWSMwGnYSvks3+zVF3LVj9ix84KoZRLZII8=;
        b=jYQhgx2VEXzL1W7iDup92PfUh0q9SxvPh4FXzBbAdnr7aqt0yXv0xGsmlx5Dr2mJ9X
         xSTUd37axemlVp4tH52n3N928prWJFeFlM4HGfsX5d9J5wCLvbdE3JU/9xFLj71eytrf
         e9atQhR85SH7tWjRGpKm0pwhDQ6VI5bLRLc4awjGRZcGCrpG3H6D8b+ZkxqQagtTjsHx
         lQUmoZokp9EGZZauHdeK8uzpzjCtBD2JdpDDI8Hw7wfr+hqMZwkZmNrzrfZ6XWwa5g9c
         jPIgJpRo3e/zxjwUovwzNoL4XUUX3atybiZ5TZDyMLvoDWFmoSMTWfCmmbXXPcyr3fwK
         RA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581115; x=1792185915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1mpJQM9gWSMwGnYSvks3+zVF3LVj9ix84KoZRLZII8=;
        b=kFPVX7Lo8JM9UVHHYtmQzIsH1w1oQRlZI4X5QsJZlJTsOJ/WEZ9+IGybAJ8hHtIpNy
         euXIwWjlVBY7fi4ucPf5pFwZW42yi1fkTLmP5v+LoZ0uW7xw0hcr6TVNBmcG0eLIZ0F1
         8vHwhaufTTINZ+QGUAaaLut78JTLwepAaoLIASR7dJVo04P5T82PLVF9G4CkndK1XVtV
         ha06xzaTl1CwVjtHcc+bk7hu6cOx4HOiTd/DMds0dRWuwpb7tMornzMgmE7U1tig9rWW
         v3WfTsMzc/sObERgIHsVlJPJJSgqzhC4ycKVC/N1VhpejbWgA/oQFBT6RXXO5VfpaJ2j
         iyfg==
X-Forwarded-Encrypted: i=1; AKwUvBxFO84tGvG28TpD4N2c/Neaog9uUaYYloQ53kXcOjj72vS0MRzGl+1c/KVQkn24alTav69um6M/gQtTpg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJdiHpCXfnLuXGsi+lxG6tCugDC92lALAtZVHmq9kQi7MybMn7a
	TvzAmQL70DdKkOPbaD3rksTd0JFkGdjxgi0fTJBBxBBURVt9G3YESG7t
X-Gm-Gg: AYBFou3Kb5XRAt8WYE8umwENWMXMh9d+xW/jkzi00iytsA37xd9bn975oElEhmNjgk1
	eFXrZd5zHTz9hL05W4AmhIojyASLsIexUkXajhujWPgFJVvmT3cIFnuItC6KuZ4AmxwQlqahAvz
	1qxopQtNLa4ZTPZYX56vsIEk/hBmqR11tTWsP5Y+g7zsdP5JqyTpXXL8LLgogjvDwH2pq4baBG5
	3N5BmNk8hiwuVUmpYlHU/K6rE2qPuPg/YF3wRPIPt/tDrYR3cWsHWb5+L5fTtAp2vUwd9nLVo+D
	iKSTeCcZh1qjZuBoRL7Q7J5olMKYX2JB/cBdF4tdTYSjGY6W9b6YH2vysSQmqLf3nMu9CV+6NIz
	e4htXsTsoKKiVb88Ddvtp11Srvxsp0u4AYsgsMDEIhWKwqTb0ImNRusvn3vIu6g0XxQeNBRl6XW
	d/cIHbHlGnitELPVNx2zAGXhjeGMRF+TiGUESAlhD9+Vv8goaz1K7ay13elS0HN2W0ScKYXfRB7
	ISO2vBru8DPMLOnq3frUMmRyXqotrsygmnIMOzJj2mLyZvF5uo=
X-Received: by 2002:a17:906:f586:b0:c2e:4742:4c91 with SMTP id a640c23a62f3a-c31aa08e8a5mr280006366b.35.1791581114893;
        Fri, 09 Oct 2026 14:25:14 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ae42sm149079966b.15.2026.10.09.14.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:25:14 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v3 0/2] alpha: complete the direct-mm shootdown fixes
Date: Fri,  9 Oct 2026 23:19:34 +0200
Message-ID: <20261009212501.971158-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the second of two series. Apply all eight patches of "alpha: fix
stale TLB translations breaking copy-on-write and writeback" v4 first,
then these two patches. The base-commit and prerequisite-patch-id lines
below describe that complete ordering from for-next at 33465f6ab697.

The direct context-load fix formerly numbered v2 1/3 has moved to the
front of the stale-TLB series, where it is needed before the post-switch
hook can clear asn_lock. It is not duplicated here. This replaces the old
interleaved dependency with two series that can be applied in sequence.

Patch 1 removes the remote context-clearing loop after the migration
shootdown rendezvous. The callbacks have already updated their own slots;
clearing them remotely can hide a CPU still running the mm.

Patch 2 fixes the mm_users <= 1 shootdown shortcut. An explicit
kthread_use_mm() borrower takes mmgrab(), not mmget(), so mm_users does
not count it. Inspect remote context slots instead of clearing them, and
skip the IPIs only when no other CPU has a context. Together the two
patches remove runtime remote writes to the slots.

This revision addresses Matt Turner's review of v2:

  - Add smp_mb() after context publication in __load_new_mm_context().
    check_mmu_context() can publish after finish_lock_switch() has already
    issued its barrier, so relying only on the scheduler and direct-switch
    callers' barriers left that publisher unordered.
  - Test current->mm in ipi_flush_tlb_mm() and ipi_flush_icache_page(),
    matching the page-flush handler. A CPU holding only a lazy active_mm
    then clears its slot rather than repeatedly publishing a new ASN.
    An explicit borrower still has current->mm set and is flushed.
  - Require the first series' need_new_asn change for newly allocated ASNs.
    An IPI after finish_lock_switch() can zero such a slot while asn_lock
    is set. Completing that handshake before returning to user space
    prevents the shortcut from mistaking a live ASN for an inactive CPU.
  - Move the direct-load patch to the first series and update the base,
    prerequisite patch IDs, numbering and ordering explanations.

The scheduler publication remains ordered by finish_lock_switch(); the
new barrier in __load_new_mm_context() covers every caller of that helper.
The checking CPU orders its slot reads after its page-table changes with
smp_mb(). Stale slots may conservatively cause an extra round of IPIs,
after which a CPU not running the mm clears its own slot. The effect of
the new lazy-CPU handling on throughput has not been measured.

Testing

Cross-build validation for this revision covers arch/alpha/kernel/,
arch/alpha/mm/, kernel/sched/core.o and kernel/kthread.o with GCC 15.0.1:
ALPHA_GENERIC SMP and UP with COMPACTION=n, and SMP with COMPACTION=y,
RCU_STRICT_GRACE_PERIOD=y, PREEMPT_COUNT=y and NR_CPUS=4. These are compile
checks; all three passed. All ten patches pass checkpatch without warnings,
and sequential application reproduces the committed trees at both series
boundaries. No new boot or hardware runtime results are claimed.

The following are historical results reported for the previous versions,
not hardware results for this revision's barrier or handler changes.

On an ES40, EV68AL Tsunami, three CPUs and v7.2-rc6, the direct-load KUnit
test changed from 0/2 to 2/2 passing. Single-threaded fork throughput was
1360 forks/s with the old shortcut, 1050 with it removed, and 1360 with the
context-slot shortcut. Earlier regression runs passed glibc malloc-check
25/25 and four related tests 10/10 each, plus COW and writeback tests,
including continuous compaction with 359768 migrated folios.

Matt tested the direct-load change on an ES47 (EV7), v7.3-rc1, one CPU
online. His KUnit test passed 3/3, usercopy_kunit 4/4 and kunit_iov_iter
17/17, with a fork/COW check clean under compaction. Those runs did not
exercise remote-slot clearing or the shortcut's remote-CPU test. The
reviewed and tested direct-load patch now carries those tags in the first
series. Patch 1 here retains Matt's Reviewed-by; patch 2 needs review.

The callers are not limited to KUnit: vhost's kthread mode, USB gadget AIO
paths (including dummy_hcd setups) and vdpa_sim can borrow an mm too. Both
remaining patches retain Cc: stable, including the migration cleanup as
the shortcut's prerequisite.

The adjacent enter_lazy_tlb() page-table/ASN mismatch remains outside this
work. This series does not claim to fix every aspect of lazy TLB handling.

Thanks to Matt Turner for the review and EV7 testing.

v2: https://lore.kernel.org/linux-alpha/20261008195608.965266-1-linmag7@gmail.com/
v1: https://lore.kernel.org/linux-alpha/20260904162424.376504-1-linmag7@gmail.com/

Magnus Lindholm (2):
  alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
  alpha: do not skip TLB shootdown IPIs for kthread-borrowed mms

 arch/alpha/include/asm/mmu_context.h |  2 +-
 arch/alpha/kernel/smp.c              | 52 ++++++++++++++--------------
 arch/alpha/mm/fault.c                |  4 ++-
 arch/alpha/mm/tlbflush.c             | 16 ---------
 4 files changed, 30 insertions(+), 44 deletions(-)


base-commit: 33465f6ab697abceafd9a340067a544d551c4412
prerequisite-patch-id: d194ee1170a45793fa8533400dbc5599fc0e59ae
prerequisite-patch-id: 17df30a2da268e1bd07c7b44de4ef061cb744c50
prerequisite-patch-id: 94856bd5734d96521ef19e59cdb77af1d577fefa
prerequisite-patch-id: 7326de756f1a933cd3c44e4f7669c5a7c4519678
prerequisite-patch-id: 9e39c93f5b7267d1e8ffd176988803681ba03eeb
prerequisite-patch-id: c3f48cfa74e60b966610f88f73f7a393b5adf0b2
prerequisite-patch-id: 73a4faf81a8a0929ba8ba03a6d9a3286e0d9bd2b
prerequisite-patch-id: 55fb49cef84ea661b5340f14c56d73c04556f565
-- 
2.43.0

