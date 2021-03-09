From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFCv2] mm/madvise: introduce MADV_POPULATE_(READ|WRITE) to
 prefault/prealloc memory
Date: Tue, 9 Mar 2021 09:31:14 +0100
Message-ID: <00fcfc37-e288-8ffe-a443-c2f5054deee9@redhat.com>
References: <20210308164520.18323-1-david@redhat.com>
 <6ecd754406fffe851be6543025203b6b@sf-tec.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615278696;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GfRwAlMZCg89ixlFNqb8ULyiVLWTEnJ0ZTo2SVvckic=;
        b=MiYQ6rnLtbe6gyrKStwD19ZC7zd7UV6fViyryKiskbK4+QnA/abn+sVUOQeY8Eq63pKOlg
        9hAawSiX9/iR7SO1alwqb/aXqeD3dM8X59BXk1li5Fr2vFH83tv8Of8g/gkdkJQYoaFvb+
        jNEb71lB6RK0y3AI1GWdrZH1PAK0RdQ=
In-Reply-To: <6ecd754406fffe851be6543025203b6b@sf-tec.de>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.d>

On 09.03.21 08:35, Rolf Eike Beer wrote:
>> diff --git a/mm/internal.h b/mm/internal.h
>> index 9902648f2206..a5c4ed23b1db 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -340,6 +340,9 @@ void __vma_unlink_list(struct mm_struct *mm,
>> struct vm_area_struct *vma);
>>   #ifdef CONFIG_MMU
>>   extern long populate_vma_page_range(struct vm_area_struct *vma,
>>   		unsigned long start, unsigned long end, int *nonblocking);
>> +extern long faultin_vma_page_range(struct vm_area_struct *vma,
>> +				   unsigned long start, unsigned long end,
>> +				   bool write, int *nonblocking);
>>   extern void munlock_vma_pages_range(struct vm_area_struct *vma,
>>   			unsigned long start, unsigned long end);
>>   static inline void munlock_vma_pages_all(struct vm_area_struct *vma)
> 
> The parameter name does not match the one in the implementation.
> 
> Otherwise the implementation looks fine AFAICT.

Hehe, you can tell how I copy-pasted from populate_vma_page_range(), 
because there, the variable names are messed up, too :)

Will fix (most probably populate_vma_page_range() as well in a cleanup 
patch), thanks!

-- 
Thanks,

David / dhildenb

