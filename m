From: Jens Axboe <axboe@kernel.dk>
Subject: Re: remove the legacy ide driver v2
Date: Wed, 16 Jun 2021 08:52:18 -0600
Message-ID: <4b003372-41d0-507a-b74b-b73aa33189f4@kernel.dk>
References: <20210616134658.1471835-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-ide-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ho0nMLLWDiEI8PWRRnO12oSgVwkuBUrJL0BDNxvINsA=;
        b=hoREoaRWaUrQikoDfDACdirEoAtNi+fOmNy3ydxCJMLyS1AYVOlkcC6i6q2ACi7hoR
         YdvK7zt01zFnWIoInOM4K4wHv15MobleKQ1Md6yZJgidSl5oEj8UBm6vgBx5+levT+bF
         gqF6j+MUp/6RnngHTAeIvJzipUGYH5hjKD1VuO/9eya66IdaHMbpo/KgDZ3DVaHvErqA
         B3qi1ZmurpgN6d4R5YCa0cXu/kDnuxtw+1LeEfjQcxRp6ZbVEoBzspOFJuy/TVVDm65t
         V0QVWPMfUuOXT+50eXThDDyewiClZ1fYk3Xwe/r2yV0gFF5zxhb9twIsyab3WIZv3KyY
         DAmQ==
In-Reply-To: <20210616134658.1471835-1-hch@lst.de>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, Linus Torvalds <torvalds@linux-foundation.org>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org

On 6/16/21 7:46 AM, Christoph Hellwig wrote:
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
> This series is against Jens' for-5.14/libata branch.

Unless someone complains loudly, I plan on queueing this up end this
week.

-- 
Jens Axboe

