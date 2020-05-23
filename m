From: "Maciej W. Rozycki" <macro@wdc.com>
Subject: Re: [PATCH v4] alpha: fix memory barriers so that they conform to
 the specification
Date: Sat, 23 May 2020 20:27:15 +0100 (BST)
Message-ID: <alpine.LFD.2.21.2005232024500.21168@redsun52.ssa.fujisawa.hgst.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
 <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org> <20200513144128.GA16995@mail.rc.ru>
 <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com> <20200523151027.GA10128@mail.rc.ru>
 <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005231739440.21168@redsun52.ssa.fujisawa.hgst.com> <alpine.LRH.2.02.2005231307470.18038@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1590262041; x=1621798041;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3a3TsFVAhNs1kKCcF0A2hYXSG8gQ1nGLK2HbNNP92vk=;
  b=DFJhvF7TFNnhdie1t3QEjtu3d0PL+sAFxEhDbU8OKJCD/qfTHLhEfchf
   tyOly32FXudBBlfLEqp2rNbmBzn4EWWB/QR/G3lNVQG9iwwN2/V2oXQW1
   h54+a0S6Wh4RpKF5CF0F21rDl+0F22c5C5SR3eSPc4GLpN55qnesSIk4n
   t9oucyyja2AZxjNH0O5tR+6VvwFW+lGU1FyHiqaFlqYki/HRNsRL6CMHo
   bj+R6iH9wJpD/T8rjYA+SdLiR0PimbCfHBuu7lidSzayOsdKi/BCjYrMJ
   1cY4B+5hKxzQkNZsO0kKVwWXYmtUdwCxtSnBvi7PpXjd2F7jMOQtFJro7
   g==;
In-Reply-To: <alpine.LRH.2.02.2005231307470.18038@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "Maciej W. Rozycki" <macro@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

On Sat, 23 May 2020, Mikulas Patocka wrote:

> >  A statement expression would do though, e.g.:
> > 
> > #define readb_relaxed(addr)	({ mb(); __raw_readb(addr); })
> > 
> > and might be preferable for code brevity to adding a zillion of inline 
> > functions.
> > 
> >   Maciej
> 
> I know, but that file uses inline functions everywhere else, so I wanted 
> to make it consistent.

 Fair enough, fine with me.  I still can't access my Alpha system, have 
you verified your latest version at run time?

  Maciej
