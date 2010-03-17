From: "Will L Givens" <wlgivens@gmail.com>
Subject: Build Error with GLIBC-2.11.1
Date: Wed, 17 Mar 2010 00:26:50 -0500
Message-ID: <008801cac592$72bff400$583fdc00$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:mime-version:content-type:content-transfer-encoding
         :x-mailer:thread-index:content-language:x-cr-hashedpuzzle
         :x-cr-puzzleid;
        bh=/ro1W7Djm5U5zB4HNjNAmczNqtBjmySFkjFIwIQL0o0=;
        b=P+iaLlajDRt4+/9k/rnnognXUUywEQ5yEaagIZ+gBzT4NzQpK1FL8B7iXoLue3YAp8
         4DNksYV8zJ0pkQza3rOTcxip4Erc3IxZh2saWY301dXAxjHjGZmlVavEvJDI1L/ne5L8
         loQDYaDfRdCpKX9Y2MaXniEPZhhQ8NfwYsqA0=
Content-Language: en-us
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: libc-alpha@sourceware.org
Cc: linux-alpha@vger.kernel.org

This error was obtained using GCC-3.4.3 and Binutils-2.20.1...

mkdir -p ../glibc-2.11.1-build
cd ../glibc-2.11.1-build


CC=gcc-3.4.3 CXX=g++-3.4.3 CPP=/usr/bin/cpp-3.4.3 \
 CFLAGS="-O2 -mtune=ev67 -mieee -finline-limit=2000 \
 -fno-strict-aliasing -D__ASSUME_F_GETOWN_EX" \
 ../glibc-2.11.1/configure \
 --prefix=/usr \
 --build=alphaev67-alpha-linux \
 --bindir=/usr/bin \
 --sbindir=/sbin \
 --sysconfdir=/etc \
 --datadir=/usr/share \
 --includedir=/usr/share/include \
 --libdir=/usr/lib \
 --libexecdir=/usr/libexec \
 --localstatedir=/var \
 --sharedstatedir=/var/com \
 --mandir=/usr/share/man \
 --infodir=/usr/share/info \
 --enable-shared \
 --enable-kernel=2.6  # --with-headers=/usr/src/linux\
 --enable-add-ons=ports,nptl \
 --disable-sanity-checks \
 --disable-profile \
 --without-selinux \
 libc_cv_forced_unwind=yes libc_cv_c_cleanup=yes

make -j2

) | gcc-3.4.3 -c  -I../include -I/usr/src/redhat/BUILD/glibc-2.11.1-build/io
-I/usr/src/redhat/BUILD/glibc-2.11.1-build -I../ports/sysdeps/alpha/elf
-I../ports/sysdeps/unix/sysv/linux/alpha/alphaev67/fpu
-I../ports/sysdeps/alpha/alphaev67/fpu -I../ports/sysdeps/alpha/alphaev6/fpu
-I../ports/sysdeps/unix/sysv/linux/alpha/alphaev67
-I../ports/sysdeps/unix/sysv/linux/alpha/fpu -I../ports/sysdeps/alpha/fpu
-I../ports/sysdeps/unix/sysv/linux/alpha/nptl
-I../ports/sysdeps/unix/sysv/linux/alpha
-I../sysdeps/unix/sysv/linux/wordsize-64 -I../sysdeps/ieee754/ldbl-64-128
-I../sysdeps/ieee754/ldbl-opt -I../nptl/sysdeps/unix/sysv/linux
-I../nptl/sysdeps/pthread -I../sysdeps/pthread
-I../ports/sysdeps/unix/sysv/linux -I../sysdeps/unix/sysv/linux
-I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman
-I../sysdeps/unix/inet -I../nptl/sysdeps/unix/sysv
-I../ports/sysdeps/unix/sysv -I../sysdeps/unix/sysv
-I../ports/sysdeps/unix/alpha -I../nptl/sysdeps/unix -I../ports/sysdeps/unix
-I../sysdeps/unix -I../sysdeps/posix -I../ports/sysdeps/alpha/alphaev67
-I../ports/sysdeps/alpha/alphaev6 -I../ports/sysdeps/alpha/alphaev5
-I../ports/sysdeps/alpha/nptl -I../ports/sysdeps/alpha
-I../sysdeps/wordsize-64 -I../sysdeps/ieee754/ldbl-128
-I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/flt-32
-I../ports/sysdeps/alpha/soft-fp -I../sysdeps/ieee754
-I../sysdeps/generic/elf -I../sysdeps/generic -I../nptl -I../ports  -I..
-I../libio -I.  -D_LIBC_REENTRANT -include ../include/libc-symbols.h
-DASSEMBLER   -Wa,--noexecstack   -o
/usr/src/redhat/BUILD/glibc-2.11.1-build/io/flock.o -x assembler-with-cpp -
-MD -MP -MF /usr/src/redhat/BUILD/glibc-2.11.1-build/io/flock.o.dt -MT
/usr/src/redhat/BUILD/glibc-2.11.1-build/io/flock.o
../sysdeps/unix/sysv/linux/fcntl.c: In function `do_fcntl':
../sysdeps/unix/sysv/linux/fcntl.c:43: error: storage size of 'fex' isn't
known
../sysdeps/unix/sysv/linux/fcntl.c:44: error: `F_GETOWN_EX' undeclared
(first use in this function)
../sysdeps/unix/sysv/linux/fcntl.c:44: error: (Each undeclared identifier is
reported only once
../sysdeps/unix/sysv/linux/fcntl.c:44: error: for each function it appears
in.)
../sysdeps/unix/sysv/linux/fcntl.c:46: error: `F_OWNER_GID' undeclared
(first use in this function)
../sysdeps/unix/sysv/linux/fcntl.c:43: warning: unused variable `fex'
make[2]: *** [/usr/src/redhat/BUILD/glibc-2.11.1-build/io/fcntl.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory `/usr/src/redhat/BUILD/glibc-2.11.1/io'
make[1]: *** [io/subdir_lib] Error 2
make[1]: Leaving directory `/usr/src/redhat/BUILD/glibc-2.11.1'
make: *** [all] Error 2
[root@jericho glibc-2.11.1]# pico -w +43
../glibc-2.11.1/sysdeps/unix/sysv/linux/fcntl.c
[root@jericho glibc-2.11.1]# pico -w +43
../glibc-2.11.1/ports/sysdeps/unix/sysv/linux/alpha/bits/fcntl.h
[root@jericho glibc-2.11.1]# pico -w +43
../glibc-2.11.1/sysdeps/unix/sysv/linux/fcntl.c
[root@jericho glibc-2.11.1]# pico -w +43
../glibc-2.11/sysdeps/unix/sysv/linux/fcntl.c
glibc-2.11.1/         glibc-2.11.1.tar.bz2  glibc-2.11-build/
glibc-2.11.1-build/   glibc-2.11.90/
[root@jericho glibc-2.11.1]# pico -w +43
../glibc-2.11.90/sysdeps/unix/sysv/linux/fcntl.c
[root@jericho glibc-2.11.1]# pico -w +43
../glibc-2.11.1/sysdeps/unix/sysv/linux/fcntl.c
[root@jericho glibc-2.11.1]#

