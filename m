From: Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>
Subject: Re: [PATCH resend v2 2/5] mm/madvise: introduce
 MADV_POPULATE_(READ|WRITE) to prefault page tables
Date: Thu, 20 May 2021 15:44:18 +0200
Message-ID: <YKZnsnqgEMx6Xl6X@dhcp22.suse.cz>
References: <20210511081534.3507-1-david@redhat.com>
 <20210511081534.3507-3-david@redhat.com>
 <YKOR/8LzEaOgCvio@dhcp22.suse.cz>
 <bb0e2ebb-e66d-176c-b20a-fbadd95cde98@redhat.com>
 <YKOiV9VkEdYFM9nB@dhcp22.suse.cz>
 <b2fa988d-9625-7c0e-ce83-158af0058e38@redhat.com>
Mime-Version: 1.0
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1621518266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8FtvtQGziQhcsaA/EvzWrXNbEVs6OaNRrt/mRJMM9cU=;
        b=CQ8uUnw1rxMpz8avh1mYAkvdbRHR4IgjibUucNFDQIxbmYf5sXdDKB/hypasyxUHH5Zd2I
        PlCAJhUGC7VlaSrCbqMlySmj05bdOcEzKaPXQ/KuYsubdNFiKqJQy0eG7QG5h6+9OZ/xFK
        wqindb7jd/LPH8oYEy+S9+XBsVBqP7U=
Content-Disposition: inline
In-Reply-To: <b2fa988d-9625-7c0e-ce83-158af0058e38-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Oscar Salvador <osalvador-l3A5Bk7waGM@public.gmane.org>, Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>, Dave Hansen <dave.hansen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rik van Riel <riel-ebMLmSuQjDVBDgjK7y7TUQ@public.gmane.org>, "Michael S . Tsirkin" <mst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Kirill A . Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>, Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, James E.J. Bottomle

On Tue 18-05-21 14:03:52, David Hildenbrand wrote:
[...]
> > > I expect that use case might vanish over
> > > time (eventually with new kernels and updated user space), but it might
> > > stick for a bit.
> > 
> > Could you elaborate some more please?
> 
> After I raised that the current behavior of userfaultfd-wp is suboptimal,
> Peter started working on a userfaultfd-wp mode that doesn't require to
> prefault all pages just to have it working reliably -- getting notified when
> any page changes, including ones that haven't been populated yet and would
> have been populated with the shared zeropage on first access. Not sure what
> the state of that is and when we might see it.

OK, thanks for the clarification. This suggests that inventing a new
interface to cover this usecase doesn't sound like the strongest
justification to me. But this doesn't mean this disqualifies it either.

> > > Apart from that, populating the shared zeropage might be relevant in some
> > > corner cases: I remember there are sparse matrix algorithms that operate
> > > heavily on the shared zeropage.
> > 
> > I am not sure I see why this would be a useful interface for those? Zero
> > page read fault is really low cost. Or are you worried about cummulative
> > overhead by entering the kernel many times?
> 
> Yes, cumulative overhead when dealing with large, sparse matrices. Just an
> example where I think it could be applied in the future -- but not that I
> consider populating the shared zeropage a really important use case in
> general (besides for userfaultfd-wp right now).

OK.
 
[...]
> Anyhow, please suggest a way to handle it via a single flag in the kernel --
> which would be some kind of heuristic as we know from MAP_POPULATE. Having
> an alternative at hand would make it easier to discuss this topic further. I
> certainly *don't* want MAP_POPULATE semantics when it comes to
> MADV_POPULATE, especially when it comes to shared mappings. Not useful in
> QEMU now and in the future.

OK, this point is still not entirely clear to me. Elsewhere you are
saying that QEMU cannot use MAP_POPULATE because it ignores errors
and also it doesn't support sparse mappings because they apply to the
whole mmap. These are all clear but it is less clear to me why the same
semantic is not applicable for QEMU when used through madvise interface
which can handle both of those.
Do I get it right that you really want to emulate the full fledged write
fault to a) limit another write fault when the content is actually
modified and b) prevent from potential errors during the write fault
(e.g. mkwrite failing on the fs data)?

> We could make MADV_POPULATE act depending on the readability/writability of
> a mapping. Use MADV_POPULATE_WRITE on writable mappings, use
> MADV_POPULATE_READ on readable mappings. Certainly not perfect for use cases
> where you have writable mappings that are mostly read only (as in the
> example with fake-NVDIMMs I gave ...), but if it makes people happy, fine
> with me. I mostly care about MADV_POPULATE_WRITE.

Yes, this is where my thinking was going as well. Essentially define
MADV_POPULATE as "Populate the mapping with the memory based on the
mapping access." This looks like a straightforward semantic to me and it
doesn't really require any deep knowledge of internals.

Now, I was trying to compare which of those would be more tricky to
understand and use and TBH I am not really convinced any of the two is
much better. Separate READ/WRITE modes are explicit which can be good
but it will require quite an advanced knowledge of the #PF behavior.
On the other hand MADV_POPULATE would require some tricks like mmap,
madvise and mprotect(to change to writable) when the data is really
written to. I am not sure how much of a deal this would be for QEMU for
example.

So, all that being said, I am not really sure. I am not really happy
about READ/WRITE split but if a simpler interface is going to be a bad
fit for existing usecases then I believe a proper way to go is the
document the more complex interface thoroughly.
-- 
Michal Hocko
SUSE Labs
