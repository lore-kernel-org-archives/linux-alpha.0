From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH v4] alpha: fix memory barriers so that they conform to
 the specification
Date: Sat, 23 May 2020 11:34:50 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
 <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org> <20200513144128.GA16995@mail.rc.ru>
 <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com>
 <20200523151027.GA10128@mail.rc.ru>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590248097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bDxZxuV7E3rZneUhWoOgRhvyhVH3uErtZvr2qHpWXrw=;
        b=iVHvkejS2P0jU/3v502+/x9OY5X2MfXrZF87FIgJQxT39RdjaTblGCmNrywnPR7XtZa8yP
        Ic9PHCnVQE89nMl4/sYErS0xL+oL989xm/2c+e8eAt4ZflkZKntu+fV4ftnSCwnbiPfp4w
        SI/5FTPFCiNft/Dtyh2KLkzWMCAnyMA=
In-Reply-To: <20200523151027.GA10128@mail.rc.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: "Maciej W. Rozycki" <macro@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org



On Sat, 23 May 2020, Ivan Kokshaysky wrote:

> On Sat, May 23, 2020 at 06:26:54AM -0400, Mikulas Patocka wrote:
> > The commits cd0e00c10672 and 92d7223a7423 broke boot on the Alpha Avanti
> > platform. The patches move memory barriers after a write before the write.
> > The result is that if there's iowrite followed by ioread, there is no
> > barrier between them.
> > 
> > The Alpha architecture allows reordering of the accesses to the I/O space,
> > and the missing barrier between write and read causes hang with serial
> > port and real time clock.
> > 
> > This patch makes barriers confiorm to the specification.
> > 
> > 1. We add mb() before readX_relaxed and writeX_relaxed -
> >    memory-barriers.txt claims that these functions must be ordered w.r.t.
> >    each other. Alpha doesn't order them, so we need an explicit barrier.
> > 2. We add mb() before reads from the I/O space - so that if there's a
> >    write followed by a read, there should be a barrier between them.
> 
> You missed the second mb() in extern inline u16 readw(). Otherwise,
> 
> Acked-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>

... and I also broke the *_relaxed macros and didn't notice it, because 
they are unused in my config. This won't compile, because mb() is a 
statement, not a function.

> > +#define readb_relaxed(addr)        (mb(), __raw_readb(addr))

I'll send a new version of the patch.

Mikulas

