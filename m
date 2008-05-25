From: Wakko Warner <wakko@animx.eu.org>
Subject: Compile error with make bootpfile (2.6.25.4)
Date: Sun, 25 May 2008 18:31:39 -0400
Message-ID: <20080525223139.GA6378@animx.eu.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

I'm not on this list, so keep me CCd.  I am on linux-kernel however.

I'm cross compiling a kernel for my alpha on x86.  I'm seeing this:
  gcc -Wp,-MD,arch/alpha/boot/tools/.objstrip.d -Iarch/alpha/boot -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -o arch/alpha/boot/tools/objstrip /usr/src/linux/dist/2.6.25.4/arch/alpha/boot/tools/objstrip.c
/usr/src/linux/dist/2.6.25.4/arch/alpha/boot/tools/objstrip.c: In function 'main':
/usr/src/linux/dist/2.6.25.4/arch/alpha/boot/tools/objstrip.c:189: warning: format '%#016lx' expects type 'long unsigned int', but argument 5 has type 'Elf32_Addr'
/usr/src/linux/dist/2.6.25.4/arch/alpha/boot/tools/objstrip.c:196: error: 'struct exec' has no member named 'fh'
/usr/src/linux/dist/2.6.25.4/arch/alpha/boot/tools/objstrip.c:202: error: 'struct exec' has no member named 'fh'
/usr/src/linux/dist/2.6.25.4/arch/alpha/boot/tools/objstrip.c:202: error: 'struct exec' has no member named 'ah'
/usr/src/linux/dist/2.6.25.4/arch/alpha/boot/tools/objstrip.c:214: error: 'struct exec' has no member named 'ah'
/usr/src/linux/dist/2.6.25.4/arch/alpha/boot/tools/objstrip.c:214: error: 'struct exec' has no member named 'ah'
/usr/src/linux/dist/2.6.25.4/arch/alpha/boot/tools/objstrip.c:215: error: 'struct exec' has no member named 'ah'
/usr/src/linux/dist/2.6.25.4/arch/alpha/boot/tools/objstrip.c:219: error: 'struct exec' has no member named 'ah'
/usr/src/linux/dist/2.6.25.4/arch/alpha/boot/tools/objstrip.c:220: error: 'struct exec' has no member named 'ah'
/usr/src/linux/dist/2.6.25.4/arch/alpha/boot/tools/objstrip.c:263: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'size_t'
make[2]: *** [arch/alpha/boot/tools/objstrip] Error 1
make[1]: *** [bootpfile] Error 2
make: *** [sub-make] Error 2
make: Leaving directory `/usr/src/linux/dist/2.6.25.4'

I called make like this:
make -C /usr/src/linux/dist/2.6.25.4 O=$PWD ARCH=alpha V=1 CROSS_COMPILE=alpha-linux-gnu- bootpfile

My host gcc is:
gcc (GCC) 4.1.3 20070514 (prerelease) (Debian 4.1.2-7)

My target gcc is:
alpha-linux-gnu-gcc (GCC) 4.1.3 20070514 (prerelease) (Debian 4.1.2-7)

My intent was to netboot my alpha to install the initial system.

-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???
