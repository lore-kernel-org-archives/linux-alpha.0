From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v2 7/7] alpha: lazy FPU switching
Date: Fri, 2 Sep 2022 06:14:33 +0100
Message-ID: <YxGROdeUQHG4XPH9@ZenIV>
References: <YxFhB4/cEXX5aHbn@ZenIV>
 <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
 <20220902015012.2664521-7-viro@zeniv.linux.org.uk>
 <CAHk-=wjfCBF_xYtKacU920YFMKNDnesTUy-gYq8qHucLDTWNHQ@mail.gmail.com>
 <YxGPk1dDyCP2AWul@ZenIV>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=w6b2UEHLmuGJTTnShaxMkc2M0eiHRzxueLF+Dp5bmzA=; b=nC8pyaelExlI8Ib37Xfc0OeFD2
        awdGLZ0dr0fXWbBJaO8BS7eceWxZ70Tg9qXXhDNFknG872Cck35CpOlRPTRVy3/B/wH4q999sYqWf
        tduo4b2q8MFPBmK5+qpHMTbu+lkJDCOmluxitfDrYuD6XZcD924uCpu1jECFqlo46Un/WcAsTIzsV
        Lx0pT5Zwmceh0XpLU3ed1A3T8Yhhajlkzj1j9qPm/7ApIxHFq9RBuIrmMZU2wvgmTCMIZGrGxGVkN
        y8TZri0IAqD4G1D3NwVlidpRbeGWs4dYMgFssbAru+C3cdYR5tUzJhq4jbjo8T/NC2/UYsIvS6Tdv
        AMClj/xA==;
Content-Disposition: inline
In-Reply-To: <YxGPk1dDyCP2AWul@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org

On Fri, Sep 02, 2022 at 06:07:31AM +0100, Al Viro wrote:

> > With the asm even having a comment about how it only works because
> > alpha doesn't do preemption (ARCH_NO_PREEMPT), but then the C code
> > does do those preempt_disable/enable pairs, and I see an actual bug in
> > there too:
> > 
> > Both alpha_read_fp_reg() and alpha_read_fp_reg_s() do a
> > preempt_enable() -> preempt_enable() pair (ie the first one should be
> > a preempt_disable()).
> 
> Will fix.

	Done and pushed.  IIRC, that started as a similar comment re
"we'd need to disable preemption here if we ever grow one on alpha",
but I ended up looking at it and deciding that it's easier to just
go ahead and call preempt_disable()/preempt_enable() instead
of comments.
