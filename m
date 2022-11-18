From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH mm-unstable v1 04/20] mm: add early FAULT_FLAG_UNSHARE
 consistency checks
Date: Fri, 18 Nov 2022 17:45:31 +0100
Message-ID: <f427422c-9af3-dc0a-dcc3-2a1114eb77ea@suse.cz>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-5-david@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1668789932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gGWCBwR6W7N/T/oKVxq15JaXduGL74ybELQMLEOROjQ=;
	b=oTTvOF9em1RBHrcDz3sPtZD55HB28JQKz0rq8O6fqbEdz69a/AXJF4jT92zC2TnMfoTP5o
	N+/92zbPBa11XH4uj3j1PVuX4IFT5iMf+cuDaOPUiGYk17AhOFewCKsW2Vloee6rUH2cev
	ywRRIq+dF6sPyizq6eVC4qLT8N+v1Fc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1668789932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gGWCBwR6W7N/T/oKVxq15JaXduGL74ybELQMLEOROjQ=;
	b=w1a8SK5GtUV98VIRjCKPQTv/uTPpGl8AZCdCXalMKOScuLDWEelI6GTSk7XWYEsOviak8d
	9ZPPVSaQ1GZLctAg==
Content-Language: en-US
In-Reply-To: <20221116102659.70287-5-david@redhat.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <so ngmuchun@bytedance.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Oded

On 11/16/22 11:26, David Hildenbrand wrote:
> For now, FAULT_FLAG_UNSHARE only applies to anonymous pages, which
> implies a COW mapping. Let's hide FAULT_FLAG_UNSHARE early if we're not
> dealing with a COW mapping, such that we treat it like a read fault as
> documented and don't have to worry about the flag throughout all fault
> handlers.
> 
> While at it, centralize the check for mutual exclusion of
> FAULT_FLAG_UNSHARE and FAULT_FLAG_WRITE and just drop the check that
> either flag is set in the WP handler.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/huge_memory.c |  3 ---
>  mm/hugetlb.c     |  5 -----
>  mm/memory.c      | 23 ++++++++++++++++++++---
>  3 files changed, 20 insertions(+), 11 deletions(-)

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

