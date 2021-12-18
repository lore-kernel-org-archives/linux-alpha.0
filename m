From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH v2 00/17] lib/bitmap: optimize bitmap_weight() usage
Date: Sat, 18 Dec 2021 13:19:56 -0800
Message-ID: <20211218212014.1315894-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JzsjdMdsnVfTtF2jA28Re9um5Pc1jpset8TjSm+sCCQ=;
        b=JJsYWCM4ZBrFr/QGYcVtz1O5XpwXMR8kjk5zvlx1xd9d3Bnfs+RyARM+UF2BFzbQzh
         Gtz0Jhiop3r+qa0tUyPUPAMdU6Jzy350IR0tNVuhpUl5a46wJZSSCfrlTroVV0iEzWQm
         jnatXUCyMxUjx4zPd6MbwV+jlb+bcIyfWFewnkHP1g6bfMLkxOoJnBeNiY1ltSGyKLUW
         NJO78tJlSMx+Op9iY217snQDmDuDZZGnfHCB/c9C+zObP29p/bUuiIWC4jVIoflp+GZQ
         +vsH2Ey++3hW+p7C5pzF3cKCahFFKGna42dCmd+BpNpZItDrp0SdGfIa8OEsJ5ce8y7A
         EIWw==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>

In many cases people use bitmap_weight()-based functions to compare
the result against a number of expression:

	if (cpumask_weight(...) > 1)
		do_something();

This may take considerable amount of time on many-cpus machines because
cpumask_weight(...) will traverse every word of underlying cpumask
unconditionally.

We can significantly improve on it for many real cases if stop traversing
the mask as soon as we count cpus to any number greater than 1:

	if (cpumask_weight_gt(..., 1))
		do_something();

To implement this idea, the series adds bitmap_weight_cmp() function
and bitmap_weight_{eq,gt,ge,lt,le} macros on top of it; corresponding
wrappers in cpumask and nodemask.

There are 3 cpumasks, for which weight is counted frequently: possible,
present and active. They all are read-mostly, and to optimize counting
number of set bits for them, this series adds atomic counters, similarly
to online cpumask.

v1: https://lkml.org/lkml/2021/11/27/339
v2:
  - add bitmap_weight_cmp();
  - fix bitmap_weight_le semantics and provide full set of {eq,gt,ge,lt,le}
    as wrappers around bitmap_weight_cmp();
  - don't touch small bitmaps (less than 32 bits) - optimization works
    only for large bitmaps;
  - move bitmap_weight() == 0 -> bitmap_empty() conversion to a separate
    patch, ditto cpumask_weight() and nodes_weight;
  - add counters for possible, present and active cpus;
  - drop bitmap_empty() where possible;
  - various fixes around bit counting that spotted my eyes.

Yury Norov (17):
  all: don't use bitmap_weight() where possible
  drivers: rename num_*_cpus variables
  fix open-coded for_each_set_bit()
  all: replace bitmap_weight with bitmap_empty where appropriate
  all: replace cpumask_weight with cpumask_empty where appropriate
  all: replace nodes_weight with nodes_empty where appropriate
  lib/bitmap: add bitmap_weight_{cmp,eq,gt,ge,lt,le} functions
  all: replace bitmap_weight with bitmap_weight_{eq,gt,ge,lt,le} where
    appropriate
  lib/cpumask: add cpumask_weight_{eq,gt,ge,lt,le}
  lib/nodemask: add nodemask_weight_{eq,gt,ge,lt,le}
  lib/nodemask: add num_node_state_eq()
  kernel/cpu.c: fix init_cpu_online
  kernel/cpu: add num_possible_cpus counter
  kernel/cpu: add num_present_cpu counter
  kernel/cpu: add num_active_cpu counter
  tools/bitmap: sync bitmap_weight
  MAINTAINERS: add cpumask and nodemask files to BITMAP_API

 MAINTAINERS                                   |   4 +
 arch/alpha/kernel/process.c                   |   2 +-
 arch/ia64/kernel/setup.c                      |   2 +-
 arch/ia64/mm/tlb.c                            |   2 +-
 arch/mips/cavium-octeon/octeon-irq.c          |   4 +-
 arch/mips/kernel/crash.c                      |   2 +-
 arch/nds32/kernel/perf_event_cpu.c            |   2 +-
 arch/powerpc/kernel/smp.c                     |   2 +-
 arch/powerpc/kernel/watchdog.c                |   2 +-
 arch/powerpc/xmon/xmon.c                      |   4 +-
 arch/s390/kernel/perf_cpum_cf.c               |   2 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        |  16 +--
 arch/x86/kernel/smpboot.c                     |   4 +-
 arch/x86/kvm/hyperv.c                         |   8 +-
 arch/x86/mm/amdtopology.c                     |   2 +-
 arch/x86/mm/mmio-mod.c                        |   2 +-
 arch/x86/mm/numa_emulation.c                  |   4 +-
 arch/x86/platform/uv/uv_nmi.c                 |   2 +-
 drivers/acpi/numa/srat.c                      |   2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c             |   2 +-
 drivers/cpufreq/scmi-cpufreq.c                |   2 +-
 drivers/firmware/psci/psci_checker.c          |   2 +-
 drivers/gpu/drm/i915/i915_pmu.c               |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c      |   2 +-
 drivers/hv/channel_mgmt.c                     |   4 +-
 drivers/iio/dummy/iio_simple_dummy_buffer.c   |   4 +-
 drivers/iio/industrialio-trigger.c            |   2 +-
 drivers/infiniband/hw/hfi1/affinity.c         |  13 +-
 drivers/infiniband/hw/qib/qib_file_ops.c      |   2 +-
 drivers/infiniband/hw/qib/qib_iba7322.c       |   2 +-
 drivers/irqchip/irq-bcm6345-l1.c              |   2 +-
 drivers/leds/trigger/ledtrig-cpu.c            |   6 +-
 drivers/memstick/core/ms_block.c              |   4 +-
 drivers/net/dsa/b53/b53_common.c              |   6 +-
 drivers/net/ethernet/broadcom/bcmsysport.c    |   6 +-
 .../net/ethernet/intel/ice/ice_virtchnl_pf.c  |   4 +-
 .../net/ethernet/intel/ixgbe/ixgbe_sriov.c    |   2 +-
 .../marvell/octeontx2/nic/otx2_ethtool.c      |   2 +-
 .../marvell/octeontx2/nic/otx2_flows.c        |   8 +-
 .../ethernet/marvell/octeontx2/nic/otx2_pf.c  |   2 +-
 drivers/net/ethernet/mellanox/mlx4/cmd.c      |  33 ++---
 drivers/net/ethernet/mellanox/mlx4/eq.c       |   4 +-
 drivers/net/ethernet/mellanox/mlx4/fw.c       |   4 +-
 drivers/net/ethernet/mellanox/mlx4/main.c     |   2 +-
 drivers/net/ethernet/qlogic/qed/qed_rdma.c    |   4 +-
 drivers/net/ethernet/qlogic/qed/qed_roce.c    |   2 +-
 drivers/perf/arm-cci.c                        |   2 +-
 drivers/perf/arm_pmu.c                        |   4 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.c      |   2 +-
 drivers/perf/thunderx2_pmu.c                  |   4 +-
 drivers/perf/xgene_pmu.c                      |   2 +-
 drivers/scsi/lpfc/lpfc_init.c                 |   2 +-
 drivers/scsi/storvsc_drv.c                    |   6 +-
 drivers/soc/fsl/qbman/qman_test_stash.c       |   2 +-
 drivers/staging/media/tegra-video/vi.c        |   2 +-
 drivers/thermal/intel/intel_powerclamp.c      |   9 +-
 include/linux/bitmap.h                        |  80 +++++++++++
 include/linux/cpumask.h                       | 131 +++++++++++++-----
 include/linux/nodemask.h                      |  40 ++++++
 kernel/cpu.c                                  |  54 ++++++++
 kernel/irq/affinity.c                         |   2 +-
 kernel/padata.c                               |   2 +-
 kernel/rcu/tree_nocb.h                        |   4 +-
 kernel/rcu/tree_plugin.h                      |   2 +-
 kernel/sched/core.c                           |  10 +-
 kernel/sched/topology.c                       |   4 +-
 kernel/time/clockevents.c                     |   2 +-
 kernel/time/clocksource.c                     |   2 +-
 lib/bitmap.c                                  |  21 +++
 mm/mempolicy.c                                |   2 +-
 mm/page_alloc.c                               |   2 +-
 mm/vmstat.c                                   |   4 +-
 tools/include/linux/bitmap.h                  |  44 ++++++
 tools/lib/bitmap.c                            |  20 +++
 tools/perf/builtin-c2c.c                      |   4 +-
 tools/perf/util/pmu.c                         |   2 +-
 76 files changed, 480 insertions(+), 183 deletions(-)

-- 
2.30.2

