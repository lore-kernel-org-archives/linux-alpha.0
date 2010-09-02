From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 25/91] arch/h8300/Kconfig.cpu Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:07:54 -0700
Message-ID: <1283461679-7851-10-git-send-email-justinmattock@gmail.com>
References: <1283461679-7851-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=qG8kFP5KZ0/0GbTVZqUgExQAaWz7vkSGcUAPEPLAMXU=;
        b=XXtn0hrBa8TIh8ubHHQl8kQ/MIGKTwjDjS3LPi7xNTMbThN0GTx0NIJdra67IT48hU
         AUqJL73qRXqScnBCn90TMD7b5snW6JmkswkNGSKQTNfxFTp2lc5DsZLL9dT5RGOWqt6K
         DbbdLXFNIcz6ygqQoco1S7h7MGZ1orF8xsc5E=
In-Reply-To: <1283461679-7851-1-git-send-email-justinmattock@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
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
 arch/h8300/Kconfig.cpu |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/h8300/Kconfig.cpu b/arch/h8300/Kconfig.cpu
index 6e2ecff..d69fc26 100644
--- a/arch/h8300/Kconfig.cpu
+++ b/arch/h8300/Kconfig.cpu
@@ -17,10 +17,10 @@ config H8300H_AKI3068NET
 	help
 	  AKI-H8/3068F / AKI-H8/3069F Flashmicom LAN Board Support
 	  More Information. (Japanese Only)
-	  <http://akizukidensi.com/catalog/h8.html>
+	  <http://akizukidenshi.com/catalog/default.aspx>
 	  AE-3068/69 Evaluation Board Support
 	  More Information.
-	  <http://www.microtronique.com/ae3069lan.htm>
+	  <http://www.microtronique.com/>
 
 config H8300H_H8MAX
 	bool "H8MAX"
@@ -28,7 +28,7 @@ config H8300H_H8MAX
 	help
 	  H8MAX Evaluation Board Support
 	  More Information. (Japanese Only)
-	  <http://strawberry-linux.com/h8/index.html>
+	  <http://strawberry-linux.com/h8/>
 
 config H8300H_SIM
 	bool "H8/300H Simulator"
@@ -36,7 +36,7 @@ config H8300H_SIM
 	help
 	  GDB Simulator Support
 	  More Information.
-	  arch/h8300/Doc/simulator.txt
+	  <http://www.gnu.org/software/gdb/> 
 
 config H8S_GENERIC
 	bool "H8S Generic"
@@ -49,15 +49,15 @@ config H8S_EDOSK2674
 	help
 	  Renesas EDOSK-2674 Evaluation Board Support
 	  More Information.
-	  <http://www.azpower.com/H8-uClinux/index.html>
- 	  <http://www.eu.renesas.com/tools/edk/support/edosk2674.html>
+	  <http://h8-uclinux.sourceforge.net/>
+ 	  <http://www.renesas.eu/>
 
 config H8S_SIM
 	bool "H8S Simulator"
 	help
 	  GDB Simulator Support
 	  More Information.
-	  arch/h8300/Doc/simulator.txt
+	  http://www.gnu.org/software/gdb/ 
 
 endchoice
 
-- 
1.7.2.1

