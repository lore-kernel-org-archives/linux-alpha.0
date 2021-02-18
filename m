From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Thu, 18 Feb 2021 11:54:48 +0100
Message-ID: <de28b8db-a103-5bc2-8ace-d2907026a95d@redhat.com>
References: <20210217154844.12392-1-david@redhat.com>
 <YC5Am6a4KMSA8XoK@dhcp22.suse.cz>
 <3763a505-02d6-5efe-a9f5-40381acfbdfd@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613645705;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gcqiQcLIQresUmqBjSfx8mrrnANdscT5bovWT1NTSz4=;
        b=RbMuaZstJ6CrGg4oZoL5YG7svl5DHKGEf1wjaUssrTflC9zkTDIx2aqkNx4R9yEHjj/GQo
        ivX8Rkt2Fl0Fvr6kT9YAdKWpQ7SnLbk9fTKa3Wrwos/6r4zfOGSVj53QVGRcydY6V8EXbF
        zZv44dg4pKP5TVkprrvN+0/8wO5f9uk=
In-Reply-To: <3763a505-02d6-5efe-a9f5-40381acfbdfd@redhat.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E.J. Bottomle

>>>      If we hit
>>>      hardware errors on pages, ignore them - nothing we really can or
>>>      should do.
>>> 3. On errors during MADV_POPULATED, some memory might have been
>>>      populated. Callers have to clean up if they care.
>>
>> How does caller find out? madvise reports 0 on success so how do you
>> find out how much has been populated?
> 
> If there is an error, something might have been populated. In my QEMU
> implementation, I simply discard the range again, good enough. I don't
> think we need to really indicate "error and populated" or "error and not
> populated".

Clarifying again: if madvise(MADV_POPULATED) succeeds, it returns 0. If 
there was a problem poopulating memory, it returns -ENOMEM (similar to 
MADV_WILLNEED). Callers can detect the error and discard.

-- 
Thanks,

David / dhildenb

