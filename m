From: Meelis Roos <mroos@linux.ee>
Subject: Re: is alpha jensen support dead?
Date: Sun, 21 May 2017 14:18:40 +0300 (EEST)
Message-ID: <alpine.LRH.2.20.1705211414440.27352@math.ut.ee>
References: <20170521105032.5F0807FF0E@ilves.cyber.ee>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170521105032.5F0807FF0E@ilves.cyber.ee>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

> Hi all,
> 
> it seems like the Alpha Jense build (the only one using pci-noop.c)
> and thus being a different build than all the later PCI capable
> system has been broken since at least:
> 
> commit 6aca0503847f6329460b15b3ab2b0e30bb752793
> Author: Christian Borntraeger <borntraeger@de.ibm.com>
> Date:   Tue Feb 2 21:46:33 2016 -0800
> 
>     alpha/dma: use common noop dma ops
> 
> which switches pci-noop.c to use generic code, but fat fingered a symbol
> and didn't wire up the Kconfig.
> 
> Is there any value in keeping it alive?  Especially as there probably
> isn't any build coverage..

I do not have any experience with Jensens.

> Btw, how well is alpha working these days?  It looks like there hasn't
> been any maintainer activity for about two years.

However, I keep PC164, DS10, DS10L, DS20 alive and plan to revice 
my XP1000 too. A 21264-base half embedded system worked fine until I 
broke a connector on it so hoping to revive it too.

PC164, DS10, DS10L worked fine with 4.1 for me, others are on earlier 
kernels.

-- 
Meelis Roos (mroos@linux.ee)
