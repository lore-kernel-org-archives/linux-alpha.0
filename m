From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH 2/2 v4] alpha: add a delay before serial port read
Date: Sat, 23 May 2020 06:37:30 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005230628140.22664@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060721450.25338@file01.intranet.prod.int.rdu2.redhat.com> <20200506114711.GB3024358@kroah.com> <alpine.LRH.2.02.2005061122440.16395@file01.intranet.prod.int.rdu2.redhat.com> <20200506154938.GA3537174@kroah.com>
 <alpine.LRH.2.02.2005061152300.16395@file01.intranet.prod.int.rdu2.redhat.com> <20200506160823.GA3559699@kroah.com> <alpine.LRH.2.02.2005061245500.18599@file01.intranet.prod.int.rdu2.redhat.com> <20200506174528.GB3711921@kroah.com>
 <alpine.LRH.2.02.2005070407010.5006@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005100020530.487915@eddie.linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-serial-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590230258;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=k1yG5ML8gU+AF44yjVtH1IXuLR9xKXu55v9jMt9VYuY=;
        b=PRWjkFwRiUsO5Qu760GvQN7EHWZekco1f3VQECgaKOhhTxDDt/nDqgY6rD4XdnW//az5Ff
        ThdRP8RsZLV4m8k8ogr2jMqmO5zjAJ428Jeg8hnbRTlTS8neFHrah5r2bul1skMwOrZdqH
        mTmqnfUbRJ+v5uk8Y+CZruUH2u0u+Qc=
In-Reply-To: <alpine.LFD.2.21.2005100020530.487915@eddie.linux-mips.org>
Sender: linux-serial-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org



On Sun, 10 May 2020, Maciej W. Rozycki wrote:

> On Thu, 7 May 2020, Mikulas Patocka wrote:
> 
> > > > I've created this patch that adds a global macro/variable 
> > > > serial_port_needs_delay. I've also deleted UPQ_DELAY_BEFORE_READ and test 
> > > > serial_port_needs_delay directly in io_serial_in, so that the compiler 
> > > > will optimize it out on non-alpha architectures.
> > > 
> > > That's not good, what about systems with hundreds of serial ports?
> > 
> > I doubt that someone will conect hundreds of serial ports to such an old 
> > alpha machine :)
> 
> It would be good if PCI serial ports (on add-on cards) were unaffected.

After reading the Alpha specification, I am convinced that the issue is 
not timing, but reordering or merging of accesses to the MMIO space.

So, we need a barrier before a write (mandated by memory-barriers.txt), 
after a read (mandated by memory-barriers.txt) and between write and read 
(mandated by the alpha spec).

The performance of serial ports could be improved if we changed it to use 
read_relaxed and write_relaxed (the serial port never does DMA, so we 
don't have to deal with DMA ordering).

Mikulas

