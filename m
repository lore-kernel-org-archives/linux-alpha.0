From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 1/2] Revert "agp: AMD AGP is used on UP1100 & UP1500 alpha boxen"
Date: Tue,  1 Feb 2011 11:54:15 -0500
Message-ID: <1296579256-14777-1-git-send-email-mattst88@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
        bh=eRUiivIu7AizX8Yu2NJ051q5D91UDV1S0Vg2qTS/bcQ=;
        b=ul7Nve60X/eVAVrc77gSJMgD3iG3Z463SULHPtyb24NbVRpcTF+eoUYrbsETvqN13T
         GsQbn+VvO0QOCBat9G2xqmjUO0Xo0WJ/MK/LH7OC3EyqxEXrFgFEyB2r2A/TDM+FHnEa
         v19EM8pB3UZZIK4tXDG4q6mQ/Bq+LE5xapUiA=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-alpha@vger.kernel.org, Alan Hourihane <alanh@fairlite.demon.co.uk>, Matt Turner <mattst88@gmail.com>

This reverts commit f191f144079b0083c6fa7d01a4acbd7263fb5032.

The AMD 751 and 761 chipsets are used on the UP1000, UP1100, and UP1500
OEM motherboards, but they neglect to do anything to make AGP work.

According to Ivan Kokshaysky:
There is quite fundamental conflict between the Alpha architecture and
x86 AGP implementation - Alpha is entirely cache coherent by design,
while x86 AGP is not (I mean native AGP DMA transactions, not a PCI over
AGP). There are no such things as non-cacheable mappings or software
support for cache flushing/invalidation on Alpha, so x86 AGP code won't
work on Nautilus.

So there's no point in allowing this driver to be configured on Alpha.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 drivers/char/agp/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/agp/Kconfig b/drivers/char/agp/Kconfig
index fcd867d..d8b1b57 100644
--- a/drivers/char/agp/Kconfig
+++ b/drivers/char/agp/Kconfig
@@ -50,7 +50,7 @@ config AGP_ATI
 
 config AGP_AMD
 	tristate "AMD Irongate, 761, and 762 chipset support"
-	depends on AGP && (X86_32 || ALPHA)
+	depends on AGP && X86_32
 	help
 	  This option gives you AGP support for the GLX component of
 	  X on AMD Irongate, 761, and 762 chipsets.
-- 
1.7.2.2

