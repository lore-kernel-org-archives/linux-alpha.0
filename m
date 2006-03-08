From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: Problem on Alpha with "convert to generic irq framework"
Date: Wed, 8 Mar 2006 14:28:57 +0300
Message-ID: <20060308142857.A4851@jurassic.park.msu.ru>
References: <20060304111219.GA10532@localhost> <20060306155114.A8425@jurassic.park.msu.ru> <20060306135434.GA12829@localhost> <20060306191324.A1502@jurassic.park.msu.ru> <20060306163142.GA19833@localhost>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060306163142.GA19833@localhost>; from mchouque@free.fr on Mon, Mar 06, 2006 at 05:31:42PM +0100
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Chouquet-Stringer <mchouque@free.fr>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Richard Henderson <rth@twiddle.net>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>

Well, the problem with the new interrupt code is that it does
local_irq_enable() before return from interrupt.

I don't know exactly why it breaks with the MILO PALcode. I'd guess
that if an interrupt occurs during 'call_pal rti' execution, some
critical PALcode data gets corrupted.

Fixed thus.

Ivan.

--- 2.6.16-rc5/arch/alpha/kernel/irq.c	Mon Mar  6 11:57:58 2006
+++ linux/arch/alpha/kernel/irq.c	Wed Mar  8 14:10:51 2006
@@ -153,6 +153,5 @@ handle_irq(int irq, struct pt_regs * reg
 	irq_enter();
 	local_irq_disable();
 	__do_IRQ(irq, regs);
-	local_irq_enable();
 	irq_exit();
 }
