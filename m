From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/2] alpha: fix build failure
Date: Mon, 14 Sep 2015 14:22:08 -0700
Message-ID: <20150914212208.GA11482@roeck-us.net>
References: <1442231369-27118-1-git-send-email-sudipm.mukherjee@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=HNeJl6PpzMmSOODCF4Fjdo1k7g2LgQJw+v9iAMX3GWs=;
	b=SNip1Uz9/xO5sOZYQJ/9XaF0zbNTsLgMannHgiRbIKJZm3E3LCY1qAygEBPBXXzU0QgpKA9S/TkbptseY+aFwIaQ6WKY8Mz6YRzPrF3TFfbH33q5Q69LENR6Id1aoFrfJ6G9wKlbP7gVrgJtu1+rEgs1LSf6uVEH+6IM3S8x8YM=;
Content-Disposition: inline
In-Reply-To: <1442231369-27118-1-git-send-email-sudipm.mukherjee@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org

On Mon, Sep 14, 2015 at 05:19:27PM +0530, Sudip Mukherjee wrote:
> We were getting build failure on allmodconfig. Mainly two causes
> ioremap_uc was not defined and __delay was not exported.
> 
I already submitted patches to fix those problems some 6+ weeks ago.
Hope you'll have more luck.

Guenter

> regards
> sudip
> 
> Sudip Mukherjee (2):
>   alpha: io: define ioremap_uc
>   alpha: lib: export __delay
> 
>  arch/alpha/include/asm/io.h | 4 +++-
>  arch/alpha/lib/udelay.c     | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
> 
