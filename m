From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH] alpha: math-emu: Fix modular build
Date: Wed, 19 Jul 2017 01:02:04 +0100
Message-ID: <20170719000204.GD18698@decadent.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="twz1s1Hj1O0rHoT0"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org


--twz1s1Hj1O0rHoT0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Commit 00fc0e0dda62 ("alpha: move exports to actual definitions") also
removed the exports of the math emulator hooks, which are defined in C
code.  In case anyone cares about the option of CONFIG_MATHEMU=3Dm, add
exports next to those definitions.  Also add a MODULE_LICENSE.

Fixes: 00fc0e0dda62 ("alpha: move exports to actual definitions")
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
This is build-tested only.

Ben.

 arch/alpha/kernel/traps.c  | 2 ++
 arch/alpha/math-emu/math.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index 65bb102d985b..ddb89a18cf26 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -193,8 +193,10 @@ die_if_kernel(char * str, struct pt_regs *regs, long e=
rr, unsigned long *r9_15)
 static long dummy_emul(void) { return 0; }
 long (*alpha_fp_emul_imprecise)(struct pt_regs *regs, unsigned long writem=
ask)
   =3D (void *)dummy_emul;
+EXPORT_SYMBOL_GPL(alpha_fp_emul_imprecise);
 long (*alpha_fp_emul) (unsigned long pc)
   =3D (void *)dummy_emul;
+EXPORT_SYMBOL_GPL(alpha_fp_emul);
 #else
 long alpha_fp_emul_imprecise(struct pt_regs *regs, unsigned long writemask=
);
 long alpha_fp_emul (unsigned long pc);
diff --git a/arch/alpha/math-emu/math.c b/arch/alpha/math-emu/math.c
index d17d705f6545..1c2d456da7f2 100644
--- a/arch/alpha/math-emu/math.c
+++ b/arch/alpha/math-emu/math.c
@@ -53,6 +53,7 @@ extern void alpha_write_fp_reg_s (unsigned long reg, unsi=
gned long val);
 #ifdef MODULE
=20
 MODULE_DESCRIPTION("FP Software completion module");
+MODULE_LICENSE("GPL v2");
=20
 extern long (*alpha_fp_emul_imprecise)(struct pt_regs *, unsigned long);
 extern long (*alpha_fp_emul) (unsigned long pc);

--twz1s1Hj1O0rHoT0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBWW6he+e/yOyVhhEJAQoK4g/9GZ6oBGquaAHb27R9ndU2Z5ImGYkXr2Hv
7uxbkupzwDbIAOU+vno5UHSH7HGxRK6nEkeEPwFX1Rk07AhtLT22ig9dBqwpc+F+
p1HBfvBRbb76oqwoOEKUjzXmLLod2IuSDJ2EsbzHUPi7C2sZwRuFlLQbhON167al
1h2m3HAVqfSau4bYT4+oNLSL3sk6SD1YKL4xHYSBHMq7p5nMU1F0f/G1xaaTUJxm
uAv7OzI9SJ1D7MF2TuFqVQBsrOOwH+zGyE59TBv70uByjwW/TaybyRVSrMrvVeg6
A2VRZnujOntTN6DVxXy/BELmnidxHYur4fAIbSJOdz8kpvAR+/wa1+MGXueuQCbC
2mNQv7qxRXfzxoyDBE0IHs4BgOGqgdoaiYWMjrWkT0vwcuf4WKZz/mSOF9G1PCwJ
k1wbaO23NTiqHjKTsirY+Op/Tp/JMnr7AkMW0fN+G+5L3Yeakk/X0hG0NE5sVbF9
GvcmKRtsaoV++fFauJ9TGwk4rmeYNaXIMu0s4dZ6JCUKrfkuEUGrkuqnAvVmts6f
LmafDNr2J1zAXmiisOocazrfLtp1ADg6nNo7qP0Q7TxpA40W+h43FZJQJvBshl0V
PalgqFLCQ1qh11Qz1X2y6VebkWHHp+9Rx9gYbDUP6zXAjlAsSOlEZ/NZauEpgW+k
yAtQxoMBrtA=
=xIDK
-----END PGP SIGNATURE-----

--twz1s1Hj1O0rHoT0--
