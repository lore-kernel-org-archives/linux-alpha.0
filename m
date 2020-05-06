From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH 2/2] alpha: add a delay before serial port read
Date: Wed, 6 May 2020 07:23:31 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005060721450.25338@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-serial-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588764215;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=sxASDUoH2mg/OWf8ncLB2g7lbzbXYW0W74S4Ym38kY4=;
        b=CX/V9Gf8rBUdSEjs3woaysCV9eyMcAA/1b1Xz6EnPBh8Tyw6Lx5P19yZw7+EGACX07WsjV
        MsuKNx5EkHhDSa0r0PjpRSoh8wwiHGRhx8xbnSVdxPlTx+o9qDUtRnUL3HN09hhtQpxVbN
        lmBFgCgJaJ7KMYm+t7W2ChRmUn6Y78I=
Sender: linux-serial-owner@vger.kernel.org
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

This patch fixes the serial ports by adding a small delay before the "inb"
instruction.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
Cc: stable@vger.kernel.org	# v4.17+

---
 drivers/tty/serial/8250/8250_port.c |    4 ++++
 1 file changed, 4 insertions(+)

Index: linux-stable/drivers/tty/serial/8250/8250_port.c
===================================================================
--- linux-stable.orig/drivers/tty/serial/8250/8250_port.c	2020-05-06 08:25:19.000000000 +0200
+++ linux-stable/drivers/tty/serial/8250/8250_port.c	2020-05-06 09:04:17.000000000 +0200
@@ -442,6 +442,10 @@ static unsigned int mem32be_serial_in(st
 
 static unsigned int io_serial_in(struct uart_port *p, int offset)
 {
+#ifdef CONFIG_ALPHA
+/* we need a small delay, the Alpha Avanti chipset locks up with back-to-back accesses */
+	ndelay(300);
+#endif
 	offset = offset << p->regshift;
 	return inb(p->iobase + offset);
 }

