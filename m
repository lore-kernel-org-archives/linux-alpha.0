From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH 1/2 v2] alpha: add a delay to inb_p, inb_w and inb_l
Date: Wed, 6 May 2020 13:12:20 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588785144;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4NmFIV7QvCRRvqv1Eoet8VLqmfYT92cvTdnbMe/vaPw=;
        b=d4pa3mkRRxiB0TN6bgxavmUopcUxs696jeKlAH5bQyw5gIDqhJL6uu9PRHmCYOqU+A4PqB
        5p7+4Jjob5nb58QwTHxzuTWralbKY5Q2x1SmPG0Wn0VC+6dr4JJkUzb8VvrHjyg69BacAh
        v+so9NH+3kefoZjZzuPQw7OKh+qJvQU=
In-Reply-To: <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, Sinan Kaya <okaya@codeaurora.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org



On Wed, 6 May 2020, Arnd Bergmann wrote:

> On Wed, May 6, 2020 at 1:21 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> 
> >  /*
> >   * The yet supported machines all access the RTC index register via
> >   * an ISA port access but the way to access the date register differs ...
> > + *
> > + * The ISA bus on Alpha Avanti doesn't like back-to-back accesses,
> > + * we need to add a small delay.
> >   */
> >  #define CMOS_READ(addr) ({ \
> >  outb_p((addr),RTC_PORT(0)); \
> > +udelay(2); \
> >  inb_p(RTC_PORT(1)); \
> 
> 
> The inb_p() / outb_p() functions are meant to already have a delay in them,
> maybe we should just add it there for alpha?
> 
>      Arnd

Yes, that is possible too - it fixes the real time clock hang for me.



From: Mikulas Patocka <mpatocka@redhat.com>

The patch 92d7223a74235054f2aa7227d207d9c57f84dca0 ("alpha: io: reorder
barriers to guarantee writeX() and iowriteX() ordering #2") broke boot on
the Alpha Avanti platform.

The patch changes timing between accesses to the ISA bus, in particular,
it reduces the time between "write" access and a subsequent "read" access.

This causes lock-up when accessing the real time clock and serial ports.

This patch fixes the real time clock by adding a small delay to the inb_p,
inw_p and inl_p macros.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
Cc: stable@vger.kernel.org	# v4.17+

---
 arch/alpha/include/asm/io.h |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

Index: linux-stable/arch/alpha/include/asm/io.h
===================================================================
--- linux-stable.orig/arch/alpha/include/asm/io.h	2020-05-06 08:23:47.000000000 +0200
+++ linux-stable/arch/alpha/include/asm/io.h	2020-05-06 18:33:47.000000000 +0200
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
+#define inb_p(x)	(ndelay(300), inb(x))
+#define inw_p(x)	(ndelay(300), inw(x))
+#define inl_p(x)	(ndelay(300), inl(x))
 #define outb_p		outb
 #define outw_p		outw
 #define outl_p		outl

