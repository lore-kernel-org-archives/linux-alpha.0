From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Sun, 30 Dec 2018 17:25:19 -0500
Message-ID: <20181230222519.GA4195@p50>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=5cKcfmJ20UK9CCVQ6E8lFHgopqsdOf7qXHzuf3MsKjk=;
        b=jZEE28awEXDEvvpl8+leq1fJV+YHYN+R3jqU2090Gj1Bu00rX940TaRqa1JUkynXk+
         o3772XeIf8ZsQJ732+Hiu+ooW8U24zUJoNcpAhf9K1nnSIxK26wzGYekpJPQjMlRhhKv
         3S5Tlzts4uNfhi13E9ZPwuGGO2KGPqTvhV2M7EJcFGtUdoBWswPc1LhN1IAC27MFFHTV
         tr9cxVBF4W10HZB7IxNOpn4Cz3KDL6Io80IK9xwlhVZcSfVGlwcngLJqTT1p9ryRktGo
         rKYBthb28XrlhNHaOks2lV6FqF/I4LNzuYbIDvWThEz/4MTCTRnmKWR31sB2OIYRVlxS
         GAHw==
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, Colin Ian King <colin.king@canonical.com>, Firoz Khan <firoz.khan@linaro.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi Linus,

Please pull a few small changes for alpha as well as the new system call table
generation support from Firoz Khan.

Thanks,
Matt


The following changes since commit 9097a058d49e049925d8da72db07fffcee24efa0:

  Merge branch 'i2c/for-current' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux (2018-12-20 14:49:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus

for you to fetch changes up to 1c3243f61fa7daea78de9866af2625f559ebf456:

  alpha: Remove some unused variables (2018-12-21 16:02:03 -0500)

----------------------------------------------------------------
Alexandre Belloni (1):
      alpha: rtc: simplify alpha_rtc_init

Colin Ian King (1):
      alpha: fix spelling mistake QSD_PORT_ACTUVE -> QSD_PORT_ACTIVE

Daniel Bristot de Oliveira (1):
      alpha: Fix a typo on ptrace.h

Firoz Khan (5):
      alpha: move __IGNORE* entries to non uapi header
      alpha: remove CONFIG_OSF4_COMPAT flag from syscall table
      alpha: add __NR_syscalls along with NR_SYSCALLS
      alpha: add system call table generation support
      alpha: generate uapi header and syscall table header files

Matt Turner (1):
      alpha: Remove some unused variables

 arch/alpha/Makefile                      |   3 +
 arch/alpha/include/asm/Kbuild            |   2 +-
 arch/alpha/include/asm/unistd.h          |  23 +-
 arch/alpha/include/uapi/asm/Kbuild       |   1 +
 arch/alpha/include/uapi/asm/ptrace.h     |   2 +-
 arch/alpha/include/uapi/asm/unistd.h     | 484 +--------------------------
 arch/alpha/kernel/core_wildfire.c        |   2 +-
 arch/alpha/kernel/osf_sys.c              |  12 +-
 arch/alpha/kernel/rtc.c                  |  22 +-
 arch/alpha/kernel/syscalls/Makefile      |  38 +++
 arch/alpha/kernel/syscalls/syscall.tbl   | 453 ++++++++++++++++++++++++++
 arch/alpha/kernel/syscalls/syscallhdr.sh |  36 ++
 arch/alpha/kernel/syscalls/syscalltbl.sh |  32 ++
 arch/alpha/kernel/systbls.S              | 542 +------------------------------
 14 files changed, 609 insertions(+), 1043 deletions(-)
 create mode 100644 arch/alpha/kernel/syscalls/Makefile
 create mode 100644 arch/alpha/kernel/syscalls/syscall.tbl
 create mode 100644 arch/alpha/kernel/syscalls/syscallhdr.sh
 create mode 100644 arch/alpha/kernel/syscalls/syscalltbl.sh

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iNUEABYKAH0WIQSzlptPDvl9ch5jjr2cglpmBdQLvgUCXClFz18UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjM5
NjlCNEYwRUY5N0Q3MjFFNjM4RUJEOUM4MjVBNjYwNUQ0MEJCRQAKCRCcglpmBdQL
voRIAQCKGxM8wqW+zJQi1JX6N2jNEhP2fPh4Nekf5rtwheTBdAD/ZIszO3xxsqzb
khElq4SeErcRxYtJFZAXwAM2YMOdrwU=
=xXfP
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
