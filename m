From: Ameer Hamza <ahamza@ixsystems.com>
Subject: Re: [PATCH v2] Add new open(2) flag - O_EMPTY_PATH
Date: Mon, 2 Jan 2023 19:35:38 +0500
Message-ID: <20230102143538.GA8886@hamza-HP-ZBook-15-G3>
References: <202212310842.ysbymPHY-lkp@intel.com>
 <20221231235618.117201-1-ahamza@ixsystems.com>
 <4b39cf528148470c934fb5823b35e9d5@AcuMS.aculab.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ixsystems.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJq3TeEMVEa4cxKJPhRTEvU3LME7/v1uYktVvktqpGE=;
        b=giKYD8zRfEz+aTz2PgAOBuReNmF+3ipE0aYhpWrnbzcVWA26vzIqDcD5FLnSINxL+M
         LFgGo5qElo0bKpiGfxDHPVQWCGxhFZKx+3Y/aZn1AWx0/kyJ9opa93mRMDHf0nnNlhvl
         PA3JyflJbfKHZwlrMzULsTWiA8AahjGq9TK5CQj+MwD0qIDt/S2DYL0NF/9yBKPJR6Hd
         LUZq3p6uP6VrHbVutXsxh5dGaQFGXmtNXvhh4pvj+FWdD3tpqULpz+WOHzCQbXHsJhUk
         FzhGm4wbNSJ9Yc+0fC/CyXB2H4rYo1IVLlPto8ymlfhlFf4cIa9LN/tUuQBlArcXvoLX
         RLdA==
Content-Disposition: inline
In-Reply-To: <4b39cf528148470c934fb5823b35e9d5@AcuMS.aculab.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Laight <David.Laight@ACULAB.COM>
Cc: "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "jlayton@kernel.org" <jlayton@kernel.org>, "chuck.lever@oracle.com" <chuck.lever@oracle.com>, "arnd@arndb.de" <arnd@arndb.de>, "guoren@kernel.org" <guoren@kernel.org>, "palmer@rivosinc.com" <palmer@rivosinc.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "slark_xiao@163.com" <slark_xiao@163.com>, "richard.henderson@linaro.org" <richard.henderson@linaro.org>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, "mattst88@gmail.com" <mattst88@gmail.com>, "James.Bottomley@HansenPartnership.com" <James.Bottomley@HansenPartnership.com>, "deller@gmx.de" <deller@gmx.de>, "davem@davemloft.net" <davem@davemloft.net>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, linux-kernel@vger.kernel.

On Mon, Jan 02, 2023 at 02:01:38PM +0000, David Laight wrote:
> From: Ameer Hamza
> > Sent: 31 December 2022 23:56
> > 
> > This patch adds a new flag O_EMPTY_PATH that allows openat and open
> > system calls to open a file referenced by fd if the path is empty,
> > and it is very similar to the FreeBSD O_EMPTY_PATH flag. This can be
> > beneficial in some cases since it would avoid having to grant /proc
> > access to things like samba containers for reopening files to change
> > flags in a race-free way.
> > 
> 
> But what does it do?
> (Apart from add code to a common kernel code path.)
> 
> 	David
It can convert an O_PATH descriptor to one suitable for r/w work.
If we already have a file descriptor: {opath_fd = open(&lt;path&gt;, O_PATH);}, we can call {openat(opath_fd, "", O_EMPTY_PATH | O_RDWR)} instead of going through procfs {open(/proc/self/fd/&lt;opath_fd&gt;, O_RDWR)}.
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
