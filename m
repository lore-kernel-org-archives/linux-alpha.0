From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 00/13] Finish off [smp_]read_barrier_depends()
Date: Fri, 8 Nov 2019 10:50:51 -0800
Message-ID: <20191108185051.GA20975@paulmck-ThinkPad-P72>
References: <20191108170120.22331-1-will@kernel.org>
Reply-To: paulmck@kernel.org
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573239057;
        bh=dFDcpZXiMmZsmjjgE4UFkW3p5h3lhoxIHSMwIhFg4Qc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=gohOviOZonK9pYKk2xMt6H+3xKQzS+dgmS23ekbrgUnC3/lNDNv2UHS2iO3LHMgaZ
         JQgrxSdaDpU0d77GN+27jCK5U3kU1Li0Uv/P/egvXnnXdHeFI9NbvlsM9ooVcprEae
         iF4p0Yjo5R2xlT8wDiT+aK1rgjoVJHHl/7pBDiNg=
Content-Disposition: inline
In-Reply-To: <20191108170120.22331-1-will@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Yunjae Lee <lyj7694@gmail.com>, SeongJae Park <sj38.park@gmail.com>, Josh Triplett <josh@joshtriplett.org>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>, Boqun Feng <boqun.feng@gmail.com>, linux-alpha@vger.kernel.org, virtualization@lists.linux-foundation.org

On Fri, Nov 08, 2019 at 05:01:07PM +0000, Will Deacon wrote:
> Hi all,
> 
> Although [smp_]read_barrier_depends() became part of READ_ONCE() in
> commit 76ebbe78f739 ("locking/barriers: Add implicit
> smp_read_barrier_depends() to READ_ONCE()"), it still limps on in the
> Linux memory model with the sinister hope of attracting innocent new
> users so that it becomes impossible to remove altogether.
> 
> Let's strike before it's too late: there's only one user outside of
> arch/alpha/ and that lives in the vhost code which I don't think you
> can actually compile for Alpha. Even if you could, it appears to be
> redundant. The rest of these patches remove any mention of the barrier
> from Documentation and comments, as well as removing its use from the
> Alpha backend and finally dropping it from the memory model completely.
> 
> After this series, there are still two places where it is mentioned:
> 
>   1. The Korean translation of memory-barriers.txt. I'd appreciate some
>      help fixing this because it's not entirely a straightforward
>      deletion.
> 
>   2. The virtio vring tests under tools/. This is userspace code so I'm
>      not too fussed about it.
> 
> There's a chunk of header reshuffling at the start of the series so that
> READ_ONCE() can sensibly be overridden by arch code.
> 
> Feedback welcome.

For the series:

Acked-by: Paul E. McKenney <paulmck@kernel.org>

> Cheers,
> 
> Will
> 
> Cc: Yunjae Lee <lyj7694@gmail.com>
> Cc: SeongJae Park <sj38.park@gmail.com>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Josh Triplett <josh@joshtriplett.org>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Joe Perches <joe@perches.com>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> Cc: virtualization@lists.linux-foundation.org
> 
> --->8
> 
> Will Deacon (13):
>   compiler.h: Split {READ,WRITE}_ONCE definitions out into rwonce.h
>   READ_ONCE: Undefine internal __READ_ONCE_SIZE macro after use
>   READ_ONCE: Allow __READ_ONCE_SIZE cases to be overridden by the
>     architecture
>   vhost: Remove redundant use of read_barrier_depends() barrier
>   alpha: Override READ_ONCE() with barriered implementation
>   READ_ONCE: Remove smp_read_barrier_depends() invocation
>   alpha: Replace smp_read_barrier_depends() usage with smp_[r]mb()
>   locking/barriers: Remove definitions for [smp_]read_barrier_depends()
>   Documentation/barriers: Remove references to
>     [smp_]read_barrier_depends()
>   tools/memory-model: Remove smp_read_barrier_depends() from informal
>     doc
>   powerpc: Remove comment about read_barrier_depends()
>   include/linux: Remove smp_read_barrier_depends() from comments
>   checkpatch: Remove checks relating to [smp_]read_barrier_depends()
> 
>  .../RCU/Design/Requirements/Requirements.html |  11 +-
>  Documentation/memory-barriers.txt             | 156 +-----------------
>  arch/alpha/include/asm/atomic.h               |  16 +-
>  arch/alpha/include/asm/barrier.h              |  61 +------
>  arch/alpha/include/asm/pgtable.h              |  10 +-
>  arch/alpha/include/asm/rwonce.h               |  22 +++
>  arch/powerpc/include/asm/barrier.h            |   2 -
>  drivers/vhost/vhost.c                         |   5 -
>  include/asm-generic/Kbuild                    |   1 +
>  include/asm-generic/barrier.h                 |  17 --
>  include/asm-generic/rwonce.h                  | 131 +++++++++++++++
>  include/linux/compiler.h                      | 114 +------------
>  include/linux/compiler_attributes.h           |  12 ++
>  include/linux/percpu-refcount.h               |   2 +-
>  include/linux/ptr_ring.h                      |   2 +-
>  mm/memory.c                                   |   2 +-
>  scripts/checkpatch.pl                         |   9 +-
>  .../Documentation/explanation.txt             |  26 ++-
>  18 files changed, 217 insertions(+), 382 deletions(-)
>  create mode 100644 arch/alpha/include/asm/rwonce.h
>  create mode 100644 include/asm-generic/rwonce.h
> 
> -- 
> 2.24.0.rc1.363.gb1bccd3e3d-goog
> 
