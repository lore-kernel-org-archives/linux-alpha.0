From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [regression] boot failure on alpha, bisected
Date: Sun, 7 Oct 2012 18:08:50 +0100
Message-ID: <20121007170850.GJ2616@ZenIV.linux.org.uk>
References: <20121006204736.GA1830@ds20.borg.net>
 <20121007165534.GA8024@redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121007165534.GA8024@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Nesterov <oleg@redhat.com>
Cc: dl8bcu@dl8bcu.de, peterz@infradead.org, mingo@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On Sun, Oct 07, 2012 at 06:55:34PM +0200, Oleg Nesterov wrote:

> Hmm. I know nothing about arch/alpha and I can't understand its entry.S.
> But _it seems_ to me that do_notify_resume() is called with irqs disabled.
> If this is true, then imho arch/alpha should be fixed.
> 
> Before this commit task_work_run() enabled irqs, but this was the "side
> effect" of spin_lock_irq/spin_unlock_irq, we should not rely on this.

Um...  There's a bunch of architectures that are in the same situation.
grep for do_notify_resume() and you'll see...

It needs to be dealt with sanely, and actually have patches for alpha
going in that direction, but breaking a bunch of architectures is not a good
thing, obviously.  So you've bought yourself a major PITA for coming
weeks...
