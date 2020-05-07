From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
Date: Thu, 7 May 2020 15:30:18 +0200
Message-ID: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com>
 <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-serial-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, Sinan Kaya <okaya@codeaurora.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

On Thu, May 7, 2020 at 10:06 AM Mikulas Patocka <mpatocka@redhat.com> wrote:
> On Wed, 6 May 2020, Mikulas Patocka wrote:
> > On Wed, 6 May 2020, Arnd Bergmann wrote:
> > > On Wed, May 6, 2020 at 1:21 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> > >
> > > >  /*
> > > >   * The yet supported machines all access the RTC index register via
> > > >   * an ISA port access but the way to access the date register differs ...
> > > > + *
> > > > + * The ISA bus on Alpha Avanti doesn't like back-to-back accesses,
> > > > + * we need to add a small delay.
> > > >   */
> > > >  #define CMOS_READ(addr) ({ \
> > > >  outb_p((addr),RTC_PORT(0)); \
> > > > +udelay(2); \
> > > >  inb_p(RTC_PORT(1)); \
> > >
> > >
> > > The inb_p() / outb_p() functions are meant to already have a delay in them,
> > > maybe we should just add it there for alpha?
> > >
> > >      Arnd
> >
> > Yes, that is possible too - it fixes the real time clock hang for me.
> >
> >
> > -#define inb_p                inb
> > -#define inw_p                inw
> > -#define inl_p                inl
> > +#define inb_p(x)     (ndelay(300), inb(x))
> > +#define inw_p(x)     (ndelay(300), inw(x))
> > +#define inl_p(x)     (ndelay(300), inl(x))
> >  #define outb_p               outb
> >  #define outw_p               outw
> >  #define outl_p               outl
>
> 300ns was too low. We need at least 1400ns to fix the hang reliably.

Are you sure that it is in fact the timing that is important here and not
a barrier? I see that inb() is written in terms of readb(), but the
barrier requirements for I/O space are a bit different from those
on PCI memory space.

In the example you gave first, there is a an outb_p() followed by inb_p().
These are normally serialized by the bus, but I/O space also has the
requirement that an outb() completes before we get to the next
instruction (non-posted write), while writeb() is generally posted and
only needs a barrier before the write rather than both before and after
like outb.

    Arnd
