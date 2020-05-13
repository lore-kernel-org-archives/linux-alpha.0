From: John Ogness <john.ogness@linutronix.de>
Subject: Re: Alpha hardware for printk tests?
Date: Wed, 13 May 2020 14:17:51 +0200
Message-ID: <87r1vokp00.fsf@vostro.fn.ogness.net>
References: <87tv0lgqut.fsf@vostro.fn.ogness.net>
        <20200513092526.GD2743@tower>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20200513092526.GD2743@tower> (Michael Cree's message of "Wed, 13
        May 2020 21:25:26 +1200")
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On 2020-05-13, Michael Cree <mcree@orcon.net.nz> wrote:
>> I have posted[0] a new lockless printk ringbuffer implementation. The
>> ringbuffer has been tested heavily on x86_64 and arm64 SMP
>> systems. However, I would also like to test it on an SMP Alpha
>> system. Since the main purpose of the test is to verify the memory
>> barriers, the tests need to run on real hardware.
>> 
>> The new ringbuffer (with test routine) can also be built as a kernel
>> module and does not require any kernel patching. It should work on
>> any Linux kernel 4.20 or higher.
>> 
>> Is there anyone with access to SMP Alpha hardware that would be
>> willing to run the tests for me? Or can someone tell me where I might
>> find such a candidate? Thanks!
>
> I run the two Alpha ES45's building for Debian-Ports.  I can run
> the tests on one of them if you provide me with instructions.

That would be very helpful! Actually the test should build/run fine on
the Debian/stable (4.19) kernel as well. The source code is available
here:

https://linux:linux@dl.linutronix.de/customers/printk/prb-test.tar.gz

The README in the tarball explains how to build/run the test and what
information to send back after the test.

Even if you only had time to run the test for a few minutes, it would be
very helpful for me!

If you have any problems with the test module, please let me know. This
test has been confirmed to run successfully on: arm64, amd64, ppc64el

John Ogness
