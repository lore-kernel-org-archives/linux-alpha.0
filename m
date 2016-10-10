From: Meelis Roos <mroos@linux.ee>
Subject: alpha: WARNING: CPU: 0 PID: 17 at kernel/softirq.c:150
 __local_bh_enable_ip+0xbc/0x100
Date: Mon, 10 Oct 2016 11:21:38 +0300 (EEST)
Message-ID: <alpine.LRH.2.20.1610101117090.13749@math.ut.ee>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel list <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

Revived my alphapc 164 and found that 4.6.0-rc6-00123-g21a9703 was 
showing a warning on bootup. Tried 4.8.0, same warning.

Seems to be about SRM interrupt coming in at a bad time?

Full dmesg from 4.8.0:

[    0.000000] Linux version 4.8.0 (mroos@pc164) (gcc version 4.9.3 (Gentoo 4.9.3 p1.5, pie-0.6.4) ) #6 Fri Oct 7 19:39:10 EEST 2016
[    0.000000] Booting on EB164 variation PC164 using machine vector PC164 from SRM
[    0.000000] Major Options: EV56 LEGACY_START VERBOSE_MCHECK DISCONTIGMEM MAGIC_SYSRQ 
[    0.000000] Command line: root=/dev/sda2 console=ttyS0
[    0.000000] Raw memory layout:
[    0.000000]  memcluster  0, usage 1, start        0, end      192
[    0.000000]  memcluster  1, usage 0, start      192, end    32651
[    0.000000]  memcluster  2, usage 1, start    32651, end    32768
[    0.000000] Initializing bootmem allocator on Node ID 0
[    0.000000]  memcluster  1, usage 0, start      192, end    32651
[    0.000000]  Detected node memory:   start      194, end    32651
[    0.000000]  freeing pages 192:384
[    0.000000]  freeing pages 1400:32651
[    0.000000]  reserving pages 1400:1401
[    0.000000] 1024K Bcache detected; load hit latency 30 cycles, load miss latency 212 cycles
[    0.000000] pci: cia revision 2
[    0.000000] On node 0 totalpages: 32651
[    0.000000] free_area_init_node: node 0, pgdat fffffc0000986a60, node_mem_map fffffc0000af2000
[    0.000000]   DMA zone: 224 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 32651 pages, LIFO batch:7
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32427
[    0.000000] Kernel command line: root=/dev/sda2 console=ttyS0
[    0.000000] PID hash table entries: 1024 (order: 0, 8192 bytes)
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 262144 bytes)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 131072 bytes)
[    0.000000] Sorting __ex_table...
[    0.000000] Memory: 249280K/261208K available (4739K kernel code, 355K rwdata, 1296K rodata, 208K init, 1432K bss, 11928K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=128
[    0.000000] NR_IRQS:35
[    0.000000] clocksource: rpcc: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 3822520893 ns
[    0.001953] Console: colour VGA+ 80x25
[    0.029296] console [ttyS0] enabled
[    0.030273] Calibrating delay loop... 985.92 BogoMIPS (lpj=480768)
[    0.041015] pid_max: default: 32768 minimum: 301
[    0.042968] Mount-cache hash table entries: 1024 (order: 0, 8192 bytes)
[    0.043945] Mountpoint-cache hash table entries: 1024 (order: 0, 8192 bytes)
[    0.055664] devtmpfs: initialized
[    0.058593] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1866466235866741 ns
[    0.060546] NET: Registered protocol family 16
[    0.062499] pci: passed tb register update test
[    0.063476] pci: passed sg loopback i/o read test
[    0.064453] pci: passed tbia test
[    0.065429] pci: passed pte write cache snoop test
[    0.066406] pci: failed valid tag invalid pte reload test (mcheck; workaround available)
[    0.067382] pci: passed pci machine check test
[    0.068359] PCI host bridge to bus 0000:00
[    0.069335] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    0.070312] pci_bus 0000:00: root bus resource [mem 0x00000000-0x1fffffff]
[    0.071289] pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
[    0.072265] pci 0000:00:05.0: [1000:000f] type 00 class 0x010000
[    0.072265] pci 0000:00:05.0: reg 0x10: [io  0x10000-0x100ff]
[    0.073242] pci 0000:00:05.0: reg 0x14: [mem 0x82875000-0x828750ff]
[    0.073242] pci 0000:00:05.0: reg 0x18: [mem 0x82874000-0x82874fff]
[    0.073242] pci 0000:00:05.0: reg 0x30: [mem 0x82840000-0x8285ffff pref]
[    0.073242] pci 0000:00:06.0: [102b:051b] type 00 class 0x030000
[    0.073242] pci 0000:00:06.0: reg 0x10: [mem 0x88000000-0x88ffffff pref]
[    0.073242] pci 0000:00:06.0: reg 0x14: [mem 0x82870000-0x82873fff]
[    0.073242] pci 0000:00:06.0: reg 0x18: [mem 0x82000000-0x827fffff]
[    0.073242] pci 0000:00:06.0: reg 0x30: [mem 0x82860000-0x8286ffff pref]
[    0.074218] pci 0000:00:08.0: [8086:0484] type 00 class 0x000000
[    0.074218] pci 0000:00:09.0: [1011:0009] type 00 class 0x020000
[    0.074218] pci 0000:00:09.0: reg 0x10: [io  0x10100-0x1017f]
[    0.074218] pci 0000:00:09.0: reg 0x14: [mem 0x82875100-0x8287517f]
[    0.074218] pci 0000:00:09.0: reg 0x30: [mem 0x82800000-0x8283ffff pref]
[    0.075195] pci 0000:00:0b.0: [1095:0646] type 00 class 0x010180
[    0.075195] pci 0000:00:0b.0: reg 0x20: [io  0x10180-0x1018f]
[    0.075195] pci 0000:00:0b.0: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
[    0.076171] pci 0000:00:0b.0: legacy IDE quirk: reg 0x14: [io  0x03f6]
[    0.077148] pci 0000:00:0b.0: legacy IDE quirk: reg 0x18: [io  0x0170-0x0177]
[    0.078124] pci 0000:00:0b.0: legacy IDE quirk: reg 0x1c: [io  0x0376]
[    0.080078] pci: enabling save/restore of SRM state
[    0.081054] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
[    0.082031] pci 0000:00:06.0: BAR 0: assigned [mem 0x03000000-0x03ffffff pref]
[    0.083007] pci 0000:00:06.0: BAR 2: assigned [mem 0x02800000-0x02ffffff]
[    0.083984] pci 0000:00:09.0: BAR 6: assigned [mem 0x02200000-0x0223ffff pref]
[    0.084960] pci 0000:00:05.0: BAR 6: assigned [mem 0x02240000-0x0225ffff pref]
[    0.085937] pci 0000:00:06.0: BAR 6: assigned [mem 0x02260000-0x0226ffff pref]
[    0.086914] pci 0000:00:06.0: BAR 1: assigned [mem 0x02270000-0x02273fff]
[    0.087890] pci 0000:00:05.0: BAR 2: assigned [mem 0x02274000-0x02274fff]
[    0.088867] pci 0000:00:05.0: BAR 0: assigned [io  0x8000-0x80ff]
[    0.089843] pci 0000:00:05.0: BAR 1: assigned [mem 0x02275000-0x022750ff]
[    0.090820] pci 0000:00:09.0: BAR 0: assigned [io  0x8400-0x847f]
[    0.091796] pci 0000:00:09.0: BAR 1: assigned [mem 0x02276000-0x0227607f]
[    0.092773] pci 0000:00:0b.0: BAR 4: assigned [io  0x8480-0x848f]
[    0.093749] pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
[    0.093749] pci_bus 0000:00: resource 5 [mem 0x00000000-0x1fffffff]
[    0.094726] SMC FDC37C93X Ultra I/O Controller found @ 0x370
[    0.104492] vgaarb: setting as boot device: PCI:0000:00:06.0
[    0.104492] vgaarb: device added: PCI:0000:00:06.0,decodes=io+mem,owns=io+mem,locks=none
[    0.105468] vgaarb: loaded
[    0.106445] vgaarb: bridge control possible 0000:00:06.0
[    0.107421] SCSI subsystem initialized
[    0.111328] clocksource: Switched to clocksource rpcc
[    0.132812] NET: Registered protocol family 2
[    0.135742] TCP established hash table entries: 2048 (order: 1, 16384 bytes)
[    0.136718] TCP bind hash table entries: 2048 (order: 1, 16384 bytes)
[    0.137695] TCP: Hash tables configured (established 2048 bind 2048)
[    0.139648] UDP hash table entries: 256 (order: 0, 8192 bytes)
[    0.140624] UDP-Lite hash table entries: 256 (order: 0, 8192 bytes)
[    0.142578] NET: Registered protocol family 1
[    0.144531] PCI: CLS 0 bytes, default 32
[    0.147460] srm_env: version 0.0.6 loaded successfully
[    0.148437] Using epoch 2000 for rtc year 16
[    0.151367] platform rtc-alpha: rtc core: registered rtc-alpha as rtc0
[    0.153320] futex hash table entries: 256 (order: -1, 6144 bytes)
[    0.155273] workingset: timestamp_bits=55 max_order=15 bucket_order=0
[    0.186523] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[    0.188476] io scheduler noop registered
[    0.190429] io scheduler cfq registered (default)
[    0.192382] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.194335] serial8250: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    0.196288] serial8250: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
[    0.249999] random: fast init done
[    0.352538] sym0: <875> rev 0x3 at pci 0000:00:05.0 irq 18
[    0.358398] Floppy drive(s): fd0 is 2.88M
[    0.450195] sym0: Symbios NVRAM, ID 7, Fast-20, SE, parity checking
[    0.451171] sym0: open drain IRQ line driver, using on-chip SRAM
[    0.452148] sym0: using LOAD/STORE-based firmware.
[    0.454101] sym0: SCSI BUS has been reset.
[    0.455077] scsi host0: sym-2.2.3
[    0.458007] Linux Tulip driver version 1.1.15-NAPI (Feb 27, 2007)
[    0.463866] tulip0: Old format EEPROM on 'Accton EN1207' board.  Using substitute media control info
[    0.464843] tulip0: EEPROM default media type Autosense
[    0.465820] tulip0: Index #0 - Media 10base2 (#1) described by a 21140 non-MII (0) block
[    0.466796] tulip0: Index #1 - Media 10baseT (#0) described by a 21140 non-MII (0) block
[    0.467773] tulip0: Index #2 - Media 10baseT-FDX (#4) described by a 21140 non-MII (0) block
[    0.468749] tulip0: Index #3 - Media 100baseTx (#3) described by a 21140 non-MII (0) block
[    0.469726] tulip0: Index #4 - Media 100baseTx-FDX (#5) described by a 21140 non-MII (0) block
[    0.471679] net eth0: Digital DS21140 Tulip rev 34 at MMIO 0x2276000, 00:00:e8:3c:4e:c2, IRQ 19
[    0.478515] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.479491] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.481445] FDC 0 is a post-1991 82077
[    0.485351] NET: Registered protocol family 10
[    0.491210] NET: Registered protocol family 17
[    0.496093] platform rtc-alpha: setting system clock to 2016-10-07 17:57:08 UTC (1475863028)
[    0.745116] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
[    0.757812] atkbd serio1: keyboard reset failed on isa0060/serio1
[    0.802733] atkbd serio1: keyboard reset failed on isa0060/serio1
[    3.819333] scsi 0:0:0:0: Direct-Access     COMPAQ   BF0369A4BC       HPB7 PQ: 0 ANSI: 3
[    3.820310] scsi target0:0:0: tagged command queuing enabled, command queue depth 16.
[    3.821287] scsi target0:0:0: Beginning Domain Validation
[    3.828123] scsi target0:0:0: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
[    3.832029] scsi target0:0:0: Domain Validation skipping write tests
[    3.833005] scsi target0:0:0: Ending Domain Validation
[    7.993159] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    7.995113] sd 0:0:0:0: [sda] 71132000 512-byte logical blocks: (36.4 GB/33.9 GiB)
[    7.997066] sd 0:0:0:0: [sda] Write Protect is off
[    7.998042] sd 0:0:0:0: [sda] Mode Sense: cf 00 10 08
[    7.999019] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, supports DPO and FUA
[    8.010738]  sda: sda1 sda2 sda4
[    8.013667] ------------[ cut here ]------------
[    8.013667] WARNING: CPU: 0 PID: 17 at kernel/softirq.c:150 __local_bh_enable_ip+0xbc/0x100
[    8.013667] Modules linked in:
[    8.013667] CPU: 0 PID: 17 Comm: kworker/0:1 Not tainted 4.8.0 #6
[    8.013667] Workqueue: events_freezable_power_ disk_events_workfn
[    8.013667] fffffc000f1c79c0 0000000000000009 fffffc0000328190 fffffc000032bcfc 
                      fffffc000032bcfc 0000000000000200 fffffc000036dc90 0000000000000fff 
                      0000000000000100 0000000000000009 fffffc0000aba6c8 0000000000000005 
                      fffffc000036dca0 0000000000000000 fffffc000036dd50 0000000000000005 
                      fffffc0000aba680 0000000000000009 fffffc000032b9bc fffffc000f1c7a50 
                      fffffc000032bed8 0000000000000001 fffffc000095a2c0 0000000000000012 
[    8.013667] Trace:
[    8.013667] [<fffffc0000328190>] __warn+0x160/0x190
[    8.013667] [<fffffc000032bcfc>] __local_bh_enable_ip+0xbc/0x100
[    8.013667] [<fffffc000032bcfc>] __local_bh_enable_ip+0xbc/0x100
[    8.013667] [<fffffc000036dc90>] __rcu_process_callbacks+0x90/0x130
[    8.013667] [<fffffc000036dca0>] __rcu_process_callbacks+0xa0/0x130
[    8.013667] [<fffffc000036dd50>] rcu_process_callbacks+0x20/0x50
[    8.013667] [<fffffc000032b9bc>] __do_softirq+0x19c/0x330
[    8.013667] [<fffffc000032bed8>] irq_exit+0xb8/0xf0
[    8.013667] [<fffffc00003161c4>] handle_irq+0x94/0x100
[    8.013667] [<fffffc0000320ce4>] srm_device_interrupt+0x24/0x40
[    8.013667] [<fffffc0000320888>] pc164_srm_device_interrupt+0x38/0x60
[    8.013667] [<fffffc0000517088>] elv_set_request+0x28/0x40
[    8.013667] [<fffffc00003163c0>] do_entInt+0x140/0x200
[    8.013667] [<fffffc0000311430>] ret_from_sys_call+0x0/0x10
[    8.013667] [<fffffc000051a7e0>] blk_get_request+0xc0/0x1b0
[    8.013667] [<fffffc0000522030>] get_io_context+0x0/0x30
[    8.013667] [<fffffc000051a7e0>] blk_get_request+0xc0/0x1b0
[    8.013667] [<fffffc00006021dc>] scsi_execute+0x5c/0x1f0
[    8.013667] [<fffffc00006038f0>] scsi_execute_req_flags+0xc0/0x170
[    8.013667] [<fffffc0000606920>] scsi_test_unit_ready+0x90/0x1a0
[    8.013667] [<fffffc0000629220>] sd_check_events+0x1a0/0x250
[    8.013667] [<fffffc0000530c3c>] disk_check_events+0x5c/0x1b0
[    8.013667] [<fffffc0000340ef4>] process_one_work+0x144/0x440
[    8.013667] [<fffffc000034164c>] worker_thread+0x7c/0x680
[    8.013667] [<fffffc000034a778>] kthread+0x128/0x160
[    8.013667] [<fffffc00003415d0>] worker_thread+0x0/0x680
[    8.013667] [<fffffc00003117a8>] ret_from_kernel_thread+0x18/0x20
[    8.013667] [<fffffc000034a650>] kthread+0x0/0x160
[    8.013667] [<fffffc000034a650>] kthread+0x0/0x160

[    8.013667] ---[ end trace 1c8518e7c6158c3f ]---
[    8.019527] sd 0:0:0:0: [sda] Attached SCSI disk
[    8.024409] EXT4-fs (sda2): couldn't mount as ext3 due to feature incompatibilities
[    8.026363] EXT4-fs (sda2): couldn't mount as ext2 due to feature incompatibilities
[    8.049800] EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
[    8.050777] VFS: Mounted root (ext4 filesystem) readonly on device 8:2.
[    8.066402] devtmpfs: mounted
[    8.068355] Freeing unused kernel memory: 208K (fffffc00008f8000 - fffffc000092c000)
[    8.069331] This architecture does not have kernel memory protection.
[    8.297847] random: crng init done
[   14.995109] tulip 0000:00:09.0 enp0s9: renamed from eth0
[   15.464835] libata version 3.00 loaded.
[   15.607413] scsi host1: pata_cmd64x
[   15.623038] scsi host2: pata_cmd64x
[   15.624015] ata1: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0x8480 irq 14
[   15.624015] ata2: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0x8488 irq 15
[   15.624015] pata_cmd64x: active 10 recovery 10 setup 3.
[   15.624015] pata_cmd64x: active 10 recovery 10 setup 3.
[   15.802726] ata1.00: ATAPI: SONY    CD-RW  CRX140E, 1.2a, max UDMA/33
[   15.802726] pata_cmd64x: active 3 recovery 1 setup 1.
[   15.802726] pata_cmd64x: active 3 recovery 1 setup 1.
[   15.826163] ata1.00: configured for MWDMA2
[   15.832999] scsi 1:0:0:0: CD-ROM            SONY     CD-RW  CRX140E   1.2a PQ: 0 ANSI: 5
[   15.850577] sr 1:0:0:0: [sr0] scsi3-mmc drive: 32x/32x writer cd/rw xa/form2 cdda tray
[   15.850577] cdrom: Uniform CD-ROM driver Revision: 3.20
[   15.851554] sr 1:0:0:0: Attached scsi CD-ROM sr0
[   15.852530] sr 1:0:0:0: Attached scsi generic sg1 type 5
[   15.853507] pata_cmd64x: active 10 recovery 10 setup 3.
[   15.853507] pata_cmd64x: active 10 recovery 10 setup 3.
[   19.562489] EXT4-fs (sda2): re-mounted. Opts: errors=remount-ro
[   20.831044] Adding 1697208k swap on /dev/sda4.  Priority:-1 extents:1 across:1697208k 
[   21.395496] EXT4-fs (sda1): mounting ext2 file system using the ext4 subsystem
[   21.420887] EXT4-fs (sda1): mounted filesystem without journal. Opts: (null)
[14884.945503] perl(26200): unaligned trap at 0000020000192b04: 000000012004c6d1 28 1
[14884.945503] perl(26200): unaligned trap at 0000020000192b10: 000000012004c6d1 2c 4
[14884.945503] perl(26200): unaligned trap at 0000020000192b04: 000000012004c73e 28 1
[14884.945503] perl(26200): unaligned trap at 0000020000192b10: 000000012004c73e 2c 4
[14884.946480] perl(26200): unaligned trap at 0000020000192b04: 000000012004c699 28 1

-- 
Meelis Roos (mroos@linux.ee)
