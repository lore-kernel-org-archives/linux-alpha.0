From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 1/9] alpha: Replace deprecated spinlock initialization
Date: Thu, 27 Jan 2011 08:54:15 +0100 (CET)
Message-ID: <alpine.LFD.2.00.1101270851370.31804@localhost6.localdomain6>
References: <20110123143631.392446736@linutronix.de> <20110123143836.940494132@linutronix.de> <AANLkTin1ct3NfBP8kiaEweA6ZEPTvKfCqgN-nVdJ0n0g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTin1ct3NfBP8kiaEweA6ZEPTvKfCqgN-nVdJ0n0g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org

On Sun, 23 Jan 2011, Matt Turner wrote:
> On Sun, Jan 23, 2011 at 3:16 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
> 
> Thanks! I'll apply this.

I take it through core/locking in tip as well, because further
cleanups depend on it. Git will sort out the identical changes.

Thanks,

	tglx
