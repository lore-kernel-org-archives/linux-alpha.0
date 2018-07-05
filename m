From: Deepa Dinamani <deepa.kernel@gmail.com>
Subject: [PATCH v2 0/7] Introduce struct __kernel_timex
Date: Thu,  5 Jul 2018 14:35:57 -0700
Message-ID: <20180705213604.18883-1-deepa.kernel@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=1kAkNM1JCVYSJaZnsKjgVRyIrW1VHH37L1SeTPHE5IU=;
        b=qOvUncLqYVzS2A+KLOSjOx+ftqbhgmgmi3MUkAAqib7WxmCqTN4S6gKM7nzg222J14
         LPGeCEecIziYvphucQroWcQU8Y4Kf9OCBUT8tP86b142gU881EwC1QbRDRZRFbH6fu/q
         Ud05+MBIxH2zOLAfLJkINAtgnG+QHAq6hZl9nZ9CsmZj1/Gnmgc276YK8s9UQxzbR8QB
         c1Z6aH40yGiStHNFv8W6+mnh2QYZQmBasHwYJRAMVE7ppMN4cGfZTR95gM6PKYzA0EnF
         bb9mN1mM1SgRvhErPtqxYmMWJdaECYZyWlTwF7sfgCDH3jASqwgtqkGMxRlGcmzNXi8l
         CU7g==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tglx@linutronix.de, linux-kernel@vger.kernel.org
Cc: arnd@arndb.de, y2038@lists.linaro.org, catalin.marinas@arm.com, davem@davemloft.net, linux-alpha@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org, netdev@vger.kernel.org, palmer@sifive.com

The series introduces struct __kernel_timex as a substitute for
the non y2038 safe struct timex.

The series is based on the original series posted by Arnd Bergmann
in [1].

The overview of the series is as below:
1. Prepare for the compat timex interfaces to be used unconditionally.
2. Introduce struct __kernel_timex.
3. Use struct __kernel_timex in place of struct timex.
4. Switch syscalls to use struct __kernel_timex.

[1] https://sourceware.org/ml/libc-alpha/2015-05/msg00070.html

Changes since v1:
* Fix riscv asm/compat.h to pick up generic compat types

Deepa Dinamani (7):
  arm64: Make basic compat_* types always available
  sparc: Make thread_info.h available directly
  riscv: Include asm-generic/compat.h
  timex: prepare compat helpers for y2038 changes
  time: Add struct __kernel_timex
  timex: use __kernel_timex internally
  timex: change syscalls to use struct __kernel_timex

 arch/alpha/kernel/osf_sys.c     |  2 +-
 arch/arm64/include/asm/compat.h | 22 ++++-----
 arch/riscv/include/asm/compat.h |  3 ++
 arch/sparc/include/asm/compat.h |  2 +
 drivers/ptp/ptp_clock.c         |  2 +-
 include/asm-generic/compat.h    |  8 +++-
 include/linux/compat.h          | 33 --------------
 include/linux/compat_time.h     | 34 ++++++++++++++
 include/linux/posix-clock.h     |  2 +-
 include/linux/syscalls.h        |  5 +--
 include/linux/timex.h           |  9 +++-
 include/uapi/linux/timex.h      | 41 +++++++++++++++++
 kernel/compat.c                 | 63 --------------------------
 kernel/time/ntp.c               | 12 ++---
 kernel/time/ntp_internal.h      |  2 +-
 kernel/time/posix-clock.c       |  2 +-
 kernel/time/posix-timers.c      | 14 ++----
 kernel/time/posix-timers.h      |  2 +-
 kernel/time/time.c              | 80 ++++++++++++++++++++++++++++++---
 kernel/time/timekeeping.c       |  4 +-
 20 files changed, 201 insertions(+), 141 deletions(-)


base-commit: e30b8745c892204095c0a8b69405868f63ddcce1
-- 
2.17.1

Cc: catalin.marinas@arm.com
Cc: davem@davemloft.net
Cc: linux-alpha@vger.kernel.org
Cc: linux-api@vger.kernel.org
Cc: linux-arch@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: netdev@vger.kernel.org
Cc: palmer@sifive.com
