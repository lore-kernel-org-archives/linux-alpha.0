From: "Maciej W. Rozycki" <macro@wdc.com>
Subject: Re: [PATCH v4] alpha: fix memory barriers so that they conform to
 the specification
Date: Sat, 23 May 2020 17:44:18 +0100 (BST)
Message-ID: <alpine.LFD.2.21.2005231739440.21168@redsun52.ssa.fujisawa.hgst.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
 <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org> <20200513144128.GA16995@mail.rc.ru>
 <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com> <20200523151027.GA10128@mail.rc.ru>
 <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1590252264; x=1621788264;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=y3/c05P0+8tMbwfUtm2kD68ZlvFGrOuCSHYxFth7mvg=;
  b=WbCBQ8LYubzteCUmIFKZoHv9FEcA65ec7xLHqATlt9mG1mkmF7y032MY
   Ji1B6oDentFARI+YzchDCdprhr/l60Za/vIh+aXqwd0LsnrgHqQXL7aq3
   GMB6S4S+51rlwrn17MGM8uTlxP7ve6FFzhR1PkC3Einyb4agJQH3o6BYO
   ZgVu/PpnHFfoEqNOe0PywqJkHUdS/nKyVwUNRm5nsSISXnQa4JJ8GCGqW
   gRVZGbQCckB/DzMLlrk1w0aPkJvV0XNpjzqP3YUAT8mtK4icQRh2w44D9
   C2jsWcYCjkAap/kgxkEwJebpj4bou1w+mME8Lge9Z3ef0mcbBPTUeFYGL
   Q==;
In-Reply-To: <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "Maciej W. Rozycki" <macro@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

On Sat, 23 May 2020, Mikulas Patocka wrote:

> ... and I also broke the *_relaxed macros and didn't notice it, because 
> they are unused in my config. This won't compile, because mb() is a 
> statement, not a function.
> 
> > > +#define readb_relaxed(addr)        (mb(), __raw_readb(addr))

 A statement expression would do though, e.g.:

#define readb_relaxed(addr)	({ mb(); __raw_readb(addr); })

and might be preferable for code brevity to adding a zillion of inline 
functions.

  Maciej
