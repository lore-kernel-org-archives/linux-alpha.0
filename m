From: John Ogness <john.ogness@linutronix.de>
Subject: Re: Alpha hardware for printk tests?
Date: Tue, 19 May 2020 15:42:15 +0200
Message-ID: <87v9ksavns.fsf@vostro.fn.ogness.net>
References: <87tv0lgqut.fsf@vostro.fn.ogness.net>
        <20200513092526.GD2743@tower> <87r1vokp00.fsf@vostro.fn.ogness.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <87r1vokp00.fsf@vostro.fn.ogness.net> (John Ogness's message of
        "Wed, 13 May 2020 14:17:51 +0200")
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On 2020-05-12, John Ogness <john.ogness@linutronix.de> wrote:
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
> Is there anyone with access to SMP Alpha hardware that would be
> willing to run the tests for me? Or can someone tell me where I might
> find such a candidate? Thanks!

A problem leading to data corruption in the ringbuffer messages has been
identified and fixed. A new version of the test module is available:

https://linux:linux@dl.linutronix.de/customers/printk/prb-test.tar.gz

The README in the tarball explains how to build/run the test and what
information to send back after the test.

This test module should build/run without any kernel patching or
rebooting. Even if it is only allowed to run on your SMP-Alpha for an
hour, that would be very helpful for me.

Thanks,
John Ogness
