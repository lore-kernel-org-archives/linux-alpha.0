From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH 00/11] rcu: Add missing RCU idle APIs on idle loop v2
Date: Sat, 25 Aug 2012 14:10:17 +1200
Message-ID: <50383409.7090207@orcon.net.nz>
References: <1345733915-20040-1-git-send-email-fweisbec@gmail.com>	 <20120824212647.GU2472@linux.vnet.ibm.com> <1345857554.4840.43.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1345857554.4840.43.camel@deadeye.wl.decadent.org.uk>
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ben Hutchings <ben@decadent.org.uk>
Cc: paulmck@linux.vnet.ibm.com, Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Chris Zankel <chris@zankel.net>, "3.2.x.." <stable@vger.kernel.org>, Chen Liqin <liqin.chen@sunplusct.com>, Lennox Wu <lennox.wu@gmail.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Parisc <linux-parisc@vger.kernel.org>, David Howells <dhowells@redhat.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, Geert Uytterhoeven <geert@linux-m68k.org>, m68k <linux-m68k@lists.linux-m68k.org>, Hirokazu Takata <takata@linux-m32r.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Cris <linux-cris-kernel@axis.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.>

On 25/08/12 13:19, Ben Hutchings wrote:
> On Fri, 2012-08-24 at 14:26 -0700, Paul E. McKenney wrote:
>> On Thu, Aug 23, 2012 at 04:58:24PM +0200, Frederic Weisbecker wrote:
>>> Hi,
>>>
>>> Changes since v1:
>>>
>>> - Fixed preempt handling in alpha idle loop
>>> - added ack from Geert
>>> - fixed stable email address, sorry :-/
>>>
>>> This time I built tested everywhere but: h8300 (compiler internal error),
>>> and mn10300, parisc, score (cross compilers not available in
>>> ftp://ftp.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.6.3/)
>>>
>>> For testing, you can pull from:
>>>
>>> git://github.com/fweisbec/linux-dynticks.git
>>> 	rcu/idle-fix-v2 
>>>
>>> Thanks.
>>
>> I have queued these on -rcu branch rcu/idle:
>>
>> 	git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
>>
>> This problem has been in place since 3.3, so it is hard to argue that
>> it is a regression for this merge window.  I have therefore queued it
>> for 3.7.
> 
> I don't follow that; I would expect any serious bug fix (serious enough
> for a stable update) to be acceptable for 3.6 at this point.
> 
> If the regression occurred in 3.3, then the cc lines should be something
> like:
> 
>     Cc: <stable@vger.kernel.org> # 3.3+
> 
> and not the current:
> 
>     Cc: 3.2.x.. <stable@vger.kernel.org>

The Alpha patches fix an even earlier regression resulting in RCU CPU
stalls on an SMP kernel built for generic Alpha (which includes the
current Debian 3.2-alpha-smp kernel) and renders the kernel pretty much
unuseable.  I've only tested the two alpha patches together but maybe
just the first patch (1/11 alpha: Fix preemption handling in idle loop)
might be needed to fix the problem in 3.2.   I'll test and let you know.

Cheers
Michael.
