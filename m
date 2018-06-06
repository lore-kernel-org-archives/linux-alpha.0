From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 0.5/5] alpha: remove custom dec_and_lock() implementation
Date: Wed, 6 Jun 2018 13:21:39 +0200
Message-ID: <20180606112139.5ykw277zt72ye3ka@linutronix.de>
References: <20180504154533.8833-1-bigeasy@linutronix.de>
 <20180504154533.8833-2-bigeasy@linutronix.de>
 <20180604102559.2ynbassthjzva62l@linutronix.de>
 <20180604102757.h46feymcfdydl4nz@linutronix.de>
 <20180604114852.GQ12217@hirez.programming.kicks-ass.net>
 <20180606111849.4vr2ap2w4mlyqm23@linutronix.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180606111849.4vr2ap2w4mlyqm23@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, Ingo Molnar <mingo@redhat.com>, Anna-Maria Gleixner <anna-maria@linutronix.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On 2018-06-06 13:18:50 [+0200], To Peter Zijlstra wrote:
> I suggest to remove the custom alpha implementation of dec_and_lock()
> and if it is an issue (performance wise) we could still inline the fast
> path of dec_and_lock().

For everyone who lost track, we are now down to this:
|577cd5e894ec alpha: remove custom dec_and_lock() implementation
|831923bd9fd3 spinlock: atomic_dec_and_lock: Add an irqsave variant
|f452abc5a3c1 drivers/md/raid5: Use irqsave variant of atomic_dec_and_lock()
|8e609dcd8b0d drivers/md/raid5: Do not disable irq on release_inactive_stripe_list() call
|fdf84cf5bee4 bdi: use refcount_t for reference counting instead atomic_t
|c3fce80b4112 userns: use refcount_t for reference counting instead atomic_t
|a9595ca33f5b locking/refcount: implement refcount_dec_and_lock_irqsave()
|32ded25a41a9 bdi: Use irqsave variant of refcount_dec_and_lock()
|6a63e34ed625 userns: Use irqsave variant of refcount_dec_and_lock()

for reference at
  https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git/log/?h=refcount_t_irqsave

Sebastian
