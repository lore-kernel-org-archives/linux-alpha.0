From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: Please test my alpha tree
Date: Thu, 13 Jan 2011 00:54:16 +0300
Message-ID: <20110112215416.GA18643@jurassic.park.msu.ru>
References: <AANLkTinLCqS+E8CXmAfs51sWuPS1JtNguA2VcoKK4g4f@mail.gmail.com> <4D2E18B4.8060805@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D2E18B4.8060805@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Kyle McMartin <kyle@redhat.com>

On Thu, Jan 13, 2011 at 10:10:12AM +1300, Michael Cree wrote:
> On 12/01/11 18:29, Matt Turner wrote:
>> On boot-up of my UP1500, I see
>>
>> HWRPB cycle frequency bogus.  Estimated 796423805 Hz
>> Trying to install interrupt handler for IRQ8
>> ------------[ cut here ]------------
>> WARNING: at kernel/softirq.c:138 __local_bh_enable+0xa8/0xc0()
>
> I don't think that's related to the __do_IRQ removal.  It occurs in the 
> 2.6.37 kernel just released.  Was discussed on linux-alpha with no 
> resolution; see
> http://marc.info/?l=linux-alpha&m=128859282018188&w=2 and following 
> messages in thread.

Fixed, the patch will follow shortly.

>> Ivan, the last patch in my tree is a breakage fix that you proposed.
>> It seems fine to me; can you please give your sign-off?
>
> The commit message should give more information.  How about the following?
>
> Commit df9ee29270 made arch_local_irq_save and arch_local_irq_restore 
> static inline which with -Werror trips up on __set_hae() and _set_hae() 
> which are extern inline.  The naive solution is to make __set_hae() and 
> set_hae() static inline but for reasons described in commit d559d4a24a3fe 
> this breaks the generic kernel build.  Instead, since this is architecture 
> specific code, this patch hard wires in the architecture specific method of 
> disabling and enabling interrupts.

Agreed, that would be nice description.

> You can also add my Tested-by (I tested on generic, miata and dp264 kernel 
> builds).

Matt, feel free to add
 Signed-off-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>

Ivan.
