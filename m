From: Joseph Myers <joseph@codesourcery.com>
Subject: [PATCH 3/8] alpha/math-emu: Move alpha from math-emu-old to
 math-emu
Date: Thu, 2 Jul 2015 15:49:16 +0000
Message-ID: <alpine.DEB.2.10.1507021548150.29415@digraph.polyomino.org.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, mpe@ellerman.id.au

From: Joseph Myers <joseph@codesourcery.com>

This patch moves alpha from math-emu-old to math-emu, updating it for
the API changes.

The following cleanups or bug fixes (that might change how the
emulation behaves, or that go beyond mechanical conversion to new
APIs) are included in this patch because of their close connection to
the API changes:

* Alpha now uses after-rounding tininess detection.

* On Alpha, extensions from single to double now use FP_EXTEND with
  raw unpacking instead of the previous hardcoded code with cooked
  unpacking; these should be equivalent and the new code, with the
  optimizations in FP_EXTEND relative to the old FP_CONV, should be as
  efficient as the previous hardcoded code.

Signed-off-by: Joseph Myers <joseph@codesourcery.com>

---

diff --git a/arch/alpha/include/asm/sfp-machine.h b/arch/alpha/include/asm/sfp-machine.h
index 5fe63af..96c266a 100644
--- a/arch/alpha/include/asm/sfp-machine.h
+++ b/arch/alpha/include/asm/sfp-machine.h
@@ -48,6 +48,7 @@
 #define _FP_NANSIGN_Q		1
 
 #define _FP_KEEPNANFRACP 1
+#define _FP_QNANNEGATEDP 0
 
 /* Alpha Architecture Handbook, 4.7.10.4 sais that
  * we should prefer any type of NaN in Fb, then Fa.
@@ -79,4 +80,6 @@
 /* We write the results always */
 #define FP_INHIBIT_RESULTS 0
 
+#define _FP_TININESS_AFTER_ROUNDING 1
+
 #endif
diff --git a/arch/alpha/math-emu/math.c b/arch/alpha/math-emu/math.c
index 917196e..1fdb122 100644
--- a/arch/alpha/math-emu/math.c
+++ b/arch/alpha/math-emu/math.c
@@ -6,9 +6,9 @@
 #include <asm/uaccess.h>
 
 #include "sfp-util.h"
-#include <math-emu-old/soft-fp.h>
-#include <math-emu-old/single.h>
-#include <math-emu-old/double.h>
+#include <math-emu/soft-fp.h>
+#include <math-emu/single.h>
+#include <math-emu/double.h>
 
 #define	OPC_PAL		0x00
 #define OPC_INTA	0x10
@@ -127,17 +127,27 @@ alpha_fp_emul (unsigned long pc)
 		va = alpha_read_fp_reg_s(fa);
 		vb = alpha_read_fp_reg_s(fb);
 		
-		FP_UNPACK_SP(SA, &va);
-		FP_UNPACK_SP(SB, &vb);
+		switch (func) {
+		case FOP_FNC_SUBx:
+		case FOP_FNC_ADDx:
+			FP_UNPACK_SEMIRAW_SP(SA, &va);
+			FP_UNPACK_SEMIRAW_SP(SB, &vb);
+			break;
+
+		default:
+			FP_UNPACK_SP(SA, &va);
+			FP_UNPACK_SP(SB, &vb);
+			break;
+		}
 
 		switch (func) {
 		case FOP_FNC_SUBx:
 			FP_SUB_S(SR, SA, SB);
-			goto pack_s;
+			goto pack_semiraw_s;
 
 		case FOP_FNC_ADDx:
 			FP_ADD_S(SR, SA, SB);
-			goto pack_s;
+			goto pack_semiraw_s;
 
 		case FOP_FNC_MULx:
 			FP_MUL_S(SR, SA, SB);
@@ -160,26 +170,10 @@ alpha_fp_emul (unsigned long pc)
 		if ((func & ~3) == FOP_FNC_CMPxUN) {
 			FP_UNPACK_RAW_DP(DA, &va);
 			FP_UNPACK_RAW_DP(DB, &vb);
-			if (!DA_e && !_FP_FRAC_ZEROP_1(DA)) {
-				FP_SET_EXCEPTION(FP_EX_DENORM);
-				if (FP_DENORM_ZERO)
-					_FP_FRAC_SET_1(DA, _FP_ZEROFRAC_1);
-			}
-			if (!DB_e && !_FP_FRAC_ZEROP_1(DB)) {
-				FP_SET_EXCEPTION(FP_EX_DENORM);
-				if (FP_DENORM_ZERO)
-					_FP_FRAC_SET_1(DB, _FP_ZEROFRAC_1);
-			}
-			FP_CMP_D(res, DA, DB, 3);
-			vc = 0x4000000000000000UL;
 			/* CMPTEQ, CMPTUN don't trap on QNaN,
 			   while CMPTLT and CMPTLE do */
-			if (res == 3
-			    && ((func & 3) >= 2
-				|| FP_ISSIGNAN_D(DA)
-				|| FP_ISSIGNAN_D(DB))) {
-				FP_SET_EXCEPTION(FP_EX_INVALID);
-			}
+			FP_CMP_D(res, DA, DB, 3, (func & 3) >= 2 ? 2 : 1);
+			vc = 0x4000000000000000UL;
 			switch (func) {
 			case FOP_FNC_CMPxUN: if (res != 3) vc = 0; break;
 			case FOP_FNC_CMPxEQ: if (res) vc = 0; break;
@@ -189,55 +183,64 @@ alpha_fp_emul (unsigned long pc)
 			goto done_d;
 		}
 
-		FP_UNPACK_DP(DA, &va);
-		FP_UNPACK_DP(DB, &vb);
-
 		switch (func) {
 		case FOP_FNC_SUBx:
-			FP_SUB_D(DR, DA, DB);
-			goto pack_d;
-
 		case FOP_FNC_ADDx:
-			FP_ADD_D(DR, DA, DB);
-			goto pack_d;
-
-		case FOP_FNC_MULx:
-			FP_MUL_D(DR, DA, DB);
-			goto pack_d;
-
-		case FOP_FNC_DIVx:
-			FP_DIV_D(DR, DA, DB);
-			goto pack_d;
-
-		case FOP_FNC_SQRTx:
-			FP_SQRT_D(DR, DB);
-			goto pack_d;
+			FP_UNPACK_SEMIRAW_DP(DA, &va);
+			FP_UNPACK_SEMIRAW_DP(DB, &vb);
+			break;
 
 		case FOP_FNC_CVTxS:
 			/* It is irritating that DEC encoded CVTST with
 			   SRC == T_floating.  It is also interesting that
 			   the bit used to tell the two apart is /U... */
 			if (insn & 0x2000) {
-				FP_CONV(S,D,1,1,SR,DB);
-				goto pack_s;
+				FP_UNPACK_SEMIRAW_DP(DB, &vb);
+				FP_TRUNC(S,D,1,1,SR,DB);
+				goto pack_semiraw_s;
 			} else {
 				vb = alpha_read_fp_reg_s(fb);
-				FP_UNPACK_SP(SB, &vb);
-				DR_c = DB_c;
-				DR_s = DB_s;
-				DR_e = DB_e + (1024 - 128);
-				DR_f = SB_f << (52 - 23);
-				goto pack_d;
+				FP_UNPACK_RAW_SP(SB, &vb);
+				FP_EXTEND(D,S,1,1,DR,SB);
+				goto pack_raw_d;
 			}
 
 		case FOP_FNC_CVTxQ:
-			if (DB_c == FP_CLS_NAN
+			FP_UNPACK_RAW_DP(DB, &vb);
+			if (DB_e == _FP_EXPMAX_D
 			    && (_FP_FRAC_HIGH_RAW_D(DB) & _FP_QNANBIT_D)) {
 			  /* AAHB Table B-2 says QNaN should not trigger INV */
 				vc = 0;
 			} else
 				FP_TO_INT_ROUND_D(vc, DB, 64, 2);
 			goto done_d;
+
+		default:
+			FP_UNPACK_DP(DA, &va);
+			FP_UNPACK_DP(DB, &vb);
+			break;
+		}
+
+		switch (func) {
+		case FOP_FNC_SUBx:
+			FP_SUB_D(DR, DA, DB);
+			goto pack_semiraw_d;
+
+		case FOP_FNC_ADDx:
+			FP_ADD_D(DR, DA, DB);
+			goto pack_semiraw_d;
+
+		case FOP_FNC_MULx:
+			FP_MUL_D(DR, DA, DB);
+			goto pack_d;
+
+		case FOP_FNC_DIVx:
+			FP_DIV_D(DR, DA, DB);
+			goto pack_d;
+
+		case FOP_FNC_SQRTx:
+			FP_SQRT_D(DR, DB);
+			goto pack_d;
 		}
 		goto bad_insn;
 
@@ -256,26 +259,44 @@ alpha_fp_emul (unsigned long pc)
 			goto done_d;
 
 		case FOP_FNC_CVTxS:
-			FP_FROM_INT_S(SR, ((long)vb), 64, long);
-			goto pack_s;
+			FP_FROM_INT_S(SR, ((long)vb), 64, unsigned long);
+			goto pack_raw_s;
 
 		case FOP_FNC_CVTxT:
-			FP_FROM_INT_D(DR, ((long)vb), 64, long);
-			goto pack_d;
+			FP_FROM_INT_D(DR, ((long)vb), 64, unsigned long);
+			goto pack_raw_d;
 		}
 		goto bad_insn;
 	}
 	goto bad_insn;
 
+pack_raw_s:
+	FP_PACK_RAW_SP(&vc, SR);
+	goto packed_s;
+
+pack_semiraw_s:
+	FP_PACK_SEMIRAW_SP(&vc, SR);
+	goto packed_s;
+
 pack_s:
 	FP_PACK_SP(&vc, SR);
+packed_s:
 	if ((_fex & FP_EX_UNDERFLOW) && (swcr & IEEE_MAP_UMZ))
 		vc = 0;
 	alpha_write_fp_reg_s(fc, vc);
 	goto done;
 
+pack_raw_d:
+	FP_PACK_RAW_DP(&vc, DR);
+	goto packed_d;
+
+pack_semiraw_d:
+	FP_PACK_SEMIRAW_DP(&vc, DR);
+	goto packed_d;
+
 pack_d:
 	FP_PACK_DP(&vc, DR);
+packed_d:
 	if ((_fex & FP_EX_UNDERFLOW) && (swcr & IEEE_MAP_UMZ))
 		vc = 0;
 done_d:


-- 
Joseph S. Myers
joseph@codesourcery.com
