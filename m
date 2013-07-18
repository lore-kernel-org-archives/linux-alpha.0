From: Michael Cree <cree@waikato.ac.nz>
Subject: Re: [RFC PATCH 00/10] Alpha support for QEMU
Date: Thu, 18 Jul 2013 13:14:35 +1200
Message-ID: <20130718011435.GA20007@stolen.phys.waikato.ac.nz>
References: <1373996058-13399-1-git-send-email-rth@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1373996058-13399-1-git-send-email-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

On Tue, Jul 16, 2013 at 10:34:08AM -0700, Richard Henderson wrote:
> The series seems pretty stable under QEMU, but I have no real hardware
> on which to test -- the whole reason I'm interested in QEMU of course.
> So I'm hoping that someone will notice this and help me out with testing.

Tested the patch series applied against 3.10.1 on a 3-CPU ES45.  System came
up fine but I noticed date was wrong and had been reset back to the start
of the epoch (Jan 1 1970).  Appears it is not reading hardware clock
correctly on boot.

I manually set the clock to the correct time but noticed it is running slow,
indeed in a period of 60s the system clock incremented by 21s (+/-1s) so
would appear clock is running slow by a factor given by the number of CPUs.

Cheers
Michael
