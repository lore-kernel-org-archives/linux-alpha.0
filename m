From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Sat, 20 Jan 2018 18:25:42 -0800
Message-ID: <20180121022542.GA1963@ivybridge.mattst88.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=YJh446BHMhYkRCQcOKjT9xKE6Mf8JZcLYc9QFcX6JWA=;
        b=hesbNFtwHfpkR93crdtaPKpsL0bvWnQGuF01zbSwJ6ERCpVTvprAO1J7zFBFPt/rT1
         nq07XCruScNdAazl7oTullzDresIWAIVAJecZftUXjQL8oQI48X4R7YMvQmGhmuC1jHG
         FEVUWHOWFRegvFMsn+JVcbGZQ5DqyL5k7f5JaHfsy6LMt7pkjRgq8pJMypNWd1Kxe4F2
         JbtlbuNK5u6VHr3R224X3j/S9ZI5FIizKDCVHQeb7lPR1inaDuGO+C+8Vn3JOHbdVydP
         aDMfb4aSIeBysLPSdiVXm+jZeMaFiqQqK8waI7vBKmWyeLytMtcyh2BNR2fU3nYE9YMt
         xP5Q==
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mikulas Patocka <mpatocka@redhat.com>, Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi Linus,

Please pull my alpha git tree. It contains a build fix and a regression fix.

Hopefully still in time for 4.15 :)

Thanks,
Matt

The following changes since commit 8cbab92dff778e516064c13113ca15d4869ec883:

  Merge tag 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma (2018-01-16 16:47:40 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus

for you to fetch changes up to 86be89939d11a84800f66e2a283b915b704bf33d:

  alpha/PCI: Fix noname IRQ level detection (2018-01-20 16:22:36 -0800)

----------------------------------------------------------------
Lorenzo Pieralisi (1):
      alpha/PCI: Fix noname IRQ level detection

Michael Cree (1):
      alpha: extend memset16 to EV6 optimised routines

 arch/alpha/kernel/sys_sio.c | 35 +++++++++++++++++++++++++++++------
 arch/alpha/lib/ev6-memset.S | 12 ++++++------
 2 files changed, 35 insertions(+), 12 deletions(-)

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO7Y55W+GH6LoZQVpD91oLZdMpyoFAlpj+iYACgkQD91oLZdM
pyqCdA/7BkWfs/kXqpymmmt9mGu58fWR7G7j4M3QETDhafmuiOZiBWEjEKyZaj9t
wjOtjThTf+6+xvrbRsoAUbje4Afx3XgHYZl3FNsgmhZqe9LPsG7iJAkx9ZuwwbCL
JuIfcWHx5gqymcqsNxIuLmU0n6ffseuYm07bVYXxrCZVpWtGM6tynoA+VG6U/k82
pvZeLJHeZaIlY7DKtDQNN4rz9HpR9nNKocf1xUCZ9uY9NkSxAo6XpdeA1GOEyT9E
xFVeCPJkpXiY+fpXeUJkamHiC2TuhOJ+IoaGTe1/VLsN1b9+Z0wruNQBhF714If3
1icgI0ccaJ3mrkJVDU7C3yQxHcsidTBhRZhjfkhX5I8ecCsy1cp8SH/InpXcUKVP
MYORTkeaXCfBPLzRCBbb8onuX/2wNFNuTHwskB8ptauyyp3CAisWnfN73thdwUO4
dn/1cGozVRtNk7vaH7OW2xNAYryDSFpyReRqnaTs9UbvNCTb7N5lRxdFtZshJY1v
QFPVomuklmUXSJYATy3Nc19PNguOr8pEBOLKnWcRZ+0bo+lP9/lzqRWzH66ceTYq
BRLQLuGZ5h7RCoMacPm/jkWjIAsWhYI6+TemP/AFxQdEO8lrIkXAORPC7s7bifVl
PyjBmwXiMLYn7LjqCC6QinjWB2jfX5tZGvVBU/A1qJsAhOLrmDI=
=v81v
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
