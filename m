From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 05/91] arch/arm/mach-sa1100/Kconfig Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:06:36 -0700
Message-ID: <1283461606-7803-6-git-send-email-justinmattock@gmail.com>
References: <1283461606-7803-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=ip5GAEgEq4WJLd1tcgTWHCNPRWgMWbZIBn93jbSYZYY=;
        b=QBIaPffVFZJFDUu8UR70KUiO0m/bxTeCqaNurgHEWzclqxI4vv1d1RpNMHomUDWWsU
         AvpvD+aeGXrvq7FVwEGw7xuusrAGwi8NnWEJpg4jnBL0CGiypPNTEaIKWVJK906HGc3J
         jlOzWNAURtgmZpvFwwYe2A8c6ydARj0TtJlJ4=
In-Reply-To: <1283461606-7803-1-git-send-email-justinmattock@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, jkosina@suse.cz, "Justin P. Mattock" <justinmattock@gmail.com>

The below patch updates a broken web address that is no longer
working due to company buyout, and/or change of location.
(Please have a look through, and let me know if any of them
need to be changed, and I'll resend an updated patch).

Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>

---
 arch/arm/mach-sa1100/Kconfig |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-sa1100/Kconfig b/arch/arm/mach-sa1100/Kconfig
index fd4c52b..264ee98 100644
--- a/arch/arm/mach-sa1100/Kconfig
+++ b/arch/arm/mach-sa1100/Kconfig
@@ -90,7 +90,8 @@ config SA1100_JORNADA720
 	# FIXME: select CPU_FREQ_SA11x0
 	help
 	  Say Y here if you want to build a kernel for the HP Jornada 720
-	  handheld computer.  See <http://www.hp.com/jornada/products/720>
+	  handheld computer.  See <http://h10025.www1.hp.com/ewfrf/wc/
+	  product?product=61677&cc=us&lc=en&dlc=en&product=61677#>
 	  for details.
 
 config SA1100_JORNADA720_SSP
@@ -108,7 +109,7 @@ config SA1100_HACKKIT
 	select CPU_FREQ_SA1100
 	help
 	  Say Y here to support the HackKit Core CPU Board
-	  <http://hackkit.eletztrick.de>;
+	  <http://web.archive.org/web/*/http://hackkit.eletztrick.de>;
 
 config SA1100_LART
 	bool "LART"
@@ -145,7 +146,7 @@ config SA1100_SIMPAD
 	  FLASH. The SL4 version got 64 MB RAM and 32 MB FLASH and a
 	  PCMCIA-Slot. The version for the Germany Telecom (DTAG) is the same
 	  like CL4 in additional it has a PCMCIA-Slot. For more information
-	  visit <http://www.my-siemens.com/> or <http://www.siemens.ch/>.
+	  visit <http://www.siemens.ch/>.
 
 config SA1100_SSP
 	tristate "Generic PIO SSP"
-- 
1.7.2.1
