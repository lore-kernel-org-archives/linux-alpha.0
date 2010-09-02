From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 15/91] arch/arm/mach-at91/Kconfig Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:06:46 -0700
Message-ID: <1283461606-7803-16-git-send-email-justinmattock@gmail.com>
References: <1283461606-7803-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=VJPPlaM99QVNP4q8FzdEpJpSGH/L3wQ51olk6KYV1Do=;
        b=QumEm8RyAwf9hYaLm2zLgW//IUcNjzrNnU/TwqfNzcshN429ZcFGX54MnS/+W6yZ7R
         iZNlqA43czdafFhkqPlTpt12lTz/j3BUpUii+KQnlhLw6Lp+1EUmqpnJirPlMyqe+V5c
         zNPs+N7kd1+6vj3EUo5HUp47+tee6B+nCmhaE=
In-Reply-To: <1283461606-7803-1-git-send-email-justinmattock@gmail.com>
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
 arch/arm/mach-at91/Kconfig |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index 939bccd..c0bcfb8 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -105,7 +105,7 @@ config MACH_ONEARM
 	bool "Ajeco 1ARM Single Board Computer"
 	help
 	  Select this if you are using Ajeco's 1ARM Single Board Computer.
-	  <http://www.ajeco.fi/products.htm>
+	  <http://www.ajeco.fi/index.php?language=fin>
 
 config ARCH_AT91RM9200DK
 	bool "Atmel AT91RM9200-DK Development board"
@@ -137,7 +137,7 @@ config MACH_CARMEVA
 	bool "Conitec ARM&EVA"
 	help
 	  Select this if you are using Conitec's AT91RM9200-MCU-Module.
-	  <http://www.conitec.net/english/linuxboard.htm>
+	  <http://www.conitec.net/english/linuxboard.php>
 
 config MACH_ATEB9200
 	bool "Embest ATEB9200"
@@ -149,7 +149,7 @@ config MACH_KB9200
 	bool "KwikByte KB920x"
 	help
 	  Select this if you are using KwikByte's KB920x board.
-	  <http://kwikbyte.com/KB9202_description_new.htm>
+	  <http://www.kwikbyte.com/KB9202.html>
 
 config MACH_PICOTUX2XX
 	bool "picotux 200"
-- 
1.7.2.1

