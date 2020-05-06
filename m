From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH 2/2 v2] alpha: add a delay before serial port read
Date: Wed, 6 May 2020 11:57:08 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005061152300.16395@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060721450.25338@file01.intranet.prod.int.rdu2.redhat.com> <20200506114711.GB3024358@kroah.com> <alpine.LRH.2.02.2005061122440.16395@file01.intranet.prod.int.rdu2.redhat.com> <20200506154938.GA3537174@kroah.com>
Mime-Version: 1.0
Return-path: <linux-serial-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588780632;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cmGtqLKbdcuk3GEDBRY8pjioOEUIcpSAuT0yu/iJDjA=;
        b=hRjFt/ztpezuavusNnKnnd7x7nCWG+uD6pLzbjCKomqABys8VaCmsRWeLtVWfMlJ/PAaj7
        duwEQ3HYTcSBW35QmtbpKMB5ycMr8wE0PlhBxFUyr1DN+ctcs7o/oU65DJUkUPtojxQKdO
        toHWCllHCx+v09Gq0TV504XElXBPrj8=
In-Reply-To: <20200506154938.GA3537174@kroah.com>
Sender: linux-serial-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Sinan Kaya <okaya@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org



On Wed, 6 May 2020, Greg Kroah-Hartman wrote:

> On Wed, May 06, 2020 at 11:29:29AM -0400, Mikulas Patocka wrote:
> > 
> > 
> > On Wed, 6 May 2020, Greg Kroah-Hartman wrote:
> > 
> > > > Index: linux-stable/drivers/tty/serial/8250/8250_port.c
> > > > ===================================================================
> > > > --- linux-stable.orig/drivers/tty/serial/8250/8250_port.c	2020-05-06 08:25:19.000000000 +0200
> > > > +++ linux-stable/drivers/tty/serial/8250/8250_port.c	2020-05-06 09:04:17.000000000 +0200
> > > > @@ -442,6 +442,10 @@ static unsigned int mem32be_serial_in(st
> > > >  
> > > >  static unsigned int io_serial_in(struct uart_port *p, int offset)
> > > >  {
> > > > +#ifdef CONFIG_ALPHA
> > > > +/* we need a small delay, the Alpha Avanti chipset locks up with back-to-back accesses */
> > > > +	ndelay(300);
> > > > +#endif
> > > 
> > > We really do not like #ifdef in .c files, especially ones that cause a
> > > coding style violation :)
> > > 
> > > Why can't you do this as a quirk for this specific chipset?  You should
> > > tie it to the serial port hardware type, not to the CPU type.
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > Do you want this patch? It enables the delay based on the specific PCI-ISA 
> > bridge.
> > 
> > There is still "#if defined(CONFIG_ALPHA) && defined(CONFIG_PCI)" because 
> > if we want to reference a variable defined by the PCI subsystem in the 
> > arch/alpha tree, we must do it conditionally. If you want to get rid of 
> > these #ifs, please describe how.
> > 
> > Mikulas
> > 
> > 
> > From: Mikulas Patocka <mpatocka@redhat.com>
> > 
> > The patch 92d7223a74235054f2aa7227d207d9c57f84dca0 ("alpha: io: reorder
> > barriers to guarantee writeX() and iowriteX() ordering #2") broke boot on
> > the Alpha Avanti platform.
> > 
> > The patch changes timing between accesses to the ISA bus, in particular,
> > it reduces the time between "write" access and a subsequent "read" access.
> > 
> > This causes lock-up when accessing the real time clock and serial ports.
> > 
> > This patch fixes the serial ports by adding a small delay before the "inb"
> > instruction.
> > 
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
> > Cc: stable@vger.kernel.org	# v4.17+
> > 
> > ---
> >  arch/alpha/include/asm/pci.h        |    2 ++
> >  arch/alpha/kernel/pci.c             |    4 ++++
> >  drivers/tty/serial/8250/8250_core.c |    7 +++++++
> >  drivers/tty/serial/8250/8250_port.c |    3 +++
> >  include/linux/serial_core.h         |    1 +
> >  5 files changed, 17 insertions(+)
> > 
> > Index: linux-stable/include/linux/serial_core.h
> > ===================================================================
> > --- linux-stable.orig/include/linux/serial_core.h	2020-05-06 17:16:28.000000000 +0200
> > +++ linux-stable/include/linux/serial_core.h	2020-05-06 17:16:28.000000000 +0200
> > @@ -154,6 +154,7 @@ struct uart_port {
> >  
> >  	/* quirks must be updated while holding port mutex */
> >  #define UPQ_NO_TXEN_TEST	BIT(0)
> > +#define UPQ_DELAY_BEFORE_READ	BIT(1)
> >  
> >  	unsigned int		read_status_mask;	/* driver specific */
> >  	unsigned int		ignore_status_mask;	/* driver specific */
> > Index: linux-stable/drivers/tty/serial/8250/8250_core.c
> > ===================================================================
> > --- linux-stable.orig/drivers/tty/serial/8250/8250_core.c	2020-05-06 17:16:28.000000000 +0200
> > +++ linux-stable/drivers/tty/serial/8250/8250_core.c	2020-05-06 17:16:28.000000000 +0200
> > @@ -37,6 +37,9 @@
> >  #ifdef CONFIG_SPARC
> >  #include <linux/sunserialcore.h>
> >  #endif
> > +#if defined(CONFIG_ALPHA) && defined(CONFIG_PCI)
> > +#include <linux/pci.h>
> > +#endif
> 
> Don't need the #if for this.

You're right.

> >  #include <asm/irq.h>
> >  
> > @@ -490,6 +493,10 @@ static void univ8250_rsa_support(struct
> >  static inline void serial8250_apply_quirks(struct uart_8250_port *up)
> >  {
> >  	up->port.quirks |= skip_txen_test ? UPQ_NO_TXEN_TEST : 0;
> > +#if defined(CONFIG_ALPHA) && defined(CONFIG_PCI)
> > +	if (alpha_serial_port_needs_delay)
> > +		up->port.quirks |= UPQ_DELAY_BEFORE_READ;
> > +#endif
> 
> Why is a #define needed here?
> 
> You can do this same type of change without any #ifdefs in any .c files
> and that would be much nicer.

Because alpha_serial_port_needs_delay is defined only on Alpha - so we 
need to guard accesses to it with #ifdef CONFIG_ALPHA - otherwise the 
kernel wouldn't link on non-Alpha platforms.

Should I make it defined for all architectures?

Mikulas

