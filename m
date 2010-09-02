From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 16/91] arch/arm/mach-footbridge/Kconfig Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:07:45 -0700
Message-ID: <1283461679-7851-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=8Dr0ctCoF69M6LmlxuSSmTJQr8UPa+mYoC04iNA/R/I=;
        b=qGJaoLqbSp0SCfHvV7L7V5DBHIpHD6oPGIF/2WjAFcYPHcKmeM1/fo+LKgXN2fCf1y
         cM34RHiKcsMrdF4X8gDaOyoegqlKhGOqMDVNEcvDTbqbHcuiLHeOC9yDg/hqw+XQtQ7f
         eoETkKZD+bWIDlPBmt1+1Usm4ApaYfxkWw0yg=
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
 arch/arm/mach-footbridge/Kconfig |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-footbridge/Kconfig b/arch/arm/mach-footbridge/Kconfig
index bdd2579..81d66fb 100644
--- a/arch/arm/mach-footbridge/Kconfig
+++ b/arch/arm/mach-footbridge/Kconfig
@@ -29,7 +29,8 @@ config ARCH_PERSONAL_SERVER
 	  There are no product plans beyond the current research
 	  prototypes at this time.  Information is available at:
 
-	  <http://www.crl.hpl.hp.com/projects/personalserver/>
+	  <http://web.archive.org/web/*/http://www.crl.hpl.hp.com
+	  /projects/personalserver/>
 
 	  If you have any questions or comments about the  Compaq Personal
 	  Server, send e-mail to <skiff@crl.dec.com>.
-- 
1.7.2.1
