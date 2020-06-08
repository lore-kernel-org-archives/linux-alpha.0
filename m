From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH v7] alpha: fix memory barriers so that they conform to the specification
Date: Mon, 8 Jun 2020 16:49:23 -0700
Message-ID: <CAEdQ38HcqZWrVEHoPcngd_PnNQsf+OxFob1upAwx6TL-=_Uopg@mail.gmail.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
 <20200513144128.GA16995@mail.rc.ru> <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com>
 <20200523151027.GA10128@mail.rc.ru> <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005251500420.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005251151550.4135@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005261046340.29117@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.DEB.2.20.2005270114380.1027@tpp.orcam.me.uk> <alpine.LRH.2.02.2006080256360.15393@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uBzs8KmsEdBvGAcXk3Vb8AURrpvHv861x7OOzwsbqVc=;
        b=MWtK/hHZaJhvWGA/KGnL6we8nFDF9ORpa5xmtB0dqPXfcrF7VmYOyyCxwnI02wRjgQ
         Y6jC3kPvPiO4UWPRrhjC2a68YdRNU4jWHLBk1zfKLL1K+VGcoMnwOCAWLLKyeW+498AP
         49aX5edGyWoqieus3bGndrhnFWvX1uZDQOxrJNNN6P4cYKJqYWHWSvYqt/Zw8Qniy3Jc
         9CLiWZpdSxBv39fdRS4S4VcLWnWqGpcWKRnOKBhvgvcZMIADzy4B7JwlrWKIPfMiS8Xa
         8F/kq4ci9tLnHW86+bqL1zUPQO4IQvRfCKAdDLy0F2fsugrRxTJp5WvQ3fjEX9TkZCLV
         LIxQ==
In-Reply-To: <alpine.LRH.2.02.2006080256360.15393@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: "Maciej W. Rozycki" <macro@wdc.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "Maciej W. Rozycki" <macro@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>

On Sun, Jun 7, 2020 at 11:58 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> Will you submit the patch to Linus' tree in this merge window?
>
> Mikulas

I will do it. Thank you, Mikulas!
