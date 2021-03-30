From: David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 2/5] mm/madvise: introduce MADV_POPULATE_(READ|WRITE)
 to prefault/prealloc memory
Date: Tue, 30 Mar 2021 18:30:48 +0200
Message-ID: <26227fc6-3e7b-4e69-f69d-4dc2a67ecfe8@redhat.com>
References: <20210317110644.25343-1-david@redhat.com>
 <20210317110644.25343-3-david@redhat.com>
 <CAG48ez0BQ3Vd3nDLEvyiSU0XALgUQ=c-fAwcFVScUkgo_9qVuQ@mail.gmail.com>
 <2bab28c7-08c0-7ff0-c70e-9bf94da05ce1@redhat.com>
 <CAG48ez20rLRNPZj6hLHQ_PLT8H60kTac-uXRiLByD70Q7+qsdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617121876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ohkgyyxTZN8asq9XvjHpqzqG5vkxDUnIvcSn+C26Z30=;
        b=aBbAg8Ymq9gXSzGLDZQgso/WXc2ly0xoTAvCSet/8F8RhHEXIMQjdg3zReseKpH/U/4T3h
        ndVAAsf/0zrA55PFxnDJsZMh8li5O2KnBWOGks/0orre8uMcGyN/EFOo96giYnBpdVPxeU
        gjvTbiRyDp3qr0bEDjoCg8OlAYcAbuk=
In-Reply-To: <CAG48ez20rLRNPZj6hLHQ_PLT8H60kTac-uXRiLByD70Q7+qsdQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MM <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>, Oscar Salvador <osalvador-l3A5Bk7waGM@public.gmane.org>, Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>, Dave Hansen <dave.hansen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rik van Riel <riel-ebMLmSuQjDVBDgjK7y7TUQ@public.gmane.org>, "Michael S . Tsirkin" <mst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Kirill A . Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>, Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Bogendoerfer <tsbogend-I1c7kopa9pyUKJdSJbYsyg@public.gmane.org>

On 30.03.21 18:21, Jann Horn wrote:
> On Tue, Mar 30, 2021 at 5:01 PM David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>>> +long faultin_vma_page_range(struct vm_area_struct *vma, unsigned long start,
>>>> +                           unsigned long end, bool write, int *locked)
>>>> +{
>>>> +       struct mm_struct *mm = vma->vm_mm;
>>>> +       unsigned long nr_pages = (end - start) / PAGE_SIZE;
>>>> +       int gup_flags;
>>>> +
>>>> +       VM_BUG_ON(!PAGE_ALIGNED(start));
>>>> +       VM_BUG_ON(!PAGE_ALIGNED(end));
>>>> +       VM_BUG_ON_VMA(start < vma->vm_start, vma);
>>>> +       VM_BUG_ON_VMA(end > vma->vm_end, vma);
>>>> +       mmap_assert_locked(mm);
>>>> +
>>>> +       /*
>>>> +        * FOLL_HWPOISON: Return -EHWPOISON instead of -EFAULT when we hit
>>>> +        *                a poisoned page.
>>>> +        * FOLL_POPULATE: Always populate memory with VM_LOCKONFAULT.
>>>> +        * !FOLL_FORCE: Require proper access permissions.
>>>> +        */
>>>> +       gup_flags = FOLL_TOUCH | FOLL_POPULATE | FOLL_MLOCK | FOLL_HWPOISON;
>>>> +       if (write)
>>>> +               gup_flags |= FOLL_WRITE;
>>>> +
>>>> +       /*
>>>> +        * See check_vma_flags(): Will return -EFAULT on incompatible mappings
>>>> +        * or with insufficient permissions.
>>>> +        */
>>>> +       return __get_user_pages(mm, start, nr_pages, gup_flags,
>>>> +                               NULL, NULL, locked);
>>>
>>> You mentioned in the commit message that you don't want to actually
>>> dirty all the file pages and force writeback; but doesn't
>>> POPULATE_WRITE still do exactly that? In follow_page_pte(), if
>>> FOLL_TOUCH and FOLL_WRITE are set, we mark the page as dirty:
>>
>> Well, I mention that POPULATE_READ explicitly doesn't do that. I
>> primarily set it because populate_vma_page_range() also sets it.
>>
>> Is it safe to *not* set it? IOW, fault something writable into a page
>> table (where the CPU could dirty it without additional page faults)
>> without marking it accessed? For me, this made logically sense. Thus I
>> also understood why populate_vma_page_range() set it.
> 
> FOLL_TOUCH doesn't have anything to do with installing the PTE - it
> essentially means "the caller of get_user_pages wants to read/write
> the contents of the returned page, so please do the same things you
> would do if userspace was accessing the page". So in particular, if
> you look up a page via get_user_pages() with FOLL_WRITE|FOLL_TOUCH,
> that tells the MM subsystem "I will be writing into this page directly
> from the kernel, bypassing the userspace page tables, so please mark
> it as dirty now so that it will be properly written back later". Part
> of that is that it marks the page as recently used, which has an
> effect on LRU pageout behavior, I think - as far as I understand, that
> is why populate_vma_page_range() uses FOLL_TOUCH.
> 
> If you look at __get_user_pages(), you can see that it is split up
> into two major parts: faultin_page() for creating PTEs, and
> follow_page_mask() for grabbing pages from PTEs. faultin_page()
> ignores FOLL_TOUCH completely; only follow_page_mask() uses it.
> 
> In a way I guess maybe you do want the "mark as recently accessed"
> part that FOLL_TOUCH would give you without FOLL_WRITE? But I think
> you very much don't want the dirtying that FOLL_TOUCH|FOLL_WRITE leads
> to. Maybe the ideal approach would be to add a new FOLL flag to say "I
> only want to mark as recently used, I don't want to dirty". Or maybe
> it's enough to just leave out the FOLL_TOUCH entirely, I don't know.

Any thoughts why populate_vma_page_range() does it?

-- 
Thanks,

David / dhildenb

