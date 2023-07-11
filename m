From: Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v4 0/5] Add a new fchmodat2() syscall
Date: Tue, 11 Jul 2023 18:16:02 +0200
Message-ID: <cover.1689092120.git.legion@kernel.org>
References: <cover.1689074739.git.legion@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <cover.1689074739.git.legion@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk
Cc: James.Bottomley@HansenPartnership.com, acme@kernel.org, alexander.shishkin@linux.intel.com, axboe@kernel.dk, benh@kernel.crashing.org, borntraeger@de.ibm.com, bp@alien8.de, catalin.marinas@arm.com, christian@brauner.io, dalias@libc.org, davem@davemloft.net, deepa.kernel@gmail.com, deller@gmx.de, dhowells@redhat.com, fenghua.yu@intel.com, fweimer@redhat.com, geert@linux-m68k.org, glebfm@altlinux.org, gor@linux.ibm.com, hare@suse.com, hpa@zytor.com, ink@jurassic.park.msu.ru, jhogan@kernel.org, kim.phillips@arm.com, ldv@altlinux.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux@armlinux.org.uk, li

In glibc, the fchmodat(3) function has a flags argument according to the
POSIX specification [1], but kernel syscalls has no such argument.
Therefore, libc implementations do workarounds using /proc. However,
this requires procfs to be mounted and accessible.

This patch set adds fchmodat2(), a new syscall. The syscall allows to
pass the AT_SYMLINK_NOFOLLOW flag to disable LOOKUP_FOLLOW. In all other
respects, this syscall is no different from fchmodat().

[1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/chmod.html

Changes since v3 [cover.1689074739.git.legion@kernel.org]:

* Rebased to master because a new syscall has appeared in master.
* Increased __NR_compat_syscalls as pointed out by Arnd Bergmann.
* Syscall renamed fchmodat4 -> fchmodat2 as suggested by Christian Brauner.
* Returned do_fchmodat4() the original name. We don't need to version
  internal functions.
* Fixed warnings found by checkpatch.pl.

Changes since v2 [20190717012719.5524-1-palmer@sifive.com]:

* Rebased to master.
* The lookup_flags passed to sys_fchmodat4 as suggested by Al Viro.
* Selftest added.

Changes since v1 [20190531191204.4044-1-palmer@sifive.com]:

* All architectures are now supported, which support squashed into a
  single patch.
* The do_fchmodat() helper function has been removed, in favor of directly
  calling do_fchmodat4().
* The patches are based on 5.2 instead of 5.1.

---

Alexey Gladkov (2):
  fs: Add fchmodat2()
  selftests: Add fchmodat2 selftest

Palmer Dabbelt (3):
  Non-functional cleanup of a "__user * filename"
  arch: Register fchmodat2, usually as syscall 452
  tools headers UAPI: Sync files changed by new fchmodat2 syscall

 arch/alpha/kernel/syscalls/syscall.tbl        |   1 +
 arch/arm/tools/syscall.tbl                    |   1 +
 arch/arm64/include/asm/unistd.h               |   2 +-
 arch/arm64/include/asm/unistd32.h             |   2 +
 arch/ia64/kernel/syscalls/syscall.tbl         |   1 +
 arch/m68k/kernel/syscalls/syscall.tbl         |   1 +
 arch/microblaze/kernel/syscalls/syscall.tbl   |   1 +
 arch/mips/kernel/syscalls/syscall_n32.tbl     |   1 +
 arch/mips/kernel/syscalls/syscall_n64.tbl     |   1 +
 arch/mips/kernel/syscalls/syscall_o32.tbl     |   1 +
 arch/parisc/kernel/syscalls/syscall.tbl       |   1 +
 arch/powerpc/kernel/syscalls/syscall.tbl      |   1 +
 arch/s390/kernel/syscalls/syscall.tbl         |   1 +
 arch/sh/kernel/syscalls/syscall.tbl           |   1 +
 arch/sparc/kernel/syscalls/syscall.tbl        |   1 +
 arch/x86/entry/syscalls/syscall_32.tbl        |   1 +
 arch/x86/entry/syscalls/syscall_64.tbl        |   1 +
 arch/xtensa/kernel/syscalls/syscall.tbl       |   1 +
 fs/open.c                                     |  18 +-
 include/linux/syscalls.h                      |   4 +-
 include/uapi/asm-generic/unistd.h             |   5 +-
 tools/include/uapi/asm-generic/unistd.h       |   5 +-
 .../arch/mips/entry/syscalls/syscall_n64.tbl  |   2 +
 .../arch/powerpc/entry/syscalls/syscall.tbl   |   2 +
 .../perf/arch/s390/entry/syscalls/syscall.tbl |   2 +
 .../arch/x86/entry/syscalls/syscall_64.tbl    |   2 +
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/fchmodat2/.gitignore  |   2 +
 tools/testing/selftests/fchmodat2/Makefile    |   6 +
 .../selftests/fchmodat2/fchmodat2_test.c      | 162 ++++++++++++++++++
 30 files changed, 223 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/fchmodat2/.gitignore
 create mode 100644 tools/testing/selftests/fchmodat2/Makefile
 create mode 100644 tools/testing/selftests/fchmodat2/fchmodat2_test.c

-- 
2.33.8

