From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH 1/1] task_work: Add local_irq_enable() into
 task_work_run()
Date: Sat, 13 Oct 2012 16:39:00 +0100
Message-ID: <20121013153900.GR2616@ZenIV.linux.org.uk>
References: <20121006204736.GA1830@ds20.borg.net>
 <20121012160359.GB30881@redhat.com>
 <CA+55aFwXiu1znTkksgSyxa7v1-3cPWZL5dvth_8hQygSKE1utw@mail.gmail.com>
 <201210132259.25791.mcree@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201210132259.25791.mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>, dl8bcu@dl8bcu.de, peterz@infradead.org, mingo@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Sat, Oct 13, 2012 at 10:59:25PM +1300, Michael Cree wrote:

> Any chance that we could have the fixes backported to the stable queue, in 
> particular to the 3,2 kernel?  We should then be able to run the Debian built 
> SMP kernel on the autobuilders at Debian-Ports rather than having to run a 
> specially built kernel or a UP kernel.
> 
> BTW, the WARNING: at kernel/softirq.c:139 __local_bh_enable+0xe8/0x110() still 
> occurs when bringing up the CPUs.  Actually it happens twice now.  I've 
> attached my dmesg dump should you wish to check.

The obvious fix is to add local_irq_disable() into do_entInt(), just before
calling handle_ipi().  But I'm not sure if we wouldn't be better off just
doing it right in the beginning of do_entInt().  Take a look at that switch
in there: case 0 - we want local_irq_disable() done before handle_ipi().
case 1 - we do local_irq_disable() right there on SMP and do it almost
instantly in case of UP, since handle_irq() will do it a few insns after
entry anyway.  case 3 - ->device_interrupt() calls handle_irq() very soon
on all subarchitectures.  That leaves machine checks and perf_irq.  I have
no idea how hot those paths really are; do we spend enough time in there
to make blanket local_disable_irq() on those painful?  If not, we'd probably
be better off just lifting local_disable_irq() to the beginning of
do_entInt() and killing it in handle_irq() - that sucker is always called
from do_entInt(), directly or via ->device_interrupt().

Comments?
