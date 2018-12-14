From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Generic kernel fails to boot on Alpha bisected to b38d08f3181c
Date: Fri, 14 Dec 2018 17:47:33 +1300
Message-ID: <20181214044733.nr43q4wu22ktasvu@tower>
References: <20181213082612.bi2dcd6uhzp3t6iq@tower>
 <20181213160724.GU2509588@devbig004.ftw2.facebook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="jnbswjcdwgcvwuta"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213160724.GU2509588@devbig004.ftw2.facebook.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, debian-alpha@lists.debian.org


--jnbswjcdwgcvwuta
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 13, 2018 at 08:07:24AM -0800, Tejun Heo wrote:
> Hello, Michael.
> 
> On Thu, Dec 13, 2018 at 09:26:12PM +1300, Michael Cree wrote:
> > A kernel built for generic UP Alpha had been noted to fail to boot
> > for quite some time (since the release of 3.18).  The kernel either
> > locks up before printing any messages to the console or just falls
> > back into the SRM with a HALT instruction again before any messages
> > are printed to the console.  A work around is to either use a kernel
> > built for generic SMP or to build a machine specific kernel as these
> > boot correctly.
> > 
> > Because there were other compile errors at the time it proved
> > difficult to bisect, but we are continuing to get complaints about
> > it as it renders the Debian Alpha installer somewhat useless, so I
> > returned to trying to find the problem and managed to bisect it to:
> > 
> > commit b38d08f3181c5025a7ce84646494cc4748492a3b
> > Author: Tejun Heo <tj@kernel.org>
> > Date:   Tue Sep 2 14:46:02 2014 -0400
> > 
> >     percpu: restructure locking
> > 
> > Any suggestions as to what might be the problem and a fix?
> 
> So, the only thing I can think of is that it's calling
> spin_unlock_irq() while irq handling isn't set up yet.  Can you please
> try the followings?
> 
> 1. Convert all spin_[un]lock_irq() to
>    spin_lock_irqsave/unlock_irqrestore().

Yes, that's it.  With the attached patch the kernel boots.

Cheers
Michael.

--jnbswjcdwgcvwuta
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-percpu-convert-spin_lock_irq-to-spin_lock_irqsave.patch"

From e08cf3c714184d8fe168fffcd7d15732924deb1e Mon Sep 17 00:00:00 2001
From: Michael Cree <mcree@orcon.net.nz>
Date: Fri, 14 Dec 2018 17:24:31 +1300
Subject: [PATCH] percpu: convert spin_lock_irq to spin_lock_irqsave.

Bisection lead to commit b38d08f3181c ("percpu: restructure
locking") as being the cause of lockups at initial boot on
the kernel built for generic Alpha.

On a suggestion by Tejun Heo that:

So, the only thing I can think of is that it's calling
spin_unlock_irq() while irq handling isn't set up yet.
Can you please try the followings?

1. Convert all spin_[un]lock_irq() to
   spin_lock_irqsave/unlock_irqrestore().
---
 mm/percpu-km.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/percpu-km.c b/mm/percpu-km.c
index 38de70ab1a0d..0f643dc2dc65 100644
--- a/mm/percpu-km.c
+++ b/mm/percpu-km.c
@@ -50,6 +50,7 @@ static struct pcpu_chunk *pcpu_create_chunk(gfp_t gfp)
 	const int nr_pages = pcpu_group_sizes[0] >> PAGE_SHIFT;
 	struct pcpu_chunk *chunk;
 	struct page *pages;
+	unsigned long flags;
 	int i;
 
 	chunk = pcpu_alloc_chunk(gfp);
@@ -68,9 +69,9 @@ static struct pcpu_chunk *pcpu_create_chunk(gfp_t gfp)
 	chunk->data = pages;
 	chunk->base_addr = page_address(pages) - pcpu_group_offsets[0];
 
-	spin_lock_irq(&pcpu_lock);
+	spin_lock_irqsave(&pcpu_lock, flags);
 	pcpu_chunk_populated(chunk, 0, nr_pages, false);
-	spin_unlock_irq(&pcpu_lock);
+	spin_unlock_irqrestore(&pcpu_lock, flags);
 
 	pcpu_stats_chunk_alloc();
 	trace_percpu_create_chunk(chunk->base_addr);
-- 
2.11.0


--jnbswjcdwgcvwuta--
