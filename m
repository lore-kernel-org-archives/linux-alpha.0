From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Wed, 22 Sep 2021 22:50:23 +0200 (CEST)
Message-ID: <202109222050.18MKoNUh007272@valdese.nms.ulrich-teichert.org>
References: <CAHk-=whwreptD=WByMRNsv-gfqR3oUu4v33i5Swd2dyeLObyRw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAHk-=whwreptD=WByMRNsv-gfqR3oUu4v33i5Swd2dyeLObyRw@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>, Michael Cree <mcree@orcon.net.nz>, Guenter Roeck <linux@roeck-us.net>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc <linux-parisc@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

Hi,

> > I would try the SRM bootimage (make bootimage), but the build is broken:
> 
> The attached patch is too ugly for words, and there's no way I will
> commit anything like this.
> 
> But it at least builds for and seems to successfully make an alpha
> bootimage even when cross-compiling on x86-64.
> 
> So something to test, perhaps..

Sure, I burned it to a CDROM and booted from that per SRM. The screen
went black for a second, then the SRM console came back with:

?05 HLT INSTR
PC=00000000.20000014 PSL= 00000000.00000007

I wonder if we would be able to see more on a serial line - I can try
that perhaps tomorrow or at the weekend. To find out to what code the
PC is pointing to, I would need to understand to what point in memory SRM
loads the image into.... But this way, the process of loading the kernel
definitely worked - I still don't understand why aboot can load the
old kernel but not the new one. I'll have a look at the aboot sources,
perhaps there's a certain limit on kernel size?

I'm not sure if we can call this progress,
CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, The Bellrays: Bad Reaction
