From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Tue, 22 May 2018 21:02:17 -0700
Message-ID: <20180523040217.GA6512@ivybridge.mattst88.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=/KfCWkKKims04xC+5yWr6Y4q/a98RTsY//GfiQAAnT0=;
        b=X9OMRY1abp8Wzo8/YTjDCCNzoqKrs8QipExcTPL05dS0wUQKU3XzFsQtovwdr/8G/L
         E2JpSbUV02sN7piV+LKjc7Roxh+NA/CHJNgTKD9arUbxgyojuU91wec7CEopU1goJ0rz
         B15QcxKl54rM1AC8258+hQU8AOABqaA8KQyobxSAcGZ/rm6cDb6lkoMEkkBSB/ekkqj2
         mJn+AI80xn10ZrDoUcTscdnRlFsq2KODkX0L8H3dfrS0TsRlCuEq4pfTmu2gjFwmesSq
         cusZXK0oUr7fZwoQZV6iBu7oT5GyS9x/gDzIE2CArFDxFJziXWpDd1VGUoyq5ULVyb6q
         z4uw==
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>, Sinan Kaya <okaya@codeaurora.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull a few small changes for alpha.

Thanks,
Matt


The following changes since commit c61a56ababa404961fa769a2b24229f18e461961:

  Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (2018-04-29 10:06:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus

for you to fetch changes up to 92d7223a74235054f2aa7227d207d9c57f84dca0:

  alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2 (2018-05-22 18:10:36 -0700)

----------------------------------------------------------------
Christoph Hellwig (2):
      alpha: use dma_direct_ops for jensen
      alpha: simplify get_arch_dma_ops

Sinan Kaya (1):
      alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2

 arch/alpha/Kconfig                   |  1 +
 arch/alpha/include/asm/dma-mapping.h |  8 ++++++--
 arch/alpha/kernel/io.c               | 14 +++++++-------
 arch/alpha/kernel/pci-noop.c         | 33 ---------------------------------
 arch/alpha/kernel/pci_iommu.c        |  4 +---
 5 files changed, 15 insertions(+), 45 deletions(-)

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO7Y55W+GH6LoZQVpD91oLZdMpyoFAlsE58UACgkQD91oLZdM
pyoH0RAAjH0zXHAixaRf1rrKhXtytCnW/Zwv/XcrewOnbJFVWUmjJi5iIg+Nbooi
7WVfpf2f843FMG55/Ie/KVA3f5VA9NdHvOJ5tNBq3Nj2oi+K0PBr7il+DOCRWIWE
yMWa/hcjw1aoO7nWsqodKYtn/X44yY1KRxUcrPtW1Mrzy6XYDaJxlkCLiWMrEvXe
2YjU9UKHRusvPaVJAemYU++qnAoUbnu2nlnk/3J+txTQLUGc0oPcqYkp5fhfOneR
9L+k3XLenvsZWwdcvhR/rghoL16spVaS7bkeIFtZCs3HWqnNTBo7fo2ulXT221ei
ERpBfQPyf9vhWx+w5tyKSrDXQbNnaWFFNeDA0oe/JsPP+krW1JgEtD1uE8pbqrx+
5gsSSreF974MzOIXLFJt8yaWisnWHTBny0PSWkexx/QwfOFH8rzl/QCjgxe/X4re
BdjYTzIPMFPtGWWnqxsmq3YxpgncpNtubgzDcUtsLuuxqyhwylmRqQCNXIgg+2GU
FqUmAGBI4EqqAGaP7eB7WjefshxxS7ETOUQ0alm3ilarsb2rXp7nP9j35dHFN9xL
UedwzJAULLm/WRS/O8m3b8SoJ5mRlZk6kFAojIxpdfqrHgB7+3BvpUOPsMwC/cao
MeRPOW+URajpGp6hVVRlKofY0pRsN26Al8qeW+Xh6qvmWtyPYAE=
=eVuD
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
