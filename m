From: Michael Cree <cree@waikato.ac.nz>
Subject: 2.6.39.1 Regression: testsuite failures in eglibc on Alpha
Date: Sat, 11 Jun 2011 12:31:11 +1200
Message-ID: <4DF2B74F.50700@waikato.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org

While building eglibc (Debian version 2.13-5) test suite failures are
reported when running under the 2.6.39.1 kernel, but not when running
under the 2.6.38.6 kernel on the Alpha arch.  The failures are:

tst-mutexpi4.out, Error 1
tst-mutexpi7.out, Error 1
tst-mutexpi7a.out, Error 1
tst-robust1.out, Error 1
tst-robust3.out, Error 1
tst-robust4.out, Error 1
tst-robust6.out, Error 1
tst-robust7.out, Error 1
tst-robust8.out, Error 1
tst-robust9.out, Error 1
tst-robustpi1.out, Error 1
tst-robustpi3.out, Error 1
tst-robustpi4.out, Error 1
tst-robustpi6.out, Error 1
tst-robustpi7.out, Error 1
tst-robustpi8.out, Error 1

Some of the above tests time out, for example:

GCONV_PATH=3D/=ABBUILDDIR=BB/eglibc-2.13/build-tree/alpha-libc/iconvdat=
a
LC_ALL=3DC     /=ABBUILDDIR=BB/eglibc-2
=2E13/build-tree/alpha-libc/elf/ld-linux.so.2 --library-path
/=ABBUILDDIR=BB/eglibc-2.13/build-tree/alpha-
libc:/=ABBUILDDIR=BB/eglibc-2.13/build-tree/alpha-libc/math:/=ABBUILDDI=
R=BB/eglibc-2.13/build-tree/alpha-lib
c/elf:/=ABBUILDDIR=BB/eglibc-2.13/build-tree/alpha-libc/dlfcn:/=ABBUILD=
DIR=BB/eglibc-2.13/build-tree/alpha-l
ibc/nss:/=ABBUILDDIR=BB/eglibc-2.13/build-tree/alpha-libc/nis:/=ABBUILD=
DIR=BB/eglibc-2.13/build-tree/alpha-l
ibc/rt:/=ABBUILDDIR=BB/eglibc-2.13/build-tree/alpha-libc/resolv:/=ABBUI=
LDDIR=BB/eglibc-2.13/build-tree/alpha
-libc/crypt:/=ABBUILDDIR=BB/eglibc-2.13/build-tree/alpha-libc/nptl
/=ABBUILDDIR=BB/eglibc-2.13/build-tree/al
pha-libc/nptl/tst-mutexpi7  >
/=ABBUILDDIR=BB/eglibc-2.13/build-tree/alpha-libc/nptl/tst-mutexpi7.out
Timed out: killed the child process
make[3]: ***
[/=ABBUILDDIR=BB/eglibc-2.13/build-tree/alpha-libc/nptl/tst-mutexpi7.ou=
t]
Error 1

Since no problems are seen with the 2.6.38 kernel series this appears t=
o
be a 2.6.39[.1] regression.

Cheers
Michael.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
