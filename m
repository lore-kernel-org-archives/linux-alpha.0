From: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH 1/6] pata_cypress: add a module option to disable BM-DMA
Date: Wed, 16 Jun 2021 15:16:56 +0100
Message-ID: <20210616141656.GF22278@shell.armlinux.org.uk>
References: <20210616134658.1471835-1-hch@lst.de>
 <20210616134658.1471835-2-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3eHDFeOd5JUwGJsCO8IHOvIdyejL0srMm9wcqB5wSRA=; b=G+lsBszZX7wMG+OHqecK1b3Ef
        /t9Ca2aRzaiTNqrk+K48cYfgJJ1Z8h5HwCFLdsMAeueQZMW0jSh9u2kl+MKgpNmxk+qgsgQdw61re
        jGud3zPlkE7tJ3VFLt6L7gHHhmCyhVEUv1/+gvySbaLuzqLXwh32sSZqgAirzH3nwOMXSS6EjdppB
        /J1OOWUZi6aQ3E9DQGCSbN/8lSAZvN3FCBqKE3gWq1Bps6PZ1oLEd91oYz4qVvYVw5KVVjpZgbUBN
        Gy3Ep68yVKWk4PkZomtI14bAY5QpV1Ash6xKgGxh+tROEhHreGLp8zliJRg0TWElf67zLk/8AVFEu
Content-Disposition: inline
In-Reply-To: <20210616134658.1471835-2-hch@lst.de>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Linus Torvalds <torvalds@linux-foundation.org>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org

On Wed, Jun 16, 2021 at 03:46:53PM +0200, Christoph Hellwig wrote:
> Multiple users report that they need to disable DMA on this driver,
> so provide an option to do so without affecting all of libata.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks!

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
