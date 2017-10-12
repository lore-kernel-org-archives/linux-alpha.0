From: Will Deacon <will.deacon@arm.com>
Subject: [PATCH 0/3] Remove lockless_dereference
Date: Thu, 12 Oct 2017 15:26:14 +0100
Message-ID: <1507818377-7546-1-git-send-email-will.deacon@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: linux-kernel@vger.kernel.org, mcree@orcon.net.nz, peterz@infradead.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, Will Deacon <will.deacon@arm.com>

Hi all,

These patches remove lockless_dereference from the kernel. It's only used
in a handful of places relative to READ_ONCE and ACCESS_ONCE and is only
required for correctness on Alpha. Consequently, READ_ONCE is strengthened
on Alpha systems to include the smp_read_barrier_depends implicitly and
Alpha's release and release atomic_t and atomic64_t operations are also
upgraded.

The nastiest part about all of this was actually fixing the circular
includes of compiler.h, which is an existing problem that doesn't crop
up in practice because lockless_dereference is rarely used.

Thanks,

Will

--->8

Will Deacon (3):
  linux/compiler.h: Split into compiler.h and compiler-types.h
  locking/barriers: Kill lockless_dereference
  alpha: atomics: Add smp_read_barrier_depends() to release/relaxed
    atomics

 Documentation/memory-barriers.txt                  |  12 -
 .../translations/ko_KR/memory-barriers.txt         |  12 -
 arch/alpha/include/asm/atomic.h                    |  13 +
 arch/arm/include/asm/ptrace.h                      |   3 +-
 arch/x86/events/core.c                             |   2 +-
 arch/x86/include/asm/mmu_context.h                 |   4 +-
 arch/x86/kernel/ldt.c                              |   2 +-
 drivers/md/dm-mpath.c                              |  20 +-
 fs/dcache.c                                        |   4 +-
 fs/overlayfs/ovl_entry.h                           |   2 +-
 fs/overlayfs/readdir.c                             |   2 +-
 include/linux/compiler-clang.h                     |   2 +-
 include/linux/compiler-gcc.h                       |   2 +-
 include/linux/compiler-intel.h                     |   2 +-
 include/linux/compiler-types.h                     | 274 ++++++++++++++++++++
 include/linux/compiler.h                           | 286 +--------------------
 include/linux/linkage.h                            |   2 +-
 include/linux/rculist.h                            |   4 +-
 include/linux/rcupdate.h                           |   4 +-
 include/uapi/linux/stddef.h                        |   2 +-
 kernel/events/core.c                               |   4 +-
 kernel/seccomp.c                                   |   2 +-
 kernel/task_work.c                                 |   2 +-
 mm/slab.h                                          |   2 +-
 scripts/headers_install.sh                         |   2 +-
 25 files changed, 325 insertions(+), 341 deletions(-)
 create mode 100644 include/linux/compiler-types.h

-- 
2.1.4

