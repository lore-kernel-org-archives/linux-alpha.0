From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH v5] alpha: fix memory barriers so that they conform to
 the specification
Date: Mon, 25 May 2020 11:54:31 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.2005251149540.4135@file01.intranet.prod.int.rdu2.redhat.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
 <20200513144128.GA16995@mail.rc.ru> <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com>
 <20200523151027.GA10128@mail.rc.ru> <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005251500420.21168@redsun52.ssa.fujisawa.hgst.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590422079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=G5HlSdeXArcl1605FHe8FaMeiLyTdkgKVGZzS1ZjLN4=;
        b=g3s6yV6CnSsqFczINKHfr6hRJb2Q231r8bABM+NfCtItxlz0hUlFiyVUEFPB+Ej+JT9zFW
        GLCww1lbuxm+oRXxt20cZNwqiweBjtweWwPZhZ5+d4/4KkiapC0LeYeitd3I0Btknrg1Ge
        nkxPltWsUzhCJl1OGXqnyQpk0fCL4ro=
In-Reply-To: <alpine.LFD.2.21.2005251500420.21168@redsun52.ssa.fujisawa.hgst.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@wdc.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "Maciej W. Rozycki" <macro@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org



On Mon, 25 May 2020, Maciej W. Rozycki wrote:

> On Mon, 25 May 2020, Mikulas Patocka wrote:
> 
> > The functions __raw_read* are already extern inline, so the compiler will 
> > inline/noinline them depending on the macros trivial_io_bw and 
> > trivial_io_lq - so we can just call them from read*_relaxed without 
> > repeating the extern inline pattern.
> 
>  The whole point of this peculiar arrangement for cooked accessors is to 
> avoid having barriers inserted inline around out-of-line calls to raw 
> accessors,

I see, but why do we want to avoid that? Linux kernel has no binary 
compatibility, so it doesn't matter if the barriers are inlined in the 
drivers or not.

Anyway, I've sent a next version of the patch that makes read*_relaxed 
extern inline.

Mikulas

