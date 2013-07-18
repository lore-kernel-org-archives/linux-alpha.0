From: Michael Cree <cree@waikato.ac.nz>
Subject: Re: [RFC PATCH 00/10] Alpha support for QEMU
Date: Fri, 19 Jul 2013 09:28:15 +1200
Message-ID: <20130718212815.GA32459@stolen.phys.waikato.ac.nz>
References: <1373996058-13399-1-git-send-email-rth@twiddle.net>
 <20130718011435.GA20007@stolen.phys.waikato.ac.nz>
 <51E7EFC6.6070003@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51E7EFC6.6070003@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

On Thu, Jul 18, 2013 at 06:38:14AM -0700, Richard Henderson wrote:
> On 07/17/2013 06:14 PM, Michael Cree wrote:
> > Tested the patch series applied against 3.10.1 on a 3-CPU ES45.  System came
> > up fine but I noticed date was wrong and had been reset back to the start
> > of the epoch (Jan 1 1970).  Appears it is not reading hardware clock
> > correctly on boot.
> 
> Please scan the dmesg for the "Using epoch 2000 for rtc year 13" line,
> and compare vs a similar message on the previous kernel.

The kernel without the patch set has the "Using epoch 2000" line and
the kernel with the patch set is missing the "Using epoch 2000" line.

The differences in config between the two kernels are:

diff /boot/config-3.10.1-titan-p1+ /boot/config-3.10.1-titan-rth2+ 
25c25
< CONFIG_LOCALVERSION="-titan-p1"
---
> CONFIG_LOCALVERSION="-titan-rth2"
44c44,53
< CONFIG_GENERIC_CMOS_UPDATE=y
---
> CONFIG_GENERIC_CLOCKEVENTS=y
> CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
> 
> #
> # Timers subsystem
> #
> CONFIG_HZ_PERIODIC=y
> # CONFIG_NO_HZ_IDLE is not set
> # CONFIG_NO_HZ is not set
> # CONFIG_HIGH_RES_TIMERS is not set
253a263
> # CONFIG_ALPHA_QEMU is not set
277a288,293
> # CONFIG_HZ_32 is not set
> # CONFIG_HZ_64 is not set
> # CONFIG_HZ_128 is not set
> # CONFIG_HZ_256 is not set
> CONFIG_HZ_1024=y
> # CONFIG_HZ_1200 is not set


> > I manually set the clock to the correct time but noticed it is running slow,
> > indeed in a period of 60s the system clock incremented by 21s (+/-1s) so
> > would appear clock is running slow by a factor given by the number of CPUs.
> 
> That's curious.  I wonder if somehow I botched the smp changes, and I'm
> not getting the timer interrupt either (1) enabled or (2) registered on
> the secondary cpus...
> 
> Perhaps /proc/interrupts will confirm or deny this?

On the kernel without the patch set the dummy-RTC timer interrupt received
30876 interrupts in a 30s period which is within measurement uncertainty of
the expected 30*1024 = 30720 interrupts.

On the kernel with the patch set the dummy-RTC timer interrupt received 14419 
interrupts on CPU-1, 13935 interrupts on CPU-2 and 2619 interrupts on CPU-3
over a 30s period.

Cheers
Michael.
