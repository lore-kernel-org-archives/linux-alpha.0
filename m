From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH 2/2 v4] alpha: add a delay before serial port read
Date: Thu, 7 May 2020 08:53:03 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005070836190.27409@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200506114711.GB3024358@kroah.com> <alpine.LRH.2.02.2005061122440.16395@file01.intranet.prod.int.rdu2.redhat.com> <20200506154938.GA3537174@kroah.com> <alpine.LRH.2.02.2005061152300.16395@file01.intranet.prod.int.rdu2.redhat.com>
 <20200506160823.GA3559699@kroah.com> <alpine.LRH.2.02.2005061245500.18599@file01.intranet.prod.int.rdu2.redhat.com> <20200506174528.GB3711921@kroah.com> <alpine.LRH.2.02.2005070407010.5006@file01.intranet.prod.int.rdu2.redhat.com> <20200507085201.GA1097552@kroah.com>
 <alpine.LRH.2.02.2005070645330.18423@file01.intranet.prod.int.rdu2.redhat.com> <20200507111037.GB1490467@kroah.com>
Mime-Version: 1.0
Return-path: <linux-serial-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588855988;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Hvqm5iDK+KZF8xmh4JNvSsVzvvifeygBB2w/QK0T3GY=;
        b=cLbNb6dudFgAztPNO8ufkYhABOViFCsfK4GRig1FmN5adTl9zXy7LjR9hq8jPGTlbpWiHS
        MclGgTcTq54WT+ss1yPFwXF32p73+d2F96zxvcnoGVstrp751gn555HcvOT7wwxFysp7VU
        FttHaLyERkRmtVBXVI1VBfdWtU4a4cE=
In-Reply-To: <20200507111037.GB1490467@kroah.com>
Sender: linux-serial-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org



On Thu, 7 May 2020, Greg Kroah-Hartman wrote:

> On Thu, May 07, 2020 at 06:53:55AM -0400, Mikulas Patocka wrote:
> > Index: linux-stable/include/linux/pci.h
> > ===================================================================
> 
> Is this coming from git?

No - I use quilt.

> > --- linux-stable.orig/include/linux/pci.h	2020-05-07 09:57:02.000000000 +0200
> > +++ linux-stable/include/linux/pci.h	2020-05-07 09:57:02.000000000 +0200
> > @@ -2384,6 +2384,10 @@ static inline bool pci_is_thunderbolt_at
> >  	return false;
> >  }
> >  
> > +#ifndef serial_port_needs_delay
> > +#define serial_port_needs_delay	0
> > +#endif
> 
> Anyway, why is this in pci.h?  It has nothing to do with the PCI core.
> 
> And the name needs a lot better description, something like:
> 	alpha_has_b0rken_serial_ports_and_needs_delay
> or something to prevent anyone else from ever using this, right?
> 
> greg k-h

OK - I moved it to asm/serial.h

Mikulas

