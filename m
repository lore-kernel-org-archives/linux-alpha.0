From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH] alpha: Restore symbol versions for symbols exported from
 assembly
Date: Wed, 19 Jul 2017 01:01:16 +0100
Message-ID: <20170719000116.GC18698@decadent.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J4XPiPrVK1ev6Sgr"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org


--J4XPiPrVK1ev6Sgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add <asm/asm-prototypes.h> so that genksyms knows the types of
these symbols and can generate CRCs for them.

Fixes: 00fc0e0dda62 ("alpha: move exports to actual definitions")
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
This is build-tested only (defconfig + MODVERSIONS=y).

Ben.

 arch/alpha/include/asm/asm-prototypes.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 arch/alpha/include/asm/asm-prototypes.h

diff --git a/arch/alpha/include/asm/asm-prototypes.h b/arch/alpha/include/asm/asm-prototypes.h
new file mode 100644
index 000000000000..d12c68ea340b
--- /dev/null
+++ b/arch/alpha/include/asm/asm-prototypes.h
@@ -0,0 +1,18 @@
+#include <linux/spinlock.h>
+
+#include <asm/checksum.h>
+#include <asm/console.h>
+#include <asm/page.h>
+#include <asm/string.h>
+#include <asm/uaccess.h>
+
+#include <asm-generic/asm-prototypes.h>
+
+extern void __divl(void);
+extern void __reml(void);
+extern void __divq(void);
+extern void __remq(void);
+extern void __divlu(void);
+extern void __remlu(void);
+extern void __divqu(void);
+extern void __remqu(void);

--J4XPiPrVK1ev6Sgr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBWW6hS+e/yOyVhhEJAQpw9w//R3sRE0t64zMybDvC8/8I9vwVuGgH6Uqp
3ysRbY/iNpAeKgufzqWl/kT/GkPCkiynZk62DcYphuGHfAWt5hEr1okpsm7XyRzU
tsIPAdy6YDCj/wSSGr444XiSBo0qocU+3TKe+/3NH5aiYR0AHiNCVQms7JEI3jfI
bFV8PmryX4yAEGtlyG+2mlgKri2C0rWIWrfZ4cM5WNaTSFAjO149VeZOXJ1IxLn7
ZL/ypfn1JPbscDVXu7lYEfmeE3BLQJrtVikBTxzcahLM5k2SxPcfxA7oaP8M+IlZ
YdNsqPxqJawtXQRNdAtdysSjmbdxOBMJS5FObY+8G92xypHuUaxRnBhJieldn/7g
G6/780LlfAWNHmGS8vxPYSnazUAvsOdIRPJrIRirZv4kSU1TC1KAS47ce52C7gdw
hCpdBxR4ib3VZ0Gdeuyk0LbrEW/rNJKu3Mcg1NfGEUpvXQMkyYVHYwqkzHur640g
4Og4J7GSaTR8eHTpciliDMcNsMsX0Ibs31cCPh/Tivni6bUFXfT53FvuShy9Dehq
gv/zQ+6lfwFuhFzSTLBPbi59GMNMNVe+YSfMOCnX8J627qnVzx1f7zux1q1Y3DtU
FHOZr7PVHlLovyjlBoM5ecOpzAA8emXOsNGOO12Rutvt6WutIA5GZfI/UcBZTuOa
yxezfOBdUnM=
=w//A
-----END PGP SIGNATURE-----

--J4XPiPrVK1ev6Sgr--
