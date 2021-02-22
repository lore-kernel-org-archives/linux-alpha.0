From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Mon, 22 Feb 2021 14:22:37 +0100
Message-ID: <3b5cd68d-c4ac-c6be-8824-34c541d5377b@redhat.com>
References: <20210217154844.12392-1-david@redhat.com>
 <640738b5-a47e-448b-586d-a1fb80131891@redhat.com>
 <YDOqA9nQHiuIrKBu@dhcp22.suse.cz>
 <73f73cf2-1b4e-bfa9-9a4c-3192d7b7a5ec@redhat.com>
 <YDOvRv8sCVcgF6yC@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614000175;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QRsNQR46kCoWJ5LwqQ/hYDavqNf0sAJPGKLdOJIj1SE=;
        b=YRecH139FVKHx7OdRTTI0skxMykbm3d2J1eEZHqI9h+OVtJGg667r1EtyHyVkDcMrMaf2Q
        iPJf1N1Ep03UhqEkpDTk5gvjZvpTxZkeVbZ9kC7E4b0elyhbDJO4AXm/pQn1TVCAKjwGkh
        ww7KEE39DhGj3KdjBJHWgXvC71FwJ1Q=
In-Reply-To: <YDOvRv8sCVcgF6yC@dhcp22.suse.cz>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E.J. Bottomle

>> Exactly. But for hugetlbfs/shmem ("!RAM-backed files") this is not what we
>> want.
> 
> OK, then I must have misread your requirements. Maybe I just got lost in
> all the combinations you have listed.

Another special case could be dax/pmem I think. You might want to fault 
it in readable/writable but not perform an actual read/write unless 
really required.

QEMU phrases this as "don't cause wear on the storage backing".

-- 
Thanks,

David / dhildenb

