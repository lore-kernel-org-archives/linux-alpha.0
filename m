From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH 3/3] alpha: Implement HW performance events on the EV67 and later CPUs.
Date: Tue, 25 May 2010 09:58:05 +1200
Message-ID: <E02DFBB5-4841-4C6F-8142-0E7D0F1D4A30@orcon.net.nz>
References: <cover.1272668360.git.mcree@orcon.net.nz> <8e86ca502b675b3730bd58be391e0239e87e176d.1272668361.git.mcree@orcon.net.nz> <1272958808.5605.126.camel@twins>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1272958808.5605.126.camel@twins>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Arnaldo Carvalho de Melo <acme@redhat.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org

On 4/05/2010, at 7:40 PM, Peter Zijlstra wrote:
> On Sat, 2010-05-01 at 11:55 +1200, Michael Cree wrote:
>> +/* I wonder what this is for ??? */
>> +void set_perf_event_pending(void)
>> +{
>> +}
>
> If the PMU Interrupt comes in as an NMI we cannot take locks and such
> from its handler. So what we do is queue that work to be ran later.  
> The
> kernel has a fallback to run this stuff from the timer hardirq, but if
> the PMI is IRQ context (like ARM) you can simply call
> perf_event_do_pending() at its tail.

My understanding from the Alpha HW Ref. Man. and a brief look at the  
kernel code is that the PMI comes in through the normal IRQ entry  
point on the Alpha.  It is a high priority interrupt and only a  
machine check (i.e. detected hardware failure) can interrupt the PMU  
interrupt handler.  I don't know whether that is an issue for taking  
locks or not and need advice on that.

I originally based the Alpha implementation on the Sparc  
implementation and would've copied the set_perf_event_pending()  
definition from the Sparc code, but I now see that newer Sparc code  
does not have that definition nor does it call perf_event_do_pending()  
in the interrupt handler.

So I need advice on whether to:

1) Just remove the set_perf_event_pending() definition so we are like  
the Sparc code,

2) Add perf_event_do_pending() to the tail of the IRQ handler so we  
are like the ARM code, or

3) Implement the following suggestion:

> Alternatively you can self-IPI like x86 does and run
> perf_event_do_pending() from there.

Another question is what are the observeable symptoms if an incorrect  
option above is implemented?

Regards
Michael.

