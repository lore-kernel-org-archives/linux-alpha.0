From: Tobias Klausmann <klausman@schwarzvogel.de>
Subject: BOOTP image build broken?
Date: Mon, 20 Apr 2009 19:17:40 +0200
Message-ID: <20090420171740.GA10844@eric.schwarzvogel.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

Hi! 

Apparently, with recent kernels (I tested .28, .29 and 30rc2),
the bootpfile make target is broken:

# make bootpfile
  CHK     include/linux/version.h
  CHK     include/linux/utsrelease.h
  SYMLINK include/asm -> include/asm-alpha
  CALL    scripts/checksyscalls.sh
<stdin>:1377:2: warning: #warning syscall timerfd_create not implemented
<stdin>:1385:2: warning: #warning syscall fallocate not implemented
<stdin>:1389:2: warning: #warning syscall timerfd_settime not implemented
<stdin>:1393:2: warning: #warning syscall timerfd_gettime not implemented
<stdin>:1397:2: warning: #warning syscall signalfd4 not implemented
<stdin>:1401:2: warning: #warning syscall eventfd2 not implemented
<stdin>:1405:2: warning: #warning syscall epoll_create1 not implemented
<stdin>:1409:2: warning: #warning syscall dup3 not implemented
<stdin>:1413:2: warning: #warning syscall pipe2 not implemented
<stdin>:1417:2: warning: #warning syscall inotify_init1 not implemented
  CHK     include/linux/compile.h
  AS      arch/alpha/boot/head.o
  HOSTCC  arch/alpha/boot/tools/objstrip
arch/alpha/boot/tools/objstrip.c: In function 'main':
arch/alpha/boot/tools/objstrip.c:153: warning: implicit declaration of function 'elf_check_arch'
/tmp/ccHLFEcL.o: In function `main':
(.text+0x72c): undefined reference to `elf_check_arch'
/tmp/ccHLFEcL.o: In function `main':
(.text+0x730): undefined reference to `elf_check_arch'
collect2: ld returned 1 exit status
make[1]: *** [arch/alpha/boot/tools/objstrip] Error 1
make: *** [bootpfile] Error 2

# make bootpfile V=1
[...]
make -f scripts/Makefile.build obj=arch/alpha/boot arch/alpha/boot/bootpfile
  gcc -Wp,-MD,arch/alpha/boot/.head.o.d  -nostdinc -isystem /usr/lib/gcc/alpha-unknown-linux-gnu/4.3.3/include -D__KERNEL__ -Iinclude  -I/usr/src/linux-2.6.28/arch/alpha/include -include include/linux/autoconf.h -D__ASSEMBLY__     -c -o arch/alpha/boot/head.o arch/alpha/boot/head.S
  gcc -Wp,-MD,arch/alpha/boot/tools/.objstrip.d -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer     -o arch/alpha/boot/tools/objstrip arch/alpha/boot/tools/objstrip.c  
arch/alpha/boot/tools/objstrip.c: In function 'main':
arch/alpha/boot/tools/objstrip.c:153: warning: implicit declaration of function 'elf_check_arch'
/tmp/cc3g1zC5.o: In function `main':
(.text+0x72c): undefined reference to `elf_check_arch'
/tmp/cc3g1zC5.o: In function `main':
(.text+0x730): undefined reference to `elf_check_arch'
collect2: ld returned 1 exit status
make[1]: *** [arch/alpha/boot/tools/objstrip] Error 1
make: *** [bootpfile] Error 2
#

After digging around a bit I copied over this from
arch/alpha/include/asm/elf.h in the hopes it was just a missing
include:

#define elf_check_arch(x) ((x)->e_machine == EM_ALPHA)

But that didn't help much, either:

# make bootpfile
  HOSTCC  arch/alpha/boot/tools/objstrip
  OBJSTRIP arch/alpha/boot/vmlinux.nh
arch/alpha/boot/tools/objstrip: 2 program headers (forgot to link with -N?)
arch/alpha/boot/tools/objstrip: extracting 0xfffffc0000310000-0xfffffc000076fe44 (at 100)
arch/alpha/boot/tools/objstrip: copying 4587076 byte from vmlinux
arch/alpha/boot/tools/objstrip: zero-filling bss and aligning to 0 with 357980 bytes
echo "#define KERNEL_SIZE `ls -l arch/alpha/boot/vmlinux.nh | awk '{print $5}'`" > arch/alpha/boot/ksize.hT
cmp -s arch/alpha/boot/ksize.hT arch/alpha/boot/ksize.h || mv -f arch/alpha/boot/ksize.hT arch/alpha/boot/ksize.h
rm -f arch/alpha/boot/ksize.hT
  CC      arch/alpha/boot/bootp.o
  LD      arch/alpha/boot/bootpheader
lib/lib.a(vsprintf.o): In function `vsnprintf':
(.text+0x1b70): undefined reference to `sprint_symbol'
lib/lib.a(vsprintf.o): In function `vsnprintf':
(.text+0x1b84): undefined reference to `sprint_symbol'
lib/lib.a(vsprintf.o): In function `vsnprintf':
(.text+0x1ccc): undefined reference to `warn_on_slowpath'
lib/lib.a(vsprintf.o): In function `vsnprintf':
(.text+0x1cdc): undefined reference to `warn_on_slowpath'
make[1]: *** [arch/alpha/boot/bootpheader] Error 1
make: *** [bootpfile] Error 2

# make bootpfile V=1
[...]
make -f scripts/Makefile.build obj=arch/alpha/boot arch/alpha/boot/bootpfile
  gcc -Wp,-MD,arch/alpha/boot/.head.o.d  -nostdinc -isystem /usr/lib/gcc/alpha-unknown-linux-gnu/4.3.3/include -D__KERNEL__ -Iinclude  -I/usr/src/linux-2.6.28/arch/alpha/include -include include/linux/autoconf.h -D__ASSEMBLY__     -c -o arch/alpha/boot/head.o arch/alpha/boot/head.S
echo "#define KERNEL_SIZE `ls -l arch/alpha/boot/vmlinux.nh | awk '{print $5}'`" > arch/alpha/boot/ksize.hT
cmp -s arch/alpha/boot/ksize.hT arch/alpha/boot/ksize.h || mv -f arch/alpha/boot/ksize.hT arch/alpha/boot/ksize.h
rm -f arch/alpha/boot/ksize.hT
  gcc -Wp,-MD,arch/alpha/boot/.bootp.o.d  -nostdinc -isystem /usr/lib/gcc/alpha-unknown-linux-gnu/4.3.3/include -D__KERNEL__ -Iinclude  -I/usr/src/linux-2.6.28/arch/alpha/include -include include/linux/autoconf.h -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -O2 -pipe -mno-fp-regs -ffixed-8 -msmall-data -fno-jump-tables -mcpu=ev67 -Wa,-mev6 -fno-stack-protector -fomit-frame-pointer -Wdeclaration-after-statement -Wno-pointer-sign  -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(bootp)"  -D"KBUILD_MODNAME=KBUILD_STR(bootp)"  -c -o arch/alpha/boot/bootp.o arch/alpha/boot/bootp.c
  ld    -static -uvsprintf -T   arch/alpha/boot/bootloader.lds arch/alpha/boot/head.o arch/alpha/boot/bootp.o lib/lib.a arch/alpha/lib/lib.a -o arch/alpha/boot/bootpheader 
lib/lib.a(vsprintf.o): In function `vsnprintf':
(.text+0x1b70): undefined reference to `sprint_symbol'
lib/lib.a(vsprintf.o): In function `vsnprintf':
(.text+0x1b84): undefined reference to `sprint_symbol'
lib/lib.a(vsprintf.o): In function `vsnprintf':
(.text+0x1ccc): undefined reference to `warn_on_slowpath'
lib/lib.a(vsprintf.o): In function `vsnprintf':
(.text+0x1cdc): undefined reference to `warn_on_slowpath'
make[1]: *** [arch/alpha/boot/bootpheader] Error 1
make: *** [bootpfile] Error 2

Any suggestions? 

Regards,
Tobias

-- 
prom_printf("No VAC. Get some bucks and buy a real computer.");
	linux-2.6.19/arch/sparc/mm/sun4c.c
