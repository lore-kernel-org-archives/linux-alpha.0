From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH mm-unstable v1 06/20] mm: rework handling in do_wp_page()
 based on private vs. shared mappings
Date: Tue, 22 Nov 2022 15:20:23 +0100
Message-ID: <d6140b16-38c0-30d5-8ed8-0fcffa98a951@suse.cz>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-7-david@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1669126824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sH9ni1mWjwD99/t20LozYjCgs14d4WSa0QQZ5/xw57A=;
        b=ONiDsrks6Adh9kmLKRG5hX7BqNe+hBnscyawkgvu1AJz8qGmtAZIZ+hXnS6VAoj0OrAugk
        o40tROK3kM3fcR+iRbpZ9PF8GZdkPa5vCpRePpRrCzRDrYRdaQdlrBhTLjbiqdgGW8ubhN
        aliL9MBnPxAi22usfZx72R5a86MXxhI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1669126824;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sH9ni1mWjwD99/t20LozYjCgs14d4WSa0QQZ5/xw57A=;
        b=uarCxHzXrpMaljr4S9hN6puiDtHJ7KzEH6f0QN+PEco61ECA0/JD1fNHaEc4r+5V2Q/nrm
        T3EfGohG+a+5HLDA==
Content-Language: en-US
In-Reply-To: <20221116102659.70287-7-david@redhat.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On 11/16/22 11:26, David Hildenbrand wrote:
> We want to extent FAULT_FLAG_UNSHARE support to anything mapped into a
> COW mapping (pagecache page, zeropage, PFN, ...), not just anonymous pages.
> Let's prepare for that by handling shared mappings first such that we can
> handle private mappings last.
> 
> While at it, use folio-based functions instead of page-based functions
> where we touch the code either way.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

