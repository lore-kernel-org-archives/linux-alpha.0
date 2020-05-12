From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
Date: Tue, 12 May 2020 15:35:21 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005121525500.31782@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589312127;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H5pxUSbLWxNQVZt3chJU6aQ+MxFijTrdJFOgatW5PJM=;
        b=FCRJx0YGfOyJFnV8FqbaYpk2jVd6iwrDVN3dyPl3LIPwYfOWZ7b4Ml9Ai/Oc1OThRoEzKC
        51GeuI7p1PJNI4U3tvz5F2Ylhm89ybQvDxEbGhxgcjgzDcwNveUxGSwqaCQOk/4tRhWtw7
        mMDKEdiX5wd8g4zEHoVma0cVms5nFnU=
In-Reply-To: <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org



On Mon, 11 May 2020, Maciej W. Rozycki wrote:

>  And if timing is indeed the culprit, then I think it will be best fixed 
> in the 82378IB southbridge, i.e.[1]:
> 
> "The I/O recovery mechanism in the SIO is used to add additional recovery 
> delay between PCI originated 8-bit and 16-bit I/O cycles to the ISA Bus.  
> The SIO automatically forces a minimum delay of four SYSCLKs between 
> back-to-back 8 and 16 bit I/O cycles to the ISA Bus.  The delay is 
> measured from the rising edge of the I/O command (IOR# or IOW#) to the 
> falling edge of the next BALE.  If a delay of greater than four SYSCLKs is 
> required, the ISA I/O Recovery Time Register can be programmed to increase 
> the delay in increments of SYSCLKs.  Note that no additional delay is 
> inserted for back-to-back I/O "sub cycles" generated as a result of byte 
> assembly or disassembly.  This register defaults to 8 and 16-bit recovery 
> enabled with two clocks added to the standard I/O recovery."
> 
> where it won't be causing unnecessary overhead for native PCI devices or 
> indeed excessive one for ISA devices.  It might be interesting to note 
> that later SIO versions like the 82378ZB increased the minimum to five 
> SYSCLKs, so maybe a missing SYSCLK (that can still be inserted by suitably
> programming the ICRT) is the source of the problem?
> 
> References:
> 
> [1] "82378IB System I/O (SIO)", April 1993, Intel Corporation, Order 
>     Number: 290473-002, Section 4.1.17 "ICRT -- ISA Controller Recovery 
>     Timer Register"
> 
>   Maciej

I tried to modify this register (I wrote 0x44 to it - it should correspond 
to the maximum delay) and it had no effect on the serial port and rtc 
lock-ups.

Mikulas

