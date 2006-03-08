From: Richard Henderson <rth@twiddle.net>
Subject: Re: Problem on Alpha with "convert to generic irq framework"
Date: Wed, 8 Mar 2006 09:56:52 -0800
Message-ID: <20060308175652.GA28296@twiddle.net>
References: <20060304111219.GA10532@localhost> <20060306155114.A8425@jurassic.park.msu.ru> <20060306135434.GA12829@localhost> <20060306191324.A1502@jurassic.park.msu.ru> <20060306163142.GA19833@localhost> <20060308142857.A4851@jurassic.park.msu.ru>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060308142857.A4851@jurassic.park.msu.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Mathieu Chouquet-Stringer <mchouque@free.fr>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>

On Wed, Mar 08, 2006 at 02:28:57PM +0300, Ivan Kokshaysky wrote:
>  	irq_enter();
>  	local_irq_disable();
>  	__do_IRQ(irq, regs);
> -	local_irq_enable();
>  	irq_exit();

This will need commenting if it's to go in.


r~
