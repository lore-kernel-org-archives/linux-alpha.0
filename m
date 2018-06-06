From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 0.5/5] alpha: remove custom dec_and_lock() implementation
Date: Wed, 6 Jun 2018 13:59:19 +0200
Message-ID: <20180606115918.GG12198@hirez.programming.kicks-ass.net>
References: <20180504154533.8833-1-bigeasy@linutronix.de>
 <20180504154533.8833-2-bigeasy@linutronix.de>
 <20180604102559.2ynbassthjzva62l@linutronix.de>
 <20180604102757.h46feymcfdydl4nz@linutronix.de>
 <20180604114852.GQ12217@hirez.programming.kicks-ass.net>
 <20180606111849.4vr2ap2w4mlyqm23@linutronix.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=KdRvOFEZpW4mUURuHZtgA/9WTQ/LZ8q2susHGf72DmI=; b=I+2lOt7cCDEGEAMmG1Bh7TOpX
        JChtYJh1YbnQ5EDZllT8CaHacfNXyAvLChIlS8ltxS9HPJ7/vtFnjxlo6UddeV7MAutUGJdXEWxUe
        xW+z4+JOFDuoJ8326MaTufMz0il4nXQ1Z11ZRrEIX9dScPNqNEF55cNE+MZPW06qXHQPlDagFGQqh
        UHOCHOVN1CEoiHA5iC2yMepJ4oCQPy78cTh0ohPKnxUVSVaTDgUZhfSpfTXQHZtx9UArVL7HC0rWQ
        ROBCLdjtyW98xG3sdKAs0kFi5vWDCSjLTJNhgXn6owY0dJuEWnRA2kXTRcuzq/8+zofbvsP4vm3Ee
      
Content-Disposition: inline
In-Reply-To: <20180606111849.4vr2ap2w4mlyqm23@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, Ingo Molnar <mingo@redhat.com>, Anna-Maria Gleixner <anna-maria@linutronix.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On Wed, Jun 06, 2018 at 01:18:50PM +0200, Sebastian Andrzej Siewior wrote:

> - atomic_add_unless() adds more memory barriers compared to the custom
>   assembly

> I can't tell if the different memory barriers
> are an issue but having the same barriers is probably good.

refcount decrement needs to be a RELEASE operation, such that all the
load/stores to the object happen before we decrement the refcount.

Otherwise things like:

	obj-foo = 5;
	refcnt_dec(&obj->ref);

can be re-ordered, which then allows fun scenarios like:

	CPU0				CPU1

	refcnt_dec(&obj->ref);
					if (dec_and_test(&obj->ref))
						free(obj);
	obj->foo = 5; // oops UaF


This means (for alpha) that there should be a memory barrier _before_
the decrement, however the dec_and_lock asm thing only has one _after_,
which, per the above, is too late.

The generic version using add_unless will result in memory barrier
before and after (because that is the rule for atomic ops with a return
value) which is strictly too many barriers for the refcount story, but
who knows what other ordering requirements code has.

