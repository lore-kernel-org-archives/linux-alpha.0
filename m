From: Tejun Heo <tj@kernel.org>
Subject: Re: Generic kernel fails to boot on Alpha bisected to b38d08f3181c
Date: Thu, 13 Dec 2018 08:07:24 -0800
Message-ID: <20181213160724.GU2509588@devbig004.ftw2.facebook.com>
References: <20181213082612.bi2dcd6uhzp3t6iq@tower>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VMIvv9oJ+d07z3QLhR1Tb2CkKzGyeqd0I0xBtqS1Vdo=;
        b=DJCdmOKH4EV3o9DYzEMgupaZtPGPMc3U7+H6RJbn/9fNmfWytE01k2XQA9rg1L1wmt
         653dRwOtcYmSO9QX51AbyrqfpbfB1Za+5ibAPxqeMixThQ4Og21n5RvUu7oaRA+w3uz+
         Bzs/bgXVdeeLyPjNSY8AY1mnl5dJqSbOQqI2SSxJyLwknRrI+klu7CLG7sdLGOya/u1W
         W/+aVtAc63k6ks+NMgeGTMLwECt7g3deILYkEbJoicYAIPrHhqU3IJHZnFgUIQvpTLdo
         b1grkuYz+1nwQpEHm6iRwihqcbe73hhzS7eN7i4A6tU8dG9jBnPXGXMJjtlNx3lScPZQ
         ZiOw==
Content-Disposition: inline
In-Reply-To: <20181213082612.bi2dcd6uhzp3t6iq@tower>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, debian-alpha@lists.debian.org

Hello, Michael.

On Thu, Dec 13, 2018 at 09:26:12PM +1300, Michael Cree wrote:
> A kernel built for generic UP Alpha had been noted to fail to boot
> for quite some time (since the release of 3.18).  The kernel either
> locks up before printing any messages to the console or just falls
> back into the SRM with a HALT instruction again before any messages
> are printed to the console.  A work around is to either use a kernel
> built for generic SMP or to build a machine specific kernel as these
> boot correctly.
> 
> Because there were other compile errors at the time it proved
> difficult to bisect, but we are continuing to get complaints about
> it as it renders the Debian Alpha installer somewhat useless, so I
> returned to trying to find the problem and managed to bisect it to:
> 
> commit b38d08f3181c5025a7ce84646494cc4748492a3b
> Author: Tejun Heo <tj@kernel.org>
> Date:   Tue Sep 2 14:46:02 2014 -0400
> 
>     percpu: restructure locking
> 
> Any suggestions as to what might be the problem and a fix?

So, the only thing I can think of is that it's calling
spin_unlock_irq() while irq handling isn't set up yet.  Can you please
try the followings?

1. Convert all spin_[un]lock_irq() to
   spin_lock_irqsave/unlock_irqrestore().

2. If that still doesn't work, just convert all of them to
   spin_lock/unlock(), which is obviously broken but still is useful
   for debugging.

Thanks.

-- 
tejun
