From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH 01/21] alpha: drop unused Kconfig symbol
Date: Fri, 14 Oct 2011 14:27:20 +0200
Message-ID: <1318595240.6132.57.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
 arch/alpha/Kconfig |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 8bb9362..3d74801 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -445,11 +445,6 @@ config ALPHA_EV67
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
1.7.4.4



