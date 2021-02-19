From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Fri, 19 Feb 2021 12:10:04 +0100
Message-ID: <472f3bf1-595e-54e7-3022-0562cb6b3eb2@redhat.com>
References: <20210217154844.12392-1-david@redhat.com>
 <YC+UaTVUn0o4Zynz@dhcp22.suse.cz>
 <6e5a5bde-cedb-9d0a-f8c1-22406085b6b9@redhat.com>
 <YC+bKSQdepXhqo0T@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613733033;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5AVjhEI1tw86vUOw/9aIZh6BTcpMrggeQLiNZ3oUAgQ=;
        b=a+d7sN7mW6WqroKoZumdIyKvS8LHYltAa39fCRahl0PDzAUHhKeNCbBogMPUUtRDRsmrSA
        xqDReBCjrZnNyBW8Lhe/yz/V1/M0AsAT/GVft01F1GYtzcPyEXMQcwet12lAO+7HOloSLQ
        Z6YWo2Dfvy8BOTM0KUh8QLpgB8Y0sRc=
In-Reply-To: <YC+bKSQdepXhqo0T@dhcp22.suse.cz>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E.J. Bottomle

On 19.02.21 12:04, Michal Hocko wrote:
> On Fri 19-02-21 11:43:48, David Hildenbrand wrote:
>> On 19.02.21 11:35, Michal Hocko wrote:
>>> On Wed 17-02-21 16:48:44, David Hildenbrand wrote:
>>> [...]
>>>
>>> I only got  to the implementation now.
>>>
>>>> +static long madvise_populate(struct vm_area_struct *vma,
>>>> +			     struct vm_area_struct **prev,
>>>> +			     unsigned long start, unsigned long end)
>>>> +{
>>>> +	struct mm_struct *mm = vma->vm_mm;
>>>> +	unsigned long tmp_end;
>>>> +	int locked = 1;
>>>> +	long pages;
>>>> +
>>>> +	*prev = vma;
>>>> +
>>>> +	while (start < end) {
>>>> +		/*
>>>> +		 * We might have temporarily dropped the lock. For example,
>>>> +		 * our VMA might have been split.
>>>> +		 */
>>>> +		if (!vma || start >= vma->vm_end) {
>>>> +			vma = find_vma(mm, start);
>>>> +			if (!vma)
>>>> +				return -ENOMEM;
>>>> +		}
>>>
>>> Why do you need to find a vma when you already have one. do_madvise will
>>> give you your vma already. I do understand that you want to finish the
>>> vma for some errors but that shouldn't require handling vmas. You should
>>> be in the shope of one here unless I miss anything.
>>
>> See below, we might temporary drop the lock while not having processed all
>> pages
>>
>>>
>>>> +
>>>> +		/* Bail out on incompatible VMA types. */
>>>> +		if (vma->vm_flags & (VM_IO | VM_PFNMAP) ||
>>>> +		    !vma_is_accessible(vma)) {
>>>> +			return -EINVAL;
>>>> +		}
>>>> +
>>>> +		/*
>>>> +		 * Populate pages and take care of VM_LOCKED: simulate user
>>>> +		 * space access.
>>>> +		 *
>>>> +		 * For private, writable mappings, trigger a write fault to
>>>> +		 * break COW (i.e., shared zeropage). For other mappings (i.e.,
>>>> +		 * read-only, shared), trigger a read fault.
>>>> +		 */
>>>> +		tmp_end = min_t(unsigned long, end, vma->vm_end);
>>>> +		pages = populate_vma_page_range(vma, start, tmp_end, &locked);
>>>> +		if (!locked) {
>>>> +			mmap_read_lock(mm);
>>>> +			*prev = NULL;
>>>> +			vma = NULL;
>>
>> ^ here
>>
>> so, the VMA might have been replaced/split/... in the meantime.
>>
>> So to make forward progress, I have to lookup again. (similar. but different
>> to madvise_dontneed_free()).
> 
> Right. Missed that.

It would look more natural if we'd just be processing the whole range - 
but then it would not fit into the generic infrastructure and would 
result in even more code.

I decided to go with "process the passed range and treat the given VMA 
as an initial VMA that is invalidated as soon as we drop the lock".


-- 
Thanks,

David / dhildenb

