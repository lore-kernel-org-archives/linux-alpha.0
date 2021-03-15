From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFCv2] mm/madvise: introduce MADV_POPULATE_(READ|WRITE) to
 prefault/prealloc memory
Date: Mon, 15 Mar 2021 13:25:40 +0100
Message-ID: <7d607d1c-efd5-3888-39bb-9e5f8bc08185@redhat.com>
References: <20210308164520.18323-1-david@redhat.com>
 <20210315122213.k52wtlbbhsw42pks@box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615811166;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BN3J83lgEQDDF6GxaX9y5aWAfYv6V2YaybS0wCx0hT0=;
        b=ORPnbIw4JBEFygYEjoyZZRXBZulwVihhCTQvaWWknESfMNrt+P1d4Jro9R2uCANuz/5+Oj
        KapuDSk3BOxcI70CuqkeEPYVILgsxo8ambLYHuf6Sr7ag7RqbZ10VX6vBr16YEXK+VFeM5
        vAySpjo0rXa/J+eISZxZSoMf0Yn6txE=
In-Reply-To: <20210315122213.k52wtlbbhsw42pks@box>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.d>

On 15.03.21 13:22, Kirill A. Shutemov wrote:
> On Mon, Mar 08, 2021 at 05:45:20PM +0100, David Hildenbrand wrote:
>> +			case -EHWPOISON: /* Skip over any poisoned pages. */
>> +				start += PAGE_SIZE;
>> +				continue;
> 
> Why is it good approach? It's not abvious to me.

My main motivation was to simplify return code handling. I don't want to 
return -EHWPOISON to user space and I don't want to convert it into 
something misleading like -ENOMEM or -EINVAL. So I decided to handle 
such stuff internally.

What would be you take on that?

-- 
Thanks,

David / dhildenb

