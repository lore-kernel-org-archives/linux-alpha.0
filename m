From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 04/91] arch/arm/mach-omap1/Kconfig Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:06:35 -0700
Message-ID: <1283461606-7803-5-git-send-email-justinmattock@gmail.com>
References: <1283461606-7803-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=QXCZLRpkhWdpqcSASGGpVPc0M6Vo9xs6qO1qJAy76ac=;
        b=BwetAqyN4hfZSpVCLMK21NJe+4Ap/xegcndVO9sgtF8bQcP9AS8cB34O6c1NENkhZn
         X0ij+GhWazy+HobcOSOZkrvvT0UBLQhVBwrKI6IdoSCQWnroPjc/AwwJU9ZMXgb6sKN1
         PNmVaYhpGplbbg193pBvAyhyU0Vws0GkCyFhg=
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
 arch/arm/mach-omap1/Kconfig |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index 3b02d3b..4ec4c2e 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -119,8 +119,8 @@ config MACH_OMAP_PALMZ71
 	help
 	 Support for the Palm Zire71 PDA. To boot the kernel,
 	 you'll need a PalmOS compatible bootloader; check out
-	 http://hackndev.com/palm/z71 for more information.
-	 Say Y here if you have such a PDA, say N otherwise.
+	 http://web.archive.org/web/*/http://old.hackndev.com/palm/z71
+	 for more information. Say Y here if you have such a PDA, say N otherwise.
 
 config MACH_OMAP_PALMTT
 	bool "Palm Tungsten|T"
@@ -128,7 +128,7 @@ config MACH_OMAP_PALMTT
 	help
 	  Support for the Palm Tungsten|T PDA. To boot the kernel, you'll
 	  need a PalmOS compatible bootloader (Garux); check out
-	  http://www.hackndev.com/palm/tt/ for more information.
+	  http://garux.sourceforge.net/ for more information.
 	  Say Y here if you have this PDA model, say N otherwise.
 
 config MACH_SX1
-- 
1.7.2.1

