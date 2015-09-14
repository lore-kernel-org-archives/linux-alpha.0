From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/2] alpha: fix build failure
Date: Mon, 14 Sep 2015 16:22:16 -0700
Message-ID: <20150914232216.GA14502@roeck-us.net>
References: <1442231369-27118-1-git-send-email-sudipm.mukherjee@gmail.com>
 <20150914212208.GA11482@roeck-us.net>
 <20150914142955.89422b158c598ef5bb8cc74d@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=PvFFWj8fK0vpqDK8NV/KKgVN1v5nmhY3woNYn3d/B4M=;
	b=OOOhI6AlRcNoxNfXjkkeXOSwHgG61XE1RSgFA5t10si0MuGpH4QVdi6PhGIqXVDYmicasg4BojSqxHbVcnG0UNcWoU6Y/4BRxFOa1u52XPRmU42X2n0ebgse8AtOG+s8FNBVnVzloLnT7Ugs3KoVUItoslBSIUviX6PbqYNw6qA=;
Content-Disposition: inline
In-Reply-To: <20150914142955.89422b158c598ef5bb8cc74d@linux-foundation.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Mon, Sep 14, 2015 at 02:29:55PM -0700, Andrew Morton wrote:
> On Mon, 14 Sep 2015 14:22:08 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> 
> > On Mon, Sep 14, 2015 at 05:19:27PM +0530, Sudip Mukherjee wrote:
> > > We were getting build failure on allmodconfig. Mainly two causes
> > > ioremap_uc was not defined and __delay was not exported.
> > > 
> > I already submitted patches to fix those problems some 6+ weeks ago.
> > Hope you'll have more luck.
> 
> I have both of these patches queued for 4.3.  Cc'ing me is a way of
> preventing stuff from falling through cracks..
> 
Ok, I'll do that next time.

> But I didn't tag these patches for -stable backport.  Should I have
> done so?  If 4.2 is busted on alpha then I guess "yes".
> 
No, this only affects 4.3-rc1 and -next.

Guenter
