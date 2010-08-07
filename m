From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH] alpha: Fix printk format errors
Date: Sat,  7 Aug 2010 21:15:07 +1200
Message-ID: <1281172507-3595-1-git-send-email-mcree@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-kernel@vger.kernel.org
Cc: Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, stable@kernel.org

When compiling alpha generic build get errors such as:
arch/alpha/kernel/err_marvel.c: In function =E2=80=98marvel_print_err_c=
yc=E2=80=99:
arch/alpha/kernel/err_marvel.c:119: error: format =E2=80=98%ld=E2=80=99=
 expects type =E2=80=98long int=E2=80=99, but argument 6 has type =E2=80=
=98u64=E2=80=99

Replaced a number of %ld format specifiers with %lld since u64
is unsigned long long.

Signed-off-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/kernel/err_marvel.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_mar=
vel.c
index 52a79df..c7f2a62 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -109,7 +109,7 @@ marvel_print_err_cyc(u64 err_cyc)
 #define IO7__ERR_CYC__CYCLE__M	(0x7)
=20
 	printk("%s        Packet In Error: %s\n"
-	       "%s        Error in %s, cycle %ld%s%s\n",
+	       "%s        Error in %s, cycle %lld%s%s\n",
 	       err_print_prefix,=20
 	       packet_desc[EXTRACT(err_cyc, IO7__ERR_CYC__PACKET)],
 	       err_print_prefix,
@@ -313,7 +313,7 @@ marvel_print_po7_ugbge_sym(u64 ugbge_sym)
 	}
=20
 	printk("%s      Up Hose Garbage Symptom:\n"
-	       "%s        Source Port: %ld - Dest PID: %ld - OpCode: %s\n",=20
+	       "%s        Source Port: %lld - Dest PID: %lld - OpCode: %s\n",=
=20
 	       err_print_prefix,
 	       err_print_prefix,=20
 	       EXTRACT(ugbge_sym, IO7__PO7_UGBGE_SYM__UPH_SRC_PORT),
@@ -552,7 +552,7 @@ marvel_print_pox_spl_cmplt(u64 spl_cmplt)
 #define IO7__POX_SPLCMPLT__REM_BYTE_COUNT__M	(0xfff)
=20
 	printk("%s      Split Completion Error:\n"=09
-	       "%s         Source (Bus:Dev:Func): %ld:%ld:%ld\n",
+	       "%s         Source (Bus:Dev:Func): %lld:%lld:%lld\n",
 	       err_print_prefix,
 	       err_print_prefix,
 	       EXTRACT(spl_cmplt, IO7__POX_SPLCMPLT__SOURCE_BUS),
--=20
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
