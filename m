From: Balint Cristian <rezso@rdsor.ro>
Subject: Re: 2.6.7-rc3 from bkcvs doesn't build on Alpha
Date: Sun, 13 Jun 2004 11:59:39 +0300
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <200406131159.39672.rezso@rdsor.ro>
References: <cagdss$ab4$1@terminus.zytor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <cagdss$ab4$1@terminus.zytor.com>
Content-Disposition: inline
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-alpha@vger.kernel.org

On Sunday 13 June 2004 05:24, H. Peter Anvin wrote:
> First of all, -Werror causes build in arch/alpha/mm to fail, and
> secondly the link fails:
> 
>   gcc -Wp,-MD,init/.version.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -pipe -mno-fp-regs -ffixed-8 -msmall-data -mcpu=ev5 -Wa,-mev6 -O2 -fomit-frame-pointer     -DKBUILD_BASENAME=version -DKBUILD_MODNAME=version -c -o init/.tmp_version.o init/version.c
>    ld   -r -o init/built-in.o init/main.o init/version.o init/mounts.o init/initramfs.o
>         ld  -static -N  -T arch/alpha/kernel/vmlinux.lds.s arch/alpha/kernel/head.o   init/built-in.o --start-group  usr/built-in.o  arch/alpha/kernel/built-in.o  arch/alpha/mm/built-in.o  arch/alpha/math-emu/built-in.o  kernel/built-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o  security/built-in.o  crypto/built-in.o  lib/lib.a  arch/alpha/lib/lib.a  lib/built-in.o  arch/alpha/lib/built-in.o  drivers/built-in.o  sound/built-in.o  net/built-in.o --end-group  -o .tmp_vmlinux1
> local symbol 0: discarded in section `.exit.text' from drivers/built-in.o
> make: *** [.tmp_vmlinux1] Error 1

	I found that one driver couse this, cant remember which one but i strat do unselect in menuconfig until
compile went ok.

> 
> gcc version 3.3.3 (Debian 20040422)
> GNU ld version 2.14.90.0.7 20031029 Debian GNU/Linux
> 
> .config:
> 
> #
> # Automatically generated make config: don't edit
> #
> CONFIG_ALPHA=y
> CONFIG_64BIT=y
> CONFIG_MMU=y
> CONFIG_RWSEM_XCHGADD_ALGORITHM=y
> CONFIG_GENERIC_ISA_DMA=y
> 
> #
> # Code maturity level options
> #
> CONFIG_EXPERIMENTAL=y
> CONFIG_CLEAN_COMPILE=y
> CONFIG_STANDALONE=y
> CONFIG_BROKEN_ON_SMP=y
> 
> #
> # General setup
> #
> CONFIG_SWAP=y
> CONFIG_SYSVIPC=y
> CONFIG_POSIX_MQUEUE=y
> # CONFIG_BSD_PROCESS_ACCT is not set
> CONFIG_SYSCTL=y
> # CONFIG_AUDIT is not set
> CONFIG_LOG_BUF_SHIFT=16
> # CONFIG_HOTPLUG is not set
> # CONFIG_IKCONFIG is not set
> # CONFIG_EMBEDDED is not set
> CONFIG_KALLSYMS=y
> # CONFIG_KALLSYMS_ALL is not set
> CONFIG_FUTEX=y
> CONFIG_EPOLL=y
> CONFIG_IOSCHED_NOOP=y
> CONFIG_IOSCHED_AS=y
> CONFIG_IOSCHED_DEADLINE=y
> CONFIG_IOSCHED_CFQ=y
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> 
> #
> # Loadable module support
> #
> CONFIG_MODULES=y
> CONFIG_MODULE_UNLOAD=y
> CONFIG_MODULE_FORCE_UNLOAD=y
> CONFIG_OBSOLETE_MODPARM=y
> CONFIG_MODVERSIONS=y
> CONFIG_KMOD=y
> 
> #
> # System setup
> #
> # CONFIG_ALPHA_GENERIC is not set
> # CONFIG_ALPHA_ALCOR is not set
> # CONFIG_ALPHA_XL is not set
> # CONFIG_ALPHA_BOOK1 is not set
> # CONFIG_ALPHA_AVANTI_CH is not set
> # CONFIG_ALPHA_CABRIOLET is not set
> # CONFIG_ALPHA_DP264 is not set
> CONFIG_ALPHA_EB164=y
> # CONFIG_ALPHA_EB64P_CH is not set
> # CONFIG_ALPHA_EB66 is not set
> # CONFIG_ALPHA_EB66P is not set
> # CONFIG_ALPHA_EIGER is not set
> # CONFIG_ALPHA_JENSEN is not set
> # CONFIG_ALPHA_LX164 is not set
> # CONFIG_ALPHA_LYNX is not set
> # CONFIG_ALPHA_MARVEL is not set
> # CONFIG_ALPHA_MIATA is not set
> # CONFIG_ALPHA_MIKASA is not set
> # CONFIG_ALPHA_NAUTILUS is not set
> # CONFIG_ALPHA_NONAME_CH is not set
> # CONFIG_ALPHA_NORITAKE is not set
> # CONFIG_ALPHA_PC164 is not set
> # CONFIG_ALPHA_P2K is not set
> # CONFIG_ALPHA_RAWHIDE is not set
> # CONFIG_ALPHA_RUFFIAN is not set
> # CONFIG_ALPHA_RX164 is not set
> # CONFIG_ALPHA_SX164 is not set
> # CONFIG_ALPHA_SABLE is not set
> # CONFIG_ALPHA_SHARK is not set
> # CONFIG_ALPHA_TAKARA is not set
> # CONFIG_ALPHA_TITAN is not set
> # CONFIG_ALPHA_WILDFIRE is not set
> CONFIG_ISA=y
> CONFIG_PCI=y
> CONFIG_PCI_DOMAINS=y
> CONFIG_ALPHA_EV5=y
> CONFIG_ALPHA_CIA=y
> CONFIG_ALPHA_SRM=y
> CONFIG_EARLY_PRINTK=y
> CONFIG_DISCONTIGMEM=y
> # CONFIG_NUMA is not set
> CONFIG_VERBOSE_MCHECK=y
> CONFIG_VERBOSE_MCHECK_ON=1
> CONFIG_PCI_LEGACY_PROC=y
> CONFIG_PCI_NAMES=y
> CONFIG_SRM_ENV=y
> CONFIG_BINFMT_ELF=y
> # CONFIG_BINFMT_AOUT is not set
> # CONFIG_BINFMT_EM86 is not set
> # CONFIG_BINFMT_MISC is not set
> 
> #
> # Device Drivers
> #
> 
> #
> # Generic Driver Options
> #
> # CONFIG_DEBUG_DRIVER is not set
> 
> #
> # Memory Technology Devices (MTD)
> #
> # CONFIG_MTD is not set
> 
> #
> # Parallel port support
> #
> CONFIG_PARPORT=y
> CONFIG_PARPORT_PC=y
> CONFIG_PARPORT_PC_CML1=y
> # CONFIG_PARPORT_SERIAL is not set
> CONFIG_PARPORT_PC_FIFO=y
> CONFIG_PARPORT_PC_SUPERIO=y
> # CONFIG_PARPORT_OTHER is not set
> CONFIG_PARPORT_1284=y
> 
> #
> # Plug and Play support
> #
> CONFIG_PNP=y
> # CONFIG_PNP_DEBUG is not set
> 
> #
> # Protocols
> #
> CONFIG_ISAPNP=y
> 
> #
> # Block devices
> #
> CONFIG_BLK_DEV_FD=y
> # CONFIG_BLK_DEV_XD is not set
> # CONFIG_PARIDE is not set
> # CONFIG_BLK_CPQ_DA is not set
> # CONFIG_BLK_CPQ_CISS_DA is not set
> # CONFIG_BLK_DEV_DAC960 is not set
> # CONFIG_BLK_DEV_UMEM is not set
> CONFIG_BLK_DEV_LOOP=m
> # CONFIG_BLK_DEV_CRYPTOLOOP is not set
> CONFIG_BLK_DEV_NBD=m
> # CONFIG_BLK_DEV_CARMEL is not set
> CONFIG_BLK_DEV_RAM=y
> CONFIG_BLK_DEV_RAM_SIZE=4096
> CONFIG_BLK_DEV_INITRD=y
> 
> #
> # ATA/ATAPI/MFM/RLL support
> #
> CONFIG_IDE=y
> CONFIG_IDE_MAX_HWIFS=4
> CONFIG_BLK_DEV_IDE=y
> 
> #
> # Please see Documentation/ide.txt for help/info on IDE drives
> #
> CONFIG_BLK_DEV_IDEDISK=y
> CONFIG_IDEDISK_MULTI_MODE=y
> CONFIG_BLK_DEV_IDECD=y
> # CONFIG_BLK_DEV_IDETAPE is not set
> # CONFIG_BLK_DEV_IDEFLOPPY is not set
> # CONFIG_BLK_DEV_IDESCSI is not set
> # CONFIG_IDE_TASK_IOCTL is not set
> # CONFIG_IDE_TASKFILE_IO is not set
> 
> #
> # IDE chipset support/bugfixes
> #
> CONFIG_IDE_GENERIC=y
> # CONFIG_BLK_DEV_IDEPNP is not set
> CONFIG_BLK_DEV_IDEPCI=y
> # CONFIG_IDEPCI_SHARE_IRQ is not set
> # CONFIG_BLK_DEV_OFFBOARD is not set
> # CONFIG_BLK_DEV_GENERIC is not set
> # CONFIG_BLK_DEV_OPTI621 is not set
> CONFIG_BLK_DEV_IDEDMA_PCI=y
> # CONFIG_BLK_DEV_IDEDMA_FORCED is not set
> CONFIG_IDEDMA_PCI_AUTO=y
> # CONFIG_IDEDMA_ONLYDISK is not set
> N_COOKIES=y
> # CONFIG_INET_AH is not set
> CONFIG_INET_ESP=y
> CONFIG_INET_IPCOMP=m
> 
> #
> # IP: Virtual Server Configuration
> #
> # CONFIG_IP_VS is not set
> # CONFIG_IPV6 is not set
> CONFIG_NETFILTER=y
> # CONFIG_NETFILTER_DEBUG is not set
> 
> #
> # IP: Netfilter Configuration
> #
> # CONFIG_IP_NF_CONNTRACK is not set
> # CONFIG_IP_NF_QUEUE is not set
> CONFIG_IP_NF_IPTABLES=m
> # CONFIG_IP_NF_MATCH_LIMIT is not set
> CONFIG_IP_NF_MATCH_IPRANGE=m
> # CONFIG_IP_NF_MATCH_MAC is not set
> # CONFIG_IP_NF_MATCH_PKTTYPE is not set
> # CONFIG_IP_NF_MATCH_MARK is not set
> # CONFIG_IP_NF_MATCH_MULTIPORT is not set
> # CONFIG_IP_NF_MATCH_TOS is not set
> # CONFIG_IP_NF_MATCH_RECENT is not set
> # CONFIG_IP_NF_MATCH_ECN is not set
> # CONFIG_IP_NF_MATCH_DSCP is not set
> # CONFIG_IP_NF_MATCH_AH_ESP is not set
> # CONFIG_IP_NF_MATCH_LENGTH is not set
> # CONFIG_IP_NF_MATCH_TTL is not set
> # CONFIG_IP_NF_MATCH_TCPMSS is not set
> # CONFIG_IP_NF_MATCH_OWNER is not set
> CONFIG_IP_NF_FILTER=m
> # CONFIG_IP_NF_TARGET_REJECT is not set
> CONFIG_IP_NF_NAT_NEEDED=y
> # CONFIG_IP_NF_MANGLE is not set
> # CONFIG_IP_NF_TARGET_LOG is not set
> # CONFIG_IP_NF_TARGET_ULOG is not set
> # CONFIG_IP_NF_TARGET_TCPMSS is not set
> # CONFIG_IP_NF_ARPTABLES is not set
> CONFIG_IP_NF_COMPAT_IPCHAINS=y
> # CONFIG_IP_NF_TARGET_NOTRACK is not set
> CONFIG_IP_NF_RAW=m
> CONFIG_XFRM=y
> CONFIG_XFRM_USER=m
> 
> #
> # SCTP Configuration (EXPERIMENTAL)
> #
> # CONFIG_IP_SCTP is not set
> # CONFIG_ATM is not set
> # CONFIG_BRIDGE is not set
> CONFIG_VLAN_8021Q=m
> # CONFIG_DECNET is not set
> CONFIG_LLC=m
> CONFIG_LLC2=m
> # CONFIG_IPX is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_NET_DIVERT is not set
> # CONFIG_ECONET is not set
> # CONFIG_WAN_ROUTER is not set
> # CONFIG_NET_FASTROUTE is not set
> # CONFIG_NET_HW_FLOWCONTROL is not set
> 
> #
> # QoS and/or fair queueing
> #
> # CONFIG_NET_SCHED is not set
> 
> #
> # Network testing
> #
> # CONFIG_NET_PKTGEN is not set
> CONFIG_NETPOLL=y
> # CONFIG_NETPOLL_RX is not set
> # CONFIG_NETPOLL_TRAP is not set
> CONFIG_NET_POLL_CONTROLLER=y
> # CONFIG_HAMRADIO is not set
> # CONFIG_IRDA is not set
> # CONFIG_BT is not set
> CONFIG_NETDEVICES=y
> CONFIG_DUMMY=m
> # CONFIG_BONDING is not set
> # CONFIG_EQUALIZER is not set
> CONFIG_TUN=y
> # CONFIG_ETHERTAP is not set
> # CONFIG_NET_SB1000 is not set
> 
> #
> # ARCnet devices
> #
> # CONFIG_ARCNET is not set
> 
> #
> # Ethernet (10 or 100Mbit)NFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
> # CONFIG_NET_FC is not set
> # CONFIG_SHAPER is not set
> CONFIG_NETCONSOLE=y
> 
> #
> # ISDN subsystem
> #
> # CONFIG_ISDN is not set
> 
> #
> # Telephony Support
> #
> # CONFIG_PHONE is not set
> 
> #
> # Input device support
> #
> CONFIG_INPUT=y
> 
> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=y
> CONFIG_INPUT_MOUSEDEV_PSAUX=y
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=1280
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=1024
> # CONFIG_INPUT_JOYDEV is not set
> # CONFIG_INPUT_TSDEV is not set
> # CONFIG_INPUT_EVDEV is not set
> # CONFIG_INPUT_EVBUG is not set
> 
> #
> # Input I/O drivers
> #
> # CONFIG_GAMEPORT is not set
> CONFIG_SOUND_GAMEPORT=y
> CONFIG_SERIO=y
> CONFIG_SERIO_I8042=y
> CONFIG_SERIO_SERPORT=y
> CONFIG_SERIO_CT82C710=y
> # CONFIG_SERIO_PARKBD is not set
> CONFIG_SERIO_PCIPS2=y
> 
> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=y
> CONFIG_KEYBOARD_ATKBD=y
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> CONFIG_INPUT_MOUSE=y
> CONFIG_MOUSE_PS2=y
> # CONFIG_MOUSE_SERIAL is not set
> # CONFIG_MOUSE_INPORT is not set
> # CONFIG_MOUSE_LOGIBM is not set
> # CONFIG_MOUSE_PC110PAD is not set
> # CONFIG_MOUSE_VSXXXAA is not set
> # CONFIG_INPUT_JOYSTICK is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> # CONFIG_INPUT_MISC is not set
> 
> #
> # Character devices
> #
> CONFIG_VT=y
> CONFIG_VT_CONSOLE=y
> CONFIG_HW_CONSOLE=y
> # CONFIG_SERIAL_NONSTANDARD is not set
> 
> #
> # Serial drivers
> #
> CONFIG_SERIAL_8250=y
> CONFIG_SERIAL_8250_CONSOLE=y
> CONFIG_SERIAL_8250_NR_UARTS=4
> CONFIG_SERIAL_8250_EXTENDED=y
> # CONFIG_SERIAL_8250_MANY_PORTS is not set
> CONFIG_SERIAL_8250_SHARE_IRQ=y
> CONFIG_SERIAL_8250_DETECT_IRQ=y
> # CONFIG_SERIAL_8250_MULTIPORT is not set
> # CONFIG_SERIAL_8250_RSA is not set
> 
> #
> # Non-8250 serial port support
> #
> CONFIG_SERIAL_CORE=y
> CONFIG_SERIAL_CORE_CONSOLE=y
> CONFIG_UNIX98_PTYS=y
> CONFIG_LEGACY_PTYS=y
> CONFIG_LEGACY_PTY_COUNT=256
> CONFIG_PRINTER=y
> # CONFIG_LP_CONSOLE is not set
> # CONFIG_PPDEV is not set
> # CONFIG_TIPAR is not set
> # CONFIG_QIC02_TAPE is not set
> 
> #
> # IPMI
> #
> # CONFIG_IPMI_HANDLER is not set
> 
> #
> # Watchdog Cards
> #
> # CONFIG_WATCHDOG is not set
> CONFIG_RTC=y
> # CONFIG_DTLK is not set
> # CONFIG_R3964 is not set
> # CONFIG_APPLICOM is not set
> 
> #
> # Ftape, the floppy tape device driver
> #
> # CONFIG_FTAPE is not set
> # CONFIG_AGP is not set
> # CONFIG_DRM is not set
> # CONFIG_RAW_DRIVER is not set
> 
> #
> # I2C support
> #
> # CONFIG_I2C is not set
> 
> #
> # Misc devices
> #
> 
> #
> # Multimedia devices
> #
> # CONFIG_VIDEO_DEV is not set
> 
> #
> # Digital Video Broadcasting Devices
> #
> # CONFIG_DVB is not set
> 
> #
> # Graphics support
> #
> # CONFIG_FB is not set
> 
> #
> # Console display driver support
> #
> CONFIG_VGA_CONSOLE=y
> # CONFIG_MDA_CONSOLE is not set
> CONFIG_DUMMY_CONSOLE=y
> 
> #
> # Sound
> #
> # CONFIG_SOUND is not set
> 
> #
> # USB support
> #
> # CONFIG_USB is not set
> 
> #
> # USB Gadget Support
> #
> # CONFIG_USB_GADGET is not set
> 
> #
> # File systems
> #
> CONFIG_EXT2_FS=y
> # CONFIG_EXT2_FS_XATTR is not set
> CONFIG_EXT3_FS=y
> CONFIG_EXT3_FS_XATTR=y
> CONFIG_EXT3_FS_POSIX_ACL=y
> # CONFIG_EXT3_FS_SECURITY is not set
> CONFIG_JBD=y
> # CONFIG_JBD_DEBUG is not set
> CONFIG_FS_MBCACHE=y
> CONFIG_REISERFS_FS=m
> # CONFIG_REISERFS_CHECK is not set
> # CONFIG_REISERFS_PROC_INFO is not set
> # CONFIG_REISERFS_FS_XATTR is not set
> # CONFIG_JFS_FS is not set
> CONFIG_FS_POSIX_ACL=y
> # CONFIG_XFS_FS is not set
> # CONFIG_MINIX_FS is not set
> # CONFIG_ROMFS_FS is not set
> # CONFIG_QUOTA is not set
> CONFIG_AUTOFS_FS=m
> # CONFIG_AUTOFS4_FS is not set
> 
> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=y
> CONFIG_JOLIET=y
> CONFIG_ZISOFS=y
> CONFIG_ZISOFS_FS=y
> # CONFIG_UDF_FS is not set
> 
> #
> # DOS/FAT/NT Filesystems
> #
> CONFIG_FAT_FS=y
> CONFIG_MSDOS_FS=y
> CONFIG_VFAT_FS=y
> # CONFIG_NTFS_FS is not set
> 
> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=y
> CONFIG_PROC_KCORE=y
> CONFIG_SYSFS=y
> # CONFIG_DEVFS_FS is not set
> # CONFIG_DEVPTS_FS_XATTR is not set
> CONFIG_TMPFS=y
> # CONFIG_HUGETLB_PAGE is not set
> CONFIG_RAMFS=y
> 
> #
> # Miscellaneous filesystems
> #
> # CONFIG_ADFS_FS is not set
> # CONFIG_AFFS_FS is not set
> # CONFIG_HFS_FS is not set
> # CONFIG_HFSPLUS_FS is not set
> # CONFIG_BEFS_FS is not set
> # CONFIG_BFS_FS is not set
> # CONFIG_EFS_FS is not set
> # CONFIG_CRAMFS is not set
> # CONFIG_VXFS_FS is not set
> # CONFIG_HPFS_FS is not set
> # CONFIG_QNX4FS_FS is not set
> # CONFIG_SYSV_FS is not set
> # CONFIG_UFS_FS is not set
> 
> #
> # Network File Systems
> #
> CONFIG_NFS_FS=m
> CONFIG_NFS_V3=y
> # CONFIG_NFS_V4 is not set
> # CONFIG_NFS_DIRECTIO is not set
> CONFIG_NFSD=m
> CONFIG_NFSD_V3=y
> # CONFIG_NFSD_V4 is not set
> # CONFIG_NFSD_TCP is not set
> CONFIG_LOCKD=m
> CONFIG_LOCKD_V4=y
> CONFIG_EXPORTFS=m
> CONFIG_SUNRPC=m
> # CONFIG_RPCSEC_GSS_KRB5 is not set
> # CONFIG_SMB_FS is not set
> CONFIG_CIFS=m
> # CONFIG_CIFS_STATS is not set
> # CONFIG_NCP_FS is not set
> # CONFIG_CODA_FS is not set
> # CONFIG_AFS_FS is not set
> 
> #
> # Partition Types
> #
> # CONFIG_PARTITION_ADVANCED is not set
> CONFIG_OSF_PARTITION=y
> CONFIG_MSDOS_PARTITION=y
> 
> #
> # Native Language Support
> #
> CONFIG_NLS=y
> CONFIG_NLS_DEFAULT="iso8859-1"
> CONFIG_NLS_CODEPAGE_437=y
> # CONFIG_NLS_CODEPAGE_737 is not set
> # CONFIG_NLS_CODEPAGE_775 is not set
> # CONFIG_NLS_CODEPAGE_850 is not set
> # CONFIG_NLS_CODEPAGE_852 is not set
> # CONFIG_NLS_CODEPAGE_855 is not set
> # CONFIG_NLS_CODEPAGE_857 is not set
> # CONFIG_NLS_CODEPAGE_860 is not set
> # CONFIG_NLS_CODEPAGE_861 is not set
> # CONFIG_NLS_CODEPAGE_862 is not set
> # CONFIG_NLS_CODEPAGE_863 is not set
> # CONFIG_NLS_CODEPAGE_864 is not set
> # CONFIG_NLS_CODEPAGE_865 is not set
> # CONFIG_NLS_CODEPAGE_866 is not set
> # CONFIG_NLS_CODEPAGE_869 is not set
> # CONFIG_NLS_CODEPAGE_936 is not set
> # CONFIG_NLS_CODEPAGE_950 is not set
> # CONFIG_NLS_CODEPAGE_932 is not set
> # CONFIG_NLS_CODEPAGE_949 is not set
> # CONFIG_NLS_CODEPAGE_874 is not set
> # CONFIG_NLS_ISO8859_8 is not set
> # CONFIG_NLS_CODEPAGE_1250 is not set
> # CONFIG_NLS_CODEPAGE_1251 is not set
> CONFIG_NLS_ISO8859_1=y
> # CONFIG_NLS_ISO8859_2 is not set
> # CONFIG_NLS_ISO8859_3 is not set
> # CONFIG_NLS_ISO8859_4 is not set
> # CONFIG_NLS_ISO8859_5 is not set
> # CONFIG_NLS_ISO8859_6 is not set
> # CONFIG_NLS_ISO8859_7 is not set
> # CONFIG_NLS_ISO8859_9 is not set
> # CONFIG_NLS_ISO8859_13 is not set
> # CONFIG_NLS_ISO8859_14 is not set
> # CONFIG_NLS_ISO8859_15 is not set
> # CONFIG_NLS_KOI8_R is not set
> # CONFIG_NLS_KOI8_U is not set
> CONFIG_NLS_UTF8=y
> 
> #
> # Profiling support
> #
> # CONFIG_PROFILING is not set
> 
> #
> # Kernel hacking
> #
> CONFIG_ALPHA_LEGACY_START_ADDRESS=y
> CONFIG_DEBUG_KERNEL=y
> CONFIG_MATHEMU=y
> # CONFIG_DEBUG_SLAB is not set
> CONFIG_MAGIC_SYSRQ=y
> # CONFIG_DEBUG_SPINLOCK is not set
> # CONFIG_DEBUG_RWLOCK is not set
> # CONFIG_DEBUG_SEMAPHORE is not set
> # CONFIG_DEBUG_INFO is not set
> 
> #
> # Security options
> #
> # CONFIG_SECURITY is not set
> 
> #
> # Cryptographic options
> #
> CONFIG_CRYPTO=y
> CONFIG_CRYPTO_HMAC=y
> CONFIG_CRYPTO_NULL=m
> CONFIG_CRYPTO_MD4=m
> CONFIG_CRYPTO_MD5=y
> CONFIG_CRYPTO_SHA1=y
> CONFIG_CRYPTO_SHA256=m
> CONFIG_CRYPTO_SHA512=m
> CONFIG_CRYPTO_DES=y
> CONFIG_CRYPTO_BLOWFISH=m
> CONFIG_CRYPTO_TWOFISH=m
> CONFIG_CRYPTO_SERPENT=m
> CONFIG_CRYPTO_AES=m
> CONFIG_CRYPTO_CAST5=m
> CONFIG_CRYPTO_CAST6=m
> CONFIG_CRYPTO_ARC4=m
> CONFIG_CRYPTO_DEFLATE=m
> CONFIG_CRYPTO_MICHAEL_MIC=m
> CONFIG_CRYPTO_CRC32C=m
> CONFIG_CRYPTO_TEST=m
> 
> #
> # Library routines
> #
> CONFIG_CRC32=y
> CONFIG_LIBCRC32C=m
> CONFIG_ZLIB_INFLATE=y
> CONFIG_ZLIB_DEFLATE=m
> -
> To unsubscribe from this list: send the line "unsubscribe linux-alpha" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
