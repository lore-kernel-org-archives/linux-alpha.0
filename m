From: "Riccardo Vestrini" <riccardov@sssup.it>
Subject: Re: make bootimage and make bootpfile not working
Date: Tue, 06 Jul 2004 19:34:47 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <web-4800849@sssup.it>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="_===4800849====sssup.it===_"
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org

This is a multi-part MIME message

--_===4800849====sssup.it===_
Content-Type: text/plain; charset="ISO-8859-1"; format="flowed"
Content-Transfer-Encoding: 8bit

i forgot to sent that on list, someone can find it useful 
(may be...)

--_===4800849====sssup.it===_
Content-Type: message/rfc822

Return-Path: <riccardov@sssup.it>
Received: from [193.205.80.66] (account riccardov@sssup.it)
  by sssup.it (CommuniGate Pro WebUser 4.1.8)
  with HTTP id 4798984; Tue, 06 Jul 2004 17:41:06 +0200
From: "Riccardo Vestrini" <riccardov@sssup.it>
Subject: Re: make bootimage and make bootpfile not working
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: riccardov@sssup.it
X-Mailer: CommuniGate Pro WebUser Interface v.4.1.8
Date: Tue, 06 Jul 2004 17:41:06 +0200
Message-ID: <web-4798984@sssup.it>
In-Reply-To: <20040706145149.GG18841@lug-owl.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format="flowed"
Content-Transfer-Encoding: 8bit

>> I tried many times to obtain a network-bootable kernel 
>> image both with kernel 2.6.7 and 2.4.26, but I always 
>>got 
>> link errors while executing make bootpfile and make 
>> bootimage
>
>Please provide *exact* error messages.
>
ok, obviously they are rather long ...

kernel 2.6.7
gcc 3.3.3
digital personal workstation 500au (miata)
debian gnu/linux sid

$ make bootimage
make[1]: `arch/alpha/kernel/asm-offsets.s' is up to date.
   CHK     include/linux/compile.h
   HOSTCC  arch/alpha/boot/tools/mkbb
arch/alpha/boot/tools/mkbb.c:85: warning: return type 
defaults to `int'
arch/alpha/boot/tools/mkbb.c: In function `main':
arch/alpha/boot/tools/mkbb.c:95: warning: implicit 
declaration of function `exit'
arch/alpha/boot/tools/mkbb.c:117: warning: int format, 
different type arg (arg 3)
arch/alpha/boot/tools/mkbb.c:125: warning: int format, 
different type arg (arg 3)
   AS      arch/alpha/boot/head.o
   HOSTCC  arch/alpha/boot/tools/objstrip
   OBJSTRIP arch/alpha/boot/vmlinux.nh
arch/alpha/boot/tools/objstrip: extracting 
0xfffffc0000310000-0xfffffc0000516c08 (at 2000)
arch/alpha/boot/tools/objstrip: copying 2124808 byte from 
vmlinux
arch/alpha/boot/tools/objstrip: zero-filling bss and 
aligning to 0 with 114016 bytes
echo "#define KERNEL_SIZE `ls -l 
arch/alpha/boot/vmlinux.nh | awk '{print $5}'`" > 
arch/alpha/boot/ksize.hT
cmp -s arch/alpha/boot/ksize.hT arch/alpha/boot/ksize.h || 
mv -f arch/alpha/boot/ksize.hT arch/alpha/boot/ksize.h
rm -f arch/alpha/boot/ksize.hT
   CC      arch/alpha/boot/main.o
arch/alpha/boot/main.c: In function `load':
arch/alpha/boot/main.c:135: warning: passing arg 3 of 
`callback_read' makes pointer from integer without a cast
   LD      arch/alpha/boot/bootloader
arch/alpha/boot/main.o(.text+0x34): In function 
`pal_init':
: undefined reference to `srm_printk'
arch/alpha/boot/main.o(.text+0x8c): In function 
`pal_init':
: undefined reference to `srm_printk'
arch/alpha/boot/main.o(.text+0xc0): In function 
`pal_init':
: undefined reference to `srm_printk'
arch/alpha/boot/main.o(.text+0xcc): In function 
`pal_init':
: undefined reference to `srm_printk'
arch/alpha/boot/main.o(.text+0xe8): In function 
`pal_init':
: undefined reference to `srm_printk'
arch/alpha/boot/main.o(.text+0xfc): more undefined 
references to `srm_printk' follow
arch/alpha/boot/main.o(.text+0x1a8): In function 
`start_kernel':
: undefined reference to `callback_getenv'
arch/alpha/boot/main.o(.text+0x1b8): In function 
`start_kernel':
: undefined reference to `callback_getenv'
arch/alpha/boot/main.o(.text+0x1cc): In function 
`start_kernel':
: undefined reference to `callback_open'
arch/alpha/boot/main.o(.text+0x1d8): In function 
`start_kernel':
: undefined reference to `callback_open'
arch/alpha/boot/main.o(.text+0x200): In function 
`start_kernel':
: undefined reference to `srm_printk'
arch/alpha/boot/main.o(.text+0x210): In function 
`start_kernel':
: undefined reference to `srm_printk'
arch/alpha/boot/main.o(.text+0x220): In function 
`start_kernel':
: undefined reference to `callback_getenv'
arch/alpha/boot/main.o(.text+0x22c): In function 
`start_kernel':
: undefined reference to `callback_getenv'
arch/alpha/boot/main.o(.text+0x254): In function 
`start_kernel':
: undefined reference to `srm_printk'
arch/alpha/boot/main.o(.text+0x260): In function 
`start_kernel':
: undefined reference to `srm_printk'
arch/alpha/boot/main.o(.text+0x288): In function 
`start_kernel':
: undefined reference to `callback_read'
arch/alpha/boot/main.o(.text+0x29c): In function 
`start_kernel':
: undefined reference to `callback_read'
arch/alpha/boot/main.o(.text+0x2ac): In function 
`start_kernel':
: undefined reference to `callback_close'
arch/alpha/boot/main.o(.text+0x2b8): In function 
`start_kernel':
: undefined reference to `callback_close'
arch/alpha/boot/main.o(.text+0x2e0): In function 
`start_kernel':
: undefined reference to `srm_printk'
arch/alpha/boot/main.o(.text+0x2e4): In function 
`start_kernel':
: undefined reference to `srm_printk'
arch/alpha/boot/main.o(.text+0x2f4): In function 
`start_kernel':
: undefined reference to `callback_getenv'
arch/alpha/boot/main.o(.text+0x308): In function 
`start_kernel':
: undefined reference to `callback_getenv'
arch/alpha/boot/main.o(.text+0x324): In function 
`start_kernel':
: undefined reference to `strcpy'
arch/alpha/boot/main.o(.text+0x338): In function 
`start_kernel':
: undefined reference to `strcpy'
arch/alpha/boot/main.o(.text+0x348): In function 
`start_kernel':
: undefined reference to `srm_printk'
arch/alpha/boot/main.o(.text+0x350): In function 
`start_kernel':
: undefined reference to `srm_printk'
make[1]: *** [arch/alpha/boot/bootloader] Error 1
make: *** [bootimage] Error 2


$ make bootpfile
make[1]: `arch/alpha/kernel/asm-offsets.s' is up to date.
   CHK     include/linux/compile.h
   AS      arch/alpha/boot/head.o
echo "#define KERNEL_SIZE `ls -l 
arch/alpha/boot/vmlinux.nh | awk '{print $5}'`" > 
arch/alpha/boot/ksize.hT
cmp -s arch/alpha/boot/ksize.hT arch/alpha/boot/ksize.h || 
mv -f arch/alpha/boot/ksize.hT arch/alpha/boot/ksize.h
rm -f arch/alpha/boot/ksize.hT
   CC      arch/alpha/boot/bootp.o
   LD      arch/alpha/boot/bootpheader
lib/lib.a(vsprintf.o)(.text+0x538): In function 
`vsnprintf':
: undefined reference to `printk'
lib/lib.a(vsprintf.o)(.text+0x54c): In function 
`vsnprintf':
: undefined reference to `printk'
make[1]: *** [arch/alpha/boot/bootpheader] Error 1
make: *** [bootpfile] Error 2





----------- EXTRA INFO ---------
$ make bootpzfile

this works fine, but I had to modify file lib/dump_stack.c 
this (ugly) way commenting printk, otherwise I got link 
errors

#include <linux/kernel.h>
#include <linux/module.h>
void dump_stack(void)
{
//      printk(KERN_NOTICE
//              "This architecture does not implement 
dump_stack()\n");
}
EXPORT_SYMBOL(dump_stack);


make[1]: `arch/alpha/kernel/asm-offsets.s' is up to date.
   CHK     include/linux/compile.h
   AS      arch/alpha/boot/head.o
   GZIP    arch/alpha/boot/vmlinux.nh.gz
echo "#define KERNEL_SIZE `ls -l 
arch/alpha/boot/vmlinux.nh | awk '{print $5}'`" > 
arch/alpha/boot/kzsize.hT
echo "#define KERNEL_Z_SIZE `ls -l 
arch/alpha/boot/vmlinux.nh.gz | awk '{print $5}'`" >> 
arch/alpha/boot/kzsize.hT
cmp -s arch/alpha/boot/kzsize.hT arch/alpha/boot/kzsize.h 
|| mv -f arch/alpha/boot/kzsize.hT 
arch/alpha/boot/kzsize.h
rm -f arch/alpha/boot/kzsize.hT
   CC      arch/alpha/boot/bootpz.o
   CC      arch/alpha/boot/misc.o
   LD      arch/alpha/boot/bootpzheader
   OBJSTRIP arch/alpha/boot/tools/bootpzh
arch/alpha/boot/tools/objstrip: 2 program headers (forgot 
to link with -N?)
arch/alpha/boot/tools/objstrip: extracting 
0x00000020000000-0x00000020005e34 (at 10000)
arch/alpha/boot/tools/objstrip: copying 24116 byte from 
arch/alpha/boot/bootpzheader
arch/alpha/boot/tools/objstrip: zero-filling bss and 
aligning to 512 with 3532 bytes
cat arch/alpha/boot/tools/bootpzh 
arch/alpha/boot/vmlinux.nh.gz > arch/alpha/boot/bootpzfile


the .config file I used (i removed commented lines, since 
I selected only a minimal set of options)

CONFIG_ALPHA=y
CONFIG_64BIT=y
CONFIG_MMU=y
CONFIG_RWSEM_XCHGADD_ALGORITHM=y
CONFIG_GENERIC_ISA_DMA=y

CONFIG_EXPERIMENTAL=y
CONFIG_CLEAN_COMPILE=y
CONFIG_STANDALONE=y
CONFIG_BROKEN_ON_SMP=y

CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_POSIX_MQUEUE=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_SYSCTL=y
CONFIG_LOG_BUF_SHIFT=14
CONFIG_EMBEDDED=y
CONFIG_FUTEX=y
CONFIG_EPOLL=y
CONFIG_IOSCHED_NOOP=y
CONFIG_IOSCHED_DEADLINE=y
CONFIG_CC_OPTIMIZE_FOR_SIZE=y

CONFIG_MODULES=y
CONFIG_MODULE_UNLOAD=y
CONFIG_MODULE_FORCE_UNLOAD=y
CONFIG_OBSOLETE_MODPARM=y
CONFIG_KMOD=y

CONFIG_ALPHA_MIATA=y
CONFIG_ISA=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_ALPHA_EV5=y
CONFIG_ALPHA_CIA=y
CONFIG_ALPHA_EV56=y
CONFIG_ALPHA_PYXIS=y
CONFIG_ALPHA_SRM=y
CONFIG_EARLY_PRINTK=y
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_MISC=m

CONFIG_PNP=y

CONFIG_BLK_DEV_FD=m

CONFIG_SCSI=m

CONFIG_BLK_DEV_SD=m

CONFIG_SCSI_QLOGIC_ISP=m

CONFIG_NET=y

CONFIG_PACKET=y
CONFIG_PACKET_MMAP=y
CONFIG_NETLINK_DEV=y
CONFIG_UNIX=y
CONFIG_INET=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y

CONFIG_NETDEVICES=y

CONFIG_NET_ETHERNET=y

CONFIG_NET_TULIP=y
CONFIG_DE4X5=y

CONFIG_INPUT=y

CONFIG_SOUND_GAMEPORT=y
CONFIG_SERIO=m
CONFIG_SERIO_I8042=m

CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ATKBD=m

CONFIG_VT=y
CONFIG_VT_CONSOLE=y
CONFIG_HW_CONSOLE=y

CONFIG_UNIX98_PTYS=y

CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y

CONFIG_XFS_FS=m
CONFIG_XFS_RT=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_SECURITY=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_QUOTACTL=y

CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_RAMFS=y

CONFIG_NFS_FS=y
CONFIG_NFS_V3=y
CONFIG_ROOT_NFS=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_SUNRPC=y

CONFIG_PARTITION_ADVANCED=y
CONFIG_OSF_PARTITION=y
CONFIG_MSDOS_PARTITION=y
CONFIG_BSD_DISKLABEL=y

CONFIG_ALPHA_LEGACY_START_ADDRESS=y
CONFIG_DEBUG_KERNEL=y
CONFIG_MATHEMU=y

CONFIG_CRC32=y


--- kernel 2.4.26 ---
in the last minute I was able to make bootpfile, make 
bootpzfile and make bootimage correctly with kernel 
2.4.26,
but I had to comment out calls to printk in 
lib/dump_stack.c and lib/vsprintf.c

otherwise I got link errors, complaining that printk was 
undefined

I used almost the same .config than with 2.6



I will post exact error message after a recompilation ...



                         Riccardo Vestrini
                        <riccardov@sssup.it>

--_===4800849====sssup.it===_--
