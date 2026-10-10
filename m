Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1792F26ED3E
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791643588; cv=none; b=O8oF6rLGGZyp7aYjC/GSdX423v6OI2dhBfW8J9BAEaBGGTdVotU+lpoBZITjpDaObeLum5oQXjJfrPoO5KJWUf5AGtfhEEZnCNs2kUgJFVqjkA7HhLRV/+VAnkh1VBzxRy+QDDVvcnJgjqnHopUJPQGtoxLuGf86U8StzwrJyZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791643588; c=relaxed/simple;
	bh=PE2B59UPOOadlBtkwWqdcd7RJKl6bWXi8RccVpdLBAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XWkr3gcQ7DZMI8nAz0H6VUhk3OrmPxNkEwfxhKhRr0j34RRObyNWG6gClx60fajGYAFfVUn90N86Lb0WE3nHPzspdZudKOmKx6NIErWYGwaa05rfAzh4K1hqpxJRLm8VDyiHeGm8Ys6XRq6F0fHPaDfNxyxPNL6KlMlF63crX8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGeZefW0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGeZefW0"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so83937566b.1
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 07:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791643585; x=1792248385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q5dm3ALJVygTFo9c7172OSMAeNo9NnOOsjkf8BQg0Bw=;
        b=TGeZefW03+ogtcPX+UMc3iULRr8Xd/z1tgzepvzdoEOhsjySrEBcZoRdJrnpSePZ2E
         9mW9T/wtEdwBYFlfUXTkPFSdP4fOyIOpE0W9zZmSHi6UfD8VcD22CXbXiNajKPiMKJ9X
         Oai8ZXFRSpIwk2nyDdWpOSuzJhkZlBcoDelWgxfDCn4h5//blDeUJlkxCAlnXPwsR/Ak
         dMAi7B3D4arqYPlg8ejj5F+7VxSBOBFKyWD1OSnzGj3MTDbiEkCQv2xnJI3eV2j+MZ8A
         TYDV5OxwMeF0kPyKVdegx9oP/IRpq8Xney1YpcdzK6av6YMqFe8inF7/cHrUpD2F2NQJ
         7ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791643585; x=1792248385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q5dm3ALJVygTFo9c7172OSMAeNo9NnOOsjkf8BQg0Bw=;
        b=MiHsbTaoB+d7GYYszEE0rD0vFZO6xyv6VH32cyAM//1ILI+bE7vWyqut/O2t0T8/7X
         0G5yu/qLCsSYIHniBJtEGzlI+j9uk+66fxJfZjrsqJ9sjqFYP9/XjAZeeqzmzQKh+AN5
         /CbXDbs1ryikJ6fbA7rJIq4RDjWqfQ2gBLIfbjTgPDesoQUogsSYchGTTMa+pgl1wBPm
         Ad9TAWfFeS5Vu7/N9WBBuU+tG8It2fR2UyoyKAO6zu8FYah3NUUso9mL0HyNsWwnt3w6
         n2c0kotIypQQWA1epdunwsxwEYSx5MEuOCbPzbusDAJbvEDFyfc/vt6B2cM1dZ6akjUN
         wySQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyZfddogAXtfDMmP/XZ7vPo6REPoidB/M2OWo0F9Jugu+DixMyv0D3KgoLxNmnAiy/Zu/aUc4i7I6wmw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLvV/KxtkKKIc92gQnn44e41MEr4L0MoowT3ffeN5VhZACCn9vp
	Imyf/reg/GTEhRegGKlqgwswYqW6TpgxOosz3ZVXuZW564OeC5I5WLCZ
X-Gm-Gg: AYBFou3C/6zO4xPX4GCarJK1Sa3S0NZQ7dRtu4nGpvbXFrhSk3p+tyGUANGbpFtJ5Da
	7UV1g/dxmI7eegm/JO9bvuNgGtptMu5V77Q0na94htFqkCmTsok1QxtCM2CZ98hxyiCSXdAJlsv
	Cg55ee+q99886ZZ8Gk/Bbsf2Yr9/J+l70qwDW++X1u3V41BZNMufDA1Hc501rfkyYAd86y+xpzg
	mmd0t1zQm9dLcZ10fjjwnRNpPaxOCjI6r62uboRULDptQUyJ0aB4wr2FYnBKg4tW1FZ7zFfKdK4
	LWDRFw03HfGo6trd0ritv3Z8dhTOsM4OsFFveUH79aUmh7j2UW+Q5XQCKXBjh6U2uEeroQXm11S
	8w1wddt0IZ8r5cpHdnzFZA9R/gZHvWqxvcegHBBCmoN6BsAIVBJmWV0oSj03QsicI1UNz0hVOAe
	JqooO2MaBxveos4nOcuvHUSTYBBm4O3WI/AlmxldEWd4BlK2BoKqq2UnoDzOA+pRB22wy6qa5K4
	Dl2aMMHIxN6Ab0Ag0Y+Lylzx6/AKzwBwXbMG6RT
X-Received: by 2002:a17:906:f59f:b0:c31:7495:e57 with SMTP id a640c23a62f3a-c31aa0dc6b5mr491518266b.44.1791643585086;
        Sat, 10 Oct 2026 07:46:25 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9767227sm247286566b.11.2026.10.10.07.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:46:24 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v4 0/2] alpha: complete the direct-mm shootdown fixes
Date: Sat, 10 Oct 2026 16:33:09 +0200
Message-ID: <20261010144621.974850-1-linmag7@gmail.com>
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
below describe that ordering from for-next at 33465f6ab697.

Patch 1 removes the remote context-clearing loop after the migration
shootdown rendezvous. The callbacks have already updated their own slots;
clearing them remotely can hide a CPU still running the mm.

Patch 2 fixes the mm_users <= 1 shootdown shortcut. A kthread_use_mm()
borrower takes mmgrab(), not mmget(), so mm_users does not count it.
Inspect remote context slots instead of clearing them, and skip IPIs
only when no other CPU has a context. Together the two patches remove
runtime remote writes to those slots.

The full-mm, icache and migration callbacks now test current->mm, like
the page-flush IPI handler. A CPU retaining the mm only lazily clears its
slot instead of publishing a new ASN. The migration callback still does
the per-VA tbi() afterwards. Returning to the mm allocates a new ASN
through ev5_switch_mm(), or through the direct-load path for an explicit
borrow by current.

The caller-side tests in flush_tlb_mm() and flush_icache_user_page()
remain current->active_mm. A lazy caller can publish its own slot, but
it also performs the shortcut check, which excludes the calling CPU.
The claim about retiring lazy slots applies to the callbacks; it does
not mean that every path now tests current->mm.

Context publication from ev5_switch_mm() is ordered before use of the
mm by the mb() in Alpha's arch_spin_unlock(), when finish_lock_switch()
drops the rq lock. This is an Alpha property, not a generic guarantee
that unlocking the scheduler lock is a full barrier. A comment at the
store now records that dependency. The smp_mb() added to
__load_new_mm_context() in v3 remains necessary for publications from
check_mmu_context(), which runs after the scheduler has dropped the lock.

Changes since v3:

  - Drop the stale v2 Message-ID trailer from patch 1. Its code is
    unchanged and Matt's Reviewed-by is retained.
  - Test current->mm in ipi_flush_mm_and_page(), so migration callbacks
    also retire lazy slots rather than repopulating them on each page.
  - Explain why the caller-side active_mm tests remain unchanged.
  - Name Alpha's arch_spin_unlock() mb() in the ordering argument and
    document the dependency next to the ev5_switch_mm() publication.
  - Add Matt's Reviewed-by to patch 2 with the migration-handler change
    he requested as the condition for that tag.

Testing

Fresh fork-throughput measurements and an SMP run under compaction are
still pending for this revision. Targeted Alpha SMP, UP and SMP with
compaction builds passed, as did a full ES40 CONFIG_COMPACTION=y build. The earlier fork numbers do not measure
these handler changes and are not presented as results for v4.

For comparison only, on 2026-10-09 the preceding MMU v3 plus stale-TLB v4
passed nine lost-store rounds, nine stale-read rounds and ten writeback
rounds on an ES40, EV68AL Tsunami, with four CPUs online and
CONFIG_COMPACTION=n. No new kernel errors were observed. That run did not
exercise the migration callback changed here and is not validation of
this revision under compaction.

The direct context-load fix moved to stale-TLB v4 patch 1. Its existing
review/test tags remain there; it is not duplicated in this series.
Both patches here retain Cc: stable, including the migration cleanup as
the shortcut's prerequisite.

Thanks to Matt Turner for the review and EV7 testing.

Earlier revision:
  v2: https://lore.kernel.org/linux-alpha/20261008195608.965266-1-linmag7@gmail.com/
  v3: https://lore.kernel.org/linux-alpha/20261009212501.971158-1-linmag7@gmail.com/

Magnus Lindholm (2):
  alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
  alpha: do not skip TLB shootdown IPIs for kthread-borrowed mms

 arch/alpha/include/asm/mmu_context.h |  7 +++-
 arch/alpha/kernel/smp.c              | 52 ++++++++++++++--------------
 arch/alpha/mm/fault.c                |  4 ++-
 arch/alpha/mm/tlbflush.c             | 18 +---------
 4 files changed, 36 insertions(+), 45 deletions(-)


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

