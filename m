From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Mon, 22 Feb 2021 13:59:55 +0100
Message-ID: <73f73cf2-1b4e-bfa9-9a4c-3192d7b7a5ec@redhat.com>
References: <20210217154844.12392-1-david@redhat.com>
 <640738b5-a47e-448b-586d-a1fb80131891@redhat.com>
 <YDOqA9nQHiuIrKBu@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613998814;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TRfCGo+d4jZVJhCFZnvsjweX1KWQd9768AoENBDOGlQ=;
        b=DlY3cpOcN6TJg4ZPvCOCONZWr6zWh9aSBLpCgZsgypZRuH4NO84JXHxwLNIjVXK3POR/D4
        Y4aRETxmj9rZ2nvQxkFUYYvDwUsfXG3svgArpS+273OpwNSlRdN0Vfkw0PbYysQ/iRdBrw
        SV2svNtrU5RZqonDCzE65TB9uHVMSWI=
In-Reply-To: <YDOqA9nQHiuIrKBu@dhcp22.suse.cz>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E.J. Bottomle

On 22.02.21 13:56, Michal Hocko wrote:
> On Sat 20-02-21 10:12:26, David Hildenbrand wrote:
> [...]
>> Thinking about MADV_POPULATE vs. MADV_POPULATE_WRITE I wonder if it would be
>> more versatile to break with existing MAP_POPULATE semantics and directly go
>> with
>>
>> MADV_POPULATE_READ: simulate user space read access without actually
>> reading. Trigger a read fault if required.
>>
>> MADV_POPULATE_WRITE: simulate user space write access without actually
>> writing. Trigger a write fault if required.
>>
>> For my use case, I could use MADV_POPULATE_WRITE on anonymous memory and
>> RAM-backed files (shmem/hugetlb) - I would not have a minor fault when the
>> guest inside the VM first initializes memory. This mimics how QEMU currently
>> preallocates memory.
>>
>> However, I would use MADV_POPULATE_READ on any !RAM-backed files where we
>> actually have to write-back to a (slow?) device. Dirtying everything
>> although the guest might not actually consume it in the near future might be
>> undesired.
> 
> Isn't what the current mm_populate does?
>          if ((vma->vm_flags & (VM_WRITE | VM_SHARED)) == VM_WRITE)
>                  gup_flags |= FOLL_WRITE;
> 
> So it will write fault to shared memory mappings but it will touch
> others.

Exactly. But for hugetlbfs/shmem ("!RAM-backed files") this is not what 
we want.

-- 
Thanks,

David / dhildenb

