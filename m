From: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH] alpha/boot: fix the breakage from -isystem series...
Date: Wed, 11 Jan 2023 20:43:10 +0000
Message-ID: <Y78fXnVzitfpX1Tm@ZenIV>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=Ux8GgdBMl9eR/WogF8ePMNoWJGD1MCxK7CYf94mdnDc=; b=oFZ2XAysYh+LmsFGhlfAqOxdap
        7Qiw3DdxV3RJ2JdDmn29yAS7FC+Xba+OEFhni0lzJ8DZTv1wzkVlIPlana/io+jvnnuuFXbJd4ZWr
        YPaqgfszFDyr70NTJ1evhrqB2Qy7wiZor5yJ/PmHwdA6JJkPufzHGDKcrUeTA1PwPonz0fNYb5STz
        cTZRIJgn6c1QmRTdzUj4yL9/N6mwDdHfp7SNe0xbJPXmTBCWR+7uXoc5fdCzIwl40dOOb7E8IlV9c
        MwGiQ+e5Llj9vIm7hIMdR2CYVOXwIeFbPwNm6nVhz++A0S6tgdQsxsT8Ge3d1H91hRrgz6ftIuWRA
        wMjrN1Qg==;
Content-Disposition: inline
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/boot/bootp.c  | 2 +-
 arch/alpha/boot/bootpz.c | 2 +-
 arch/alpha/boot/main.c   | 2 +-
 arch/alpha/boot/stdio.c  | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/boot/bootp.c b/arch/alpha/boot/bootp.c
index b4faba2432d5..842e85776cc0 100644
--- a/arch/alpha/boot/bootp.c
+++ b/arch/alpha/boot/bootp.c
@@ -18,7 +18,7 @@
 #include <asm/hwrpb.h>
 #include <asm/io.h>
 
-#include <stdarg.h>
+#include <linux/stdarg.h>
 
 #include "ksize.h"
 
diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index 90a2b341e9c0..c6079308eab3 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -20,7 +20,7 @@
 #include <asm/hwrpb.h>
 #include <asm/io.h>
 
-#include <stdarg.h>
+#include <linux/stdarg.h>
 
 #include "kzsize.h"
 
diff --git a/arch/alpha/boot/main.c b/arch/alpha/boot/main.c
index e5347a080008..22a1cb0264af 100644
--- a/arch/alpha/boot/main.c
+++ b/arch/alpha/boot/main.c
@@ -15,7 +15,7 @@
 #include <asm/console.h>
 #include <asm/hwrpb.h>
 
-#include <stdarg.h>
+#include <linux/stdarg.h>
 
 #include "ksize.h"
 
diff --git a/arch/alpha/boot/stdio.c b/arch/alpha/boot/stdio.c
index 60f73ccd2e89..a5abeaf94791 100644
--- a/arch/alpha/boot/stdio.c
+++ b/arch/alpha/boot/stdio.c
@@ -2,8 +2,8 @@
 /*
  * Copyright (C) Paul Mackerras 1997.
  */
-#include <stdarg.h>
-#include <stddef.h>
+#include <linux/string.h>
+#include <linux/stdarg.h>
 
 size_t strnlen(const char * s, size_t count)
 {
-- 
2.30.2

