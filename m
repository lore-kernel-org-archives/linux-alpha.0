From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Fri, 12 Jun 2020 17:57:19 -0700
Message-ID: <20200613005719.GA344350@p50-ethernet.mattst88.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Kak9RTcXH+4k1Bq+r0Eico4rnB7HcnY6/d7GwzMpklg=;
        b=rd4hjHQV7QMHyFZSCuw6qnTVjFEi4NMQfAXUViJNyZr2qVVFvU5rx/QheZaE7t7oCI
         p7XTUkhlgVH3CCuJYuOEsUK7nwxXDQ+M/n+CzOvqgL+sd9iTJyDPP9Vq5mEuoqPYDTHJ
         A0euPh0FVRMc6vupo6H4GAOo9cy0Xy3/9vt3/yjPI6Ffn4QRtpaBf1HKtgnlA9SOcsYk
         VWiO/eXj1CR5sIsVqcp8dXsqhiU5bDuom1jB1pR4IFxZVqESeYDQ5s7ik6qY8zjl1XIU
         uTEOP3SD29RctBs1CPzuY6cSPSU9bP0gXOETl8F/5MypIQblyAqbRHXnJQWOlcIeJl7Z
         O5Ww==
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Joerg Roedel <jroedel@suse.de>, Xu Wang <vulab@iscas.ac.cn>, Mikulas Patocka <mpatocka@redhat.com>, Jason Yan <yanaijie@huawei.com>, Chuhong Yuan <hslester96@gmail.com>, Enrico Weigelt <info@metux.net>


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull a few changes for alpha. They're mostly small janitorial fixes but
there's also a build fix and most notably a patch from Mikulas that fixes a
hang on boot on the Avanti platform, which required quite a bit of work and
review.

Thanks,
Matt

The following changes since commit 79ca035d2d941839f55f3b8b69f8e81c66946ed8:

  Merge branch 'proc-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace (2020-06-10 15:00:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus

for you to fetch changes up to 777747f634ba765085373f851e9c48dccb12ad52:

  alpha: Fix build around srm_sysrq_reboot_op (2020-06-12 17:43:18 -0700)

----------------------------------------------------------------
Chuhong Yuan (1):
      alpha: Replace strncmp with str_has_prefix

Enrico Weigelt, metux IT consult (1):
      alpha: Kconfig: pedantic formatting

Jason Yan (2):
      alpha: remove unneeded semicolon in osf_sys.c
      alpha: remove unneeded semicolon in sys_eiger.c

Joerg Roedel (1):
      alpha: Fix build around srm_sysrq_reboot_op

Matt Turner (1):
      alpha: c_next should increase position index

Mikulas Patocka (2):
      alpha: fix rtc port ranges
      alpha: fix memory barriers so that they conform to the specification

Xu Wang (1):
      alpha: Replace sg++ with sg = sg_next(sg)

 arch/alpha/Kconfig               |  4 +--
 arch/alpha/boot/tools/objstrip.c |  2 +-
 arch/alpha/include/asm/io.h      | 74 ++++++++++++++++++++++++++++++++--------
 arch/alpha/kernel/io.c           | 60 ++++++++++++++++++++++++++++----
 arch/alpha/kernel/osf_sys.c      |  2 +-
 arch/alpha/kernel/pci_iommu.c    |  2 +-
 arch/alpha/kernel/setup.c        | 12 +++++--
 arch/alpha/kernel/sys_eiger.c    |  2 +-
 8 files changed, 127 insertions(+), 31 deletions(-)

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iNUEABYKAH0WIQSzlptPDvl9ch5jjr2cglpmBdQLvgUCXuQkbF8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjM5
NjlCNEYwRUY5N0Q3MjFFNjM4RUJEOUM4MjVBNjYwNUQ0MEJCRQAKCRCcglpmBdQL
vmJ0AQDEUQ90XFumMJqmNHYXWHAVKD0Lnq9shA/JcBHGXEnVtAEA7QMibeXRD4Y1
3PHd/H9JH6EmXGmnheCPU0k/Xy/LEAA=
=KLX8
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
