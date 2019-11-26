From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 11/13] powerpc: Remove comment about
 read_barrier_depends()
Date: Tue, 26 Nov 2019 14:24:28 -0800
Message-ID: <20191126222428.GX2889@paulmck-ThinkPad-P72>
References: <20191108170120.22331-1-will@kernel.org>
 <20191108170120.22331-12-will@kernel.org>
 <87imnebzpb.fsf@mpe.ellerman.id.au>
Reply-To: paulmck@kernel.org
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574807069;
        bh=QAX5ZkLqeX3XIqm05M7wJBsdoBGFDQs4mnX4cJBY7ro=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rd+Kt9pqSWX0e2SmWjaCIO6Gx/9U6YpAHGSBhthMDJGyAzRfTqHpwgrlUFg4rDMyi
         XRaPahjt4sjlaFlvy+yog9Jcdq/pd1myAYu5UVPboOix5/wBySHDhvEwCBbXq/Qbgv
         TPJCMVzYH0edjHzllovHWLkhDf1gJAvacTZy64Ss=
Content-Disposition: inline
In-Reply-To: <87imnebzpb.fsf@mpe.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Yunjae Lee <lyj7694@gmail.com>, SeongJae Park <sj38.park@gmail.com>, Josh Triplett <josh@joshtriplett.org>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>, Boqun Feng <boqun.feng@gmail.com>, linux-alpha@vger.kernel.org, virtualization@lists.linux-foundation.org

On Wed, Nov 20, 2019 at 09:37:52PM +1100, Michael Ellerman wrote:
> Will Deacon <will@kernel.org> writes:
> > 'read_barrier_depends()' doesn't exist anymore so stop talking about it.
> >
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  arch/powerpc/include/asm/barrier.h | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
> > index fbe8df433019..123adcefd40f 100644
> > --- a/arch/powerpc/include/asm/barrier.h
> > +++ b/arch/powerpc/include/asm/barrier.h
> > @@ -18,8 +18,6 @@
> >   * mb() prevents loads and stores being reordered across this point.
> >   * rmb() prevents loads being reordered across this point.
> >   * wmb() prevents stores being reordered across this point.
> > - * read_barrier_depends() prevents data-dependent loads being reordered
> > - *	across this point (nop on PPC).
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>

Queued for v5.6, thank you both!

							Thanx, Paul
