From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3] time: Make sure jiffies_to_msecs() preserves non-zero time periods
Date: Fri, 22 Jun 2018 16:33:57 +0200
Message-ID: <20180622143357.7495-1-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, stable@vger.kernel.org

For the common cases where 1000 is a multiple of HZ, or HZ is a multiple
of 1000, jiffies_to_msecs() never returns zero when passed a non-zero
time period.

However, if HZ > 1000 and not an integer multiple of 1000 (e.g. 1024 or
1200, as used on alpha and DECstation), jiffies_to_msecs() may return
zero for small non-zero time periods.  This may break code that relies
on receiving back a non-zero value.

jiffies_to_usecs() does not need such a fix: one jiffy can only be
less than one =C2=B5s if HZ > 1000000, and such large values of HZ are
already rejected at build time, twice:
  - include/linux/jiffies.h does #error if HZ >=3D 12288,
  - kernel/time/time.c has BUILD_BUG_ON(HZ > USEC_PER_SEC).

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: stable@vger.kernel.org
---
Broken since forever.

v3:
  - Add Reviewed-by,
  - Cc stable,
  - Explain better why jiffies_to_usecs() does not need a fix,

v2:
  - Add examples of affected systems,
  - Use DIV_ROUND_UP().
---
 kernel/time/time.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/time/time.c b/kernel/time/time.c
index 6fa99213fc720e4b..2b41e8e2d31db26f 100644
--- a/kernel/time/time.c
+++ b/kernel/time/time.c
@@ -28,6 +28,7 @@
  */
=20
 #include <linux/export.h>
+#include <linux/kernel.h>
 #include <linux/timex.h>
 #include <linux/capability.h>
 #include <linux/timekeeper_internal.h>
@@ -314,9 +315,10 @@ unsigned int jiffies_to_msecs(const unsigned long j)
 	return (j + (HZ / MSEC_PER_SEC) - 1)/(HZ / MSEC_PER_SEC);
 #else
 # if BITS_PER_LONG =3D=3D 32
-	return (HZ_TO_MSEC_MUL32 * j) >> HZ_TO_MSEC_SHR32;
+	return (HZ_TO_MSEC_MUL32 * j + (1ULL << HZ_TO_MSEC_SHR32) - 1) >>
+	       HZ_TO_MSEC_SHR32;
 # else
-	return (j * HZ_TO_MSEC_NUM) / HZ_TO_MSEC_DEN;
+	return DIV_ROUND_UP(j * HZ_TO_MSEC_NUM, HZ_TO_MSEC_DEN);
 # endif
 #endif
 }
--=20
2.17.1

