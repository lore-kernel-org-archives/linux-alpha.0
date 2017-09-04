From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Mon, 4 Sep 2017 13:50:54 -0700
Message-ID: <20170904205054.GA18055@ivybridge.mattst88.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=KxeNQ0eUUPhz7j649rf4Qt/kuNdrc8F0m6dsOzo03dM=;
        b=mBEPq7ZEr7AP61Sfbxad5EVk8qVCFw3msqCo7gn/CvKQzRl5t0RtLvVHmkAKHa81te
         C9qbvSrQCP4WO23QDuHHy6eqziqcPwps5rPidvLqNgv1SvMu+i/C9d4jnZ72prU2JJ2q
         oZSAOz7eFNy7iNAjKuSRUxzD26CZVihvWwTufFJIfUiIGFZZbscxUKCANJBZmDj8PuqS
         K6ILP23GcyLAS7kgsZtb7EGh1+RKnxixQbyZ7pHQEqaq1uXzfoo3RDW2T64u6Qq10FPX
         RrKTfkuHQArCkZih6lFoNvgDTxB5Y9O3fEjHXoTDZNQGjgKpqL+l2ztuWAAWydepk2IS
         xYGw==
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ben Hutchings <ben@decadent.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Geliang Tang <geliangtang@163.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Shyam Saini <mayhs11saini@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Julia Cartwright <julia@ni.com>, Sergei Trofimovich <slyfox@gentoo.org>, Tobias Klauser <tklauser@distanz.ch>


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi Linus,

Please pull my alpha git tree. It contains some small clean up patches I've
neglected, and some build improvements from Ben Hutchings.

Thanks,
Matt


The following changes since commit dd689a68bc3551ad7bdff2c881fede5f0bd12cfa:

  Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha (2017-08-30 14:54:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus

for you to fetch changes up to d9e3cb2f9ed91020b780ee662bdec692a3f276c9:

  alpha: math-emu: Fix modular build (2017-09-04 12:04:34 -0700)

----------------------------------------------------------------
Ben Hutchings (2):
      alpha: Restore symbol versions for symbols exported from assembly
      alpha: math-emu: Fix modular build

Dan Carpenter (1):
      alpha: silence a buffer overflow warning

Geliang Tang (1):
      alpha: use kobj_to_dev()

Julia Cartwright (1):
      alpha: marvel: make use of raw_spinlock variants

Krzysztof Kozlowski (1):
      alpha: defconfig: Cleanup from old Kconfig options

Masahiro Yamada (1):
      alpha: squash lines for immediate return

Sergei Trofimovich (1):
      alpha: cleanup: remove __NR_sys_epoll_*, leave __NR_epoll_*

Shyam Saini (1):
      alpha: kernel: Use vma_pages()

Tobias Klauser (1):
      alpha: use generic fb.h

 arch/alpha/defconfig                    |  2 --
 arch/alpha/include/asm/Kbuild           |  1 +
 arch/alpha/include/asm/asm-prototypes.h | 18 ++++++++++++++++++
 arch/alpha/include/asm/core_marvel.h    |  2 +-
 arch/alpha/include/asm/fb.h             | 13 -------------
 arch/alpha/include/uapi/asm/unistd.h    |  5 -----
 arch/alpha/kernel/core_marvel.c         |  2 +-
 arch/alpha/kernel/pci-noop.c            |  6 +-----
 arch/alpha/kernel/pci-sysfs.c           |  7 +++----
 arch/alpha/kernel/pci.c                 |  6 +-----
 arch/alpha/kernel/setup.c               |  5 +++--
 arch/alpha/kernel/smc37c669.c           |  7 ++-----
 arch/alpha/kernel/sys_marvel.c          | 12 ++++++------
 arch/alpha/kernel/traps.c               |  2 ++
 arch/alpha/math-emu/math.c              |  1 +
 15 files changed, 40 insertions(+), 49 deletions(-)
 create mode 100644 arch/alpha/include/asm/asm-prototypes.h
 delete mode 100644 arch/alpha/include/asm/fb.h

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO7Y55W+GH6LoZQVpD91oLZdMpyoFAlmtvKsACgkQD91oLZdM
pyoS3w//WOtqdK6QAA1dz5pMjK9sHUYAbUpJ5CNUnlGeultraIjnOyOowwA8FJ5W
869wR1hpvpcz9xuowSTKx29j1TMdX2o2Bd9J/fqoPlUZCVRRIdd7mLwCScYaXgJi
RF6AJ53j8syItL+gVvZw4dBG9h9ceOpbgMXdTy1WdrzvDRpUE4tODhf2xyCrEePR
WZRRaQcCxFTRTKpPOp9zW6qDOLD6nk8PGLCL8VEdXI/96thQXNHVMWbF6yQC7Y0l
yS7+jEEUZIGsuMhXnKeC4vkzy1lbje3r3aEPlTmilVeMJCs2NobE+91eDJ1DEcsN
1Oc7JjGfV2WQETJC0DT6nvCkWvRR6mRtIgQytLkM3PpreAzp5l07Y6c7bbXhijJP
y0fsoKxhO8Wi7PuepOCJxCOgdeEqVMEC1t96UO86LYigGWAjOA3iqAitW+mBazp5
GnfhLRvK/xlbA7DFWSAFZwt3tTqxog5ZPXEsvZUUaU4/BeOQnStFZRiG26gTxr1M
2RURh92H+Rb7MJ7K81yvnBO8n1c8ovXnDo3z7IhwpKzZTiS3KRheVcdXZTgL7sFV
6EmnT/S4FY7MRGT8r4tJWq+YM0I4JYNE0VdZqekTSzSAsOeK53zxopbPhPYc+3eT
96SExwKBrKIyxITHb7QOZYH6ERrfak6iIUg1oY4MlgOEeO+FAdc=
=F4pK
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
