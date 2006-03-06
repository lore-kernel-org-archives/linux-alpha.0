From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: Problem on Alpha with "convert to generic irq framework"
Date: Mon, 6 Mar 2006 15:51:14 +0300
Message-ID: <20060306155114.A8425@jurassic.park.msu.ru>
References: <20060304111219.GA10532@localhost>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060304111219.GA10532@localhost>; from mchouque@free.fr on Sat, Mar 04, 2006 at 12:12:19PM +0100
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Chouquet-Stringer <mchouque@free.fr>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Richard Henderson <rth@twiddle.net>, Andrew Morton <akpm@osdl.org>
Cc: Linus Torvalds <torvalds@osdl.org>

On Sat, Mar 04, 2006 at 12:12:19PM +0100, Mathieu Chouquet-Stringer wrote:
> I can trigger the bug almost instantly and I get, more or less randomly,
> the following panic messages (without traces):
> 
> Aiee, killing interrupt handler!
> Attempted to kill the idle task!
> Unable to handle kernel paging request at virtual address

I cannot reproduce that, but all my machines use SRM, so interrupt
handling is quite different from AlphaBIOS systems.

> system type             : EB164
> system variation        : LX164
> system revision         : 0
> system serial number    : MILO-2.2-18

I'll try to install AlphaBIOS/MILO on my lx164 to see what happens.

Ivan.
