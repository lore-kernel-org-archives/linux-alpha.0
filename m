From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH v4] alpha: add a barrier after outb, outw and outl
Date: Thu, 7 May 2020 11:46:44 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005071145250.15191@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588866410;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ovG7LSbK857eMfLA1eEikSEQHDDBc5uzP/qhys5SXfw=;
        b=DBOEj1q6b6cfBQsRlAoEhPeCYrixQ8uHA8L90Ed25SrKJaDSOPwH8VD5i9YnnfXB1cgoBJ
        WCR6DoMqvw5Lo164Rue5JUkQMdYGzCP/MlzdPSUDsyTZL49xn5QtUKB/l9EbdHM7WxLTt1
        2HzoG7PE+QhVbJz7+DO6WlyFNvO0kcE=
In-Reply-To: <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

The patch 92d7223a74235054f2aa7227d207d9c57f84dca0 ("alpha: io: reorder
barriers to guarantee writeX() and iowriteX() ordering #2") broke boot on
the Alpha Avanti platform.

The patch changes timing between accesses to the ISA bus, in particular,
it reduces the time between "write" access and a subsequent "read" access.

This causes lock-up when accessing the real time clock and serial ports.

This patch fixes the bug by adding a memory barrier after the functions
that access the ISA ports - outb, outw, outl. The barrier causes that
there is some delay between the write to an IO port and a subsequent read.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
Cc: stable@vger.kernel.org	# v4.17+

---
 arch/alpha/include/asm/io.h |    3 +++
 arch/alpha/kernel/io.c      |    3 +++
 2 files changed, 6 insertions(+)

Index: linux-stable/arch/alpha/include/asm/io.h
===================================================================
--- linux-stable.orig/arch/alpha/include/asm/io.h	2020-05-07 17:36:58.000000000 +0200
+++ linux-stable/arch/alpha/include/asm/io.h	2020-05-07 17:36:58.000000000 +0200
@@ -347,11 +347,13 @@ extern inline u16 inw(unsigned long port
 extern inline void outb(u8 b, unsigned long port)
 {
 	iowrite8(b, ioport_map(port, 1));
+	mb();
 }
 
 extern inline void outw(u16 b, unsigned long port)
 {
 	iowrite16(b, ioport_map(port, 2));
+	mb();
 }
 #endif
 
@@ -377,6 +379,7 @@ extern inline u32 inl(unsigned long port
 extern inline void outl(u32 b, unsigned long port)
 {
 	iowrite32(b, ioport_map(port, 4));
+	mb();
 }
 #endif
 
Index: linux-stable/arch/alpha/kernel/io.c
===================================================================
--- linux-stable.orig/arch/alpha/kernel/io.c	2020-05-07 17:36:58.000000000 +0200
+++ linux-stable/arch/alpha/kernel/io.c	2020-05-07 17:36:58.000000000 +0200
@@ -78,16 +78,19 @@ u32 inl(unsigned long port)
 void outb(u8 b, unsigned long port)
 {
 	iowrite8(b, ioport_map(port, 1));
+	mb();
 }
 
 void outw(u16 b, unsigned long port)
 {
 	iowrite16(b, ioport_map(port, 2));
+	mb();
 }
 
 void outl(u32 b, unsigned long port)
 {
 	iowrite32(b, ioport_map(port, 4));
+	mb();
 }
 
 EXPORT_SYMBOL(inb);

