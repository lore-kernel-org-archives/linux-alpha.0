Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E6023ABA9
	for <linux-alpha@vger.kernel.org>; Fri,  2 Jan 2026 17:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767375412; cv=none; b=FDKABzMa735+OnlKRjKxcni4UFPTrf9rdv3JUGBZ8YSENIA/SSpmdIfAXII3X31U15opvaY59mkQaIr0eoBfkicbdZOEvHpskRty68UsxFBpdLg+4VeWh40g95pUflUp0dKV1EznTnd0qPGjn83kV/b7cTxCBhlVWHw7PJYXMEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767375412; c=relaxed/simple;
	bh=C+/3RXMSVbiVTRiVO0G7pTHx621LBZbiTwE9TiF73pk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pDbG8j17GK1r9ensjWoISEo6R8d2tvhj4/uuJIRFA3WXvmc6ZCvblZn+117DKheMcxlBs4niIopqMci9xMXuXuyJLix4rDFEHgx1Mm3Pln0eb05ErPVr5xShByMa3SgTMGrxUYrsKbbCzpZm0I1T1OHpXZfQ23w8tsdkv1FGBVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWvJIUNF; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWvJIUNF"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5957ac0efc2so13078459e87.1
        for <linux-alpha@vger.kernel.org>; Fri, 02 Jan 2026 09:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767375408; x=1767980208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l9CkiLHzU/YOmod1lqGzhWtLm0WsHXUj+JLHzdIFpR8=;
        b=kWvJIUNFd6QjrEYh4dUK0+ub56Vz1mP6+hVWIdJlDVC9iru8+PXx+94s7TBkd78rgl
         ZD4AJnu0L7JPPIkPFVnef1PrD/C3H5ZelaDBK2xbPBHcuihMc2iOdW2utz/PZL5COieA
         S4Wc9WMn8R01NZdBo9LamkmJ3aGnwVewIPXi/robi9RjAg7xWCdPZWRCRVrtP637A5sP
         Z0EElFod78Nf0lnjn1fMttNSMSOVMOHTJdciqKwwMbIjbpurL6YsffDqCh533qKNfnfr
         Kk5+4VDd3YFUJtbB5kVXSv4y8h0l7+hVRyfzAWzdPVnCtEdghnLI4C5ZqVONjyTipkM7
         bYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767375408; x=1767980208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9CkiLHzU/YOmod1lqGzhWtLm0WsHXUj+JLHzdIFpR8=;
        b=u0KMNNkBAoppJ8tH9Jl08Zk47wX9XsnAL0IukEz6GoaA+n9w8tCtD20EUgrri0YFio
         z34fbn5T50daBK0woBWGh9fb+x2h7svLJ85zCghlPF2L/jDvmzNNCR/lMHBF+BcGSC9P
         nZiugkd+4TSbZiuvK0+I1RrxobBPgc1YF/EXbDv0/JWoZDVpc+Ib78V4BtvFOvNdZBX2
         qwrJZjob8dWsVUCSLpFiLH+Jtb1kN4tapETTGmSie37RRZMKqYAcTCBo7X3auukEzC34
         /+bjgHxxI4h0YnS2jnJ698UlqpA76N/DccA5wsoqsuDol7abid55Yrhl5j3x2JUCavXA
         t6YQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6V53t7qI7ByoNCKPiuLef4sFpEjtJYGRKygr4irsDNfrxNC+LH3PgA677YUrWTnJDz4ER+6+L2pb84Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa0IaXr5/6KcEpKPBkz7q1wJmIHH3opKZh5T1cMKwWhUF0ugEb
	uYydKSjl2AD4LIruIPGlOgIpW73QngDwbdsVgYHx73iptbKcR09l2hat
X-Gm-Gg: AY/fxX7rI2dJRYvQAnAJBo9mXUnyQkMn43JtHhIetLUQ7WscfH+TD/4QcvQpedJZIUh
	wxtS667I3udVr3aMQOFArMPBdIQrE0GMv53Pouyni3M1p84lys+ynoMqDvlAFtxvh7JdxNHQLtm
	rhp7YBu05hwKreKrt7IGRCD5LJ5rlwhjnp5UQlgrNjofS4bT9FwJFH9Snd6rUTsu3RydVzczYx/
	Dmylv0gesoCrj4Fmg4gNcec67B/AAN+hmvu5EGCD5CeruhS8BDFpvzUEEZAW1Mp/mGEqilWubqd
	AQJASftk0WrtU2eLnCa607QP9Q3+uO2p5+oJPjpPw/8m6y1XCZd2QRavSa+l+JbySxYiMiAZeFG
	aNkyVuLs4I+GIdRTibYQWle7MCcZBeZq1tbZaGibepQAnLVXI/vaDVJbULdg+0c9LkoT08V77ui
	QLO4S5hvjfEfT2giiN3glaPV6A9pZtWM4MTh9d8so/X+zTUKVArNPu7AiJe3Cmh58=
X-Google-Smtp-Source: AGHT+IFmi1FHWi9hrEfagYqg044z77D0b0z6kHHRtJA3bNXlNGts60kU2P2xOcfYA9n6FQXA6n1Keg==
X-Received: by 2002:a05:6512:398b:b0:594:55a3:c191 with SMTP id 2adb3069b0e04-59a17d239e9mr11774694e87.14.1767375407826;
        Fri, 02 Jan 2026 09:36:47 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186203eesm12379442e87.77.2026.01.02.09.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 09:36:47 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	hch@infradead.org,
	macro@orcam.me.uk,
	glaubitz@physik.fu-berlin.de,
	mattst88@gmail.com,
	richard.henderson@linaro.org,
	ink@unseen.parts
Cc: Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 0/1] alpha: fix user-space corruption during memory compaction
Date: Fri,  2 Jan 2026 18:30:42 +0100
Message-ID: <20260102173603.18247-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes long-standing user-space crashes on Alpha systems
when memory compaction is enabled.

Observed symptoms include:
  - sporadic SIGSEGV in unrelated user programs
  - glibc allocator failures (e.g. "unaligned tcache chunk detected")
  - gcc "internal compiler error"
  - heap corruption detected by malloc consistency checks

The failures occur only when page migration / compaction is active
and disappear when compaction is disabled. They affect both UP and
SMP kernels and are not specific to a particular Alpha CPU model.

Root cause
==========

Alpha relies on Address Space Numbers (ASNs) for user-space instruction
cache coherency. Existing TLB shootdown paths during page migration
primarily depend on MM context rollover, with lazy invalidation of
translations on CPUs not actively running the MM.

This approach is insufficient during page migration. Migration creates
a window where stale data or instruction translations can survive long
enough for a CPU to perform loads or stores using the wrong physical
page. This leads to silent user-space memory corruption that later
manifests as crashes.

Testing shows that the corruption is triggered during the unmap phase
of migration. Installing the fix in ptep_clear_flush() is sufficient.
No additional handling is required when installing the new mapping.

Instruction barriers were evaluated during debugging but were found
not to be required. Immediate TLB invalidation combined with ASN
rollover is sufficient to prevent stale instruction and data access.

Solution
========

This patch introduces a migration-specific TLB flush helper that
combines:
  - MM context invalidation (ASN rollover),
  - immediate per-CPU TLB invalidation,
  - synchronous cross-CPU shootdown.

The helper is used only by the page migration / compaction unmap
path, leaving normal TLB semantics unchanged for other VM operations.

Summary
=======

This patch fixes real user-visible corruption bugs during page
migration on Alpha by making TLB shootdowns migration-safe, without
impacting non-migration code paths.

Thanks for taking a look.

Magnus Lindholm (1):
  alpha: fix user-space corruption during memory compaction

 arch/alpha/include/asm/pgtable.h  |  33 ++++++++-
 arch/alpha/include/asm/tlbflush.h |   4 +-
 arch/alpha/mm/Makefile            |   2 +-
 arch/alpha/mm/tlbflush.c          | 112 ++++++++++++++++++++++++++++++
 4 files changed, 148 insertions(+), 3 deletions(-)
 create mode 100644 arch/alpha/mm/tlbflush.c

-- 
2.51.0

