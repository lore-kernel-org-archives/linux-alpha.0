Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366AD558214
	for <linux-alpha@vger.kernel.org>; Tue, 13 Oct 2026 21:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926167; cv=none; b=N26PDHRuCARv62Fl9BVnJHg2eIMmhKT7oMX2qBirZbW3Ldoxh/PUIUHXdrK1foHywPCbvHLfi9TXyWN6nbieK3jsUbx96xj+EgBOCbvbaf1wFO+En4eMSYBf5T1VOUj4TSiB276naZ5dDR7jxKilggbYoMSOI53OeUkYs5tqHH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926167; c=relaxed/simple;
	bh=4AN0iY5ozNGFZiexnrYN6yICHblyYBOHOqpHsEeC7GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P5cX5U8LQYLTbkssPecGQRENBPlCsiO+5izOpuvCrKmEhW5/cox+FaImFr7JKtuAx16yKL7cZ/8aRAlMss+2itoQsXVjDHmsB2vF3vU8/3Je6yU4/VP7+3uS73osJFmb42ixt+hjuCUUx1tLqj0PNJUYgLnF8hpVnNb2oz+B6eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJe20qCV; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJe20qCV"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c31745ad205so892848166b.0
        for <linux-alpha@vger.kernel.org>; Tue, 13 Oct 2026 14:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791926158; x=1792530958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2WmBZgorXHjNeqY2icnkka4pWJlaaYl5IWxZIXGwQY=;
        b=HJe20qCVo+twiDUelcjo2jyH1TuY2Szy/fN015zouwmlvm63a9kvQ6JmvFHgjOSSqN
         Cd5zWx5FEvNJyJikbrNJS1wlLX6JfAUTajZ3+BKFwHLVMN5WJGA0SU+5OowK2OiyfPLJ
         OKMhMjEI87OsmIcBRXDYV5Ubwcq532Sv+hMRuxelHtT7IzzsY3L8hWJA4l8fbdIKvZ7B
         bBT6S4iBI4PPxvwic+A0+t6eYu9UxIZj4yzfO6vhnEttLQE6HqI9S9fxM81QENjhAgah
         3OuXmjROYYt+On3LQ8Fizdm1rhEhkfQw9Q2nOx0PPoEJgzUU/bThOj+64X5cPwXxoFPQ
         btgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791926158; x=1792530958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2WmBZgorXHjNeqY2icnkka4pWJlaaYl5IWxZIXGwQY=;
        b=KEoDQlR11Dhw7tQoBvhZrdSkmZEMeVTG0qLoLMmpznAJJ8kmm47VeZKV+rnTZ6QfM8
         gLlaSbFWd8FB6OmEqhvquJ3OjtN4uUTLj3Yy/iU8EmNxfDd/SMNuW0mDXnZEM1mC2zXt
         W4Jm+Jakhi10ihYxh1NVQZ3pSX0NO7wvXTVXGJLOQO/AE/2TfMojhDhme2tKn4ka0rIx
         rAOF/AFvWzkXliDrmb4szsGHLEl69AeDUQP2hjByPWBtM8XZdX+u1ig6FHqV7M5553ne
         8YsPzK0MnlP05WFsxsuSZPQ6a3IcxbB+VzTP9MRhClZ5xCM5IbRVmvbUVai2vGSeDpBX
         FJ5A==
X-Forwarded-Encrypted: i=1; AKwUvByOt9mx+P+z8LTBF5urxx7nwjRXoJvwMEygqPu7npuH0ap1RE73N70HAeQFmk+KVFq8a9661tOaOBHV5Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKeHvFDsXJplrQTkNlekdenaQE+6mSLeIPkUTsk2DrGXHiYi5qQ
	YeQyhZ4HDuYjiS5q3k93gMqTbJoZG5c9lNNV/rliLwqn44V9aHoeHLRK
X-Gm-Gg: AYBFou3reLHdpd4EQNb6Jkh37L9utVuC7rpjBjsDN5iSltTRkr1sF6P+8j9ZFbkiOQW
	lLm9iyzv9oHj3OYi5dLP9mWppXX1gCaSguJ2X51C+pepHvAVDV0Vc+FKn7dtBjvnUz+46KUW5bb
	QQqo4aYJWowhzhnnM09EGb1G+N0HHeLgp99fIO59xNkTCT+ZHrprgmu3pTTcqJwLA2Guto6KmPg
	82BwBjMowN1/xkUx+zNiI6GbYxFz3wUb2xB8teIzWnea+/cWbbA47UrToHVc8Ta8NZZS/cHv/EQ
	Pkz7dG3We+Onv+DHyv+0dCjDY3yXr8UBCRHBzeYcrqR27622VR6HuRdwDt1mUdf9pBuZh8za9mp
	L8ztu2xNppCyiG9Gr9Sju5mmC723l93VgeCVuKzYeIgL/U732jxTQxRd4Z2k+BmQMlKahcdSAXg
	3t7A7JzKvrLeGdY1VKPm1b3hRe29cLeTUYam5lm5ZU1JoZW52/BzmAPo024IgxwR5AjgbF2mc+5
	Qkmgju5LSbdM2x664DFw1t3LR0DFdXRcjcgXpTZ
X-Received: by 2002:a17:906:6206:b0:c25:f7dc:2d9 with SMTP id a640c23a62f3a-c31a70cc77emr1309169866b.26.1791926157983;
        Tue, 13 Oct 2026 14:15:57 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c355555f483sm256776766b.23.2026.10.13.14.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 14:15:56 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v7 0/5] alpha: improve Tsunami machine check reporting
Date: Tue, 13 Oct 2026 23:15:33 +0200
Message-ID: <20261013211551.991723-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds Tsunami/Typhoon system-error diagnostics and Clipper
ES40 environmental reporting. It applies to v7.3-rc1 on Alpha for-next
at 33465f6ab697.

Thanks to Matt Turner for the v6 review. His Reviewed-by tags are carried
on patches 1 and 2 from v5 and patch 3 from v6. Patches 1-3 have no code
changes since v6.

Changes since v6:
- Drop v6 patch 6, "alpha: stop on fatal Tsunami system ECC and write
  parity errors", as agreed with Matt. The panic policy will be handled
  separately; v7 focuses on reporting and acknowledgment improvements
  without adding a new panic path.
- Remove the duplicate irq_regs.h include and the trailing blank line.
- Gate full register dumps for correctable system errors on verbose
  machine-check reporting; retain their error decode and always show
  registers for uncorrectable system errors.
- Document that PERRMASK gates new PERROR latching (HRM 10.2.5.7), and
  that the ECC field selection does not establish mixed-error ordering.
- Retain conservative SERR transaction suppression: HRM 8.8.2.6 leaves
  address/command undefined whenever SERR is set, with no stated exception
  for combined errors. This differs from the suggested SERR-only check.
- Remove the redundant environmental silent pass and always-true condition.
- Treat SMIR bit 0 as raw context, using fault mask 0x14. It stayed set
  after PSU reconnection on the ES40, so do not label it a current failure.
- Print the recorded CPU ID for processor console subpackets.
- Bound Clipper console-log traversal by the HWRPB byte count. Preserve
  the firmware pointer on unknown or truncated records and dump at most
  1 KiB of raw data. Acknowledge only after a complete termination packet;
  no class-5/type-4 layout is assumed.

Deferring panic policy preserves the existing continuation behavior; it
is not a claim that continuing is safe after an uncorrectable error.
Acknowledging a latch does not repair corrupted data. A follow-up needs
to consider CPU-detected ECC, Pchip UECC, RDPE/PERR, previously latched
errors, firmware masks and the impact of a device asserting PERR#.
In particular, HRM 8.8.2.3 says erroneous PIO read data is returned as
received; it does not establish an automatic CPU 670 for that case.

PERRMASK is left as firmware configured it. A zero mask bit prevents new
latching but does not establish that previously latched status is cleared.
SMIR polarity/latching, inverted halt/reset bits, other-board firmware
layouts and successful nonempty console-log decoding remain unverified.
Console-log scanning remains restricted to Clipper; ambiguous console
environmental records remain raw.

Testing:
- Native ASan/UBSan tests pass with CONFIG_VERBOSE_MCHECK enabled and
  disabled, including runtime verbosity selection, SERR with other bits,
  mixed ECC/PCI decoding, processor subpacket CPU IDs and the new SMIR mask.
- The observed v6 PSU state sequence was replayed synthetically: individual
  failure reports remain visible and the final state reports no recognized
  fault bits while preserving raw SMIR=1. This is not a v7 hardware test.
- V7 tip vmlinux builds pass with W=1 and GCC 15.0.1 for GENERIC,
  DP264, SHARK and EIGER using minimal configurations. No warnings in
  touched files; logs contain unrelated kernel-doc warnings and the
  saved_config COMMON-symbol modpost warning. These are not per-patch
  or ES40 deployment builds.

V6 was boot-tested on my ES40 with GENERIC_ENTRY enabled. Unplugging and
reconnecting PSU AC power produced code 206 notifications: PSU 1's
individual failure indication cleared and its enabled indication returned,
while SMIR bit 0 remained set in all three reports.

V7 was built and boot-tested on my AlphaServer ES40. Basic CPU, memory
and file I/O checks passed with no new kernel messages or kernel taint.

Matt built all six v6 patches for GENERIC, DP264, SHARK and EIGER with
W=1 and GCC 16.2.0 (24 builds), with no warnings in touched files, and
booted its GENERIC tip on QEMU Clipper to root mounting. These results
apply to v6; they do not establish machine-check or manual-layout coverage.

Magnus Lindholm (5):
  alpha: move Tsunami machine check handling to err_tsunami.c
  alpha: describe the Tsunami system machine check frame
  alpha: bound EV6 logout decoding by the processor area
  alpha: decode and acknowledge Tsunami system machine checks
  alpha: decode Clipper environmental events and retain console logs

 arch/alpha/include/asm/core_tsunami.h |   8 +-
 arch/alpha/include/asm/err_common.h   |   2 +
 arch/alpha/kernel/Makefile            |   4 +-
 arch/alpha/kernel/core_tsunami.c      |  34 --
 arch/alpha/kernel/err_common.c        |  13 +
 arch/alpha/kernel/err_ev6.c           |  38 +-
 arch/alpha/kernel/err_impl.h          |   1 +
 arch/alpha/kernel/err_tsunami.c       | 724 ++++++++++++++++++++++++++
 arch/alpha/kernel/proto.h             |   3 +
 arch/alpha/kernel/sys_dp264.c         |   5 +-
 10 files changed, 784 insertions(+), 48 deletions(-)
 create mode 100644 arch/alpha/kernel/err_tsunami.c


base-commit: 33465f6ab697abceafd9a340067a544d551c4412
-- 
2.43.0

