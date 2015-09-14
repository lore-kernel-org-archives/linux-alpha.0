From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 0/2] alpha: fix build failure
Date: Mon, 14 Sep 2015 14:29:55 -0700
Message-ID: <20150914142955.89422b158c598ef5bb8cc74d@linux-foundation.org>
References: <1442231369-27118-1-git-send-email-sudipm.mukherjee@gmail.com>
	<20150914212208.GA11482@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20150914212208.GA11482@roeck-us.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Guenter Roeck <linux@roeck-us.net>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Mon, 14 Sep 2015 14:22:08 -0700 Guenter Roeck <linux@roeck-us.net> wrote:

> On Mon, Sep 14, 2015 at 05:19:27PM +0530, Sudip Mukherjee wrote:
> > We were getting build failure on allmodconfig. Mainly two causes
> > ioremap_uc was not defined and __delay was not exported.
> > 
> I already submitted patches to fix those problems some 6+ weeks ago.
> Hope you'll have more luck.

I have both of these patches queued for 4.3.  Cc'ing me is a way of
preventing stuff from falling through cracks..

But I didn't tag these patches for -stable backport.  Should I have
done so?  If 4.2 is busted on alpha then I guess "yes".

