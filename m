From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Please test my alpha tree
Date: Thu, 13 Jan 2011 10:10:12 +1300
Message-ID: <4D2E18B4.8060805@orcon.net.nz>
References: <AANLkTinLCqS+E8CXmAfs51sWuPS1JtNguA2VcoKK4g4f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <AANLkTinLCqS+E8CXmAfs51sWuPS1JtNguA2VcoKK4g4f@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matt Turner <mattst88@gmail.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Kyle McMartin <kyle@redhat.com>

On 12/01/11 18:29, Matt Turner wrote:
> After a few weeks of no work on the kernel, I've vacuumed up the
> outstanding patches.

Nice to see.

> They include the removal of __do_IRQ, so please give it a test on your hardware.
>
> On boot-up of my UP1500, I see
>
> HWRPB cycle frequency bogus.  Estimated 796423805 Hz
> Trying to install interrupt handler for IRQ8
> ------------[ cut here ]------------
> WARNING: at kernel/softirq.c:138 __local_bh_enable+0xa8/0xc0()

I don't think that's related to the __do_IRQ removal.  It occurs in the 
2.6.37 kernel just released.  Was discussed on linux-alpha with no 
resolution; see
http://marc.info/?l=linux-alpha&m=128859282018188&w=2 and following 
messages in thread.

> Ivan, the last patch in my tree is a breakage fix that you proposed.
> It seems fine to me; can you please give your sign-off?

The commit message should give more information.  How about the following?

Commit df9ee29270 made arch_local_irq_save and arch_local_irq_restore 
static inline which with -Werror trips up on __set_hae() and _set_hae() 
which are extern inline.  The naive solution is to make __set_hae() and 
set_hae() static inline but for reasons described in commit 
d559d4a24a3fe this breaks the generic kernel build.  Instead, since this 
is architecture specific code, this patch hard wires in the architecture 
specific method of disabling and enabling interrupts.

You can also add my Tested-by (I tested on generic, miata and dp264 
kernel builds).

The author information is mucked up on commits 0c9e7396d8d and 
3cf2323f0b74 and should be repaired.

The message on commit 3cf2323f0b74 is not very informative.  What "flag 
variables"?  Might be fixed by saying "Makefile flag variables".

Cheers
Michael.
