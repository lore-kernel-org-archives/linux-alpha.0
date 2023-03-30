From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v8 1/7] kernel.h: Split out COUNT_ARGS() and CONCATENATE()
Date: Thu, 30 Mar 2023 19:24:28 +0300
Message-ID: <20230330162434.35055-2-andriy.shevchenko@linux.intel.com>
References: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680193710; x=1711729710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gIQa0UBc6rrUYtPkGDZ1t1xT6zplGxALb8OYgbohTeo=;
  b=BMtTgumTEElOfhQRh4w1CoFSlfi1IAEExZC2z1RKdIUvoIe6ccOxQVzV
   Rlksvnz+TcvSvVLgBTVVNHnv3EBmaC9Jdg26SckfEbnntjcaNkiJJkduh
   m4oUcxXM2199ksPs7gvzF+1LgO9qQToWjlEGN6L8oBajTJAuOKW2GgO8N
   bFBgi8gxJySCKoYEYvHJW0k0FHYB/J1zvzOvZ+OHAFlDGBrAbqdQ6itQ6
   FlBGGA05YlYApYayjV7BP6ISso81/5cVOkvzXSErGBro1mVIKHNLLSFH9
   fXvfsJRlgeuDd0n4MFFAh5vkidqwRdCSRQMSHS+pe5vQG+7X0A0wF0TNd
   w==;
In-Reply-To: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@list
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>

kernel.h is being used as a dump for all kinds of stuff for a long time.
The COUNT_ARGS() and CONCATENATE() macros may be used in some places
without need of the full kernel.h dependency train with it.

Here is the attempt on cleaning it up by splitting out these macros().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/args.h   | 13 +++++++++++++
 include/linux/kernel.h |  8 +-------
 2 files changed, 14 insertions(+), 7 deletions(-)
 create mode 100644 include/linux/args.h

diff --git a/include/linux/args.h b/include/linux/args.h
new file mode 100644
index 000000000000..16ef6fad8add
--- /dev/null
+++ b/include/linux/args.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_ARGS_H
+#define _LINUX_ARGS_H
+
+/* This counts to 12. Any more, it will return 13th argument. */
+#define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
+#define COUNT_ARGS(X...) __COUNT_ARGS(, ##X, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
+
+#define __CONCAT(a, b) a ## b
+#define CONCATENATE(a, b) __CONCAT(a, b)
+
+#endif	/* _LINUX_ARGS_H */
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 0d91e0af0125..fa675d50d7b7 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -13,6 +13,7 @@
 
 #include <linux/stdarg.h>
 #include <linux/align.h>
+#include <linux/args.h>
 #include <linux/limits.h>
 #include <linux/linkage.h>
 #include <linux/stddef.h>
@@ -457,13 +458,6 @@ ftrace_vprintk(const char *fmt, va_list ap)
 static inline void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
 #endif /* CONFIG_TRACING */
 
-/* This counts to 12. Any more, it will return 13th argument. */
-#define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
-#define COUNT_ARGS(X...) __COUNT_ARGS(, ##X, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
-
-#define __CONCAT(a, b) a ## b
-#define CONCATENATE(a, b) __CONCAT(a, b)
-
 /* Rebuild everything on CONFIG_FTRACE_MCOUNT_RECORD */
 #ifdef CONFIG_FTRACE_MCOUNT_RECORD
 # define REBUILD_DUE_TO_FTRACE_MCOUNT_RECORD
-- 
2.40.0.1.gaa8946217a0b

