From: Tom Rini <trini@kernel.crashing.org>
Subject: [PATCH 2.4.19-rc1] Make sure drivers/input/Config.in goes before drivers/char/Config.in
Date: Mon, 1 Jul 2002 08:29:10 -0700
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20020701152910.GD20920@opus.bloom.county>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcelo Tosatti <marcelo@conectiva.com.br>
Cc: linux-kernel@vger.kernel.org, linux-mips@oss.sgi.com, linux-alpha@vger.kernel.org

This makes drivers/input/Config.in always comes before drivers/char/Config.in.

Currently, alpha, mips and mips64 source drivers/input/Config.in after
drivers/char/Config.in.  But as noted in most of the other arches
config.in, drivers/input/Config.in must come before
drivers/char/Config.in for all depenancies to be worked out.  This adds
that comments to these arches as well as fixing the dependancy.

On the off chance that this is intentional, linux-mips and linux-alpha
are CC'ed as well.

-- 
Tom Rini (TR1265)
http://gate.crashing.org/~trini/

===== arch/alpha/config.in 1.15 vs edited =====
--- 1.15/arch/alpha/config.in	Sat May 25 19:37:06 2002
+++ edited/arch/alpha/config.in	Mon Jul  1 07:16:45 2002
@@ -362,6 +362,10 @@
 fi
 endmenu
 
+#
+# input before char - char/joystick depends on it. As does USB.
+#
+source drivers/input/Config.in
 source drivers/char/Config.in
 
 #source drivers/misc/Config.in
@@ -397,7 +401,6 @@
 endmenu
 
 source drivers/usb/Config.in
-source drivers/input/Config.in
 
 source net/bluetooth/Config.in
 
===== arch/mips/config.in 1.6 vs edited =====
--- 1.6/arch/mips/config.in	Thu Feb 28 06:57:19 2002
+++ edited/arch/mips/config.in	Mon Jul  1 07:17:22 2002
@@ -563,6 +563,10 @@
 fi
 endmenu
 
+#
+# input before char - char/joystick depends on it. As does USB.
+#
+source drivers/input/Config.in
 source drivers/char/Config.in
 
 source drivers/media/Config.in
@@ -628,7 +632,6 @@
 fi
 
 source drivers/usb/Config.in
-source drivers/input/Config.in
 
 mainmenu_option next_comment
 comment 'Kernel hacking'
===== arch/mips64/config.in 1.6 vs edited =====
--- 1.6/arch/mips64/config.in	Thu Feb 28 06:57:19 2002
+++ edited/arch/mips64/config.in	Mon Jul  1 07:17:38 2002
@@ -284,6 +284,10 @@
 fi
 endmenu
 
+#
+# input before char - char/joystick depends on it. As does USB.
+#
+source drivers/input/Config.in
 source drivers/char/Config.in
 
 #source drivers/misc/Config.in
@@ -325,7 +329,6 @@
 fi
 
 source drivers/usb/Config.in
-source drivers/input/Config.in
 
 mainmenu_option next_comment
 comment 'Kernel hacking'
