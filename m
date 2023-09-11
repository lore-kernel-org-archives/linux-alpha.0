From: Sohil Mehta <sohil.mehta@intel.com>
Subject: [PATCH 0/2] arch: Sync all syscall tables with 2 newly added system calls
Date: Mon, 11 Sep 2023 18:02:08 +0000
Message-ID: <20230911180210.1060504-1-sohil.mehta@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694455408; x=1725991408;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kxCm8IPxO4Adx3HaWS72d7S3asKhB+RqeSR07UfgL5Q=;
  b=TgH4ZcvVeLgcJBMx88q+zt+rnhR/XRfuO/nxy/Ozi0X2cpYXH4HE64yE
   j4PeTqTgQ1pE7xsMbvKBDjvUV3dHOaKnXYaQzFOxFkmFjMxlfXscIU4uV
   t5M/C2DEPcLN6vUKsoLbTn6FVeytlnO9OZI40vOQiVzZxYKyjaYjTxK+P
   jqWA5m5kF9XHSqvBJzfHvJUi4BzKSRf7MkHRuEGlFh/Rl86gIRZubwHqz
   0ej0Fpyy9u/zLIvZEZr3LmRfZnfkJcx/O0nvzAihVAg5kky/2xMsbjQvX
   OOj6q3VwwaBI2omjAlgvm0Vfs8s0PHkMGhLQpeP0Sdh4RXpaOPcA8ZTEy
   g==;
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Sohil Mehta <sohil.mehta@intel.com>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian

6.6-rc1 has added support for 2 new system calls:
[1] fchmodat2()
[2] x86-specific map_shadow_stack()

This series mainly synchronizes the syscall tables arcoss the core kernel and
tools to reflect the recent updates.

For fchmodat2(), it fixes the missing entries in the tools directory.

For map_shadow_stack(), it reserves the syscall across the board. Since
map_shadow_stack() is x86 specific for now, it is marked as a conditional
syscall in sys_ni.c. Adding it to the syscall tables of other architectures is
harmless and would return ENOSYS when exercised.

Reserving arch-specific syscall numbers in the tables of all architectures is
good practice and would help avoid future conflicts.

[1]: https://lore.kernel.org/lkml/20230824-frohlocken-vorabend-725f6fdaad50@brauner/
[2]: https://lore.kernel.org/lkml/20230830234752.19858-1-dave.hansen@linux.intel.com/

Sohil Mehta (2):
  tools headers UAPI: Sync fchmodat2() syscall table entries
  arch: Reserve map_shadow_stack() syscall number for all architectures

 arch/alpha/kernel/syscalls/syscall.tbl              | 1 +
 arch/arm/tools/syscall.tbl                          | 1 +
 arch/arm64/include/asm/unistd.h                     | 2 +-
 arch/arm64/include/asm/unistd32.h                   | 2 ++
 arch/ia64/kernel/syscalls/syscall.tbl               | 1 +
 arch/m68k/kernel/syscalls/syscall.tbl               | 1 +
 arch/microblaze/kernel/syscalls/syscall.tbl         | 1 +
 arch/mips/kernel/syscalls/syscall_n32.tbl           | 1 +
 arch/mips/kernel/syscalls/syscall_n64.tbl           | 1 +
 arch/mips/kernel/syscalls/syscall_o32.tbl           | 1 +
 arch/parisc/kernel/syscalls/syscall.tbl             | 1 +
 arch/powerpc/kernel/syscalls/syscall.tbl            | 1 +
 arch/s390/kernel/syscalls/syscall.tbl               | 1 +
 arch/sh/kernel/syscalls/syscall.tbl                 | 1 +
 arch/sparc/kernel/syscalls/syscall.tbl              | 1 +
 arch/x86/entry/syscalls/syscall_32.tbl              | 1 +
 arch/xtensa/kernel/syscalls/syscall.tbl             | 1 +
 include/uapi/asm-generic/unistd.h                   | 5 ++++-
 tools/include/uapi/asm-generic/unistd.h             | 8 +++++++-
 tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl | 2 ++
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl  | 2 ++
 tools/perf/arch/s390/entry/syscalls/syscall.tbl     | 2 ++
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl   | 2 ++
 23 files changed, 37 insertions(+), 3 deletions(-)


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.34.1

