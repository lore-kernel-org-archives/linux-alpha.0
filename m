From: Mathieu Chouquet-Stringer <ml2news@free.fr>
Subject: Re: Problem on Alpha with "convert to generic irq framework"
Date: 09 Mar 2006 13:34:56 +0100
Message-ID: <m3d5gvn6dr.fsf@localhost.localdomain>
References: <20060304111219.GA10532@localhost>
	<20060306155114.A8425@jurassic.park.msu.ru>
	<20060306135434.GA12829@localhost>
	<20060306191324.A1502@jurassic.park.msu.ru>
	<20060306163142.GA19833@localhost>
	<20060308142857.A4851@jurassic.park.msu.ru>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20060308142857.A4851@jurassic.park.msu.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Richard Henderson <rth@twiddle.net>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>

ink@jurassic.park.msu.ru (Ivan Kokshaysky) writes:
> Well, the problem with the new interrupt code is that it does
> local_irq_enable() before return from interrupt.
> [...]

Your patch works wonder, thanks Ivan.

-- 
Mathieu Chouquet-Stringer
