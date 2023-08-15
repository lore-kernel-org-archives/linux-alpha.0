From: kernel test robot <oliver.sang@intel.com>
Subject: [linus:master] [locking]  c8afaa1b0f:  stress-ng.zero.ops_per_sec
 6.3% improvement
Date: Tue, 15 Aug 2023 15:11:45 +0800
Message-ID: <202308151426.97be5bd8-oliver.sang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692083522; x=1723619522;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=Xbdy6lvyoNmlfa08WzjyLWRfh6IWtA21tIRCKsTiq58=;
  b=S43UBuRkp/xqGpmDUTqtzbWuRKze1scIoNueC9I40DYJ9/cu2ZRQVAQ+
   EPclGbxWh6lq1vziRm22kr5bqzAnpTUyyrMTdxeUu2dLhA123P8CZtTG+
   0aUviYyJXC7GWRJ9TKog/eJCT8MCHd0c6O2n1PImq1lXKSiZaYSCMkT7x
   OYL+6fTx/xlOJNGdrjZHGIgBV21CtE3wSPcdaruC9NnxN7VR7+Za6aS5Z
   z2ArXNjYLTxpW7+lS95ZP4g8N52CDozg0PDxxmpswoc0PwuakAJbQD1Uq
   qX4bfFkZTvGA973lLo7iNr3oGY+Gh3L9Byi1e9h3dmbu2ScpkkGWDqzWA
   g==;
Content-Disposition: inline
List-ID: <linux-alpha.vger.kernel.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com, oliver.sang@intel.com



Hello,

kernel test robot noticed a 6.3% improvement of stress-ng.zero.ops_per_sec =
on:


commit: c8afaa1b0f8bc93d013ab2ea6b9649958af3f1d3 ("locking: remove spin_loc=
k_prefetch")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz=
 (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	class: memory
	test: zero
	cpufreq_governor: performance






Details are as below:
---------------------------------------------------------------------------=
----------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230815/202308151426.97be5bd8-oliv=
er.sang@intel.com

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
class/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/t=
estcase/testtime:
  memory/gcc-12/performance/x86_64-rhel-8.3/100%/debian-11.1-x86_64-2022051=
0.cgz/lkp-icl-2sp8/zero/stress-ng/60s

commit:=20
  3feecb1b84 ("Merge tag 'char-misc-6.5-rc6' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/gregkh/char-misc")
  c8afaa1b0f ("locking: remove spin_lock_prefetch")

3feecb1b848359b1 c8afaa1b0f8bc93d013ab2ea6b9=20
---------------- ---------------------------=20
         %stddev     %change         %stddev
             \          |                \ =20
     20.98 =B1  8%     +12.7%      23.65 =B1  4%  perf-sched.sch_delay.max.=
ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     21.05 =B1  8%    +803.4%     190.14 =B1196%  perf-sched.total_sch_dela=
y.max.ms
     46437            +2.4%      47564        stress-ng.time.involuntary_co=
ntext_switches
  87942414            +6.3%   93441484        stress-ng.time.minor_page_fau=
lts
  21983137            +6.3%   23357886        stress-ng.zero.ops
    366380            +6.3%     389295        stress-ng.zero.ops_per_sec
    100683            +4.1%     104861 =B1  2%  proc-vmstat.nr_shmem
  60215587            +6.2%   63957836        proc-vmstat.numa_hit
  60148996            +6.2%   63889951        proc-vmstat.numa_local
  22046746            +6.2%   23421583        proc-vmstat.pgactivate
  83092777            +6.3%   88309102        proc-vmstat.pgalloc_normal
  88854159            +6.1%   94276960        proc-vmstat.pgfault
  82294936            +6.3%   87489838        proc-vmstat.pgfree
  21970411            +6.3%   23344438        proc-vmstat.unevictable_pgs_c=
ulled
  21970116            +6.3%   23344165        proc-vmstat.unevictable_pgs_m=
locked
  21970115            +6.3%   23344164        proc-vmstat.unevictable_pgs_m=
unlocked
  21970113            +6.3%   23344161        proc-vmstat.unevictable_pgs_r=
escued
 1.455e+10            +4.2%  1.517e+10        perf-stat.i.branch-instructio=
ns
  58358654            +5.0%   61304729        perf-stat.i.branch-misses
  1.12e+08            +5.2%  1.179e+08        perf-stat.i.cache-misses
 2.569e+08            +5.1%  2.698e+08        perf-stat.i.cache-references
      3.32            -4.4%       3.17        perf-stat.i.cpi
      2031 =B1  2%      -5.0%       1930 =B1  2%  perf-stat.i.cycles-betwee=
n-cache-misses
 1.603e+10            +4.4%  1.674e+10        perf-stat.i.dTLB-loads
 7.449e+09            +6.1%  7.901e+09        perf-stat.i.dTLB-stores
  6.52e+10            +4.4%  6.807e+10        perf-stat.i.instructions
      0.31            +5.7%       0.33 =B1  3%  perf-stat.i.ipc
    825.05            +4.8%     864.24        perf-stat.i.metric.K/sec
    598.07            +4.7%     626.06        perf-stat.i.metric.M/sec
  12910790            +4.3%   13471810        perf-stat.i.node-load-misses
   7901301 =B1  2%      +5.7%    8348185        perf-stat.i.node-loads
  21890957 =B1  3%      +6.9%   23410670 =B1  2%  perf-stat.i.node-stores
      3.38            -4.3%       3.23        perf-stat.overall.cpi
      1964            -5.1%       1864        perf-stat.overall.cycles-betw=
een-cache-misses
      0.30            +4.5%       0.31        perf-stat.overall.ipc
 1.431e+10            +4.3%  1.493e+10        perf-stat.ps.branch-instructi=
ons
  57370846            +5.0%   60264193        perf-stat.ps.branch-misses
 1.103e+08            +5.3%   1.16e+08        perf-stat.ps.cache-misses
 2.528e+08            +5.1%  2.657e+08        perf-stat.ps.cache-references
 1.577e+10            +4.5%  1.647e+10        perf-stat.ps.dTLB-loads
  7.33e+09            +6.1%  7.776e+09        perf-stat.ps.dTLB-stores
 6.415e+10            +4.4%  6.699e+10        perf-stat.ps.instructions
  12704753            +4.4%   13259951        perf-stat.ps.node-load-misses
   7778242 =B1  2%      +5.7%    8224062        perf-stat.ps.node-loads
  21539559 =B1  3%      +7.0%   23044455 =B1  2%  perf-stat.ps.node-stores
 4.005e+12            +5.0%  4.205e+12        perf-stat.total.instructions
     38.85            -0.8       38.07        perf-profile.calltrace.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.evict.__dentry_kill.den=
try_kill
     39.12            -0.8       38.34        perf-profile.calltrace.cycles=
-pp._raw_spin_lock.evict.__dentry_kill.dentry_kill.dput
     41.16            -0.7       40.44        perf-profile.calltrace.cycles=
-pp.evict.__dentry_kill.dentry_kill.dput.__fput
     42.07            -0.7       41.39        perf-profile.calltrace.cycles=
-pp.__dentry_kill.dentry_kill.dput.__fput.task_work_run
     42.09            -0.7       41.42        perf-profile.calltrace.cycles=
-pp.dentry_kill.dput.__fput.task_work_run.exit_to_user_mode_loop
     42.13            -0.7       41.46        perf-profile.calltrace.cycles=
-pp.dput.__fput.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prep=
are
     42.59            -0.6       41.94        perf-profile.calltrace.cycles=
-pp.__fput.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.s=
yscall_exit_to_user_mode
     42.69            -0.6       42.04        perf-profile.calltrace.cycles=
-pp.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_=
exit_to_user_mode.do_syscall_64
     42.77            -0.6       42.12        perf-profile.calltrace.cycles=
-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.=
__munmap
     42.75            -0.6       42.10        perf-profile.calltrace.cycles=
-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry=
_SYSCALL_64_after_hwframe.__munmap
     42.74            -0.6       42.10        perf-profile.calltrace.cycles=
-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_m=
ode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     47.04            -0.4       46.62        perf-profile.calltrace.cycles=
-pp.entry_SYSCALL_64_after_hwframe.__munmap
     46.97            -0.4       46.55        perf-profile.calltrace.cycles=
-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     47.20            -0.4       46.79        perf-profile.calltrace.cycles=
-pp.__munmap
     39.35            -0.3       39.09        perf-profile.calltrace.cycles=
-pp.inode_sb_list_add.new_inode.shmem_get_inode.__shmem_file_setup.shmem_ze=
ro_setup
     39.08            -0.2       38.84        perf-profile.calltrace.cycles=
-pp._raw_spin_lock.inode_sb_list_add.new_inode.shmem_get_inode.__shmem_file=
_setup
      0.60            +0.0        0.63        perf-profile.calltrace.cycles=
-pp.perf_iterate_sb.perf_event_mmap_event.perf_event_mmap.mmap_region.do_mm=
ap
      0.64 =B1  2%      +0.0        0.66        perf-profile.calltrace.cycl=
es-pp.shmem_fault.__do_fault.do_read_fault.do_fault.__handle_mm_fault
      0.62            +0.0        0.65        perf-profile.calltrace.cycles=
-pp.shmem_get_folio_gfp.shmem_fault.__do_fault.do_read_fault.do_fault
      0.64            +0.0        0.67        perf-profile.calltrace.cycles=
-pp.__do_fault.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault
      0.59 =B1  2%      +0.0        0.62        perf-profile.calltrace.cycl=
es-pp.shmem_alloc_inode.alloc_inode.new_inode.shmem_get_inode.__shmem_file_=
setup
      0.80            +0.0        0.84        perf-profile.calltrace.cycles=
-pp.get_unmapped_area.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
      0.72            +0.0        0.75        perf-profile.calltrace.cycles=
-pp.kmem_cache_alloc.vm_area_alloc.mmap_region.do_mmap.vm_mmap_pgoff
      0.59 =B1  2%      +0.0        0.62        perf-profile.calltrace.cycl=
es-pp.kmem_cache_alloc_lru.shmem_alloc_inode.alloc_inode.new_inode.shmem_ge=
t_inode
      0.88 =B1  2%      +0.0        0.92        perf-profile.calltrace.cycl=
es-pp.perf_event_mmap_event.perf_event_mmap.mmap_region.do_mmap.vm_mmap_pgo=
ff
      0.94 =B1  2%      +0.0        0.98        perf-profile.calltrace.cycl=
es-pp.perf_event_mmap.mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64
      0.82            +0.0        0.86        perf-profile.calltrace.cycles=
-pp.do_fault.__handle_mm_fault.handle_mm_fault.__get_user_pages.populate_vm=
a_page_range
      0.79 =B1  2%      +0.0        0.84        perf-profile.calltrace.cycl=
es-pp.vm_area_alloc.mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64
      1.22            +0.0        1.26        perf-profile.calltrace.cycles=
-pp.mas_store_prealloc.mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64
      0.81            +0.0        0.85        perf-profile.calltrace.cycles=
-pp.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault.__get_user_pag=
es
      0.97            +0.1        1.02        perf-profile.calltrace.cycles=
-pp.__handle_mm_fault.handle_mm_fault.__get_user_pages.populate_vma_page_ra=
nge.__mm_populate
      0.63            +0.1        0.68        perf-profile.calltrace.cycles=
-pp.__folio_batch_release.shmem_undo_range.shmem_evict_inode.evict.__dentry=
_kill
      1.07            +0.1        1.12        perf-profile.calltrace.cycles=
-pp.handle_mm_fault.__get_user_pages.populate_vma_page_range.__mm_populate.=
vm_mmap_pgoff
      0.61            +0.1        0.66        perf-profile.calltrace.cycles=
-pp.release_pages.__folio_batch_release.shmem_undo_range.shmem_evict_inode.=
evict
      0.83 =B1  2%      +0.1        0.88        perf-profile.calltrace.cycl=
es-pp.alloc_inode.new_inode.shmem_get_inode.__shmem_file_setup.shmem_zero_s=
etup
      0.58            +0.1        0.64 =B1  2%  perf-profile.calltrace.cycl=
es-pp.free_pages_and_swap_cache.tlb_batch_pages_flush.tlb_finish_mmu.unmap_=
region.do_vmi_align_munmap
      0.95 =B1  3%      +0.1        1.01        perf-profile.calltrace.cycl=
es-pp.alloc_file.alloc_file_pseudo.__shmem_file_setup.shmem_zero_setup.mmap=
_region
      0.61            +0.1        0.67        perf-profile.calltrace.cycles=
-pp.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.do_vmi_align_munmap.d=
o_vmi_munmap
      1.31            +0.1        1.38        perf-profile.calltrace.cycles=
-pp.stress_zero
      1.20            +0.1        1.27        perf-profile.calltrace.cycles=
-pp.shmem_undo_range.shmem_evict_inode.evict.__dentry_kill.dentry_kill
      1.63            +0.1        1.70        perf-profile.calltrace.cycles=
-pp.__get_user_pages.populate_vma_page_range.__mm_populate.vm_mmap_pgoff.do=
_syscall_64
      1.37            +0.1        1.44        perf-profile.calltrace.cycles=
-pp.shmem_evict_inode.evict.__dentry_kill.dentry_kill.dput
      0.95 =B1  2%      +0.1        1.02        perf-profile.calltrace.cycl=
es-pp.tlb_finish_mmu.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_mu=
nmap
      1.32 =B1  3%      +0.1        1.40        perf-profile.calltrace.cycl=
es-pp.alloc_file_pseudo.__shmem_file_setup.shmem_zero_setup.mmap_region.do_=
mmap
      1.82 =B1  2%      +0.1        1.93        perf-profile.calltrace.cycl=
es-pp.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_=
munmap
      2.18            +0.1        2.32        perf-profile.calltrace.cycles=
-pp.populate_vma_page_range.__mm_populate.vm_mmap_pgoff.do_syscall_64.entry=
_SYSCALL_64_after_hwframe
      2.35            +0.1        2.49        perf-profile.calltrace.cycles=
-pp.__mm_populate.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.__mmap
      0.34 =B1 70%      +0.2        0.52        perf-profile.calltrace.cycl=
es-pp.perf_event_mmap_output.perf_iterate_sb.perf_event_mmap_event.perf_eve=
nt_mmap.mmap_region
      3.82            +0.2        4.03        perf-profile.calltrace.cycles=
-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_sysca=
ll_64
      4.01 =B1  2%      +0.2        4.23        perf-profile.calltrace.cycl=
es-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
      4.16 =B1  2%      +0.2        4.39        perf-profile.calltrace.cycl=
es-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.__munmap
      4.17 =B1  2%      +0.2        4.40        perf-profile.calltrace.cycl=
es-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     50.50            +0.3       50.80        perf-profile.calltrace.cycles=
-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     50.40            +0.3       50.70        perf-profile.calltrace.cycles=
-pp.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     50.53            +0.3       50.84        perf-profile.calltrace.cycles=
-pp.entry_SYSCALL_64_after_hwframe.__mmap
     50.71            +0.3       51.02        perf-profile.calltrace.cycles=
-pp.__mmap
     78.82            -1.0       77.78        perf-profile.children.cycles-=
pp._raw_spin_lock
     78.20            -0.9       77.29        perf-profile.children.cycles-=
pp.native_queued_spin_lock_slowpath
     41.17            -0.7       40.44        perf-profile.children.cycles-=
pp.evict
     42.07            -0.7       41.39        perf-profile.children.cycles-=
pp.__dentry_kill
     42.10            -0.7       41.42        perf-profile.children.cycles-=
pp.dentry_kill
     42.13            -0.7       41.46        perf-profile.children.cycles-=
pp.dput
     42.70            -0.6       42.05        perf-profile.children.cycles-=
pp.task_work_run
     42.60            -0.6       41.95        perf-profile.children.cycles-=
pp.__fput
     42.84            -0.6       42.20        perf-profile.children.cycles-=
pp.syscall_exit_to_user_mode
     42.78            -0.6       42.14        perf-profile.children.cycles-=
pp.exit_to_user_mode_prepare
     42.74            -0.6       42.10        perf-profile.children.cycles-=
pp.exit_to_user_mode_loop
     47.25            -0.4       46.85        perf-profile.children.cycles-=
pp.__munmap
     39.36            -0.3       39.10        perf-profile.children.cycles-=
pp.inode_sb_list_add
     40.21            -0.2       40.01        perf-profile.children.cycles-=
pp.new_inode
     40.58            -0.2       40.38        perf-profile.children.cycles-=
pp.shmem_get_inode
     97.92            -0.1       97.83        perf-profile.children.cycles-=
pp.do_syscall_64
     98.05            -0.1       97.96        perf-profile.children.cycles-=
pp.entry_SYSCALL_64_after_hwframe
      0.15 =B1  2%      +0.0        0.16        perf-profile.children.cycle=
s-pp.mas_prev_slot
      0.19 =B1  2%      +0.0        0.20        perf-profile.children.cycle=
s-pp.ksys_read
      0.14 =B1  4%      +0.0        0.16 =B1  5%  perf-profile.children.cyc=
les-pp.inode_init_owner
      0.20 =B1  2%      +0.0        0.21        perf-profile.children.cycle=
s-pp.errseq_sample
      0.35            +0.0        0.37        perf-profile.children.cycles-=
pp.shmem_get_unmapped_area
      0.46            +0.0        0.48        perf-profile.children.cycles-=
pp.mas_empty_area_rev
      0.48            +0.0        0.50        perf-profile.children.cycles-=
pp.__destroy_inode
      0.22            +0.0        0.24 =B1  2%  perf-profile.children.cycle=
s-pp.memcg_list_lru_alloc
      0.49            +0.0        0.51        perf-profile.children.cycles-=
pp.destroy_inode
      0.49 =B1  2%      +0.0        0.52 =B1  2%  perf-profile.children.cyc=
les-pp.mas_wr_store_entry
      0.25 =B1  3%      +0.0        0.28 =B1  2%  perf-profile.children.cyc=
les-pp.__munlock_folio
      0.64            +0.0        0.66        perf-profile.children.cycles-=
pp.shmem_fault
      0.50 =B1  2%      +0.0        0.53        perf-profile.children.cycle=
s-pp.perf_event_mmap_output
      0.63            +0.0        0.66        perf-profile.children.cycles-=
pp.shmem_get_folio_gfp
      0.22 =B1  4%      +0.0        0.25 =B1  2%  perf-profile.children.cyc=
les-pp.inode_init_always
      0.24 =B1  3%      +0.0        0.27 =B1  2%  perf-profile.children.cyc=
les-pp._raw_spin_lock_irq
      0.61 =B1  2%      +0.0        0.64        perf-profile.children.cycle=
s-pp.perf_iterate_sb
      0.65            +0.0        0.68        perf-profile.children.cycles-=
pp.vm_unmapped_area
      0.29 =B1  2%      +0.0        0.32        perf-profile.children.cycle=
s-pp.clear_nlink
      0.64            +0.0        0.68        perf-profile.children.cycles-=
pp.__do_fault
      0.73            +0.0        0.76        perf-profile.children.cycles-=
pp.arch_get_unmapped_area_topdown
      0.20 =B1  4%      +0.0        0.24 =B1  3%  perf-profile.children.cyc=
les-pp.folio_lruvec_lock_irq
      0.36 =B1  2%      +0.0        0.40        perf-profile.children.cycle=
s-pp.slab_pre_alloc_hook
      0.20 =B1  8%      +0.0        0.24 =B1  9%  perf-profile.children.cyc=
les-pp.free_unref_page
      0.18 =B1  9%      +0.0        0.21 =B1  8%  perf-profile.children.cyc=
les-pp.free_pcppages_bulk
      0.80            +0.0        0.84        perf-profile.children.cycles-=
pp.get_unmapped_area
      1.23            +0.0        1.27        perf-profile.children.cycles-=
pp.mas_store_prealloc
      0.88 =B1  2%      +0.0        0.92        perf-profile.children.cycle=
s-pp.___slab_alloc
      1.14            +0.0        1.18        perf-profile.children.cycles-=
pp.mas_wr_node_store
      0.94 =B1  2%      +0.0        0.98        perf-profile.children.cycle=
s-pp.perf_event_mmap
      0.89 =B1  2%      +0.0        0.93        perf-profile.children.cycle=
s-pp.perf_event_mmap_event
      0.82            +0.0        0.86        perf-profile.children.cycles-=
pp.do_read_fault
      0.80 =B1  2%      +0.0        0.84        perf-profile.children.cycle=
s-pp.vm_area_alloc
      0.82            +0.0        0.86        perf-profile.children.cycles-=
pp.do_fault
      0.41 =B1  2%      +0.0        0.46 =B1  2%  perf-profile.children.cyc=
les-pp.mlock_drain_local
      1.16            +0.0        1.21        perf-profile.children.cycles-=
pp.mas_wr_modify
      0.44            +0.0        0.49 =B1  3%  perf-profile.children.cycle=
s-pp.lru_add_drain_cpu
      0.40 =B1  2%      +0.0        0.45        perf-profile.children.cycle=
s-pp.mlock_folio_batch
      0.63 =B1  2%      +0.0        0.68        perf-profile.children.cycle=
s-pp.__folio_batch_release
      0.82 =B1  2%      +0.0        0.86        perf-profile.children.cycle=
s-pp.kmem_cache_alloc_lru
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.fput
      0.98            +0.1        1.03        perf-profile.children.cycles-=
pp.__handle_mm_fault
      1.07            +0.1        1.13        perf-profile.children.cycles-=
pp.handle_mm_fault
      0.83 =B1  2%      +0.1        0.89        perf-profile.children.cycle=
s-pp.alloc_inode
      0.73 =B1  2%      +0.1        0.78        perf-profile.children.cycle=
s-pp.release_pages
      0.58            +0.1        0.64        perf-profile.children.cycles-=
pp.free_pages_and_swap_cache
      0.96 =B1  2%      +0.1        1.02        perf-profile.children.cycle=
s-pp.alloc_file
      0.61            +0.1        0.67        perf-profile.children.cycles-=
pp.tlb_batch_pages_flush
      1.34 =B1  2%      +0.1        1.40        perf-profile.children.cycle=
s-pp.kmem_cache_alloc
      1.33            +0.1        1.40        perf-profile.children.cycles-=
pp.stress_zero
      1.21            +0.1        1.28        perf-profile.children.cycles-=
pp.shmem_undo_range
      0.95 =B1  2%      +0.1        1.02        perf-profile.children.cycle=
s-pp.tlb_finish_mmu
      1.64            +0.1        1.71        perf-profile.children.cycles-=
pp.__get_user_pages
      1.38            +0.1        1.45        perf-profile.children.cycles-=
pp.shmem_evict_inode
      0.68            +0.1        0.76 =B1  3%  perf-profile.children.cycle=
s-pp.folio_batch_move_lru
      0.72            +0.1        0.80 =B1  2%  perf-profile.children.cycle=
s-pp.lru_add_drain
      1.32 =B1  2%      +0.1        1.40        perf-profile.children.cycle=
s-pp.alloc_file_pseudo
      0.49            +0.1        0.57 =B1  2%  perf-profile.children.cycle=
s-pp.folio_lruvec_lock_irqsave
      0.67            +0.1        0.78 =B1  2%  perf-profile.children.cycle=
s-pp._raw_spin_lock_irqsave
      1.83 =B1  2%      +0.1        1.94        perf-profile.children.cycle=
s-pp.unmap_region
      2.18            +0.1        2.32        perf-profile.children.cycles-=
pp.populate_vma_page_range
      2.35            +0.1        2.49        perf-profile.children.cycles-=
pp.__mm_populate
      3.87 =B1  2%      +0.2        4.08        perf-profile.children.cycle=
s-pp.do_vmi_align_munmap
      4.17 =B1  2%      +0.2        4.39        perf-profile.children.cycle=
s-pp.__vm_munmap
      4.19 =B1  2%      +0.2        4.42        perf-profile.children.cycle=
s-pp.do_vmi_munmap
      4.17 =B1  2%      +0.2        4.40        perf-profile.children.cycle=
s-pp.__x64_sys_munmap
     50.41            +0.3       50.71        perf-profile.children.cycles-=
pp.vm_mmap_pgoff
     50.75            +0.3       51.07        perf-profile.children.cycles-=
pp.__mmap
     75.97            -1.0       74.99        perf-profile.self.cycles-pp.n=
ative_queued_spin_lock_slowpath
      1.02 =B1  2%      -0.0        0.98        perf-profile.self.cycles-pp=
._raw_spin_lock
      0.08 =B1  5%      -0.0        0.07 =B1  6%  perf-profile.self.cycles-=
pp.get_random_u32
      0.19 =B1  2%      +0.0        0.21 =B1  3%  perf-profile.self.cycles-=
pp._raw_spin_lock_irqsave
      0.17 =B1  4%      +0.0        0.18 =B1  2%  perf-profile.self.cycles-=
pp.mas_wr_walk
      0.18 =B1  2%      +0.0        0.20        perf-profile.self.cycles-pp=
.memcg_list_lru_alloc
      0.19            +0.0        0.21 =B1  2%  perf-profile.self.cycles-pp=
.errseq_sample
      0.28 =B1  2%      +0.0        0.30        perf-profile.self.cycles-pp=
.memcg_slab_post_alloc_hook
      0.18 =B1  4%      +0.0        0.21 =B1  3%  perf-profile.self.cycles-=
pp.inode_init_always
      0.42            +0.0        0.44        perf-profile.self.cycles-pp._=
_destroy_inode
      0.50            +0.0        0.53 =B1  2%  perf-profile.self.cycles-pp=
.mas_wr_node_store
      0.29 =B1  2%      +0.0        0.32        perf-profile.self.cycles-pp=
.clear_nlink
      0.21 =B1  3%      +0.0        0.24 =B1  2%  perf-profile.self.cycles-=
pp.__fput
      1.31            +0.1        1.37        perf-profile.self.cycles-pp.s=
tress_zero




Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

