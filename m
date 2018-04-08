From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Sun, 8 Apr 2018 11:44:09 -0700
Message-ID: <20180408184409.GA27396@ivybridge.mattst88.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=A3edGZRZfeQEb/F5/COPlxO+jwpny9cW8V4T6lBLSvc=;
        b=aeuMj7/c2tVFGLT85m9is7Y4gYAxGYe9wV8jZAmUae7wN4366HOmbdN86UA7rdKpHB
         JWFKL7lJVVbaTwYACQ2NPSGlguQO6xCeqFUBlIeQFi3kxGp4xhxFxYiB2HqPv/s9iGN5
         HTGuqmDLzT4PDK4oophyhhSNQgj6CiCT/skU0EE+MHGG4LMc+5848avTYisolbpJoU5h
         8e2cW0jOOJK2LKnfZ+c0suhrSnkGerihnTgwwSlZslS7Qg5np7AKoApIuUvBSUpVYNN/
         a9bt/XFmHhn317T5yF4k4V1bRb97mKA83dlNYN8dAaVK16K+whhxNj0DxTa1SOoVfd2c
         K0bg==
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sinan Kaya <okaya@codeaurora.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull a few small changes for alpha.

Thanks,
Matt


The following changes since commit bf6879dcc483f0aa087afe27d103285daf435951:

  Merge branch 'misc.compat' of git://git.kernel.org/pub/scm/linux/kernel/g=
it/viro/vfs (2018-04-07 14:38:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git=20

for you to fetch changes up to cd0e00c106722eca40b38ebf11cf134c01901086:

  alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering=
 (2018-04-07 15:04:15 -0700)

----------------------------------------------------------------
Alexandre Belloni (2):
      alpha: rtc: remove unused set_mmss ops
      alpha: rtc: stop validating rtc_time in .read_time

Michael Cree (1):
      alpha: Implement CPU vulnerabilities sysfs functions.

Sinan Kaya (1):
      alpha: io: reorder barriers to guarantee writeX() and iowriteX() orde=
ring

 arch/alpha/Kconfig          |   1 +
 arch/alpha/include/asm/io.h |  14 +++---
 arch/alpha/kernel/Makefile  |   2 +-
 arch/alpha/kernel/bugs.c    |  45 ++++++++++++++++++++
 arch/alpha/kernel/rtc.c     | 101 +---------------------------------------=
----
 5 files changed, 55 insertions(+), 108 deletions(-)
 create mode 100644 arch/alpha/kernel/bugs.c

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO7Y55W+GH6LoZQVpD91oLZdMpyoFAlrKYvIACgkQD91oLZdM
pyrAZg//R+9VhRxjNCt1SuQ6gP04fvQURGdwPgqueRdr5cW8pv2UgCeKxu3yAd92
EbhEsq7p0di7sXunzQBwKSM7ifAhVtXBKsFVrtvFrEc/1/pGbwckReQ1Hd5t4lwB
zXrmjJRGvxupyh3yqsY81vWR5t5kxfLZ1QdFvuCSdQq6LefVE+S0uBZzhhFoSOgb
z7VpCZyo9ca70or5NeysIAXYZtmLar3GyHKb1427c9zAJhmgFEhiO+WNKPpOm8wT
36rT1GF4Ot9PC/TgYQIGK3Vnds9NaRmi08iMXgiu975h0aMHQliFCSjm5r9Bhsse
GuMPMRp4HUTLHfvMsLKwBp7wYe2sq5dzbDqFbughkduHa3Dro72SzfWcrovy/PPe
lFnFxGuS024Ihp23JDDmd0kPju3y1hQxoKqj+n3Wui4HTsnvlPfKdTrTg2N0THZH
RfAsQOaApAUv1bpEcLCOyyJGIMm5IpMZhdL4ieVndGibgBDiT/HY5dXUNKpdb7we
LvN52Dh1Tc8xXdsi8iA6burQA82OGRS6sqT3G0U2rz86tAJIRQc+6knYcrBzL3Eq
Z2QBTljnw1X6n7o0GNbvUcU4RDyIIwu4Z8pyrKD55xpHGnkqUbzHgWcZck3cXgXH
DrI/MFButts4dNzDKER8iCcETds7XgL4ssXuV7ow8vWiidVLvic=
=e8Jg
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
