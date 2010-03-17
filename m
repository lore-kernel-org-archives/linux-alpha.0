From: Matt Turner <mattst88@gmail.com>
Subject: Re: Build Error with GLIBC-2.11.1
Date: Wed, 17 Mar 2010 11:17:29 -0400
Message-ID: <b4198de61003170817p4065900dw6454208fe3a91f93@mail.gmail.com>
References: <008801cac592$72bff400$583fdc00$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=BgJFDFe56OyXIWsPhimS7d7RBsHUEI+qdqv60CXBhfw=;
        b=cz4gidhFwF0gv6552VOE+Yq1LcMi50E2UMfkfkafgP1d8PsaRVKEleKkOabij4Uivq
         AimQNzK9mF+0hl4lQHeYD7lm8SJd6GcHahr8VViqiWmta/nNmom/NNxgOm+Y2kpDSFX2
         o9KlvYBOJn6FpTVxzuxbXSa6nraqs7y0IYJW0=
In-Reply-To: <008801cac592$72bff400$583fdc00$@com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Will L Givens <wlgivens@gmail.com>
Cc: libc-ports@sourceware.org, linux-alpha@vger.kernel.org

On Wed, Mar 17, 2010 at 1:26 AM, Will L Givens <wlgivens@gmail.com> wro=
te:
> This error was obtained using GCC-3.4.3 and Binutils-2.20.1...
>
> mkdir -p ../glibc-2.11.1-build
> cd ../glibc-2.11.1-build
>
>
> CC=3Dgcc-3.4.3 CXX=3Dg++-3.4.3 CPP=3D/usr/bin/cpp-3.4.3 \
> =A0CFLAGS=3D"-O2 -mtune=3Dev67 -mieee -finline-limit=3D2000 \
> =A0-fno-strict-aliasing -D__ASSUME_F_GETOWN_EX" \
> =A0../glibc-2.11.1/configure \
> =A0--prefix=3D/usr \
> =A0--build=3Dalphaev67-alpha-linux \
> =A0--bindir=3D/usr/bin \
> =A0--sbindir=3D/sbin \
> =A0--sysconfdir=3D/etc \
> =A0--datadir=3D/usr/share \
> =A0--includedir=3D/usr/share/include \
> =A0--libdir=3D/usr/lib \
> =A0--libexecdir=3D/usr/libexec \
> =A0--localstatedir=3D/var \
> =A0--sharedstatedir=3D/var/com \
> =A0--mandir=3D/usr/share/man \
> =A0--infodir=3D/usr/share/info \
> =A0--enable-shared \
> =A0--enable-kernel=3D2.6 =A0# --with-headers=3D/usr/src/linux\
> =A0--enable-add-ons=3Dports,nptl \
> =A0--disable-sanity-checks \
> =A0--disable-profile \
> =A0--without-selinux \
> =A0libc_cv_forced_unwind=3Dyes libc_cv_c_cleanup=3Dyes
>
> make -j2
>
> ) | gcc-3.4.3 -c =A0-I../include -I/usr/src/redhat/BUILD/glibc-2.11.1=
-build/io
> -I/usr/src/redhat/BUILD/glibc-2.11.1-build -I../ports/sysdeps/alpha/e=
lf
> -I../ports/sysdeps/unix/sysv/linux/alpha/alphaev67/fpu
> -I../ports/sysdeps/alpha/alphaev67/fpu -I../ports/sysdeps/alpha/alpha=
ev6/fpu
> -I../ports/sysdeps/unix/sysv/linux/alpha/alphaev67
> -I../ports/sysdeps/unix/sysv/linux/alpha/fpu -I../ports/sysdeps/alpha=
/fpu
> -I../ports/sysdeps/unix/sysv/linux/alpha/nptl
> -I../ports/sysdeps/unix/sysv/linux/alpha
> -I../sysdeps/unix/sysv/linux/wordsize-64 -I../sysdeps/ieee754/ldbl-64=
-128
> -I../sysdeps/ieee754/ldbl-opt -I../nptl/sysdeps/unix/sysv/linux
> -I../nptl/sysdeps/pthread -I../sysdeps/pthread
> -I../ports/sysdeps/unix/sysv/linux -I../sysdeps/unix/sysv/linux
> -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman
> -I../sysdeps/unix/inet -I../nptl/sysdeps/unix/sysv
> -I../ports/sysdeps/unix/sysv -I../sysdeps/unix/sysv
> -I../ports/sysdeps/unix/alpha -I../nptl/sysdeps/unix -I../ports/sysde=
ps/unix
> -I../sysdeps/unix -I../sysdeps/posix -I../ports/sysdeps/alpha/alphaev=
67
> -I../ports/sysdeps/alpha/alphaev6 -I../ports/sysdeps/alpha/alphaev5
> -I../ports/sysdeps/alpha/nptl -I../ports/sysdeps/alpha
> -I../sysdeps/wordsize-64 -I../sysdeps/ieee754/ldbl-128
> -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/flt-32
> -I../ports/sysdeps/alpha/soft-fp -I../sysdeps/ieee754
> -I../sysdeps/generic/elf -I../sysdeps/generic -I../nptl -I../ports =A0=
-I..
> -I../libio -I. =A0-D_LIBC_REENTRANT -include ../include/libc-symbols.=
h
> -DASSEMBLER =A0 -Wa,--noexecstack =A0 -o
> /usr/src/redhat/BUILD/glibc-2.11.1-build/io/flock.o -x assembler-with=
-cpp -
> -MD -MP -MF /usr/src/redhat/BUILD/glibc-2.11.1-build/io/flock.o.dt -M=
T
> /usr/src/redhat/BUILD/glibc-2.11.1-build/io/flock.o
> ../sysdeps/unix/sysv/linux/fcntl.c: In function `do_fcntl':
> ../sysdeps/unix/sysv/linux/fcntl.c:43: error: storage size of 'fex' i=
sn't
> known
> ../sysdeps/unix/sysv/linux/fcntl.c:44: error: `F_GETOWN_EX' undeclare=
d
> (first use in this function)
> ../sysdeps/unix/sysv/linux/fcntl.c:44: error: (Each undeclared identi=
fier is
> reported only once
> ../sysdeps/unix/sysv/linux/fcntl.c:44: error: for each function it ap=
pears
> in.)
> ../sysdeps/unix/sysv/linux/fcntl.c:46: error: `F_OWNER_GID' undeclare=
d
> (first use in this function)
> ../sysdeps/unix/sysv/linux/fcntl.c:43: warning: unused variable `fex'
> make[2]: *** [/usr/src/redhat/BUILD/glibc-2.11.1-build/io/fcntl.o] Er=
ror 1
> make[2]: *** Waiting for unfinished jobs....
> make[2]: Leaving directory `/usr/src/redhat/BUILD/glibc-2.11.1/io'
> make[1]: *** [io/subdir_lib] Error 2
> make[1]: Leaving directory `/usr/src/redhat/BUILD/glibc-2.11.1'
> make: *** [all] Error 2
> [root@jericho glibc-2.11.1]# pico -w +43
> ../glibc-2.11.1/sysdeps/unix/sysv/linux/fcntl.c
> [root@jericho glibc-2.11.1]# pico -w +43
> ../glibc-2.11.1/ports/sysdeps/unix/sysv/linux/alpha/bits/fcntl.h
> [root@jericho glibc-2.11.1]# pico -w +43
> ../glibc-2.11.1/sysdeps/unix/sysv/linux/fcntl.c
> [root@jericho glibc-2.11.1]# pico -w +43
> ../glibc-2.11/sysdeps/unix/sysv/linux/fcntl.c
> glibc-2.11.1/ =A0 =A0 =A0 =A0 glibc-2.11.1.tar.bz2 =A0glibc-2.11-buil=
d/
> glibc-2.11.1-build/ =A0 glibc-2.11.90/
> [root@jericho glibc-2.11.1]# pico -w +43
> ../glibc-2.11.90/sysdeps/unix/sysv/linux/fcntl.c
> [root@jericho glibc-2.11.1]# pico -w +43
> ../glibc-2.11.1/sysdeps/unix/sysv/linux/fcntl.c
> [root@jericho glibc-2.11.1]#

Alpha related glibc questions go to libc-ports@.

What's available in the glibc.git and glibc-ports.git trees won't
build correctly on alpha without patches. These patches are available
in Gentoo and are why sane people use Gentoo on their Alphas.

I've wasted a bunch of time in the last week trying to help someone
who's too stubborn for his own good to build glibc manually. He never
succeeded. There's absolutely no point in trying to help you with
this. Sorry.

You know the solution.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
