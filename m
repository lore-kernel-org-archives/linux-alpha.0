From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] kernel/time/tick-sched.c: fix warning of printk's argument
 format
Date: Fri, 09 Oct 2009 23:41:01 +0200
Message-ID: <4ACFADED.2040209@gmx.de>
References: <1255013172-31599-1-git-send-email-wuzhangjin@gmail.com> <alpine.LFD.2.01.0910080755390.3432@localhost.localdomain> <200910091542.29457.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200910091542.29457.arnd@arndb.de>
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Wu Zhangjin <wuzhangjin@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Remis Lima Baima <remis.developer@googlemail.com>, Christoph Hellwig <hch@lst.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ralf Baechle <ralf@linux-mips.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>, "James E.J. Bottomley" <jejb@parisc-linux.org>, linux-parisc@vger.kernel.org

On 10/09/2009 03:42 PM, Arnd Bergmann wrote:
> On Thursday 08 October 2009, Linus Torvalds wrote:
>> for some unfathomable reason. Quite frankly, I think Arnd just screwed up
>> the "generic" version, and the fix is almost certainly to just make the
>> generic version match all the main architectures.
>>
>> I don't have any architectures using the generic header file, though, so
>> I'm not going to do that change blindly. People who do should look at it
>> (alpha, powerpc and mips look like the only ones that might be 64-bit, but
>> I didn't check very carefully - just grepped for it)
>>
>> Added Cc's for some people that have worked on, or used, that generic
>> header file. Is there any possible reason why it is "unsigned long" in
>> that one?
>
> It was intentional to make it unsigned long in the asm-generic
> version, based on the observation that some of the 64-bit architectures
> (alpha and parisc) were using unsigned long in their arch specific
> files. The original parisc file contained
>
> typedef struct {
>         unsigned long __softirq_pending; /* set_bit is used on this */
> } ____cacheline_aligned irq_cpustat_t;
>
> which would imply that unsigned int wouldn't work for it, and looked
> like a good idea. It turns out that the comment is outdated, set_bit
> hasn't been used on __softirq_pending on any architecture for a long
> time as far as I can tell, and 32 bits is obviously enough for it.

Yes, I just tested it on the parisc architecture.
It seems we don't even touch this variable in our code.

> The patch that Ralf just sent looks good therefore, but I'd suggest
> either reverting two of Christophs patches that changed parisc and alpha
> just to be on the safe side, or getting explicit Acks for Ralfs patch
> from the maintainers of those two architectures.

Don't revert for parisc, as either "unsigned long" or "unsigned int" is OK.
So, Ralf's patch (switching __softirq_pending back to "unsigned int") get's my Ack:
Acked-by: Helge Deller <deller@gmx.de>

Helge
