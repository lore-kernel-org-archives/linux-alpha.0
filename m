From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH v7] alpha: fix memory barriers so that they conform to
 the specification
Date: Mon, 8 Jun 2020 02:58:39 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2006080256360.15393@file01.intranet.prod.int.rdu2.redhat.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <20200513144128.GA16995@mail.rc.ru> <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com> <20200523151027.GA10128@mail.rc.ru> <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com> <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005251500420.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005251151550.4135@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005261046340.29117@file01.intranet.prod.int.rdu2.redhat.com> <alpine.DEB.2.20.2005270114380.1027@tpp.orcam.me.uk>
Mime-Version: 1.0
Return-path: <linux-serial-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591599526;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=90pUbKcDx3Wj1mJ+iFwQzzOYVJXR5MBr1hnJ0abQMTk=;
        b=A+rZtV/mTL9x0NHnzngCG2RGT76ZccOe+Gb2NFH/h8koMnbx5AZr8mwwErGBZvRGNXKOA/
        iY1nSeV6OX1aDHlW2Iv0oVnM2/qmmXcbX14PlcrJI2DmH8d1GaXNYUOJ7Qlpsi2FMFwzl6
        JpiyOiTWOliJkudGgw350OMfuDSGb+Q=
In-Reply-To: <alpine.DEB.2.20.2005270114380.1027@tpp.orcam.me.uk>
Sender: linux-serial-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@wdc.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "Maciej W. Rozycki" <macro@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>



On Wed, 27 May 2020, Maciej W. Rozycki wrote:

> On Tue, 26 May 2020, Mikulas Patocka wrote:
> 
> > This patch makes barriers confiorm to the specification.
> > 
> > 1. We add mb() before readX_relaxed and writeX_relaxed -
> >    memory-barriers.txt claims that these functions must be ordered w.r.t.
> >    each other. Alpha doesn't order them, so we need an explicit barrier.
> > 2. We add mb() before reads from the I/O space - so that if there's a
> >    write followed by a read, there should be a barrier between them.
> > 
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Fixes: cd0e00c10672 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering")
> > Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
> > Cc: stable@vger.kernel.org      # v4.17+
> > Acked-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> 
>  LGTM, thanks for persistence!
> 
> Reviewed-by: Maciej W. Rozycki <macro@linux-mips.org>
> 
>   Maciej

Hi

Will you submit the patch to Linus' tree in this merge window?

Mikulas

