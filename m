From: John Ogness <john.ogness@linutronix.de>
Subject: Alpha hardware for printk tests?
Date: Tue, 12 May 2020 16:39:06 +0200
Message-ID: <87tv0lgqut.fsf@vostro.fn.ogness.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org

Hello,

I have posted[0] a new lockless printk ringbuffer implementation. The
ringbuffer has been tested heavily on x86_64 and arm64 SMP
systems. However, I would also like to test it on an SMP Alpha
system. Since the main purpose of the test is to verify the memory
barriers, the tests need to run on real hardware.

The new ringbuffer (with test routine) can also be built as a kernel
module and does not require any kernel patching. It should work on any
Linux kernel 4.20 or higher.

Is there anyone with access to SMP Alpha hardware that would be willing
to run the tests for me? Or can someone tell me where I might find such
a candidate? Thanks!

John Ogness

[0] https://lkml.kernel.org/r/20200501094010.17694-1-john.ogness@linutronix.de
