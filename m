From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH 1/2] alpha: add a delay between RTC port write and read
Date: Wed, 6 May 2020 07:21:43 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588764110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=dyBeBM3FMukKdQkbDKzhstncX2ZdEJKF6/LgPra/QJA=;
        b=OBgydTkJ2cJ7wl0WmLmKRnllYKRyeYkmCepyU530nG47hpoudKSLoHxCylscKmBPSeoVSd
        KwkM2jkQTA9R4PVmC07sZryXXKMlT1WmnjdJNlOE+cxCKamnaQcXPBtzMeou01n0T/Zemb
        Qq+/pFaip+S5JK1KHYjIFfI4oIXgmmw=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-alpha@vger.kernel.org, Sinan Kaya <okaya@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

The patch 92d7223a74235054f2aa7227d207d9c57f84dca0 ("alpha: io: reorder
barriers to guarantee writeX() and iowriteX() ordering #2") broke boot on
the Alpha Avanti platform.

The patch changes timing between accesses to the ISA bus, in particular,
it reduces the time between "write" access and a subsequent "read" access.

This causes lock-up when accessing the real time clock and serial ports.

This patch fixes the real time clock by adding a small delay between
outb_p and inb_p.

Note that we don't have to add the delay to CMOS_WRITE, because it
consists of two write accesses and they already have mb() between them.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
Cc: stable@vger.kernel.org	# v4.17+

---
 arch/alpha/include/asm/mc146818rtc.h |    4 ++++
 1 file changed, 4 insertions(+)

Index: linux-stable/arch/alpha/include/asm/mc146818rtc.h
===================================================================
--- linux-stable.orig/arch/alpha/include/asm/mc146818rtc.h	2020-05-05 20:48:30.000000000 +0200
+++ linux-stable/arch/alpha/include/asm/mc146818rtc.h	2020-05-05 21:05:53.000000000 +0200
@@ -15,9 +15,13 @@
 /*
  * The yet supported machines all access the RTC index register via
  * an ISA port access but the way to access the date register differs ...
+ *
+ * The ISA bus on Alpha Avanti doesn't like back-to-back accesses,
+ * we need to add a small delay.
  */
 #define CMOS_READ(addr) ({ \
 outb_p((addr),RTC_PORT(0)); \
+udelay(2); \
 inb_p(RTC_PORT(1)); \
 })
 #define CMOS_WRITE(val, addr) ({ \

