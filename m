From: Jaswinder Singh Rajput <jaswinder@kernel.org>
Subject: [PATCH] alpha: Remove unused CONFIG ALPHA_EV7
Date: Sat, 26 Sep 2009 18:35:53 +0530
Message-ID: <1253970353.4568.5.camel@ht.satnam>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "Robert P. J. Day" <rpjday@crashcourse.ca>


ALPHA_EV7 is unused and currently ALPHA_MARVEL is used for EV7.

Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Jaswinder Singh Rajput <jaswinderrajput@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
---
 arch/alpha/Kconfig |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 4434481..2a50491 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -449,11 +449,6 @@ config ALPHA_EV67
 	  Is this a machine based on the EV67 core?  If in doubt, select N here
 	  and the machine will be treated as an EV6.
 
-config ALPHA_EV7
-	bool
-	depends on ALPHA_MARVEL
-	default y
-
 config ALPHA_MCPCIA
 	bool
 	depends on ALPHA_RAWHIDE
-- 
1.6.0.6


