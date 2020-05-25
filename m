From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Alpha hardware for printk tests?
Date: Mon, 25 May 2020 21:47:29 +1200
Message-ID: <20200525094729.GA30094@tower>
References: <87tv0lgqut.fsf@vostro.fn.ogness.net>
 <20200513092526.GD2743@tower>
 <87r1vokp00.fsf@vostro.fn.ogness.net>
 <87v9ksavns.fsf@vostro.fn.ogness.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87v9ksavns.fsf@vostro.fn.ogness.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Ogness <john.ogness@linutronix.de>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

Hi John,

On Tue, May 19, 2020 at 03:42:15PM +0200, John Ogness wrote:
> On 2020-05-12, John Ogness <john.ogness@linutronix.de> wrote:
> > I have posted[0] a new lockless printk ringbuffer implementation. The
> > ringbuffer has been tested heavily on x86_64 and arm64 SMP
> > systems. However, I would also like to test it on an SMP Alpha
> > system. Since the main purpose of the test is to verify the memory
> > barriers, the tests need to run on real hardware.

I ran it for about 48 hours on an ES45 with two EV68CB CPUs.

This is the dmesg output.  Nothing untoward shows up.
The unaligned traps are only from some builds of R software that
I allowed to happen at some point during the 48 hours.

[5594108.751049] prb: loading out-of-tree module taints kernel.
[5594108.752025] prbtest: starting test
[5594108.795971] prbtest: start thread 000 (writer)
[5594108.795971] prbtest: start thread 001 (reader)
[5633065.742821] do_entUnaUser: 267 callbacks suppressed
[5633065.742821] R(31934): unaligned trap at 00000200034f64e4: 000000004dc6b4c5 2c 1
[5633065.899071] R(31934): unaligned trap at 00000200034f64ec: 00000000688e1c08 2c 1
[5633065.995751] R(31934): unaligned trap at 00000200034f64f4: 000000007ab1d76f 2c 1
[5633066.093407] R(31934): unaligned trap at 00000200034f64fc: 0000000079eeaefd 2c 1
[5633066.194970] R(31934): unaligned trap at 00000200034f64e4: 000000004dc6b4c5 2c 1
[5633802.658460] do_entUnaUser: 399 callbacks suppressed
[5633802.658460] R(5173): unaligned trap at 00000200034f64e4: 00000000bc6e5800 2c 1
[5633802.813733] R(5173): unaligned trap at 00000200034f64ec: 0000000099c12496 2c 1
[5633802.908460] R(5173): unaligned trap at 00000200034f64f4: 00000000664dc5fb 2c 1
[5633803.005139] R(5173): unaligned trap at 00000200034f64fc: 00000000ac4dd9c5 2c 1
[5633803.104749] R(5173): unaligned trap at 00000200034f64e4: 00000000bc6e5800 2c 1
[5765821.511765] reader1: total_lost=1320184974 max_lost=66240 total_read=47352899655 seq=48696527777
[5765821.619186] prbtest: end thread 001 (reader)
[5765821.671921] prbtest: end thread 000 (wrote 48696598157, max/avg/min 1953124/2578/0)
[5765822.735397] prbtest: completed test

There is no /sys/kernel/debug/tracing directory on this machine.
Maybe I need to enable some kernel config in the kernel build?

Cheers,
Michael.
