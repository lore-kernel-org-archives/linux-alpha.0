From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Thu, 18 Feb 2021 12:07:26 +0100
Message-ID: <50f73055950ff7382f2194134ef0f439@sf-tec.de>
References: <20210217154844.12392-1-david@redhat.com>
 <7859a7a0-96e2-72ff-be92-c0af5d642564@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <7859a7a0-96e2-72ff-be92-c0af5d642564@suse.cz>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>

>> Let's introduce MADV_POPULATE with the following semantics
>> 1. MADV_POPULATED does not work on PROT_NONE and special VMAs. It 
>> works
>>    on everything else.
>> 2. Errors during MADV_POPULATED (especially OOM) are reported. If we 
>> hit
>>    hardware errors on pages, ignore them - nothing we really can or
>>    should do.
>> 3. On errors during MADV_POPULATED, some memory might have been
>>    populated. Callers have to clean up if they care.
>> 4. Concurrent changes to the virtual memory layour are tolerated - we
                                                     ^t
>>    process each and every PFN only once, though.
>> 5. If MADV_POPULATE succeeds, all memory in the range can be accessed
>>    without SIGBUS. (of course, not if user space changed mappings in 
>> the
>>    meantime or KSM kicked in on anonymous memory).

You are talking both about MADV_POPULATE and MADV_POPULATED here.

Eike
