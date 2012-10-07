From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [regression] boot failure on alpha, bisected
Date: Sun, 7 Oct 2012 19:33:36 +0200
Message-ID: <20121007173336.GA14804@redhat.com>
References: <20121006204736.GA1830@ds20.borg.net> <20121007165534.GA8024@redhat.com> <20121007170850.GJ2616@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121007170850.GJ2616@ZenIV.linux.org.uk>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: dl8bcu@dl8bcu.de, peterz@infradead.org, mingo@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On 10/07, Al Viro wrote:
>
> On Sun, Oct 07, 2012 at 06:55:34PM +0200, Oleg Nesterov wrote:
>
> > Hmm. I know nothing about arch/alpha and I can't understand its entry.S.
> > But _it seems_ to me that do_notify_resume() is called with irqs disabled.
> > If this is true, then imho arch/alpha should be fixed.
> >
> > Before this commit task_work_run() enabled irqs, but this was the "side
> > effect" of spin_lock_irq/spin_unlock_irq, we should not rely on this.
>
> Um...  There's a bunch of architectures that are in the same situation.
> grep for do_notify_resume() and you'll see...

And every do_notify_resume() should be changed anyway, do_signal() and
tracehook_notify_resume() should be re-ordered.

> It needs to be dealt with sanely, and actually have patches for alpha
> going in that direction, but breaking a bunch of architectures is not a good
> thing, obviously.  So you've bought yourself a major PITA for coming
> weeks...

So perhaps the patch below until they are fixed?


--- x/kernel/task_work.c
+++ x/kernel/task_work.c
@@ -51,6 +51,9 @@ void task_work_run(void)
 	struct task_struct *task = current;
 	struct callback_head *work, *head, *next;
 
+	if (WARN_ONCE(irqs_disabled(), "notify_resume() with irqs_disabled"))
+		local_irq_enable();
+
 	for (;;) {
 		/*
 		 * work->func() can do task_work_add(), do not set

