From: David Miller <davem@davemloft.net>
Subject: Re: [RFC][PATCH 0/14] Convert remaining arches to
 read/update_persistent_clock
Date: Wed, 23 Dec 2009 20:54:15 -0800 (PST)
Message-ID: <20091223.205415.232734959.davem@davemloft.net>
References: <1261540762.3508.61.camel@localhost.localdomain>
	<20091223050810.GA25791@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20091223050810.GA25791@linux-sh.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: lethal@linux-sh.org
Cc: johnstul@us.ibm.com, linux-kernel@vger.kernel.org, rth@twiddle.net, linux-alpha@vger.kernel.org, linux-sh@vger.kernel.org, linux@arm.linux.org.uk, hskinnemoen@atmel.com, vapier@gentoo.org, starvik@axis.com, dhowells@redhat.com, ysato@users.sourceforge.jp, tony.luck@intel.com, takata@linux-m32r.org, geert@linux-m68k.org, yasutake.koichi@jp.panasonic.com, kyle@mcmartin.ca

From: Paul Mundt <lethal@linux-sh.org>
Date: Wed, 23 Dec 2009 14:08:10 +0900

> In any event, I wonder if it might make more sense to take something like
> the SPARC implementation that is simply a wrapper around the RTC, move
> that out in to a more generic place, and permit architectures to select
> an RTC class backed persistent clock instead (it seems to be only
> platforms that haven't caught up yet in terms of generic time and RTC
> migration that would want to define this interface on their own at all at
> this point)?

This sounds nice but don't we have a slew of RTC types that need
to be accessed over I2C and thus you can't touch them without
sleeping?
