From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Wed, 20 Nov 2013 11:26:18 -0800
Message-ID: <20131120192618.GA10362@sandybridge>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=yrRWwbVPpL0XaTS4C/3CP/8jBlnZ+/l0IaLwEbI4/wE=;
        b=K+4x+14s/NTVNCKLYTRVX8GAlADe7J6RgnBYHKoAunO5T4s2RrVcuQtFiT8D2Tclyj
         EXZo5q+1u/HTKi9r+YehYmd+XlLAtu1he9HK23uf/P0qqyq6ClM9wkG96q7BrdJNVJ7J
         pseN0rcM77VeLbbSsgu6xWxf2cMKiPxTbKsS63Gktr+HXbdMsuJ5Hh1Say0uR2DcXpB+
         GtGTDn9C/PHOVzmp35sVSm0KM1BMuTdap1kD1wY5D7M3W8urZ6kl626Y00ZpHMLqu4kC
         aqnSJhec9R39nrxojTaExNmQvlMsaovDOAMyHebGGRQBI37Gxif8EbCPnDtxv6AnDYy1
         rn4w==
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jay Estabrook <jay.estabrook@gmail.com>, Will Deacon <will.deacon@arm.com>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull my alpha git tree. It contains a few fixes and some work
=66rom Richard to make alpha emulation under QEMU much more usable.

Thanks,
Matt

The following changes since commit 673fdfe3f0630b03f3854d0361b1232f2e5ef7fb:

  Merge tag 'nfs-for-3.13-2' of git://git.linux-nfs.org/projects/trondmy/li=
nux-nfs (2013-11-16 13:14:56 -0800)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus

for you to fetch changes up to 5cfe8f1ba5eebe6f4b6e5858cdb1a5be4f3272a6:

  alpha: Prevent a NULL ptr dereference in csum_partial_copy. (2013-11-16 1=
6:48:42 -0800)

----------------------------------------------------------------
Jay Estabrook (1):
      alpha: Prevent a NULL ptr dereference in csum_partial_copy.

Richard Henderson (8):
      alpha: Eliminate compiler warning from memset macro
      alpha: Notice if we're being run under QEMU
      alpha: Allow HZ to be configured
      alpha: Primitive support for CPU power down.
      alpha: Reorganize rtc handling
      alpha: Enable the rpcc clocksource for single processor
      alpha: Switch to GENERIC_CLOCKEVENTS
      alpha: Use qemu+cserve provided high-res clock and alarm.

Will Deacon (1):
      alpha: perf: fix out-of-bounds array access triggered from raw event

 arch/alpha/Kconfig                 |  76 ++++++-
 arch/alpha/include/asm/machvec.h   |  22 +-
 arch/alpha/include/asm/pal.h       |  71 +++++++
 arch/alpha/include/asm/rtc.h       |  11 -
 arch/alpha/include/asm/string.h    |  24 ++-
 arch/alpha/include/uapi/asm/pal.h  |   1 +
 arch/alpha/kernel/Makefile         |   1 +
 arch/alpha/kernel/alpha_ksyms.c    |   1 +
 arch/alpha/kernel/irq_alpha.c      |  16 +-
 arch/alpha/kernel/machvec_impl.h   |   5 +-
 arch/alpha/kernel/perf_event.c     |  15 +-
 arch/alpha/kernel/process.c        |  17 ++
 arch/alpha/kernel/proto.h          |   6 +-
 arch/alpha/kernel/rtc.c            | 323 +++++++++++++++++++++++++++++
 arch/alpha/kernel/setup.c          |  23 ++-
 arch/alpha/kernel/smp.c            |  33 +--
 arch/alpha/kernel/sys_jensen.c     |   2 -
 arch/alpha/kernel/sys_marvel.c     |  55 +----
 arch/alpha/kernel/time.c           | 405 ++++++++++++++++-----------------=
----
 arch/alpha/kernel/traps.c          |  15 ++
 arch/alpha/lib/csum_partial_copy.c |  10 +-
 arch/alpha/lib/ev6-memset.S        |  12 +-
 arch/alpha/lib/memset.S            |  11 +-
 drivers/rtc/Kconfig                |  10 +-
 24 files changed, 777 insertions(+), 388 deletions(-)
 create mode 100644 arch/alpha/kernel/rtc.c

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSjQzZAAoJEA/daC2XTKcqsoMP/1WiP9kg0EbPiJip8GH+zRy2
QDH0+THbxSyI+rlbIIShiNVhJMYL/vYTpF9kqXzKvgcL2WLG0sEaKyqSi2LlFkNw
yoKsG19E7R6geql1Unh5tU9EkpFBWhgrvkFQrq0UmKLC+8dr9/o2ZHTDNFYOGNwr
pNTm38pijLAh3w62jrwyYjDk/JnpA6eVdYlo8S+WVah8BsAoCKH/swMhXflwwFL3
JoBrEec/PoWP0gpPgK/LtfPIWI6wqSYwFkoTyX48p8aaa3ZOPOf91sde4mTYNfKD
6TCE9HtSZcKZ6o4OdwkAsNjwvkozfhX2CLsMP8FHvzosZHLgVhw09h+rbbyCEUgu
fRGgNk9LfajtpRaXDEWAdfOeTKBLT6m+3wu57hOijfc2XCTlB23gsLmnsntpgTAC
X8gInIXXCryopYmKR16LiSPUpFItVmjp2SqTMG1yOmd/Vb9eXZGPo8oPIBsRAcVM
WSH/gOiXa5cyAdct7Y3IYkuz81dCtxTuKavOprt9cnPxPL8PlXafE/nOW4zA0uNX
Ng7ySHSE3Zb/pdcme1HV479B1TnsYqkGcZE7X2qwsMpl7aQuJp+7NguUGwzWvQJX
5YtCFpo7zAPIWtDgx6NuZKJbLAwAmdW1meaYPW2L/rYVIsNjDw5cByBSL0X8v/PG
+aopnKywnopUgljqOBdo
=q92j
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
