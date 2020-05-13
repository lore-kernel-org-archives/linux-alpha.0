From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Alpha hardware for printk tests?
Date: Wed, 13 May 2020 21:25:26 +1200
Message-ID: <20200513092526.GD2743@tower>
References: <87tv0lgqut.fsf@vostro.fn.ogness.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87tv0lgqut.fsf@vostro.fn.ogness.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Ogness <john.ogness@linutronix.de>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On Tue, May 12, 2020 at 04:39:06PM +0200, John Ogness wrote:
> I have posted[0] a new lockless printk ringbuffer implementation. The
> ringbuffer has been tested heavily on x86_64 and arm64 SMP
> systems. However, I would also like to test it on an SMP Alpha
> system. Since the main purpose of the test is to verify the memory
> barriers, the tests need to run on real hardware.
> 
> The new ringbuffer (with test routine) can also be built as a kernel
> module and does not require any kernel patching. It should work on any
> Linux kernel 4.20 or higher.
> 
> Is there anyone with access to SMP Alpha hardware that would be willing
> to run the tests for me? Or can someone tell me where I might find such
> a candidate? Thanks!

I run the two Alpha ES45's building for Debian-Ports.  I can run
the tests on one of them if you provide me with instructions.

Cheers,
Michael.
