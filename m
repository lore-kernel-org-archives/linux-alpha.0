From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH v4] alpha: fix memory barriers so that they conform to
 the specification
Date: Sat, 23 May 2020 16:11:09 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005231610360.30482@file01.intranet.prod.int.rdu2.redhat.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org> <20200513144128.GA16995@mail.rc.ru> <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com> <20200523151027.GA10128@mail.rc.ru> <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005231739440.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005231307470.18038@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005232024500.21168@redsun52.ssa.fujisawa.hgst.com>
Mime-Version: 1.0
Return-path: <linux-serial-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590264681;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2qnRCIXxHF6BhP+2IkXpbnLjh8zaRORpqHMG3dWu3u0=;
        b=ByNJxVs+ouT9Q/bKWB6ic3HxU0K3R7Hm7ODj7uUGvDZJ1xZkU1GsOf7JlCsBoaAOcVrEo7
        vzvFOQL+W7PYCJpRVS3a/jsaXyxuPi70/upnRYngjDTUqQQ6dYfxNYwBSkQ9NwNB3ITjuY
        +onihjEuUkyCRrnE5fpKXlKAFTpfaMw=
In-Reply-To: <alpine.LFD.2.21.2005232024500.21168@redsun52.ssa.fujisawa.hgst.com>
Sender: linux-serial-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@wdc.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "Maciej W. Rozycki" <macro@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org



On Sat, 23 May 2020, Maciej W. Rozycki wrote:

> On Sat, 23 May 2020, Mikulas Patocka wrote:
> 
> > >  A statement expression would do though, e.g.:
> > > 
> > > #define readb_relaxed(addr)	({ mb(); __raw_readb(addr); })
> > > 
> > > and might be preferable for code brevity to adding a zillion of inline 
> > > functions.
> > > 
> > >   Maciej
> > 
> > I know, but that file uses inline functions everywhere else, so I wanted 
> > to make it consistent.
> 
>  Fair enough, fine with me.  I still can't access my Alpha system, have 
> you verified your latest version at run time?
> 
>   Maciej

Yes - it runs without any hang.

Mikulas

