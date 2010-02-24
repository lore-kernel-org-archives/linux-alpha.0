From: Michael Cree <mcree@orcon.net.nz>
Subject: HW perf. events arch implementation
Date: Wed, 24 Feb 2010 14:35:04 +1300
Message-ID: <1EE1A83F-EB50-40F3-A6A0-5D8DE0B38446@orcon.net.nz>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <a.p.zijlstra@chello.nl>

I am trying to implement arch specific code on the Alpha for hardware  
performance events (yeah, I'm probably a little bit loopy and unsound  
of mind pursuing this on an end-of-line platform, but it's a way in to  
learn a little bit of kernel programming and it scratches an itch).

I have taken a look at the code in the x86, sparc and ppc  
implementations and tried to drum up an Alpha implementation for the  
EV67/7/79 cpus, but it ain't working and is producing obviously  
erroneous counts.  Part of the problem is that I don't understand  
under what conditions, and with what assumptions, the performance  
event subsystem is calling into the architecture specific code.  Is  
there any documentation available that describes the architecture  
specific interface?

The Alpha CPUs of interest have two 20-bit performance monitoring  
counters that can count cycles, instructions, Bcache misses and Mbox  
replays (but not all combinations of those).  For round numbers  
consider a 1GHz CPU, with a theoretical maximal sustained throughput  
of four instructions per cycle, then a single performance counter  
could potentially generate 4000 interrupts per second to signal  
counter overflow when counting instructions.

The x86, sparc and PPC implementations seem to me to assume that calls  
to read back the counters occur more frequently than performance  
counter overflow interrupts, and that the highest bit of the counter  
can safely be used to detect overflow.  (Am I correct?)  That is  
likely not to be true of the Alpha because of the small width of the  
counter.  Is there someone who would be happy to give me, a kernel  
newbie who probably doesn't even make the grade of neophyte, a bit of  
direction on this?

Also, the Alpha CPUs have an interesting mode whereby one programmes  
up one counter with a specified (or random) value that specifies a  
future instruction to profile.  The CPU runs for that number of  
instructions/cycles, then a short monitoring window (of a few cycles)  
is opened about the profiled instruction and when completed an  
interrupt is generated.  One can then read back a whole lot of  
information about the pipeline at the time of the profiled  
instruction.  This can be used for statistical sampling.  Does the  
performance events subsystem support monitoring with such a mode?

Cheers
Michael.
