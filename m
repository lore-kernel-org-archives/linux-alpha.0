Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA0537418C
	for <linux-alpha@vger.kernel.org>; Sat,  5 Sep 2026 19:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636570; cv=none; b=cNWzejQaU9YiE7D5Aa+j5WqSFrLMLAHOAUx2gTooxhqlC99+5CwVNZFn7UyVgrYBcvFR58Nq5Gl+yJ9WIbxdTuUT/Xs4AkVpFgAQAtRheIVo/KTnJrECWU4xXjVSJvBs4o9cz/xQgDqOJh1zeStQmhtPZOdXMet4tpH+AKJYb0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636570; c=relaxed/simple;
	bh=AWTRXt0pinkSDXzQrH2dkgPezTkRqphGgPwWkznG8YA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vp8EhZXrpBGRfMVk0GU3Dqw2Y6Gd0sSaEmYwE5R7e/QmvYJDzikYfmKyHeW6Wv4ae9pCBCZTljAfJUK576CjnDzpgDHK3VRfBnDnKWTWeStvE9TsvQNwA1KEjM0b47VkNYJi8kSEWzB76SQ1oGM/fxkcAOSWikxPLiV5uAFiWsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nq2mJ9ZM; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nq2mJ9ZM"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81ecf499af9so30152007b3.1
        for <linux-alpha@vger.kernel.org>; Sat, 05 Sep 2026 12:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636567; x=1789241367; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6lVFAoW28xNIIl3XigfPOKue0iale2Od2bZ64HUGmyc=;
        b=nq2mJ9ZMlfbZQCfsRdYWIKq+yY1rLYk0zrSxQl6LZRuj+KGHaQhCqoOfPQi8DROPn6
         ofVkN1S/1Ri2EV9JzzN+a3FPmmvILgtgDxPkMNA2o7ggVJ/lAlPrHhjcEb3KbzcF6OgP
         aF4RrFkmUkYnCfDo00iGDzmJvgg68bRz4yBYGLRdKK0ZQNs3pN0k3KZxDRiqYo7+b8AT
         x9TK7q8XsC5h2F/hSgFz4M6LzLBN+iztI4sV/+SQ/386nf2zoPZ2COqdu5R0zQ77zrSp
         eGW562Z1tFJA0VEfG+FVVEPJmz2VaL8YoX/x0SU7zsPEGjwxPaL4gnoOqoj3UHjqxVYl
         EYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636567; x=1789241367;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6lVFAoW28xNIIl3XigfPOKue0iale2Od2bZ64HUGmyc=;
        b=npQObxZc8wZTJcNq7ltZhy7ahs9o1OldInuqehtiaXcB0tuJjAhuJs1aPRjyzpG6q7
         T3N8oWa5Y+eTth5dkS2e1oj7QFAdU9tsjxJ9lUYcUOELBi4MTucAuFQgkpCcQJebXkqh
         LByFwKU+IZ1xMK8RXiGST5gF59HdIuKLwJQtR/rMVLS0pxnazaFY6SVPdaJuIAv5tvRi
         XMPG98QWQUVp6kVm02iNkiGnB+kQ9RaSAi8dXZf3KWJUMUzh7wbJBuvRhzEITSgcGVV6
         qfPGbipfVw9Ns99mi+lSoYowiuLLDgtfECvv/NkTiWR7J1y2ZfK1JmRTdpFz6FaJgJdc
         FdeA==
X-Gm-Message-State: AFuF++lxRtFEyHgdlrJebfHBPNkz82zPHCafdD1BI07Xor01AOUI7ie+
	lvCqjMOO/ZolW34MfPk2NOukszLh1teg/CAtlcDXUMIpFjmkefZc25aq
X-Gm-Gg: AYBFou0aikB+Jne0ciEf5gCUJLT3MBCersPoQEp8UrwfxZCbZBzQisShAbXvH+N5zcN
	uwF71aCDXifcpMN7Z4gqgciuvgC/G4H/wVAUC4w38j5imNoAeHiDBw9adXDFrouj37no4bZLKYE
	I1HT2Z6Z3LTAdx/1VpWVRH5T7gF0fkytx4oF62E+iu5nLey2DmFU4TExcyDCDJbIbNp3jH7iO0M
	ah3yQ2zd810h28ag/aTknxuhH5VD+zZznNZDnBctXXhOsUCODgub0oAPMT5MezYTU8vz5hdxPx7
	LSQJZw2t8bIC6c5QVzNLTqA+jmC1g4Y5OLFUJlSrpx8KAAuxtXnp+NNdocD8wdMSJKMD4PuNlqL
	Xd8umEVy9J56rx0PuVsRfXbfFUgnsRvW0XrBuYZt3ztdCdSLKmeAPTIsLo3bwfEEqQ3VMz6gUuf
	zHWpMAisSVLRAvPiqVXqP2+xXDhH2XtGL7xPlzQEyuWfk318nxMPf3nHCro/iY
X-Received: by 2002:a05:690c:438a:b0:873:5c7b:c0f4 with SMTP id 00721157ae682-8735c7bc27amr22167727b3.44.1788636566542;
        Sat, 05 Sep 2026 12:29:26 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149316361sm43211067b3.14.2026.09.05.12.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:25 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v2 00/22] alpha: catch up on architecture Kconfig options
Date: Sat, 05 Sep 2026 15:29:21 -0400
Message-Id: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrDIBCF4auEWVcYTWJir1K60HEmkYIJWkIh5
 O61XX7w3n9C5ZK4wr07ofCRatpyg7l1QKvPC6sUm8GgsehwUL7Qql60ZUmL2vZ321d1GDWzeDc
 6EQoR2nsvLOnzLz+ezcFXVqH4TOuvJ73RvXGkw4RzP7INOOMkMXqycdB64tHiIATX9QWbBlzlp
 AAAAA==
X-Change-ID: 20260904-arch-kconfig-options-v2-8efa959ffcbd
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5409; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=AWTRXt0pinkSDXzQrH2dkgPezTkRqphGgPwWkznG8YA=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E7aJ7/DY9rmpBKZqTcFc+NbH639IxcYlGDLl879J
 lWqIqKo4yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK7Zfofhr1Te7JZHn7
 qy0lNq5bNVjX6eYFn08+FUrZbQdzz7rHlmPmT4zcod0d0/2/dMqMwq3u2397y9ueedh6bQveJ3L
 veP+bzo4gMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

This is v2 of "alpha: catch up on architecture Kconfig options"
(https://lore.kernel.org/linux-alpha/CAEdQ38FoUPzftf9vDcJK8L38j+cDzTyxdL+Fj-3oAQHmmOxaOA@mail.gmail.com/T/#t),
addressing Magnus Lindholm's review and rebased onto v7.3-rc1 plus his
GENERIC_ENTRY v5
(https://lore.kernel.org/linux-alpha/20260902184058.198679-1-linmag7@gmail.com/T/#t),
per his request.

Changes since v1:

 - Dropped "fix arch_irqs_disabled_flags() to treat any raised IPL as
   disabled".  Magnus's objection was right: per the Architecture
   Reference Manual an intermediate IPL only masks interrupts at or
   below that level, and do_entInt() already drives PS.IPL to IPL_MAX
   itself before reporting hardirq state to lockdep, so the original
   arch_irqs_disabled_flags() was correct as it stood.

 - Dropped "add TRACE_IRQFLAGS_SUPPORT".  It conflicted with
   GENERIC_ENTRY exactly where Magnus expected: the entInt, entSys, and
   restore_all instrumentation it added is now redundant with the
   hardirq-state transitions GENERIC_ENTRY performs on those paths
   itself.  I want to work out separately, and with real testing,
   whether the remaining synchronous-exception entry points need
   anything at all here, rather than resend a patch I can't fully
   justify.

 - Fixed "add ARCH_SUPPORTS_PAGE_TABLE_CHECK support", which no longer
   built against v7.3-rc1: commit cf8771ca4cdb ("mm/page_table_check:
   Pass mm_struct to pxx_user_accessible_page()") changed the callback
   signature, and Alpha's copy is now updated to match.

 - Added the Signed-off-by that was missing from "select SPARSE_IRQ".

 - Folded the corresponding arch-support.txt updates into "select
   ARCH_HAS_GCOV_PROFILE_ALL", "select HAVE_DEBUG_KMEMLEAK", "add
   ARCH_HAS_PTE_SPECIAL support", and "select ARCH_HAS_DEBUG_VM_PGTABLE",
   and added ALPHA to the memtest= parameter list in
   kernel-parameters.txt.

 - Did not touch "add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP
   support" beyond rebasing it.  Magnus found real gaps there
   (tools/perf has no Alpha register mask, and regs->usp isn't
   snapshotted on the interrupt path), so I've left the corresponding
   feature matrices alone rather than claim it's done.

 - Picked up Tested-by/Reviewed-by from Magnus on the patches he gave
   them for.

Not yet addressed: whether do_entInt() should own hardirq context for
both interrupt paths and drop the irq_enter()/irq_exit() pair from
handle_irq(), which Magnus asked about on "enter hardirq context before
looking up the irq descriptor". No code change there yet; I'll follow up
on that thread separately.

Tested by cross-building with alpha-unknown-linux-gnu-gcc against
defconfig and, for the page-table-check fix, against a config with
CONFIG_PAGE_TABLE_CHECK=y. Boot tested on an AlphaServer ES47.

Also available at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git arch-kconfig-options-v2

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Matt Turner (22):
      alpha: enter hardirq context before looking up the irq descriptor
      alpha: select ARCH_HAS_UBSAN
      alpha: select ARCH_HAS_GCOV_PROFILE_ALL
      alpha: select HAVE_DEBUG_KMEMLEAK
      alpha: select EDAC_SUPPORT
      alpha: select ARCH_SUPPORTS_ATOMIC_RMW
      alpha: select ARCH_HAS_FAST_MULTIPLIER
      alpha: select ARCH_SUPPORTS_INT128
      alpha: select HAVE_ARCH_COMPILER_H
      alpha: select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
      alpha: add HAVE_ARCH_THREAD_STRUCT_WHITELIST support
      alpha: add ARCH_HAS_PTE_SPECIAL support
      alpha: add ARCH_SUPPORTS_PAGE_TABLE_CHECK support
      alpha: select ARCH_HAS_DEBUG_VM_PGTABLE
      alpha: select HAVE_GUP_FAST
      alpha: select ARCH_USE_MEMTEST
      alpha: select SYSCTL_EXCEPTION_TRACE
      alpha: discard .eh_frame and the relocation sections
      alpha: select ARCH_WANT_LD_ORPHAN_WARN
      alpha: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
      alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support
      alpha: select SPARSE_IRQ

 Documentation/admin-guide/kernel-parameters.txt    |  2 +-
 .../debug/debug-vm-pgtable/arch-support.txt        |  2 +-
 .../debug/gcov-profile-all/arch-support.txt        |  2 +-
 .../features/debug/kmemleak/arch-support.txt       |  2 +-
 .../features/vm/pte_special/arch-support.txt       |  2 +-
 arch/alpha/Kconfig                                 | 21 ++++++
 arch/alpha/include/asm/perf_regs.h                 |  7 ++
 arch/alpha/include/asm/pgtable.h                   | 24 +++++-
 arch/alpha/include/asm/processor.h                 |  7 ++
 arch/alpha/include/uapi/asm/perf_regs.h            | 34 +++++++++
 arch/alpha/kernel/Makefile                         |  1 +
 arch/alpha/kernel/irq.c                            |  9 ++-
 arch/alpha/kernel/irq_alpha.c                      | 13 ++++
 arch/alpha/kernel/perf_regs.c                      | 86 ++++++++++++++++++++++
 arch/alpha/kernel/vmlinux.lds.S                    | 11 +++
 arch/alpha/mm/fault.c                              | 29 ++++++++
 arch/alpha/mm/init.c                               |  5 ++
 17 files changed, 248 insertions(+), 9 deletions(-)
---
base-commit: f321329c1b70835e6b0807fddac6d4117e5604fc
change-id: 20260904-arch-kconfig-options-v2-8efa959ffcbd

Best regards,
-- 
Matt Turner <mattst88@gmail.com>

