From: Mark Salter <msalter@redhat.com>
Subject: [PATCH 10/10] Kconfig: cleanup SERIO_I8042 dependencies
Date: Sat, 14 Dec 2013 11:59:36 -0500
Message-ID: <1387040376-26906-11-git-send-email-msalter@redhat.com>
References: <1387040376-26906-1-git-send-email-msalter@redhat.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1387040376-26906-1-git-send-email-msalter@redhat.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-Id: <linux-alpha.vger.kernel.org>
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Mark Salter <msalter@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, linux-ia64@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Paul Mundt <lethal@linux-sh.org>, linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel

Remove messy dependencies from SERIO_I8042 by having it depend on one
Kconfig symbol (ARCH_MIGHT_HAVE_PC_SERIO) and having architectures
which need it select ARCH_MIGHT_HAVE_PC_SERIO in arch/*/Kconfig.
New architectures are unlikely to need SERIO_I8042, so this avoids
having an ever growing list of architectures to exclude.

Signed-off-by: Mark Salter <msalter@redhat.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Richard Henderson <rth@twiddle.net>
CC: linux-alpha@vger.kernel.org
CC: Russell King <linux@arm.linux.org.uk>
CC: linux-arm-kernel@lists.infradead.org
CC: Tony Luck <tony.luck@intel.com>
CC: Fenghua Yu <fenghua.yu@intel.com>
CC: linux-ia64@vger.kernel.org
CC: Ralf Baechle <ralf@linux-mips.org>
CC: linux-mips@linux-mips.org
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
CC: Paul Mackerras <paulus@samba.org>
CC: linuxppc-dev@lists.ozlabs.org
CC: Paul Mundt <lethal@linux-sh.org>
CC: linux-sh@vger.kernel.org
CC: "David S. Miller" <davem@davemloft.net>
CC: sparclinux@vger.kernel.org
CC: Guan Xuetao <gxt@mprc.pku.edu.cn>
CC: Ingo Molnar <mingo@redhat.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: "H. Peter Anvin" <hpa@zytor.com>
CC: x86@kernel.org
---
 drivers/input/serio/Kconfig | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/input/serio/Kconfig b/drivers/input/serio/Kconfig
index 8541f94..1f5cec2 100644
--- a/drivers/input/serio/Kconfig
+++ b/drivers/input/serio/Kconfig
@@ -16,14 +16,19 @@ config SERIO
 	  To compile this driver as a module, choose M here: the
 	  module will be called serio.
 
+config ARCH_MIGHT_HAVE_PC_SERIO
+	bool
+	help
+	  Select this config option from the architecture Kconfig if
+	  the architecture might use a PC serio device (i8042) to
+          communicate with keyboard, mouse, etc.
+
 if SERIO
 
 config SERIO_I8042
 	tristate "i8042 PC Keyboard controller"
 	default y
-	depends on !PARISC && (!ARM || FOOTBRIDGE_HOST) && \
-		   (!SUPERH || SH_CAYMAN) && !M68K && !BLACKFIN && !S390 && \
-		   !ARC
+	depends on ARCH_MIGHT_HAVE_PC_SERIO
 	help
 	  i8042 is the chip over which the standard AT keyboard and PS/2
 	  mouse are connected to the computer. If you use these devices,
-- 
1.8.3.1


