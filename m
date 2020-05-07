From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
Date: Thu, 7 May 2020 06:53:48 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005070648480.18423@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <20200507082007.GD1024567@kroah.com>
Mime-Version: 1.0
Return-path: <linux-serial-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588848835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=34zgbFJkoC2oaoVh2WD7e5/FT5aa6aZRg4OtM6t+uxY=;
        b=gS9ycqRhIaGLWtFTeMcd55rKL5OwLiaE+fnxrb83nTnByIOdJJy7oYAR1BiV1eslE40DBa
        A7+XlPj+2rz/n3EuYBhWfnmrLO4FBCBVZZMIl421PGJ8L1VMWqJrvBMtsWqJ938FHJddPQ
        91Cx4DLYQZR1BLxsx1S8lQBG2IU7+wA=
In-Reply-To: <20200507082007.GD1024567@kroah.com>
Sender: linux-serial-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

alpha: add a delay to inb_p, inb_w and inb_l

The patch 92d7223a74235054f2aa7227d207d9c57f84dca0 ("alpha: io: reorder
barriers to guarantee writeX() and iowriteX() ordering #2") broke boot on
the Alpha Avanti platform.

The patch changes timing between accesses to the ISA bus, in particular,
it reduces the time between "write" access and a subsequent "read" access.

This causes lock-up when accessing the real time clock and serial ports.

This patch fixes the real time clock by adding a small delay to the inb_p,
inw_p and inl_p macros. Note that we don't have to add a delay before
outb_p, outw_p and outl_p, because there is already a "mb()" instruction
before them and this instruction slows down access sufficiently.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
Cc: stable@vger.kernel.org	# v4.17+

---
 arch/alpha/include/asm/io.h |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

Index: linux-stable/arch/alpha/include/asm/io.h
===================================================================
--- linux-stable.orig/arch/alpha/include/asm/io.h	2020-05-07 09:54:52.000000000 +0200
+++ linux-stable/arch/alpha/include/asm/io.h	2020-05-07 09:54:52.000000000 +0200
@@ -6,6 +6,7 @@
 
 #include <linux/kernel.h>
 #include <linux/mm.h>
+#include <linux/delay.h>
 #include <asm/compiler.h>
 #include <asm/pgtable.h>
 #include <asm/machvec.h>
@@ -481,9 +482,9 @@ extern inline void writeq(u64 b, volatil
 #define iowrite16be(v,p) iowrite16(cpu_to_be16(v), (p))
 #define iowrite32be(v,p) iowrite32(cpu_to_be32(v), (p))
 
-#define inb_p		inb
-#define inw_p		inw
-#define inl_p		inl
+#define inb_p(x)	(ndelay(1400), inb(x))
+#define inw_p(x)	(ndelay(1400), inw(x))
+#define inl_p(x)	(ndelay(1400), inl(x))
 #define outb_p		outb
 #define outw_p		outw
 #define outl_p		outl

