From: "Will L Givens" <wlgivens@gmail.com>
Subject: Build Error with GLIBC-2.11.90
Date: Wed, 17 Mar 2010 00:26:53 -0500
Message-ID: <008901cac592$74562460$5d026d20$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:mime-version:content-type:content-transfer-encoding
         :x-mailer:thread-index:content-language:x-cr-hashedpuzzle
         :x-cr-puzzleid;
        bh=/3pPDWQRooeFwidVn2DrA3Oj64t3N1/NTip8V7Xy7cY=;
        b=RWIPKyc9SWSG9pNzHeqFZ1v5NNPYMb+ARyJ75u5tJWxE9Fbyc7cvwBpJ2AI96cDf1n
         uPF+lTpoyWJ0og6f72Nd1bLwdnR4XhCtkhxUhoM2dZILPPqKr8s16q+b7Ka6G5COP/Vx
         vm9oHlT8Ohg7YAdtusXr/EE1tkix84BItTTS0=
Content-Language: en-us
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: libc-alpha@sourceware.org
Cc: linux-alpha@vger.kernel.org

This error was obtained using GCC-4.3.4 and Binutils-2.20.1...

CC=/usr/local/bin/gcc-4.3.4 CXX=/usr/local/bin/g++-4.3.4 \
 CPP=/usr/bin/cpp-4.3.4\
 CFLAGS="-O2 -mtune=ev67 -mieee -DNDEBUG=1 -finline-limit=2000 \
 -fno-strict-aliasing -I/usr/include" \
 ../glibc-2.11.90/configure \
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
 --enable-kernel=2.6 \
 --enable-add-ons=ports,nptl \
 --disable-profile \
 --with-selinux \
 libc_cv_forced_unwind=yes libc_cv_c_cleanup=yes

make -sj2
assert-perr.c: In function '__assert_perror_fail':
assert-perr.c:70: warning: assignment makes pointer from integer without a
cast
assert-perr.c:70: warning: assignment makes pointer from integer without a
cast
assert-perr.c:70: warning: assignment makes pointer from integer without a
cast
assert-perr.c:70: warning: assignment makes pointer from integer without a
cast
mkdir /usr/src/redhat/BUILD/glibc-2.11-build/ctype
mkdir /usr/src/redhat/BUILD/glibc-2.11-build/intl
mkdir /usr/src/redhat/BUILD/glibc-2.11-build/catgets
mkdir /usr/src/redhat/BUILD/glibc-2.11-build/math
../ports/sysdeps/alpha/fpu/s_isnan.c:50: warning: conflicting types for
built-in function 'isnanf'
../ports/sysdeps/alpha/fpu/s_isnan.c:50: warning: conflicting types for
built-in function 'isnanf'
mkdir /usr/src/redhat/BUILD/glibc-2.11-build/setjmp
mkdir /usr/src/redhat/BUILD/glibc-2.11-build/signal
mkdir /usr/src/redhat/BUILD/glibc-2.11-build/stdlib
mkdir /usr/src/redhat/BUILD/glibc-2.11-build/stdio-common
psiginfo.c: In function 'psiginfo':
psiginfo.c:173: warning: format '%ld' expects type 'long int', but argument
3 has type 'int'
*** errlist.c count 139 vs Versions sys_errlist@GLIBC_2.4 count 138
make[2]: ***
[/usr/src/redhat/BUILD/glibc-2.11-build/stdio-common/errlist-compat.c] Error
1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [stdio-common/subdir_lib] Error 2
make: *** [all] Error 2
[root@jericho glibc-2.11.90]#

