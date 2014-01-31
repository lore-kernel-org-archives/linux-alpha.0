From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Fri, 31 Jan 2014 09:26:36 -0800
Message-ID: <20140131172636.GA32760@ivybridge>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=2i8eVmApj99b/RRPtEH4gYZhH70wmF9JcFvJ2RcqVnw=;
        b=UPeoYkd4zgVN1hwikvw7XJ1ZKQqYWSctL7u0S+l8L7Mm6jlPjtJ6ouEZxkaP9PdsFF
         37Zpwkig8Q01Wk3XD6Vw7/4v9hMvjo0LjPNjVM3mgHUjpxe2rvofz9pSDGEmrAm4JOCm
         NCq/HljsrH4PX9LoLOfsUkL9bTjy/Zej0g4A67WfLadCUbQBN0nB1Q+jOMlQ58caNdCa
         1A9GtjlU377n9wB7yAAk1QNpWQPL3Wx3zrYQEt7ELn9JvH3+nQscLun2pwKRwhWY+I/c
         alSQv1bOxXVWdXc0xSQFErjfh9vrtWcbkGv34dNUQr1PYnjHnV/cmMOSVZfKCjzXWxOM
         EOGQ==
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, Mikulas Patocka <mpatocka@redhat.com>, "Zhenglong.cai" <zhenglong.cai@cs2c.com.cn>


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull a pair of changes for alpha. One fixes a networking
regression, and the second adds audit syscall support which will
help in supporting systemd.

Thanks,
Matt

The following changes since commit e7651b819e90da924991d727d3c007200a18670d:

  Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git=
/mason/linux-btrfs (2014-01-30 20:08:20 -0800)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus

for you to fetch changes up to 0ef38d70d4118b2ce1a538d14357be5ff9dc2bbd:

  alpha: fix broken network checksum (2014-01-31 09:21:55 -0800)

----------------------------------------------------------------
Mikulas Patocka (1):
      alpha: fix broken network checksum

=E8=94=A1=E6=AD=A3=E9=BE=99 (1):
      alpha: Enable system-call auditing support.

 arch/alpha/Kconfig                   |  3 ++
 arch/alpha/include/asm/ptrace.h      |  5 +++
 arch/alpha/include/asm/thread_info.h |  2 ++
 arch/alpha/kernel/Makefile           |  1 +
 arch/alpha/kernel/audit.c            | 60 ++++++++++++++++++++++++++++++++=
++++
 arch/alpha/kernel/entry.S            |  6 +++-
 arch/alpha/kernel/ptrace.c           |  4 +++
 arch/alpha/lib/csum_partial_copy.c   |  9 ++++--
 init/Kconfig                         |  2 +-
 9 files changed, 88 insertions(+), 4 deletions(-)
 create mode 100644 arch/alpha/kernel/audit.c

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS69zMAAoJEA/daC2XTKcqTSQP/jQ4yVBrdEFCgrBJ8GaxR1vf
bA/b4L1XgjoqVbaWCg+ndcxNoSki+hyKtp9edFylhzrMyZbtapq4YYK1j3fi/4g2
1j0IGJHszEqDzBFvjTuYMlCekFP1KqSHRcFBv2K8wCcBOfaqdhaujt0TgGRWyAH/
BI3omLOXhLkjuRwlDwiJOI45FMlv2wDqctvcc7cQ0HkMtV7UR8sQrDgrEsNUbmFx
U98KgMJ7uY3r+VgLQIovufACxy6EIDmTzoC0XnZq+hm3hsr4W/NbNu+tVVHfcnme
j/85jROE1b5B5PKaiUR9VGEQfNAmTq1Er9cOHfyxhmmnLFVCjdVTY1ssT1yHnjcT
3DvPzM+QWcfe+QSKVmb8jz7CoRfqFLP1wccdo1I2EaxSyah5WR/IWR1H21thmQ7S
fWmlIflZUMvTr1W4C6OuasD2YGSzNC8MYInYouNiH+I0z3D0TdCWtpZLXht2OhHO
G0eG38GqbIsuW4mGNDG0DdUKrPadhGtgQ9+PdfSoh2BumomXEPzPpB0thmLDBHOP
d4/7QVtZmxMmyunWi6ea1zUFvn98vvzI6awJyB6pxJJquFiiHXHAQzvsXAkAB4pS
/PJ5VrRwn6qqjPboSu+UScKNh8kRLU3BUIBmEZhNyO0m8kjxjJ5XSaV04At7pDTg
h6+oMpPhv2h8w1Z2oP/T
=IFDf
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
