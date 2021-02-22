From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Mon, 22 Feb 2021 13:52:16 +0100
Message-ID: <296a1a02-f7ec-5085-f17e-eadc4bdb6a24@redhat.com>
References: <20210217154844.12392-1-david@redhat.com>
 <20210218225904.GB6669@xz-x1>
 <b24996a6-7652-f88c-301e-28417637fd02@redhat.com>
 <YDOnq9Nliopj9kQL@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613998350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2iEQDmFtT3qebJig5f9jd7ifXq3OPYbzSwZS/a5ZYlE=;
        b=Z/J8QEOhb8XmxaN6SFBGdmjN+3MD5yKWTWpiVwC2W+a0SrD46VqCTsv4vnk7vi6ys8XVfr
        3o+gwx49Crw8NE2twvb0XMOMpLwgtlFkQH9tqR1kiBCqx8OgavUex81Z/2LYggxTM8EAK3
        eSAMvIcxKmB0GX4s9edxL1keP1GItZk=
In-Reply-To: <YDOnq9Nliopj9kQL@dhcp22.suse.cz>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michal Hocko <mhocko@suse.com>
Cc: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>

On 22.02.21 13:46, Michal Hocko wrote:
> I am slowly catching up with this thread.
> 
> On Fri 19-02-21 09:20:16, David Hildenbrand wrote:
> [...]
>> So if we have zero, we write zero. We'll COW pages, triggering a write fault
>> - and that's the only good thing about it. For example, similar to
>> MADV_POPULATE, nothing stops KSM from merging anonymous pages again. So for
>> anonymous memory the actual write is not helpful at all. Similarly for
>> hugetlbfs, the actual write is not necessary - but there is no other way to
>> really achieve the goal.
> 
> I really do not see why you care about KSM so much. Isn't KSM an
> explicit opt-in with a fine grained interface to control which memory to
> KSM or not?

Yeah, I think it's opt-in via MADV_MERGEABLE. E.g., QEMU defaults to 
enable KSM unless explicitly disabled by the user.

But I agree, I got distracted by KSM details.

-- 
Thanks,

David / dhildenb

