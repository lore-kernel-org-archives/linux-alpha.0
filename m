From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFCv2] mm/madvise: introduce MADV_POPULATE_(READ|WRITE) to
 prefault/prealloc memory
Date: Mon, 15 Mar 2021 14:26:08 +0100
Message-ID: <e59d6301-6ba8-1d7f-5c15-60364eec3fe1@redhat.com>
References: <20210308164520.18323-1-david@redhat.com>
 <20210315122213.k52wtlbbhsw42pks@box>
 <7d607d1c-efd5-3888-39bb-9e5f8bc08185@redhat.com>
 <20210315130353.iqnwsnp2c2wpt4y2@box>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615814799;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qzk8VRdGUUm6dVAUfVqYW6CB+CKrhhCXO30FiEA0udA=;
        b=JANu7vsjY7+2iWnYvMeC3ilB6lhZOE/HUKhH0bVQI/0I6xk4A3YFBfVDRshOzegD9y7Sfo
        SHZslwwLI70iIqkU2mOvY6YGLqUYxxUGxI70SL9nSLV3s0PiMw0YYvsvoV13AsV1nY6TJY
        jmNQVzcZHzbmBY4asW21ANNLj5VJD0c=
In-Reply-To: <20210315130353.iqnwsnp2c2wpt4y2@box>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.d>

On 15.03.21 14:03, Kirill A. Shutemov wrote:
> On Mon, Mar 15, 2021 at 01:25:40PM +0100, David Hildenbrand wrote:
>> On 15.03.21 13:22, Kirill A. Shutemov wrote:
>>> On Mon, Mar 08, 2021 at 05:45:20PM +0100, David Hildenbrand wrote:
>>>> +			case -EHWPOISON: /* Skip over any poisoned pages. */
>>>> +				start += PAGE_SIZE;
>>>> +				continue;
>>>
>>> Why is it good approach? It's not abvious to me.
>>
>> My main motivation was to simplify return code handling. I don't want to
>> return -EHWPOISON to user space
> 
> Why? Hiding the problem under the rug doesn't help anybody. SIGBUS later
> is not better than an error upfront.

Well, if you think about "prefaulting page tables", the first intuition 
is certainly not to check for poisoned pages, right? After all, you are 
not actually accessing memory, you are allocating memory if required and 
fill page tables. OTOH, mlock() will also choke on poisoned pages.

With the current semantics, you can start and run a VM just fine. 
Preallocation/prefaulting succeeded after all. On access you will get a 
SIGBUS, from which e.g., QEMU can recover by injecting an MCE into the 
guest - just like if you would hit a poisoned page later.

The problem we are talking about is most probably very rare, especially 
when using MADV_POPULATE_ for actual preallocation.

I don't have a strong opinion; not bailing out on poisoned pages felt 
like the right thing to do.

-- 
Thanks,

David / dhildenb

