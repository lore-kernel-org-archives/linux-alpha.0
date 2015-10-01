From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH] alpha: uapi: Add support for __SANE_USERSPACE_TYPES__
Date: Thu, 01 Oct 2015 01:35:55 +0100
Message-ID: <1443659755.2730.14.camel@decadent.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-wwalh0OioEMKhEuwsCvR"
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org
Cc: Michael Cree <mcree@orcon.net.nz>, stable <stable@vger.kernel.org>


--=-wwalh0OioEMKhEuwsCvR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This fixes compiler errors in perf such as:

tests/attr.c: In function 'store_event':
tests/attr.c:66:27: error: format '%llu' expects argument of type 'long lon=
g unsigned int', but argument 6 has type '__u64 {aka long unsigned int}' [-=
Werror=3Dformat=3D]
  snprintf(path, PATH_MAX, "%s/event-%d-%llu-%d", dir,
                           ^

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
Tested-by: Michael Cree <mcree@orcon.net.nz>
Cc: stable@vger.kernel.org
---
 arch/alpha/include/asm/types.h      |  2 +-
 arch/alpha/include/uapi/asm/types.h | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/types.h b/arch/alpha/include/asm/types.=
h
index 4cb4b6d..0bc66e1 100644
--- a/arch/alpha/include/asm/types.h
+++ b/arch/alpha/include/asm/types.h
@@ -1,6 +1,6 @@
 #ifndef _ALPHA_TYPES_H
 #define _ALPHA_TYPES_H
=20
-#include <asm-generic/int-ll64.h>
+#include <uapi/asm/types.h>
=20
 #endif /* _ALPHA_TYPES_H */
diff --git a/arch/alpha/include/uapi/asm/types.h b/arch/alpha/include/uapi/=
asm/types.h
index 9fd3cd4..8d1024d 100644
--- a/arch/alpha/include/uapi/asm/types.h
+++ b/arch/alpha/include/uapi/asm/types.h
@@ -9,8 +9,18 @@
  * need to be careful to avoid a name clashes.
  */
=20
-#ifndef __KERNEL__
+/*
+ * This is here because we used to use l64 for alpha
+ * and we don't want to impact user mode with our change to ll64
+ * in the kernel.
+ *
+ * However, some user programs are fine with this.  They can
+ * flag __SANE_USERSPACE_TYPES__ to get int-ll64.h here.
+ */
+#if !defined(__SANE_USERSPACE_TYPES__) && !defined(__KERNEL__)
 #include <asm-generic/int-l64.h>
+#else
+#include <asm-generic/int-ll64.h>
 #endif
=20
 #endif /* _UAPI_ALPHA_TYPES_H */
--=20
Ben Hutchings
Knowledge is power.  France is bacon.
--=-wwalh0OioEMKhEuwsCvR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVgx/6+e/yOyVhhEJAQryMRAAivHTgHYc6g8+vR3bLv4i9XOF1vtwg/11
+4MwgCshWJOmVa84IsKJuIg4jz4mpL1tXcyH/gj7X8+uJYQJRQKyW3y0Z5em8FAo
MlFPA1G3x5XiVvkL767jV5qE/6unaQQ3eRvANUU6TuNFfFlVsCgMXF2ooJTmOIK6
M6Fdf+nXNaNMHnHi0aKrEcofSxppT2CXxoDx5dMjqLIRFw6QWE/zTjLAQn2bhoTn
H2rCBXZ9KX+RkEOMUW+68rm9aQ3mDDjFHqSpoZi4lA8pg7gsHkoC0UcLHJ3IBDdO
pCNFw2Y/u6IM+5NuPr/QLBJoQuGe4HssLua0hhw5Ubq2FTPotlxa1uUU2TxNX7pv
310wAhOHssUyg1cT+NfyRlN69Eb2+dig5f2/iUweerMJzy3s6kXyR7w01skiCUpb
AVzQjn56764nxB2InSGM2MitwbzV+8zloTKjIkX/FYCoWQ0ic81Ih3P40rmkmuu9
vw7vD0x33Ls55Gwr9Ji61WeSQmK75eToFhAq20mn1Pa9ATdnLKqlbWy6Xnx7URcQ
LSfSINrzLqgzzYLKDWVwA4UI8NTsS96MBVC2ZsU/xOKiaahU8TVcN3ObHyEJlJlB
rfgGRfI2hm2gdVl6ijtjMuU/4/VDSTCDAXEgnSU9pQ2yB6r1incWxAo5kX42SwCs
7KfgvWYz7aI=
=PQ2S
-----END PGP SIGNATURE-----

--=-wwalh0OioEMKhEuwsCvR--
