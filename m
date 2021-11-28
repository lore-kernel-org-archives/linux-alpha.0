From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
Date: Sat, 27 Nov 2021 19:56:55 -0800
Message-ID: <20211128035704.270739-1-yury.norov__22808.2007075258$1638071955$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fJ8xfnVA+NPUIa5t4yWgB58hLT4DLWUqrE9DXdtQP+o=;
        b=a5JTXAi8QEj68vc4ha+mPXa/ak1/OEEuTBec3AMtr1hEzo8fmCz3oIwEmN3K8kvQYB
         67gv/rNWFdzwHiZFz09bpXG9HR51wjgigxUHIjdtAoVE4YB1vUAdNadlYIOtRZECxgba
         qt3C1oVJF96hYIQdDKlDO0FBz0TCdg6G1jktJ3RCIVLkJZMOcXupEqyjZfFMvq2MAme6
         UgcKwKoiTAaN0noh2ql7FQQ0Jxhmh2WckqBiI0uS0tM+dBCqWKfFUMxoZTvkiS3PR3wT
         /2lsgPXrHRO/TwsRXE/k4NEjrGiabGxA6/xpgMyYfvSqIbYUO/V0Hzjl329Ng6juxWHT
         KZPQ==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>

In many cases people use bitmap_weight()-based functions like this:

	if (num_present_cpus() > 1)
		do_something();

This may take considerable amount of time on many-cpus machines because
num_present_cpus() will traverse every word of underlying cpumask
unconditionally.

We can significantly improve on it for many real cases if stop traversing
the mask as soon as we count present cpus to any number greater than 1:

	if (num_present_cpus_gt(1))
		do_something();

To implement this idea, the series adds bitmap_weight_{eq,gt,le}
functions together with corresponding wrappers in cpumask and nodemask.

Yury Norov (9):
  lib/bitmap: add bitmap_weight_{eq,gt,le}
  lib/bitmap: implement bitmap_{empty,full} with bitmap_weight_eq()
  all: replace bitmap_weigth() with bitmap_{empty,full,eq,gt,le}
  tools: sync bitmap_weight() usage with the kernel
  lib/cpumask: add cpumask_weight_{eq,gt,le}
  lib/nodemask: add nodemask_weight_{eq,gt,le}
  lib/cpumask: add num_{possible,present,active}_cpus_{eq,gt,le}
  lib/nodemask: add num_node_state_eq()
  MAINTAINERS: add cpumask and nodemask files to BITMAP_API

 MAINTAINERS                                   |  4 ++
 arch/alpha/kernel/process.c                   |  2 +-
 arch/arc/kernel/smp.c                         |  2 +-
 arch/arm/kernel/machine_kexec.c               |  2 +-
 arch/arm/mach-exynos/exynos.c                 |  2 +-
 arch/arm/mm/cache-b15-rac.c                   |  2 +-
 arch/arm64/kernel/smp.c                       |  2 +-
 arch/arm64/mm/context.c                       |  2 +-
 arch/csky/mm/asid.c                           |  2 +-
 arch/csky/mm/context.c                        |  2 +-
 arch/ia64/kernel/setup.c                      |  2 +-
 arch/ia64/mm/tlb.c                            |  8 +--
 arch/mips/cavium-octeon/octeon-irq.c          |  4 +-
 arch/mips/kernel/crash.c                      |  2 +-
 arch/mips/kernel/i8253.c                      |  2 +-
 arch/mips/kernel/perf_event_mipsxx.c          |  4 +-
 arch/mips/kernel/rtlx-cmp.c                   |  2 +-
 arch/mips/kernel/smp.c                        |  4 +-
 arch/mips/kernel/vpe-cmp.c                    |  2 +-
 .../loongson2ef/common/cs5536/cs5536_mfgpt.c  |  2 +-
 arch/mips/mm/context.c                        |  2 +-
 arch/mips/mm/tlbex.c                          |  2 +-
 arch/nds32/kernel/perf_event_cpu.c            |  4 +-
 arch/nios2/kernel/cpuinfo.c                   |  2 +-
 arch/powerpc/kernel/smp.c                     |  2 +-
 arch/powerpc/kernel/watchdog.c                |  4 +-
 arch/powerpc/platforms/85xx/smp.c             |  2 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c  |  4 +-
 arch/powerpc/sysdev/mpic.c                    |  2 +-
 arch/powerpc/xmon/xmon.c                      | 10 +--
 arch/riscv/kvm/vmid.c                         |  2 +-
 arch/s390/kernel/perf_cpum_cf.c               |  2 +-
 arch/sparc/kernel/mdesc.c                     |  6 +-
 arch/x86/events/amd/core.c                    |  2 +-
 arch/x86/kernel/alternative.c                 |  8 +--
 arch/x86/kernel/apic/apic.c                   |  4 +-
 arch/x86/kernel/apic/apic_flat_64.c           |  2 +-
 arch/x86/kernel/apic/probe_32.c               |  2 +-
 arch/x86/kernel/cpu/mce/dev-mcelog.c          |  2 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 18 +++---
 arch/x86/kernel/hpet.c                        |  2 +-
 arch/x86/kernel/i8253.c                       |  2 +-
 arch/x86/kernel/kvm.c                         |  2 +-
 arch/x86/kernel/kvmclock.c                    |  2 +-
 arch/x86/kernel/smpboot.c                     |  4 +-
 arch/x86/kernel/tsc.c                         |  2 +-
 arch/x86/kvm/hyperv.c                         |  8 +--
 arch/x86/mm/amdtopology.c                     |  2 +-
 arch/x86/mm/mmio-mod.c                        |  2 +-
 arch/x86/mm/numa_emulation.c                  |  4 +-
 arch/x86/platform/uv/uv_nmi.c                 |  2 +-
 arch/x86/xen/smp_pv.c                         |  2 +-
 arch/x86/xen/spinlock.c                       |  2 +-
 drivers/acpi/numa/srat.c                      |  2 +-
 drivers/clk/samsung/clk-exynos4.c             |  2 +-
 drivers/clocksource/ingenic-timer.c           |  3 +-
 drivers/cpufreq/pcc-cpufreq.c                 |  2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c             |  2 +-
 drivers/cpufreq/scmi-cpufreq.c                |  2 +-
 drivers/crypto/ccp/ccp-dev-v5.c               |  5 +-
 drivers/dma/mv_xor.c                          |  5 +-
 drivers/firmware/psci/psci_checker.c          |  2 +-
 drivers/gpu/drm/i810/i810_drv.c               |  2 +-
 drivers/gpu/drm/i915/i915_pmu.c               |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c      |  2 +-
 drivers/hv/channel_mgmt.c                     |  4 +-
 drivers/iio/adc/mxs-lradc-adc.c               |  3 +-
 drivers/iio/dummy/iio_simple_dummy_buffer.c   |  4 +-
 drivers/iio/industrialio-buffer.c             |  2 +-
 drivers/iio/industrialio-trigger.c            |  2 +-
 drivers/infiniband/hw/hfi1/affinity.c         | 13 ++--
 drivers/infiniband/hw/qib/qib_file_ops.c      |  2 +-
 drivers/infiniband/hw/qib/qib_iba7322.c       |  2 +-
 drivers/infiniband/sw/siw/siw_main.c          |  3 +-
 drivers/irqchip/irq-bcm6345-l1.c              |  2 +-
 drivers/irqchip/irq-gic.c                     |  2 +-
 drivers/memstick/core/ms_block.c              |  4 +-
 drivers/net/caif/caif_virtio.c                |  2 +-
 drivers/net/dsa/b53/b53_common.c              |  2 +-
 drivers/net/ethernet/broadcom/bcmsysport.c    |  6 +-
 .../cavium/liquidio/cn23xx_vf_device.c        |  2 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c |  2 +-
 .../net/ethernet/intel/ice/ice_virtchnl_pf.c  |  4 +-
 .../net/ethernet/intel/ixgbe/ixgbe_sriov.c    |  2 +-
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   |  2 +-
 .../marvell/octeontx2/nic/otx2_ethtool.c      |  2 +-
 .../marvell/octeontx2/nic/otx2_flows.c        |  8 +--
 .../ethernet/marvell/octeontx2/nic/otx2_pf.c  |  2 +-
 drivers/net/ethernet/mellanox/mlx4/cmd.c      | 10 +--
 drivers/net/ethernet/mellanox/mlx4/eq.c       |  4 +-
 drivers/net/ethernet/mellanox/mlx4/main.c     |  2 +-
 .../ethernet/mellanox/mlx5/core/en_ethtool.c  |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_dev.c     |  3 +-
 drivers/net/ethernet/qlogic/qed/qed_rdma.c    |  4 +-
 drivers/net/ethernet/qlogic/qed/qed_roce.c    |  2 +-
 drivers/net/wireless/ath/ath9k/hw.c           |  2 +-
 drivers/net/wireless/marvell/mwifiex/main.c   |  4 +-
 drivers/net/wireless/st/cw1200/queue.c        |  3 +-
 drivers/nvdimm/region.c                       |  2 +-
 drivers/nvme/host/pci.c                       |  2 +-
 drivers/perf/arm-cci.c                        |  2 +-
 drivers/perf/arm_pmu.c                        |  6 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.c      |  2 +-
 drivers/perf/thunderx2_pmu.c                  |  3 +-
 drivers/perf/xgene_pmu.c                      |  2 +-
 .../intel/speed_select_if/isst_if_common.c    |  6 +-
 drivers/pwm/pwm-pca9685.c                     |  2 +-
 drivers/scsi/lpfc/lpfc_init.c                 |  2 +-
 drivers/soc/bcm/brcmstb/biuctrl.c             |  2 +-
 drivers/soc/fsl/dpio/dpio-service.c           |  4 +-
 drivers/soc/fsl/qbman/qman_test_stash.c       |  2 +-
 drivers/spi/spi-dw-bt1.c                      |  2 +-
 drivers/staging/media/tegra-video/vi.c        |  2 +-
 drivers/thermal/intel/intel_powerclamp.c      | 10 ++-
 drivers/virt/acrn/hsm.c                       |  2 +-
 fs/ocfs2/cluster/heartbeat.c                  | 14 ++---
 fs/xfs/xfs_sysfs.c                            |  2 +-
 include/linux/bitmap.h                        | 45 ++++++++++---
 include/linux/cpumask.h                       | 55 ++++++++++++++++
 include/linux/kdb.h                           |  2 +-
 include/linux/nodemask.h                      | 29 +++++++++
 kernel/debug/kdb/kdb_bt.c                     |  2 +-
 kernel/irq/affinity.c                         |  2 +-
 kernel/padata.c                               |  2 +-
 kernel/printk/printk.c                        |  2 +-
 kernel/rcu/tree_nocb.h                        |  4 +-
 kernel/rcu/tree_plugin.h                      |  2 +-
 kernel/reboot.c                               |  4 +-
 kernel/sched/core.c                           | 10 +--
 kernel/sched/topology.c                       |  4 +-
 kernel/time/clockevents.c                     |  4 +-
 kernel/time/clocksource.c                     |  2 +-
 lib/bitmap.c                                  | 63 +++++++++++++++++++
 mm/mempolicy.c                                |  2 +-
 mm/page_alloc.c                               |  2 +-
 mm/percpu.c                                   |  6 +-
 mm/slab.c                                     |  2 +-
 mm/vmstat.c                                   |  4 +-
 tools/include/linux/bitmap.h                  | 42 ++++++++++---
 tools/lib/bitmap.c                            | 60 ++++++++++++++++++
 tools/perf/builtin-c2c.c                      |  4 +-
 tools/perf/util/pmu.c                         |  2 +-
 142 files changed, 490 insertions(+), 251 deletions(-)

-- 
2.25.1

