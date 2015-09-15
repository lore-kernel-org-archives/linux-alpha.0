From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH 0/2] alpha: fix build failure
Date: Tue, 15 Sep 2015 13:51:35 +0530
Message-ID: <20150915082135.GI9305@sudip-pc>
References: <1442231369-27118-1-git-send-email-sudipm.mukherjee@gmail.com>
 <20150914212208.GA11482@roeck-us.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=xRF/X4g2jl8AWaE96uEUzvoFpACz2S8QBqFuq2ImKts=;
        b=ZG7hNoww/Nn6caeL5sHMbWOqgwsc8Tc3c279Fo2nRe55+WK5PlRjwOAgP3U5Zm9Dto
         Oa76iW+A6doQxtl7iSVhCSRehaOqI206gFmnN9TbxT0Y/oR4Q0SDV/iKQDC0E0a6JE2X
         WxXTUKk8lgTWnaPI3Z02iVVTcQT/ArFWdMSx39qlcAtphaW7oNRVILvkw/6SBqLqmQaY
         Z/KVyr8EXDXPO1VihXHBTwFQbgT6LDpJsCD9sHaq4xqGWt5FIATG7LF4SxHr1ImCJVlW
         NvQ4JwY63WRJ7tFz4mVc6dT0QWtsrB2oRZxFl0K0Eq1upZ7LG9DDhnLikEHBQ7lV7wcW
         egsQ==
Content-Disposition: inline
In-Reply-To: <20150914212208.GA11482@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org

On Mon, Sep 14, 2015 at 02:22:08PM -0700, Guenter Roeck wrote:
> On Mon, Sep 14, 2015 at 05:19:27PM +0530, Sudip Mukherjee wrote:
> > We were getting build failure on allmodconfig. Mainly two causes
> > ioremap_uc was not defined and __delay was not exported.
> > 
> I already submitted patches to fix those problems some 6+ weeks ago.
> Hope you'll have more luck.
For my allmodconfig test with next-20150915 alpha, m32r and openrisc
failed. And ofcourse mn10300 is broken since many months now.
Have you already done something with m32r or should I try? If both of us
are trying the same it will be a wastage of time. So asking you.

regards
sudip
