From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: remove the legacy ide driver
Date: Fri, 19 Mar 2021 12:43:48 +1100 (AEDT)
Message-ID: <c1fa8e6-a05d-9ea1-f47e-9e85ea6ea65e@telegraphics.com.au>
References: <20210318045706.200458-1-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-ide-owner@vger.kernel.org>
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On Thu, 18 Mar 2021, Christoph Hellwig wrote:

> Hi all,
> 
> we've been trying to get rid of the legacy ide driver for a while now,
> and finally scheduled a removal for 2021, which is three month old now.
> 
> In general distros and most defconfigs have switched to libata long ago,
> but there are a few exceptions.  This series first switches over all
> remaining defconfigs to use libata and then removes the legacy ide
> driver.
> 
> libata mostly covers all hardware supported by the legacy ide driver.
> There are three mips drivers that are not supported, but the linux-mips
> list could not identify any users of those.  There also are two m68k
> drivers that do not have libata equivalents, which might or might not
> have users, so we'll need some input and possibly help from the m68k
> community here.
> 

A few months ago I wrote another patch to move some more platforms away 
from macide but it has not been tested yet. That is not to say you should 
wait. However, my patch does have some changes that are missing from your 
patch series, relating to ide platform devices in arch/m68k/mac/config.c. 
I hope to be able to test this patch before the 5.13 merge window closes.
