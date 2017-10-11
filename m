From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6 02/11] locking/rwsem: Implement a new locking scheme
Date: Wed, 11 Oct 2017 21:36:28 +0200
Message-ID: <20171011193628.xvapnggpqci3v6cr@hirez.programming.kicks-ass.net>
References: <1507744922-15196-1-git-send-email-longman@redhat.com>
 <1507744922-15196-3-git-send-email-longman@redhat.com>
 <20171011184038.pilwo7sjf72nwaxk@hirez.programming.kicks-ass.net>
 <29f33a68-bf01-e0f0-158f-3bae3a680e80@redhat.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=x/LVtYDntpfk6GL5bgFr87CiPMiGbG+Agx3hp7GvUWg=; b=MdoZdAJktz7MKEjO1YSBUe9f2
        qx9ppj5rWK3ZTiR8PrdGTob8TtGuUc3X0G1lOifvRfYlPufasHJPQmXHb/hpFSzrNZX8ZewIytPJG
        4MeUbAihawaGILDpfUD9ES4UVSuVpkxeYZPgYwM/W6UKvnIM/qYl4zLJmVEmwryZrEXZFQGkif0kh
        QZIGVGu7km34XtuVLRw5xpo8m0eiErjtdFwddsIeZLzPimoCYz0ryKw9jjjnV1hwVaC+I8cFVWegK
        ACQWLp/ZFKfjpWmcOZ15FSLmSAkpoVkNFdRdwsSUqbNRVzIXu/w5bvqGF6Wr16FNFUIdIsdG0xWoJ
      
Content-Disposition: inline
In-Reply-To: <29f33a68-bf01-e0f0-158f-3bae3a680e80@redhat.com>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Waiman Long <longman@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>, Dave Chinner <david@fromorbit.com>

On Wed, Oct 11, 2017 at 02:58:02PM -0400, Waiman Long wrote:
> On 10/11/2017 02:40 PM, Peter Zijlstra wrote:
> > So I implemented rwsem-mutex (also qrwlock based) that puts
> >
> >   (unsigned long)current | RWSEM_WRITER
> >
> > in the atomic_long_t rw_semaphore::owner field. The down-side is that
> > you can't do fetch_add based __down_read, because that would clobber the
> > pointer. The up-side is that we have a stable owner pointer (which is
> > what I needed for PI like things).
> 
> Without fetch_add for readers, it could lead to reduced performance for
> reader heavy workloads.

Yeah I know.. :-)

> Are you trying to do a PI version of rwsem? It can work when the lock is
> writer owned, but not when it is reader owned.

Not classical PI; there's one of those in -rt btw:

  https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/tree/kernel/locking/rwsem-rt.c?h=linux-4.11.y-rt

I'm implementing proxy-execution (or rather, playing with it in a few
spare moments here and there). But yes, it will only be able to boost
write owners. But in order to make that happen I need the lock state and
owner thing in the same field, like mutex.


In any case, I'll try and have a look at these patches.
