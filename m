From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 3.16 183/366] time: Make sure jiffies_to_msecs() preserves
 non-zero time periods
Date: Sun, 11 Nov 2018 19:49:05 +0000
Message-ID: <lsq.1541965745.992465034@decadent.org.uk>
References: <lsq.1541965744.387173642@decadent.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <lsq.1541965744.387173642@decadent.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-mips@linux-mips.org, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, John Stultz <john.stultz@linaro.org>, linux-alpha@vger.kernel.org

3.16.61-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Geert Uytterhoeven <geert@linux-m68k.org>

commit abcbcb80cd09cd40f2089d912764e315459b71f7 upstream.

For the common cases where 1000 is a multiple of HZ, or HZ is a multiple of
1000, jiffies_to_msecs() never returns zero when passed a non-zero time
period.

However, if HZ > 1000 and not an integer multiple of 1000 (e.g. 1024 or
1200, as used on alpha and DECstation), jiffies_to_msecs() may return zero
for small non-zero time periods.  This may break code that relies on
receiving back a non-zero value.

jiffies_to_usecs() does not need such a fix: one jiffy can only be less
than one =C2=B5s if HZ > 1000000, and such large values of HZ are already
rejected at build time, twice:

  - include/linux/jiffies.h does #error if HZ >=3D 12288,
  - kernel/time/time.c has BUILD_BUG_ON(HZ > USEC_PER_SEC).

Broken since forever.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-alpha@vger.kernel.org
Cc: linux-mips@linux-mips.org
Link: https://lkml.kernel.org/r/20180622143357.7495-1-geert@linux-m68k.org
[bwh: Backported to 3.16: adjust filename]
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 kernel/time.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- a/kernel/time.c
+++ b/kernel/time.c
@@ -28,6 +28,7 @@
  */
=20
 #include <linux/export.h>
+#include <linux/kernel.h>
 #include <linux/timex.h>
 #include <linux/capability.h>
 #include <linux/timekeeper_internal.h>
@@ -253,9 +254,10 @@ unsigned int jiffies_to_msecs(const unsi
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

