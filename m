From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] compile fix for DEC TGA device .remove pointer
Date: Wed, 20 Apr 2005 00:18:33 +1000 (EST)
Message-ID: <Pine.LNX.4.61.0504200002220.10894@loopy.telegraphics.com.au>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: linux-alpha@vger.kernel.org


This patch permits the TGA frame buffer driver to be built in when 
CONFIG_HOTPLUG is enabled, which is useful when the TGA card is used as a 
framebuffer console.

Before, this configuration would not compile, because 
tgafb_pci_unregister() is actually tagged __exit and conditionally 
compiled (#if defined MODULE). This meant that the routine was ommitted by 
the preprocessor but the assignment to .remove was not.

-f


Signed-of-by: Finn Thain <fthain@telegraphics.com.au>

--- drivers/video/tgafb.c-orig	2005-04-18 14:36:53.000000000 +1000
+++ drivers/video/tgafb.c	2005-04-18 14:37:28.000000000 +1000
@@ -82,7 +82,7 @@
 	.name			= "tgafb",
 	.id_table		= tgafb_pci_table,
 	.probe			= tgafb_pci_register,
-	.remove			= __devexit_p(tgafb_pci_unregister),
+	.remove			= __exit_p(tgafb_pci_unregister),
 };
 
 
