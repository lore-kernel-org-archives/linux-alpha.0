From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Sun, 10 Feb 2019 20:46:15 -0800
Message-ID: <20190211044615.GA30805@p50-ethernet>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=TQaWtqfaua1Hjo0MyL7tHgbuxemTghT+fCzIyDHfzRw=;
        b=bZDXbqsLKn3mbNYHBviCP96zZCE/W7Wbkvw+1i+H2LuRozINF2omF33A6loxQufxht
         DI5Rop3UZrMFrDP78GzVmIzAsq3OTfA4M2vcRkcDWfx3tgy2VH0XnU1OveiK1tkqQNuS
         Q4+YIxI0H8UNJm4z7vjjI43mjEU6z6gcDnhgB6FysxstfudYK1MkVeYHPKz2jVjBpcKN
         eci0SQsy5KqcLjmcf4Yj+8NSGB89nr0WkX9s9mErR5Inqu2LBlhJRvOVmkpSTVZfmJms
         Qi5UtG+LdzRrbH7gwc7+sAoM15N1w4GgOzogtvqp0yIZDea14+QdjUWSLPUcUov7uqKR
         Up9w==
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sergei Trofimovich <slyfox@gentoo.org>, "Dmitry V. Levin" <ldv@altlinux.org>, Meelis Roos <mroos@linux.ee>, Bob Tracy <rct@frus.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi Linus,

Please pull a few changes for alpha, including a build fix, a fix for the Eiger
platform, and a fix for a tricky bug uncovered by the strace test suite that
has existed since at least 1997 (v2.1.32)!

Thanks,
Matt


The following changes since commit d13937116f1e82bf508a6325111b322c30c85eb9:

  Linux 5.0-rc6 (2019-02-10 14:42:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus

for you to fetch changes up to 491af60ffb848b59e82f7c9145833222e0bf27a5:

  alpha: fix page fault handling for r16-r18 targets (2019-02-10 20:42:23 -0800)

----------------------------------------------------------------
Bob Tracy (1):
      tools uapi: fix Alpha support

Meelis Roos (1):
      alpha: Fix Eiger NR_IRQS to 128

Sergei Trofimovich (1):
      alpha: fix page fault handling for r16-r18 targets

 arch/alpha/include/asm/irq.h         | 6 +++---
 arch/alpha/mm/fault.c                | 2 +-
 tools/include/uapi/asm/bitsperlong.h | 2 ++
 3 files changed, 6 insertions(+), 4 deletions(-)

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iNUEABYKAH0WIQSzlptPDvl9ch5jjr2cglpmBdQLvgUCXGD+FF8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjM5
NjlCNEYwRUY5N0Q3MjFFNjM4RUJEOUM4MjVBNjYwNUQ0MEJCRQAKCRCcglpmBdQL
vpblAQDdRyUGTMIZfZ+O5amIfyScCTqRakEu7WWpPrsDLFp0KAD7BAT+L63aYLKq
cV6/MO6IJjorFILxvulKs4iAj5E1ygM=
=0oVh
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
