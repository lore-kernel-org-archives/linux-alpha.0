From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 3/3] alpha: Implement HW performance events on the EV67
 and later CPUs.
Date: Tue, 04 May 2010 09:40:08 +0200
Message-ID: <1272958808.5605.126.camel@twins>
References: <cover.1272668360.git.mcree@orcon.net.nz>
	 <8e86ca502b675b3730bd58be391e0239e87e176d.1272668361.git.mcree@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <8e86ca502b675b3730bd58be391e0239e87e176d.1272668361.git.mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Arnaldo Carvalho de Melo <acme@redhat.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org

On Sat, 2010-05-01 at 11:55 +1200, Michael Cree wrote:
> +/* I wonder what this is for ??? */
> +void set_perf_event_pending(void)
> +{
> +} 

If the PMU Interrupt comes in as an NMI we cannot take locks and such
from its handler. So what we do is queue that work to be ran later. The
kernel has a fallback to run this stuff from the timer hardirq, but if
the PMI is IRQ context (like ARM) you can simply call
perf_event_do_pending() at its tail.

Alternatively you can self-IPI like x86 does and run
perf_event_do_pending() from there.


