From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH 3/3 V2] alpha: Implement HW performance events on the EV67 and later CPUs.
Date: Thu, 29 Jul 2010 08:52:24 +1200
Message-ID: <FA98B8E5-B4E8-4FC7-94F0-9A8EA38CFF97@orcon.net.nz>
References: <1272958808.5605.126.camel@twins> <1280226579-6117-2-git-send-email-mcree@orcon.net.nz> <20100728125330.af75e63c.akpm@linux-foundation.org>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20100728125330.af75e63c.akpm@linux-foundation.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Arnaldo Carvalho de Melo <acme@redhat.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org

On 29/07/2010, at 7:53 AM, Andrew Morton wrote:
> On Tue, 27 Jul 2010 22:29:39 +1200
> Michael Cree <mcree@orcon.net.nz> wrote:
>
>> This implements hardware performance events for the EV67 and later
>> CPUs within the Linux performance events subsystem.  Only using the
>> performance monitoring unit in HP/Compaq's so called "Aggregrate
>> mode" is supported.
>>
>> The code has been implemented in a manner that makes extension to
>> other older Alpha CPUs relatively straightforward should some mug
>> wish to indulge his or herself.
>
> Below is the incremental diff.
>
> I have a note here that Peter had issues with the earlier version of
> this patch.  But I see no info here regarding what those issues were,
> nor whether or how they were addressed.

Yeah, I addressed those in the cover letter, which I include here FYI:

On 04/05/10 19:40, Peter Zijlstra wrote:
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
>
> Alternatively you can self-IPI like x86 does and run
> perf_event_do_pending() from there.

OK, I couldn't see how to self-IPI on the Apha (there is no obvious  
way in
the Alpha arch code, and the Alpha HW Ref. Man. only describes such a
feature being supported by the PALcode for OpenVMS which we are  
obviously
not running) and the PMI on Alpha is at such a high priority there is no
chance that the lock can be freed while in the PMI handler, so I have  
put
the call to perf_event_do_pending() in the timer interrupt, but unlike  
the
PowerPC code I don't know any tricks to force the timer interrupt to  
happen
early when there is pending work, so there is a potential maximum  
delay of
1ms from pending work being notified to calling  
perf_event_do_pending().  Is
this delay acceptable?

I also fix a nasty, but heretofore hidden, bug that could completely  
lock up
a machine with continuous PMIs due to a throttled PMC being accidently
re-enabled by the other PMC. It only showed up when I set the NMI flag  
true
in the call to perf_event_overflow() and had two events counting
simultaneously with a very short sample period.

I also see the x86 and Sparc code in 2.6.35 have reimplemented
the call to hw_perf_group_sched_in() in terms of new functions  
start_txn(),
cancel_txn() and commit_txn().  Is this change necessary to get the  
Alpha
code accepted for 2.6.36?  If so it would be helpful if I could have a  
brief
description of what each function does.

Cheers
Michael.

