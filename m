From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH] alpha: Fix missing symbol versions for str{,n}{cat,cpy}
Date: Fri, 13 Jan 2023 23:00:13 +0100
Message-ID: <Y8HUbeQh51qLA1th@decadent.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ME91w2cl5VCmWMxg"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>


--ME91w2cl5VCmWMxg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Now that modpost extracts symbol versions from *.cmd files, it can't
find the versions for these 4 symbols.  This is due to the way we link
their objects together ahead of the full vmlinux link.  genksyms puts
their symbol CRCs in .str{,n}{cat,cpy}.o.cmd, but modpost only reads
the .sty{,n}cpy.o.cmd files.

Instead of using the linker for this, add assembly sources that
concatenate the appropriate routines with include directives.

Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Fixes: f292d875d0dc ("modpost: extract symbol versions from *.cmd files")
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 arch/alpha/lib/Makefile  | 14 --------------
 arch/alpha/lib/stycpy.S  | 13 +++++++++++++
 arch/alpha/lib/styncpy.S | 13 +++++++++++++
 3 files changed, 26 insertions(+), 14 deletions(-)
 create mode 100644 arch/alpha/lib/stycpy.S
 create mode 100644 arch/alpha/lib/styncpy.S

diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
index 1cc74f7b50ef..8f1c32a25a40 100644
--- a/arch/alpha/lib/Makefile
+++ b/arch/alpha/lib/Makefile
@@ -45,17 +45,3 @@ AFLAGS___remlu.o =       -DREM -DINTSIZE
 $(addprefix $(obj)/,__divqu.o __remqu.o __divlu.o __remlu.o): \
 						$(src)/$(ev6-y)divide.S FORCE
 	$(call if_changed_rule,as_o_S)
-
-# There are direct branches between {str*cpy,str*cat} and stx*cpy.
-# Ensure the branches are within range by merging these objects.
-
-LDFLAGS_stycpy.o := -r
-LDFLAGS_styncpy.o := -r
-
-$(obj)/stycpy.o: $(obj)/strcpy.o $(obj)/$(ev67-y)strcat.o \
-		 $(obj)/$(ev6-y)stxcpy.o FORCE
-	$(call if_changed,ld)
-
-$(obj)/styncpy.o: $(obj)/strncpy.o $(obj)/$(ev67-y)strncat.o \
-		 $(obj)/$(ev6-y)stxncpy.o FORCE
-	$(call if_changed,ld)
diff --git a/arch/alpha/lib/stycpy.S b/arch/alpha/lib/stycpy.S
new file mode 100644
index 000000000000..bf2b0238209e
--- /dev/null
+++ b/arch/alpha/lib/stycpy.S
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * There are direct branches between strcpy, strcat, and stxcpy.
+ * Ensure the branches are within range by concatenating their code.
+ */
+#include "strcpy.S"
+#ifdef CONFIG_ALPHA_EV6
+#include "ev6-strcat.S"
+#include "ev6-stxcpy.S"
+#else
+#include "strcat.S"
+#include "stxcpy.S"
+#endif
diff --git a/arch/alpha/lib/styncpy.S b/arch/alpha/lib/styncpy.S
new file mode 100644
index 000000000000..213d1678be2a
--- /dev/null
+++ b/arch/alpha/lib/styncpy.S
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * There are direct branches between strncpy, strncat, and stxncpy.
+ * Ensure the branches are within range by concatenating their code.
+ */
+#include "strncpy.S"
+#ifdef CONFIG_ALPHA_EV6
+#include "ev6-strncat.S"
+#include "ev6-stxncpy.S"
+#else
+#include "strncat.S"
+#include "stxncpy.S"
+#endif

--ME91w2cl5VCmWMxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmPB1GgACgkQ57/I7JWG
EQnAmQ/+JACBLNcRIeJ859bKZ3BVCoUsXwslrToD0306GXHZlI7h7ucVPN+eCHnF
ene/yqBWYjFJ7T/iPsBXGjhwX9NNVzLku2dfuh/Dat81PdwdMDZ/M5TIKp63FExC
nkqkCkDNAm1w0tZctbjsA9HM6sWPPmgXClPhiJMDz+v6db4mT9WSlqQHzElVHrlU
QlMJaWW9LFa13d2WPS2xP59/JpZBW6OUh4RI62l3CoyOq+uaGopADv5sS8OIWyNC
9FRNSLrJFHAURzyCKxY/HFGTIs9OT9xv+IODnNq3n8SE2RZQd+lRELFBSB8gkuNv
lqXtCQRyWMPWRmBTPfOSjo8AbEemNNiawBAGdQyaCmt0VkfEAF+KMeVyu6vUkC6s
ZE8+oEOtnwLmMRVNtd/khOIlWQlJizJbJsTwInV3JLk3ZQIot2ySrWe3sg+trbTi
bgIK0QfUsI2+z9W6gc6CUMYHA+Wusltb4DHrzQSLmH7/y2hG+fKvpuY3w3nzTKZ9
C/qm6SsPaUI8gGKavbu0spNGJIQyj13dBsEY40XkmxDbm801PP58J+phJcPP2f1z
z4/M4MsE5gwQxZhutEdcLwBzvu3GlAcvzlBbi5kEXy9OZfhFyYmwoNvWOrrx2dAR
UGYyhAUP6jYdTwbzpzTR0pXx6ForNmU+xQKhdFLvCr5fyfqpEGg=
=+cfg
-----END PGP SIGNATURE-----

--ME91w2cl5VCmWMxg--
