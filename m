From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
Date: Tue, 19 Oct 2021 21:46:40 +0200 (CEST)
Message-ID: <202110191946.19JJkeut004465@valdese.nms.ulrich-teichert.org>
References: <232a0956-fe78-5169-4637-25679baa887f@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="%--multipart-mixed-boundary-1.4364.1634672800--%"
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <232a0956-fe78-5169-4637-25679baa887f@physik.fu-berlin.de>
List-ID: <linux-alpha.vger.kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>, Linux Alpha <linux-alpha@vger.kernel.org>, mattst88@gmail.com, torvalds@linux-foundation.org


--%--multipart-mixed-boundary-1.4364.1634672800--%
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi Adrian,

> On 9/26/21 13:26, Ulrich Teichert wrote:
> > Awesome! This boots right away, here's the full boot log from the serial
> > console until init starts:
> > (...)
> > After that the installer starts, but does not find the CD-ROM, most
> > probably because the AHA174x SCSI driver wasn't loaded or included in
> > the initrd image, but this is definitely more than I ever expected!
> 
> Could you try the installation image for Alpha that I built today and see if that
> fixes the CD-ROM detection issue for you?

Yeah, tried it, but both problems are still there. On my Alphastation 400,
I can boot, the SCSI-controler is recognized and the devices are there,
but I still get this when I try mounting the CD-ROM by hand:

...
Oct 19 18:39:37 kernel: [  799.428301] sr 0:0:4:0: [sr0] tag#427 unaligned transfer
Oct 19 18:39:37 kernel: [  799.428301] blk_update_request: I/O error, dev sr0, sector 64 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
Oct 19 18:39:37 kernel: [  799.432207] isofs_fill_super: bread failed, dev=sr0, iso_blknum=16, block=32
...

I've also tried booting from the CD-ROM on my Jensen and that worked insofar
as the installer starts up, which is cool, but no SCSI devices were detected.
EISA support seems to be activated, though:
...
[    0.193359] thermal_sys: Registered thermal governor 'user_space'
[    0.195312] EISA bus registered
[    0.249999] random: fast init done
...

I've modprobe'd the AHA174x kernel module by hand, as it was not inserted
automatically, but all I got was this line in the syslog:
...
Oct 19 17:07:28 main-menu[245]: INFO: Menu item 'di-utils-shell' selected
Oct 19 17:11:43 kernel: [  535.043671] SCSI subsystem initialized
...
Nothing more. According to the documentation the module needs no arguments
and should auto-probe, but it did not detect any devices.

I apologize for not doing more digging ATM,
full bootlogs from the serial line as attachments,
CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, The Bellrays: Bad Reaction

--%--multipart-mixed-boundary-1.4364.1634672800--%
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Description: ASCII text
Content-Disposition: attachment; filename="bootlog-jensen.log"

Alpha AXP System - ROM Version 1.7
Copyright (c) 1993 Digital Equipment Corporation.

Alpha AXP SRM Firmware Version - 32f
System conducting power up tests
------------------------------------------------------------

Devnam            Devstat
--------          -------
     CPU          OK EV4 P3.0 6.6ns
     MEM          OK 128MB
     NVR          OK 
     SCC          OK 
      IT          OK 
     KBD          OK 
     LPT          OK 
     VGA          OK 
    SCSI          OK 
------------------------------------------------------------
System power up OK.

>>> show dev

  BOOTDEV      ADDR      DEVTYPE    RM/FX    DEVNAM      REV     NUMBYTES
  -------      ----      -------    -----    ------      ---     --------
  FD0          PC Floppy DISK       RM   
  SCSI Devices..
  DKA0         A/0/0     DISK       FX       DGHS09Y     01C0    510.09MB 
  DKA500       A/5/0     RODISK     RM       CD-ROM      1.01    ......  
  HOST         A/7/0     PROC                AHA1742A    E   

>>> boot dka500 -fl i
INIT-S-CPU...
AUDIT_BOOT_STARTS ... 
AUDIT_CHECKSUM_GOOD
AUDIT_LOAD_BEGINS
AUDIT_LOAD_DONE

aboot: Linux/Alpha SRM bootloader version 1.0_pre20040408
aboot: switching to OSF/1 PALcode version 1.35
aboot: booting from device 'SCSI 1 6 0 0 500 0 JENS-IO'
aboot: no disklabel found.
iso: Max size:146155   Log zone size:2048
iso: First datazone:19   Root inode number 38912
aboot: could not find default config `I'
Welcome to aboot 1.0_pre20040408
Commands:
 h, ?                   Display this message
 q                      Halt the system and return to SRM
 p 1-8                  Look in partition <num> for configuration/kernel
 l                      List preconfigured kernels
 d <dir>                List directory <dir> in current filesystem
 b <file> <args>        Boot kernel in <file> (- for raw boot)
 i <file>               Use <file> as initial ramdisk
                        with arguments <args>
 0-9                    Boot preconfiguration 0-9 (list with 'l')
aboot> l
0:boot/vmlinuz ramdisk_size=49476 initrd=/boot/initrd.gz root=/dev/ram devfs=mount,dall 
1:boot/vmlinuz ramdisk_size=49476 initrd=/boot/initrd.gz root=/dev/ram devfs=mount,dall  console=ttyS0
2:boot/vmlinuz ramdisk_size=49476 initrd=/boot/initrd.gz root=/dev/ram devfs=mount,dall  console=ttyS1
aboot> 1
aboot: loading uncompressed boot/vmlinuz...
aboot: loading compressed boot/vmlinuz...
aboot: zero-filling 446660 bytes at 0xfffffc0002513394
aboot: loading initrd (16347850 bytes/15964 blocks) at 0xfffffc0006ce0000
aboot: starting kernel boot/vmlinuz with arguments ramdisk_size=49476  root=/dev/ram devfs=mount,dall  console=ttyS0
[    0.000000] Linux version 5.14.0-3-alpha-generic (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.3.0-11) 10.3.0, GNU ld (GNU Binutils for Debian) 2.37) #1 Debian 5.14.12-1 (2021-10-14)
[    0.000000] Booting GENERIC on Jensen using machine vector Jensen from SRM
[    0.000000] Major Options: MAGIC_SYSRQ 
[    0.000000] Command line: ramdisk_size=49476  root=/dev/ram devfs=mount,dall  console=ttyS0
[    0.000000] memcluster 0, usage 1, start        0, end      256
[    0.000000] memcluster 1, usage 0, start      256, end    16384
[    0.000000] Initial ramdisk at: 0x(____ptrval____) (16347850 bytes)
[    0.000000] 512K Bcache detected; load hit latency 17 cycles, load miss latency 59 cycles
[    0.000000] Max ASN from HWRPB is bad (0xf)
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x0000000000ffffff]
[    0.000000]   Normal   [mem 0x0000000001000000-0x0000000007ffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000000007ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 16256
[    0.000000] Kernel command line: ramdisk_size=49476  root=/dev/ram devfs=mount,dall  console=ttyS0
[    0.000000] Unknown command line parameters: ramdisk_size=49476 devfs=mount,dall
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 131072 bytes, linear)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 65536 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] opDEC fixup enabled.
[    0.000000] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.000000] Memory: 89696K/131072K available (8898K kernel code, 9500K rwdata, 2708K rodata, 408K init, 436K bss, 41376K reserved, 0K cma-reserved)
[    0.000000] random: get_random_u64 called from __kmem_cache_create+0x54/0x600 with crng_init=0
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS: 32784
[    0.000000] clocksource: rpcc: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 12741736309 ns
[    0.007812] Console: colour VGA+ 80x25
[    0.040039] printk: console [ttyS0] enabled
[    0.041015] Calibrating delay loop... 283.24 BogoMIPS (lpj=138496)
[    0.051757] pid_max: default: 32768 minimum: 301
[    0.056640] LSM: Security Framework initializing
[    0.061523] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.065429] AppArmor: AppArmor initialized
[    0.066406] TOMOYO Linux initialized
[    0.069335] Mount-cache hash table entries: 1024 (order: 0, 8192 bytes, linear)
[    0.071289] Mountpoint-cache hash table entries: 1024 (order: 0, 8192 bytes, linear)
[    0.103515] Performance events: No support for your CPU.
[    0.116210] devtmpfs: initialized
[    0.162109] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1866466235866741 ns
[    0.164062] futex hash table entries: 256 (order: -1, 6144 bytes, linear)
[    0.177734] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.180663] audit: initializing netlink subsys (disabled)
[    0.191406] thermal_sys: Registered thermal governor 'fair_share'
[    0.191406] thermal_sys: Registered thermal governor 'bang_bang'
[    0.192382] thermal_sys: Registered thermal governor 'step_wise'
[    0.193359] thermal_sys: Registered thermal governor 'user_space'
[    0.195312] EISA bus registered
[    0.249999] random: fast init done
[    0.253906] audit: type=2000 audit(0.184:1): state=initialized audit_enabled=0 res=1
[   12.697259] iommu: Default domain type: Translated 
[   12.701165] vgaarb: loaded
[   12.721673] NetLabel: Initializing
[   12.724602] NetLabel:  domain hash size = 128
[   12.725579] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[   12.727532] NetLabel:  unlabeled traffic allowed by default
[   12.729485] clocksource: Switched to clocksource rpcc
[   12.747063] VFS: Disk quotas dquot_6.6.0
[   12.749993] VFS: Dquot-cache hash table entries: 1024 (order 0, 8192 bytes)
[   12.763665] AppArmor: AppArmor Filesystem Enabled
[   12.874016] NET: Registered PF_INET protocol family
[   12.876946] IP idents hash table entries: 2048 (order: 1, 16384 bytes, linear)
                                                                                [   12.887688] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 8192                      bytes, linear)
[   12.888665] TCP established hash table entries: 1024 (order: 0, 8192 bytes, linear)
[   12.890618] TCP bind hash table entries: 1024 (order: 0, 8192 bytes, linear)
[   12.892571] TCP: Hash tables configured (established 1024 bind 1024)
[   12.898430] MPTCP token hash table entries: 512 (order: 0, 12288 bytes, linear)
[   12.900384] UDP hash table entries: 256 (order: 0, 8192 bytes, linear)
[   12.902337] UDP-Lite hash table entries: 256 (order: 0, 8192 bytes, linear)
[   12.907219] NET: Registered PF_UNIX/PF_LOCAL protocol family
[   12.909173] NET: Registered PF_XDP protocol family
[   12.910149] PCI: CLS 0 bytes, default 64
[   12.913079] Using epoch 2000 for rtc year 1
[   12.925774] Trying to unpack rootfs image as initramfs...
[   12.977532] platform rtc-alpha: registered as rtc0
[   12.978508] platform rtc-alpha: setting system clock to 2001-10-19T17:02:57 UTC (1003510977)
[   12.987298] Initialise system trusted keyrings
[   12.989251] Key type blacklist registered
[   13.003899] workingset: timestamp_bits=46 max_order=14 bucket_order=0
[   13.062493] random: crng init done
[   13.167962] zbud: loaded
[   13.186516] integrity: Platform Keyring initialized
[   13.187493] Key type asymmetric registered
[   13.189446] Asymmetric key parser 'x509' registered
[   13.190422] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)

[   13.386711] io scheduler mq-deadline registered
[   13.395500] isapnp: Scanning for PnP cards...
[   13.490227]  00:01: card '3Com Fast EtherLink ISA'
[   13.491204] isapnp: 1 Plug & Play card detected total
[   13.608391] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[   13.612297] serial8250: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16450
[   13.618157] serial8250: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16450
[   13.643547] Linux agpgart interface v0.103
[   13.666008] serio: i8042 KBD port at 0x60,0x64 irq 1
[   13.666985] serio: i8042 AUX port at 0x60,0x64 irq 9
[   13.674797] mousedev: PS/2 mouse device common for all mice
[   13.677727] platform eisa.0: Probing EISA bus 0
[   13.679680] ledtrig-cpu: registered to indicate activity on CPUs
[   13.693352] NET: Registered PF_INET6 protocol family
[   13.742180] atkbd serio0: keyboard reset failed on isa0060/serio0
[   13.880852] atkbd serio1: keyboard reset failed on isa0060/serio1
[   31.688460] Freeing initrd memory: 15960K
[   31.972639] Segment Routing with IPv6
[   31.974593] mip6: Mobile IPv6
[   31.975569] NET: Registered PF_PACKET protocol family
[   31.978499] mpls_gso: MPLS GSO support
[   31.982405] registered taskstats version 1
[   31.983382] Loading compiled-in X.509 certificates
[   34.851544] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f6149f3dd27dfcc5cbb419ea1'
[   34.854474] Loaded X.509 cert 'Debian Secure Boot Signer 2021 - linux: 4b6ef5abca669825178e052c84667ccbc0531f8c'
[   34.860333] zswap: loaded using pool lzo/zbud
[   34.870099] Key type ._fscrypt registered
[   34.871075] Key type .fscrypt registered
[   34.872052] Key type fscrypt-provisioning registered
[   35.004864] Key type encrypted registered
[   35.006818] AppArmor: AppArmor sha1 policy hashing enabled
[   35.008771] ima: No TPM chip found, activating TPM-bypass!
[   35.009747] ima: Allocated hash algorithm: sha256
[   35.011700] ima: No architecture policies found
[   35.013653] evm: Initialising EVM extended attributes:
[   35.014630] evm: security.selinux
[   35.015607] evm: security.SMACK64 (disabled)
[   35.016583] evm: security.SMACK64EXEC (disabled)
[   35.017560] evm: security.SMACK64TRANSMUTE (disabled)
[   35.018536] evm: security.SMACK64MMAP (disabled)
[   35.019513] evm: security.apparmor
[   35.020489] evm: security.ima
[   35.021466] evm: security.capability
[   35.022443] evm: HMAC attrs: 0x1
[   35.040021] Freeing unused kernel image (initmem) memory: 408K
[   35.042950] This architecture does not have kernel memory protection.
[   35.043927] Run /init as init process
[   35.044903]   with arguments:
[   35.044903]     /init
[   35.044903]   with environment:
[   35.044903]     HOME=/
[   35.044903]     TERM=linux
[   35.044903]     ramdisk_size=49476
[   35.045880]     devfs=mount,dall
[   63.044889] srm_env: module verification failed: signature and/or required key missing - tainting kernel
[   63.064420] srm_env: version 0.0.6 loaded successfully
[   66.078091] Unable to handle kernel paging request at virtual address 00000000000b9e48
[   66.079067] cat(183): Oops 0
[   66.079067] pc = [<fffffffc00000cf4>]  ra = [<fffffffc045c8234>]  ps = 0000    Tainted: G            E    
[   66.080044] pc is at 0xfffffffc00000cf4
[   66.080044] ra is at srm_env_proc_show+0x64/0xe0 [srm_env]
[   66.080044] v0 = 0000000000000000  t0 = 0000000000003600  t1 = fffffc0000003600
[   66.080044] t2 = fffffffc00000088  t3 = 0000000000000001  t4 = 00000000000000c8
[   66.080044] t5 = fffffc00036fa000  t6 = 0000000000000001  t7 = fffffc00034dc000
[   66.081020] s0 = fffffc00037ae000  s1 = fffffffc000000e0  s2 = fffffffffffffff4
[   66.081020] s3 = 000000000000000e  s4 = 0000000000000001  s5 = 0000000000400cc0
[   66.081020] s6 = fffffc00036da000
[   66.081020] a0 = 0000000000000002  a1 = 000000000000000e  a2 = fffffc00037ae000
[   66.081020] a3 = 0000000000002000  a4 = fffffc00034dfd18  a5 = 0000000000010000
[   66.081020] t8 = 0000000000000001  t9 = 00000200001440c0  t10= fffffc00010113f0
[   66.081020] t11= 0000000000000004  pv = 00000000000b9e40  at = 0000000085bdb5d6
[   66.081020] gp = fffffc000250be10  sp = 0000000087abd03f
[   66.081997] Disabling lock debugging due to kernel taint
[   66.081997] Trace:
[   66.081997] [<fffffc00012477b4>] seq_read_iter+0x254/0x6d0
[   66.081997] [<fffffc0001247d48>] seq_read+0x118/0x170
[   66.081997] [<fffffc00012d5e98>] proc_reg_read+0xc8/0x140
[   66.081997] [<fffffc000120d974>] vfs_read+0xd4/0x220
[   66.082973] [<fffffc000120d934>] vfs_read+0x94/0x220
[   66.082973] [<fffffc000120de84>] ksys_read+0x84/0x130
[   66.082973] [<fffffc000101149c>] entSys+0xac/0xc0
[   66.082973] [<fffffc00010113f0>] entSys+0x0/0xc0
[   66.082973] 
[   66.082973] Code:
[   66.082973]  b69e0020 
[   66.083950]  b73e0028 
[   66.083950]  b75e0030 
[   66.083950]  b77e0038 
[   66.083950]  47e05410 
[   66.083950]  a37bffe8 
[   66.083950] <a35b0008>
[   66.083950]  6b5a4000 
[   66.083950] 

Oct 19 17:07:28 main-menu[245]: INFO: Menu item 'di-utils-shell' selected
Oct 19 17:11:43 kernel: [  535.043671] SCSI subsystem initialized

--%--multipart-mixed-boundary-1.4364.1634672800--%
Content-Type: application/octet-stream
Content-Transfer-Encoding: 7bit
Content-Description: ASCII text
Content-Disposition: attachment; filename="bootlog-avanti.log"

ff.fe.fd.fc.fb.fa.f9.f8.f7.f6.f5.
ef.df.ee.ed.ec.f4.eb.ea.e9.e8.e7.e6.....e5.
AlphaStation 400 4/233 Console V7.1-2
  built on Nov 17 1999 at 10:20:07
>>>show dev
dka100.1.0.6.0             DKA100               IBM DDRS-34560  S97B
dka300.3.0.6.0             DKA300             SEAGATE ST15150N  0023
dka400.4.0.6.0             DKA400                        RRD45  1645
dva0.0.0.0.1               DVA0                               
ewa0.0.0.12.0              EWA0              00-00-F8-20-10-49
pka0.7.0.6.0               PKA0                  SCSI Bus ID 7
>>>boot dka400 -fl i
(boot dka400.4.0.6.0 -flags i)
block 0 of dka400.4.0.6.0 is a valid boot block
reading 163 blocks from dka400.4.0.6.0
bootstrap code read in
base = 1f6000, image_start = 0, image_bytes = 14600
initializing HWRPB at 2000
initializing page table at 1e8000
initializing machine state
setting affinity to the primary CPU
jumping to bootstrap code
aboot: Linux/Alpha SRM bootloader version 1.0_pre20040408
aboot: switching to OSF/1 PALcode version 1.46
aboot: booting from device 'SCSI 0 6 0 4 400 0 0'
aboot: no disklabel found.
Welcome to aboot 1.0_pre20040408
Commands:
 h, ?                   Display this message
 q                      Halt the system and return to SRM
 p 1-8                  Look in partition <num> for configuration/kernel
 l                      List preconfigured kernels
 d <dir>                List directory <dir> in current filesystem
 b <file> <args>        Boot kernel in <file> (- for raw boot)
 i <file>               Use <file> as initial ramdisk
                        with arguments <args>
 0-9                    Boot preconfiguration 0-9 (list with 'l')
aboot> 1
aboot: loading uncompressed boot/vmlinuz...
aboot: loading compressed boot/vmlinuz...
aboot: zero-filling 446660 bytes at 0xfffffc0002513394
aboot: loading initrd (16347850 bytes/15964 blocks) at 0xfffffc000ccde000
[    0.000000] Linux version 5.14.0-3-alpha-generic (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.3.0-11) 10.3.0, GNU ld (GNU Binutils for Debian) 2.37) #                   #1 Debian 5.14.12-1 (2021-10-14)
[    0.000000] Booting GENERIC on Avanti using machine vector Avanti from SRM
[    0.000000] Major Options: MAGIC_SYSRQ 
[    0.000000] Command line: ramdisk_size=49476  root=/dev/ram devfs=mount,dall  console=ttyS0
[    0.000000] memcluster 0, usage 1, start        0, end      251
[    0.000000] memcluster 1, usage 0, start      251, end    28671
[    0.000000] memcluster 2, usage 1, start    28671, end    28672
[    0.000000] Initial ramdisk at: 0x(____ptrval____) (16347850 bytes)
[    0.000000] 512K Bcache detected; load hit latency 18 cycles, load miss latency 113 cycles
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x00000003ffffdfff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000000dffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000000dffffff]
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 28448
[    0.000000] Kernel command line: ramdisk_size=49476  root=/dev/ram devfs=mount,dall  console=ttyS0
[    0.000000] Unknown command line parameters: ramdisk_size=49476 devfs=mount,dall
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 262144 bytes, linear)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 131072 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.000000] Memory: 187128K/229376K available (8898K kernel code, 9500K rwdata, 2708K rodata, 408K init, 436K bss, 42248K reserved, 0K cma-reserved)
[    0.000000] random: get_random_u64 called from __kmem_cache_create+0x54/0x600 with crng_init=0
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS: 32784
[    0.000000] HWRPB cycle frequency bogus.  Estimated 233327253 Hz
[    0.001953] Console: colour dummy device 80x25
[    0.031249] printk: console [ttyS0] enabled
[    0.032226] Calibrating delay loop... 451.40 BogoMIPS (lpj=220160)
[    0.042968] pid_max: default: 32768 minimum: 301
[    0.046874] LSM: Security Framework initializing
[    0.050781] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.053710] AppArmor: AppArmor initialized
[    0.055664] TOMOYO Linux initialized
[    0.058593] Mount-cache hash table entries: 1024 (order: 0, 8192 bytes, linear)
[    0.059570] Mountpoint-cache hash table entries: 1024 (order: 0, 8192 bytes, linear)
[    0.080078] Performance events: No support for your CPU.
[    0.089843] devtmpfs: initialized
[    0.124999] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1866466235866741 ns
[    0.126953] futex hash table entries: 256 (order: -1, 6144 bytes, linear)
[    0.135742] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.139648] audit: initializing netlink subsys (disabled)
[    0.147460] thermal_sys: Registered thermal governor 'fair_share'
[    0.147460] thermal_sys: Registered thermal governor 'bang_bang'
[    0.148437] thermal_sys: Registered thermal governor 'step_wise'
[    0.149413] thermal_sys: Registered thermal governor 'user_space'
[    0.152343] EISA bus registered
[    0.156249] PCI host bridge to bus 0000:00
[    0.157226] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    0.160156] pci_bus 0000:00: root bus resource [mem 0x00000000-0x3fffffff]
[    0.161132] pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
[    0.163085] pci 0000:00:06.0: [1000:0001] type 00 class 0x000000
[    0.164062] pci 0000:00:06.0: reg 0x10: [io  0x10000-0x100ff]
[    0.165038] pci 0000:00:06.0: reg 0x14: [mem 0x82040000-0x820400ff]
[    0.166015] pci 0000:00:06.0: NCR 53c810 rev 1 PCI class overridden (0x000000 -> 0x010000)
[    0.168945] pci 0000:00:07.0: [8086:0484] type 00 class 0x000000
[    0.171874] pci 0000:00:0b.0: [1011:0004] type 00 class 0x038000
[    0.173828] pci 0000:00:0b.0: reg 0x10: [mem 0x88000000-0x89ffffff pref]
[    0.174804] pci 0000:00:0b.0: reg 0x30: [mem 0x82000000-0x8203ffff pref]
[    0.177734] pci 0000:00:0c.0: [1011:0002] type 00 class 0x020000
[    0.178710] pci 0000:00:0c.0: reg 0x10: [io  0x10100-0x1017f]
[    0.180663] pci 0000:00:0c.0: reg 0x14: [mem 0x82040100-0x8204017f]
[    0.182617] pci: enabling save/restore of SRM state
[    0.184570] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
[    0.185546] pci 0000:00:0b.0: BAR 0: assigned [mem 0x02000000-0x03ffffff pref]
[    0.186523] pci 0000:00:0b.0: BAR 6: assigned [mem 0x01200000-0x0123ffff pref
[    0.188476] pci 0000:00:06.0: BAR 1: assigned [mem 0x01240000-0x012400ff]
[    0.189453] pci 0000:00:0c.0: BAR 0: assigned [io  0x8400-0x847f]
[    0.190429] pci 0000:00:0c.0: BAR 1: assigned [mem 0x01241000-0x0124107f]
[    0.191406] pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
[    0.192382] pci_bus 0000:00: resource 5 [mem 0x00000000-0x3fffffff]
[    0.193359] sio_pci_route: PIRQ original 0xb800a05 new 0xb0a050f
[    0.194335] Found PC87332 Super IO chip at 0x26e
[    0.195312] PC873xx enabling IDE interrupt
[    0.196288] PC873xx enabling EPP v1.9
[    0.228515] audit: type=2000 audit(0.142:1): state=initialized audit_enabled=0 res=1
[    0.249999] random: fast init done
[    7.835933] iommu: Default domain type: Translated 
[    7.838863] vgaarb: loaded
[    7.852535] NetLabel: Initializing
[    7.853511] NetLabel:  domain hash size = 128
[    7.854488] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    7.856441] NetLabel:  unlabeled traffic allowed by default
[    7.867183] VFS: Disk quotas dquot_6.6.0
[    7.870113] VFS: Dquot-cache hash table entries: 1024 (order 0, 8192 bytes)
[    7.878902] AppArmor: AppArmor Filesystem Enabled
[    7.957027] NET: Registered PF_INET protocol family
[    7.958980] IP idents hash table entries: 4096 (order: 2, 32768 bytes, linear)
                                                                                [    7.966792] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 8192                     bytes, linear)
[    7.968745] TCP established hash table entries: 2048 (order: 1, 16384 bytes, linear)
[    7.969722] TCP bind hash table entries: 2048 (order: 1, 16384 bytes, linear)
[    7.970699] TCP: Hash tables configured (established 2048 bind 2048)
[    7.974605] MPTCP token hash table entries: 512 (order: 0, 12288 bytes, linear)
[    7.976558] UDP hash table entries: 256 (order: 0, 8192 bytes, linear)
[    7.977534] UDP-Lite hash table entries: 256 (order: 0, 8192 bytes, linear)
[    7.981441] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    7.983394] NET: Registered PF_XDP protocol family
[    7.984370] PCI: CLS 0 bytes, default 64
[    7.986324] Using epoch 1980 for rtc year 21
[    7.996089] Trying to unpack rootfs image as initramfs...
[    8.035152] platform rtc-alpha: registered as rtc0
[    8.037105] platform rtc-alpha: setting system clock to 2001-10-19T18:26:25 UTC (1003515985)
[    8.043941] Initialise system trusted keyrings
[    8.045894] Key type blacklist registered
[    8.059566] workingset: timestamp_bits=46 max_order=15 bucket_order=0
[    8.138667] zbud: loaded
[    8.151363] integrity: Platform Keyring initialized
[    8.152339] Key type asymmetric registered
[    8.153316] Asymmetric key parser 'x509' registered
[    8.155269] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[    8.258784] io scheduler mq-deadline registered
[    8.264644] isapnp: Scanning for PnP cards...
[    8.612300] isapnp: No Plug & Play device found
[    8.970698] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    8.974604] serial8250: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    8.988276] serial8250: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
[    9.008784] Linux agpgart interface v0.103
[    9.024409] serio: i8042 KBD port at 0x60,0x64 irq 1
[    9.025386] serio: i8042 AUX port at 0x60,0x64 irq 12
[    9.038081] mousedev: PS/2 mouse device common for all mice
[    9.040034] platform eisa.0: Probing EISA bus 0
[    9.041987] ledtrig-cpu: registered to indicate activity on CPUs
[    9.050776] NET: Registered PF_INET6 protocol family
[    9.087885] atkbd serio0: keyboard reset failed on isa0060/serio0
[    9.193354] atkbd serio1: keyboard reset failed on isa0060/serio1
[   13.049798] random: crng init done
[   19.850575] Freeing initrd memory: 15960K
[   20.045888] Segment Routing with IPv6
[   20.047841] mip6: Mobile IPv6
[   20.048817] NET: Registered PF_PACKET protocol family
[   20.051747] mpls_gso: MPLS GSO support
[   20.054677] registered taskstats version 1
[   20.055653] Loading compiled-in X.509 certificates
[   21.781238] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f6149f3dd27dfcc5cbb419ea1'
[   21.782215] Loaded X.509 cert 'Debian Secure Boot Signer 2021 - linux: 4b6ef5abca669825178e052c84667ccbc0531f8c'
[   21.788074] zswap: loaded using pool lzo/zbud
[   21.795887] Key type ._fscrypt registered
[   21.796863] Key type .fscrypt registered
[   21.797840] Key type fscrypt-provisioning registered
[   21.889637] Key type encrypted registered
[   21.890613] AppArmor: AppArmor sha1 policy hashing enabled
[   21.892566] ima: No TPM chip found, activating TPM-bypass!
[   21.893543] ima: Allocated hash algorithm: sha256
[   21.895496] ima: No architecture policies found
[   21.897449] evm: Initialising EVM extended attributes:
[   21.898426] evm: security.selinux
[   21.899402] evm: security.SMACK64 (disabled)
[   21.900379] evm: security.SMACK64EXEC (disabled)
[   21.901355] evm: security.SMACK64TRANSMUTE (disabled)
[   21.902332] evm: security.SMACK64MMAP (disabled)
[   21.903309] evm: security.apparmor
[   21.904285] evm: security.ima
[   21.905262] evm: security.capability
[   21.906238] evm: HMAC attrs: 0x1
[   21.916980] Freeing unused kernel image (initmem) memory: 408K
[   21.918934] This architecture does not have kernel memory protection.
[   21.920887] Run /init as init process
[   21.921863]   with arguments:
[   21.921863]     /init
[   21.921863]   with environment:
[   21.921863]     HOME=/
[   21.921863]     TERM=linux
[   21.921863]     ramdisk_size=49476
[   21.921863]     devfs=mount,dall
[   23.598620] scsi_mod: module verification failed: signature and/or required k
ey missing - tainting kernel
[   23.764636] SCSI subsystem initialized
[   23.954089] sym0: <810> rev 0x1 at pci 0000:00:06.0 irq 11
[   23.974597] sym0: No NVRAM, ID 7, Fast-10, SE, parity checking
[   23.976550] sym0: SCSI BUS has been reset.
[   23.978503] scsi host0: sym-2.2.3
[   27.624985] scsi 0:0:1:0: Direct-Access     IBM      DDRS-34560       S97B PQ: 0 ANSI: 2
[   27.626938] scsi target0:0:1: tagged command queuing enabled, command queue depth 16.
[   27.627915] scsi target0:0:1: Beginning Domain Validation
[   27.642563] scsi target0:0:1: FAST-10 SCSI 10.0 MB/s ST (100 ns, offset 8)
[   27.653306] scsi target0:0:1: Domain Validation skipping write tests
[   27.654282] scsi target0:0:1: Ending Domain Validation
[   27.966782] scsi 0:0:3:0: Direct-Access     SEAGATE  ST15150N         0023 PQ: 0 ANSI: 2
[   27.968735] scsi target0:0:3: tagged command queuing enabled, command queue depth 16.
[   27.969712] scsi target0:0:3: Beginning Domain Validation
[   27.992173] scsi target0:0:3: FAST-10 SCSI 10.0 MB/s ST (100 ns, offset 8)
[   28.010727] scsi target0:0:3: Domain Validation skipping write tests
[   28.011704] scsi target0:0:3: Ending Domain Validation
[   28.030259] scsi 0:0:4:0: CD-ROM            DEC      RRD45   (C) DEC  1645 PQ: 0 ANSI: 2
[   28.032212] scsi target0:0:4: Beginning Domain Validation
[   28.046860] scsi target0:0:4: FAST-5 SCSI 4.2 MB/s ST (236 ns, offset 8)
[   28.062485] scsi target0:0:4: Domain Validation skipping write tests
[   28.063462] scsi target0:0:4: Ending Domain Validation
[   29.011703] sr 0:0:4:0: Power-on or device reset occurred
[   29.034164] sr 0:0:4:0: [sr0] scsi-1 drive
[   29.035141] cdrom: Uniform CD-ROM driver Revision: 3.20
[   29.080063] sr 0:0:4:0: Attached scsi CD-ROM sr0
[   29.370102] sd 0:0:1:0: Power-on or device reset occurred
[   29.376938] sd 0:0:3:0: Power-on or device reset occurred
[   29.381820] sd 0:0:1:0: [sda] Spinning up disk...
[   29.391586] sd 0:0:3:0: [sdb] 8388315 512-byte logical blocks: (4.29 GB/4.00 GiB)
[   29.399399] sd 0:0:3:0: [sdb] Write Protect is off
[   29.400375] sd 0:0:3:0: [sdb] Mode Sense: ab 00 10 08
[   29.410141] sd 0:0:3:0: [sdb] Write cache: disabled, read cache: enabled, supports DPO and FUA
[   29.491195]  sdb: sdb1 sdb2 sdb3 sdb4
[   29.588852] sd 0:0:3:0: [sdb] Attached SCSI disk
[   30.437484] .ready
[   39.043925] sd 0:0:1:0: [sda] 8925000 512-byte logical blocks: (4.57 GB/4.25 GiB)
[   39.095683] sd 0:0:1:0: [sda] Write Protect is off
[   39.096659] sd 0:0:1:0: [sda] Mode Sense: b9 00 00 08
[   39.129862] sd 0:0:1:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   39.285136]  sda: sda1 sda2 sda3 sda4 sda5
[   39.442362] sd 0:0:1:0: [sda] Attached SCSI disk
[   57.998993] srm_env: version 0.0.6 loaded successfully
[  227.778203] sr 0:0:4:0: [sr0] tag#406 unaligned transfer
[  227.778203] blk_update_request: I/O error, dev sr0, sector 584615 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 0
[  227.790898] sr 0:0:4:0: [sr0] tag#409 unaligned transfer
[  227.790898] blk_update_request: I/O error, dev sr0, sector 584615 op 0x0:(READ) flags 0x0 phys_seg 9 prio class 0
[  227.790898] Buffer I/O error on dev sr0, logical block 584615, async page
[  227.791875] Buffer I/O error on dev sr0, logical block 584619, async page read
[  227.791875] Buffer I/O error on dev sr0, logical block 584620, async page read
[  227.791875] Buffer I/O error on dev sr0, logical block 584621, async page read
[  227.791875] Buffer I/O error on dev sr0, logical block 584622, async page read
[  227.791875] Buffer I/O error on dev sr0, logical block 584623, async page read
[  228.032109] sr 0:0:4:0: [sr0] tag#420 unaligned transfer
[  228.033086] blk_update_request: I/O error, dev sr0, sector 7 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 0
[  228.046758] sr 0:0:4:0: [sr0] tag#423 unaligned transfer
[  228.046758] blk_update_request: I/O error, dev sr0, sector 7 op 0x0:(READ) flags 0x0 phys_seg 9 prio class 0
[  228.047734] Buffer I/O error on dev sr0, logical block 7, async page read
[  228.049687] sr 0:0:4:0: [sr0] tag#424 unaligned transfer
[  228.049687] blk_update_request: I/O error, dev sr0, sector 7 op 0x0:(READ) flags 0x0 phys_seg 9 prio class 0
....
[  228.051641] sr 0:0:4:0: [sr0] tag#425 unaligned transfer
[  228.769414] sr 0:0:4:0: [sr0] tag#441 unaligned transfer
[  228.773320] sr 0:0:4:0: [sr0] tag#442 unaligned transfer
[  228.782109] sr 0:0:4:0: [sr0] tag#443 unaligned transfer
...
[  240.065306] sr 0:0:4:0: [sr0] tag#403 unaligned transfer
[  240.065306] print_req_error: 120 callbacks suppressed
[  240.065306] blk_update_request: I/O error, dev sr0, sector 64 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[  240.069213] isofs_fill_super: bread failed, dev=sr0, iso_blknum=16, block=32

Oct 19 18:39:37 kernel: [  799.428301] sr 0:0:4:0: [sr0] tag#427 unaligned transfer
Oct 19 18:39:37 kernel: [  799.428301] blk_update_request: I/O error, dev sr0, sector 64 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
Oct 19 18:39:37 kernel: [  799.432207] isofs_fill_super: bread failed, dev=sr0, iso_blknum=16, block=32


--%--multipart-mixed-boundary-1.4364.1634672800--%--
