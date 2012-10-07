From: Thorsten Kranzkowski <dl8bcu@dl8bcu.de>
Subject: Re: [regression] boot failure on alpha, bisected
Date: Sun, 7 Oct 2012 19:41:47 +0000
Message-ID: <20121007194147.GA931@ds20.borg.net>
References: <20121006204736.GA1830@ds20.borg.net>
 <20121007165534.GA8024@redhat.com>
 <20121007171300.GA10942@redhat.com>
 <20121007180420.GA900@ds20.borg.net>
 <20121007191627.GA19278@redhat.com>
Reply-To: dl8bcu@dl8bcu.de
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121007191627.GA19278@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Nesterov <oleg@redhat.com>
Cc: peterz@infradead.org, mingo@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Al Viro <viro@ZenIV.linux.org.uk>

On Sun, Oct 07, 2012 at 09:16:27PM +0200, Oleg Nesterov wrote:
> On 10/07, Thorsten Kranzkowski wrote:
> > On Sun, Oct 07, 2012 at 07:13:00PM +0200, Oleg Nesterov wrote:
> > > On 10/07, Oleg Nesterov wrote:
> > > >
> > > > Hmm. I know nothing about arch/alpha and I can't understand its entry.S.
> > > > But _it seems_ to me that do_notify_resume() is called with irqs disabled.
> > > > If this is true, then imho arch/alpha should be fixed.
> > > >
> > > > Before this commit task_work_run() enabled irqs, but this was the "side
> > > > effect" of spin_lock_irq/spin_unlock_irq, we should not rely on this.
> > >
> > > Could you please test the debugging patch below?
> >
> > Of course. With that patch applied the kernel (ac3d0da) boots again. The trace line
> > is printed about once a second, with values '2' and '4'.
> 
> Thanks a lot Thorsten!
> 
> So I'll probably send the patch which enables interrupts in
> task_work_run(). I guess this needs "if (irqs_disabled())"
> for lockdep.
> 
> The question is, should I add the warning to remind that this
> arch needs a fix?

If you do, then please warn only once, otherwise there will be a lot of
warnings :-)
 
Thorsten
 

-- 
| Thorsten Kranzkowski        Internet: dl8bcu@dl8bcu.de                      |
| Mobile: ++49 170 1876134       Snail: Kiebitzstr. 14, 49324 Melle, Germany  |
| Ampr: dl8bcu@db0lj.#rpl.deu.eu, dl8bcu@marvin.dl8bcu.ampr.org [44.130.8.19] |
