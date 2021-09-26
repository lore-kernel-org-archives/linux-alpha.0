From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
Date: Sun, 26 Sep 2021 13:26:26 +0200 (CEST)
Message-ID: <202109261126.18QBQQWp003766@valdese.nms.ulrich-teichert.org>
References: <fb334b31-9b06-615d-189b-bf7909906752@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <fb334b31-9b06-615d-189b-bf7909906752@physik.fu-berlin.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linux Alpha <linux-alpha@vger.kernel.org>, mattst88@gmail.com, torvalds@linux-foundation.org

Hi Adrian,

> On 9/23/21 21:57, Ulrich Teichert wrote:
> > and putting the four SIMMs into bank 0 only, I was able to boot my ancient
> > kernel with 128 MB of ram. So far so good, but I failed to boot the
> > 5.15-rc2 kernel over aboot or from the CDROM, with exactly the same
> > behavior as before (uncompressing.... forever or machine check with HALT).
> 
> Out of curiosity, have you tried a recent Debian ISO for Alpha?
> 
> > https://cdimage.debian.org/cdimage/ports/current/

Awesome! This boots right away, here's the full boot log from the serial
console until init starts:

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
iso: Max size:145780   Log zone size:2048
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
0:boot/vmlinuz ramdisk_size=47628 initrd=/boot/initrd.gz root=/dev/ram devfs=mount,dall 
1:boot/vmlinuz ramdisk_size=47628 initrd=/boot/initrd.gz root=/dev/ram devfs=mount,dall  console=ttyS0
2:boot/vmlinuz ramdisk_size=47628 initrd=/boot/initrd.gz root=/dev/ram devfs=mount,dall  console=ttyS1
aboot> 1
aboot: loading uncompressed boot/vmlinuz...
aboot: loading compressed boot/vmlinuz...
aboot: zero-filling 447516 bytes at 0xfffffc00024faf4c
aboot: loading initrd (15874549 bytes/15502 blocks) at 0xfffffc0006d62000
aboot: starting kernel boot/vmlinuz with arguments ramdisk_size=47628  root=/dev/ram devfs=mount,dall  console=ttyS0
[    0.000000] Linux version 5.14.0-1-alpha-generic (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.3.0-9) 10.3.0, GNU ld (GNU Binutils for Debian) 2.37) #1 Debian 5.14.6-2 (2021-09-19)
[    0.000000] Booting GENERIC on Jensen using machine vector Jensen from SRM
[    0.000000] Major Options: MAGIC_SYSRQ 
[    0.000000] Command line: ramdisk_size=47628  root=/dev/ram devfs=mount,dall  console=ttyS0
[    0.000000] memcluster 0, usage 1, start        0, end      256
[    0.000000] memcluster 1, usage 0, start      256, end    16384
[    0.000000] Initial ramdisk at: 0x(____ptrval____) (15874549 bytes)
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
[    0.000000] Kernel command line: ramdisk_size=47628  root=/dev/ram devfs=mount,dall  console=ttyS0
[    0.000000] Unknown command line parameters: ramdisk_size=47628 devfs=mount,dall
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 131072 bytes, linear)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 65536 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] opDEC fixup enabled.
[    0.000000] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.000000] Memory: 90256K/131072K available (8897K kernel code, 9499K rwdata, 2704K rodata, 312K init, 437K bss, 40816K reserved, 0K cma-reserved)
[    0.000000] random: get_random_u64 called from __kmem_cache_create+0x54/0x600 with crng_init=0
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS: 32784
[    0.000000] clocksource: rpcc: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 12741736309 ns
[    0.007812] Console: colour VGA+ 80x25
[    0.038085] printk: console [ttyS0] enabled
[    0.040039] Calibrating delay loop... 282.32 BogoMIPS (lpj=137728)
[    0.049804] pid_max: default: 32768 minimum: 301
[    0.054687] LSM: Security Framework initializing
[    0.059570] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.063476] AppArmor: AppArmor initialized
[    0.064453] TOMOYO Linux initialized
[    0.068359] Mount-cache hash table entries: 1024 (order: 0, 8192 bytes, linear)
[    0.071289] Mountpoint-cache hash table entries: 1024 (order: 0, 8192 bytes, linear)
[    0.103515] Performance events: No support for your CPU.
[    0.117187] devtmpfs: initialized
[    0.163085] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1866466235866741 ns
[    0.166015] futex hash table entries: 256 (order: -1, 6144 bytes, linear)
[    0.179687] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.182617] audit: initializing netlink subsys (disabled)
[    0.193359] thermal_sys: Registered thermal governor 'fair_share'
[    0.193359] thermal_sys: Registered thermal governor 'bang_bang'
[    0.194335] thermal_sys: Registered thermal governor 'step_wise'
[    0.196288] thermal_sys: Registered thermal governor 'user_space'
[    0.249999] random: fast init done
[    0.252929] audit: type=2000 audit(0.186:1): state=initialized audit_enabled=0 res=1
[   12.660149] iommu: Default domain type: Translated 
[   12.663079] vgaarb: loaded
[   12.684563] NetLabel: Initializing
[   12.685540] NetLabel:  domain hash size = 128
[   12.686516] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[   12.689446] NetLabel:  unlabeled traffic allowed by default
[   12.692376] clocksource: Switched to clocksource rpcc
[   12.709954] VFS: Disk quotas dquot_6.6.0
[   12.712884] VFS: Dquot-cache hash table entries: 1024 (order 0, 8192 bytes)
[   12.725579] AppArmor: AppArmor Filesystem Enabled
[   12.836907] NET: Registered PF_INET protocol family
[   12.839837] IP idents hash table entries: 2048 (order: 1, 16384 bytes, linear)
[   12.850579] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 8192 bytes, linear)
[   12.851555] TCP established hash table entries: 1024 (order: 0, 8192 bytes, linear)
[   12.853509] TCP bind hash table entries: 1024 (order: 0, 8192 bytes, linear)
[   12.854485] TCP: Hash tables configured (established 1024 bind 1024)
[   12.860344] MPTCP token hash table entries: 512 (order: 0, 12288 bytes, linear)
[   12.862298] UDP hash table entries: 256 (order: 0, 8192 bytes, linear)
[   12.864251] UDP-Lite hash table entries: 256 (order: 0, 8192 bytes, linear)
[   12.868157] NET: Registered PF_UNIX/PF_LOCAL protocol family
[   12.869134] NET: Registered PF_XDP protocol family
[   12.870110] PCI: CLS 0 bytes, default 64
[   12.873040] Using epoch 2000 for rtc year 1
[   12.887688] Trying to unpack rootfs image as initramfs...
[   12.939446] platform rtc-alpha: registered as rtc0
[   12.942376] platform rtc-alpha: setting system clock to 2001-09-26T10:57:30 UTC (1001501850)
[   12.950188] Initialise system trusted keyrings
[   12.952141] Key type blacklist registered
[   12.966790] workingset: timestamp_bits=46 max_order=14 bucket_order=0
[   13.062493] random: crng init done
[   13.131829] zbud: loaded
[   13.150383] integrity: Platform Keyring initialized
[   13.151360] Key type asymmetric registered
[   13.152337] Asymmetric key parser 'x509' registered
[   13.153313] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[   13.351555] io scheduler mq-deadline registered
[   13.358391] isapnp: Scanning for PnP cards...
[   13.453118]  00:01: card '3Com Fast EtherLink ISA'
[   13.454094] isapnp: 1 Plug & Play card detected total
[   13.561516] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[   13.566399] serial8250: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16450
[   13.584953] serial8250: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16450
[   13.596672] Linux agpgart interface v0.103
[   13.617180] serio: i8042 KBD port at 0x60,0x64 irq 1
[   13.619133] serio: i8042 AUX port at 0x60,0x64 irq 9
[   13.637688] mousedev: PS/2 mouse device common for all mice
[   13.639641] ledtrig-cpu: registered to indicate activity on CPUs
[   13.653313] NET: Registered PF_INET6 protocol family
[   13.706047] atkbd serio0: keyboard reset failed on isa0060/serio0
[   13.833000] atkbd serio1: keyboard reset failed on isa0060/serio1
[   31.153304] Freeing initrd memory: 15496K
[   31.443343] Segment Routing with IPv6
[   31.445296] mip6: Mobile IPv6
[   31.447249] NET: Registered PF_PACKET protocol family
[   31.450179] mpls_gso: MPLS GSO support
[   31.455062] registered taskstats version 1
[   31.456038] Loading compiled-in X.509 certificates
[   34.281232] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f6149f3dd27dfcc5cbb419ea1'
[   34.283185] Loaded X.509 cert 'Debian Secure Boot Signer 2021 - linux: 4b6ef5abca669825178e052c84667ccbc0531f8c'
[   34.288068] zswap: loaded using pool lzo/zbud
[   34.298810] Key type ._fscrypt registered
[   34.299787] Key type .fscrypt registered
[   34.300763] Key type fscrypt-provisioning registered
[   34.434552] Key type encrypted registered
[   34.436505] AppArmor: AppArmor sha1 policy hashing enabled
[   34.437482] ima: No TPM chip found, activating TPM-bypass!
[   34.438458] ima: Allocated hash algorithm: sha256
[   34.439435] ima: No architecture policies found
[   34.441388] evm: Initialising EVM extended attributes:
[   34.442365] evm: security.selinux
[   34.443341] evm: security.SMACK64 (disabled)
[   34.444318] evm: security.SMACK64EXEC (disabled)
[   34.446271] evm: security.SMACK64TRANSMUTE (disabled)
[   34.447247] evm: security.SMACK64MMAP (disabled)
[   34.449201] evm: security.apparmor
[   34.451154] evm: security.ima
[   34.452130] evm: security.capability
[   34.453107] evm: HMAC attrs: 0x1
[   34.467755] Freeing unused kernel image (initmem) memory: 312K
[   34.470685] This architecture does not have kernel memory protection.
[   34.471662] Run /init as init process

After that the installer starts, but does not find the CD-ROM, most
probably because the AHA174x SCSI driver wasn't loaded or included in
the initrd image, but this is definitely more than I ever expected!

Could you please point me to the kernel build script you are using? I must
be doing something completely wrong.

I assume the installer build instructions on

https://wiki.debian.org/PortsDocs/CreateDebianInstallerImages

are still valid? In that case, I should be able to create a debian ports
installer image with a custom kernel?

Thanks for suggesting the debian ports images and of course for your
maintenance work!

CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, The Bellrays: Bad Reaction
