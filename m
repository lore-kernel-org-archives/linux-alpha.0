From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH] alpha, gpio: GENERIC_GPIO default must be n
Date: Sun, 28 Aug 2011 21:57:00 +0100
Message-ID: <1314565020.9176.60.camel@deadeye>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: Michael Cree <mcree@orcon.net.nz>, 638696@bugs.debian.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org

Since GPIOLIB is optional on alpha, GENERIC_GPIO must not be
selected by default.  If GPIOLIB is enabled, it will select
GENERIC_GPIO.

Reported-by: Michael Cree <mcree@orcon.net.nz>
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
See <http://bugs.debian.org/638696> for an example of what 'def_bool y'
breaks.

Ben.

 arch/alpha/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 60cde53..8bb9362 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -51,7 +51,7 @@ config GENERIC_CMOS_UPDATE
         def_bool y
 
 config GENERIC_GPIO
-	def_bool y
+	bool
 
 config ZONE_DMA
 	bool
-- 
1.7.5.4


