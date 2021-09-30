From: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH v4 00/11] sections: Unify kernel sections range check and use
Date: Thu, 30 Sep 2021 15:11:32 +0800
Message-ID: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-arch-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: arnd@arndb.de, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, mingo@redhat.com, davem@davemloft.net, ast@kernel.org, ryabinin.a.a@gmail.com, akpm@linux-foundation.org
Cc: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, bpf@vger.kernel.org, linux-alpha@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Kefeng Wang <wangkefeng.wang@huawei.com>

There are three head files(kallsyms.h, kernel.h and sections.h) which
include the kernel sections range check, let's make some cleanup and
unify them.

1. cleanup arch specific text/data check and fix address boundary check
   in kallsyms.h
2. make all the basic/core kernel range check function into sections.h
3. update all the callers, and use the helper in sections.h to simplify
   the code

After this series, we have 5 APIs about kernel sections range check in
sections.h

 * is_kernel_rodata()		--- already in sections.h
 * is_kernel_core_data()	--- come from core_kernel_data() in kernel.h
 * is_kernel_inittext()		--- come from kernel.h and kallsyms.h
 * __is_kernel_text()		--- add new internal helper
 * __is_kernel()		--- add new internal helper

Note: For the last two helpers, people should not use directly, consider to
      use corresponding function in kallsyms.h.

v4:
- Use core_kernel_text() in powerpc sugguested Christophe Leroy, build
  test only
- Use is_kernel_text() in alpha and microblaze, build test only on
  next-20210929

v3:
https://lore.kernel.org/linux-arch/20210926072048.190336-1-wangkefeng.wang@huawei.com/
- Add Steven's RB to patch2
- Introduce two internal helper, then use is_kernel_text() in core_kernel_text()
  and is_kernel() in kernel_or_module_addr() suggested by Steven

v2:
https://lore.kernel.org/linux-arch/20210728081320.20394-1-wangkefeng.wang@huawei.com/
- add ACK/RW to patch2, and drop inappropriate fix tag
- keep 'core' to check kernel data, suggestted by Steven Rostedt
  <rostedt@goodmis.org>, rename is_kernel_data() to is_kernel_core_data()
- drop patch8 which is merged
- drop patch9 which is resend independently

v1:
https://lore.kernel.org/linux-arch/20210626073439.150586-1-wangkefeng.wang@huawei.com


Kefeng Wang (11):
  kallsyms: Remove arch specific text and data check
  kallsyms: Fix address-checks for kernel related range
  sections: Move and rename core_kernel_data() to is_kernel_core_data()
  sections: Move is_kernel_inittext() into sections.h
  x86: mm: Rename __is_kernel_text() to is_x86_32_kernel_text()
  sections: Provide internal __is_kernel() and __is_kernel_text() helper
  mm: kasan: Use is_kernel() helper
  extable: Use is_kernel_text() helper
  powerpc/mm: Use core_kernel_text() helper
  microblaze: Use is_kernel_text() helper
  alpha: Use is_kernel_text() helper

 arch/alpha/kernel/traps.c      |  4 +-
 arch/microblaze/mm/pgtable.c   |  3 +-
 arch/powerpc/mm/pgtable_32.c   |  7 +---
 arch/x86/kernel/unwind_orc.c   |  2 +-
 arch/x86/mm/init_32.c          | 14 +++----
 include/asm-generic/sections.h | 75 ++++++++++++++++++++++++++--------
 include/linux/kallsyms.h       | 13 +-----
 include/linux/kernel.h         |  2 -
 kernel/extable.c               | 33 ++-------------
 kernel/locking/lockdep.c       |  3 --
 kernel/trace/ftrace.c          |  2 +-
 mm/kasan/report.c              |  2 +-
 net/sysctl_net.c               |  2 +-
 13 files changed, 78 insertions(+), 84 deletions(-)

-- 
2.26.2

