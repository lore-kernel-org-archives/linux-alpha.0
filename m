From: Greg KH <gregkh@suse.de>
Subject: Re: [4/4] 2.6.23-rc3: known regressions v3
Date: Fri, 24 Aug 2007 10:56:08 -0700
Message-ID: <20070824175608.GA5333@suse.de>
References: <46CF0DEF.5040107@googlemail.com> <46CF17A0.2060503@googlemail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <46CF17A0.2060503@googlemail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-usb-devel@lists.sourceforge.net, Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oliver@neukum.org>, Tino Keitel <tino.keitel@gmx.de>, Parag Warudkar <parag.warudkar@gmail.com>, Zachary Amsden <zach@vmware.com>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Oliver Falk <oliver@linux-kernel.at>

On Fri, Aug 24, 2007 at 07:38:40PM +0200, Michal Piotrowski wrote:
> Hi all,
> 
> Here is a list of some known regressions in 2.6.23-rc3.

First off, thanks so much for tracking these, it can't be an easy job,
but one that is really needed.  Keep up the great work.

> USB
> 
> Subject         : 2.6.23-rc1: USB hard disk broken
> References      : http://lkml.org/lkml/2007/7/25/62
> Last known good : ?
> Submitter       : Tino Keitel <tino.keitel@gmx.de>
> Caused-By       : ?
> Handled-By      : Oliver Neukum <oliver@neukum.org>
> Status          : unknown

Last I heard was that Tino was going to try to do further testing, but
as he hasn't responded in a few weeks, I'd mark this one down to,
"unknown and unreproducable".  Unless someone else knows more?

thanks,

greg k-h
