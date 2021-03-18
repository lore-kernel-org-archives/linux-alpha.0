From: Christoph Hellwig <hch@lst.de>
Subject: remove the legacy ide driver
Date: Thu, 18 Mar 2021 05:56:56 +0100
Message-ID: <20210318045706.200458-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=wEy5NunwrZKXnkhywjB0DIEFLxRmlhSa94tBcP+tKjE=; b=bv913LM0lvcD8Id3k3odeou8wR
        1UvHd2GaSV+awelY4zndccdEi1o98SvR0osHU7YT2lzvxPSgn9S+llRvYFYZl0NqxKr6JPY5h6ZqC
        /VHtYLrSrsc3G0fU/qqnWT2IZ/W4XWIdxAZ8719My3Pmb4XVeFuT7ZtRtwHvPpDffcuPFktVt74Ci
        iKFsp0yleZWPZWxf14Mw2w5Vhlql3ikursfJEfoBHUEAclgryE05eVjtWYzyYdxxKWdARDOzxutBe
        fAU3lk4ETNL1tXb+E/S9a3A6KawIpnvinkS/iDrdzoMGs3YMF+h+OAjuVTBRk+TeCrfcJQuHQYqF9
        rlZkW62w==;
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Hi all,

we've been trying to get rid of the legacy ide driver for a while now,
and finally scheduled a removal for 2021, which is three month old now.

In general distros and most defconfigs have switched to libata long ago,
but there are a few exceptions.  This series first switches over all
remaining defconfigs to use libata and then removes the legacy ide
driver.

libata mostly covers all hardware supported by the legacy ide driver.
There are three mips drivers that are not supported, but the linux-mips
list could not identify any users of those.  There also are two m68k
drivers that do not have libata equivalents, which might or might not
have users, so we'll need some input and possibly help from the m68k
community here.
