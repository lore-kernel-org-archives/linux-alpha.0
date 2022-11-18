From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH mm-unstable v1 01/20] selftests/vm: anon_cow: prepare for
 non-anonymous COW tests
Date: Fri, 18 Nov 2022 17:20:06 +0100
Message-ID: <5104fc7b-7b38-652a-9a3f-6116e48d4129@suse.cz>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-2-david@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1668788407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZdCAdBuUfE3Rqc7NKln9hVuWsUdVVMVjbpiUee2vmvc=;
        b=gFn628LRme6mgJaZwZXeXxqjVHZ1dhRwig/bm8/PJr2zPCzCtNxBMW9LTId3gWUCMDCXyK
        TtXWbFh2gTikA3YMbaaroxv4l1XPLUH9rONQd0Dr+UuiMwnQoW4bEdHtBzAdzRgdfTZpOo
        z5sm6N12GAAOBYVJKj61R24kx7azRZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1668788407;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZdCAdBuUfE3Rqc7NKln9hVuWsUdVVMVjbpiUee2vmvc=;
        b=TNP3u8Xx8uZo+sUiWVVILNS2hk5mwr0qssvrZKBXcmmjqp8qeTg4rudZW0WqfwYAgYNMk2
        poai8KIFEEpddcDw==
Content-Language: en-US
In-Reply-To: <20221116102659.70287-2-david@redhat.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On 11/16/22 11:26, David Hildenbrand wrote:
> Originally, the plan was to have a separate tests for testing COW of
> non-anonymous (e.g., shared zeropage) pages.
> 
> Turns out, that we'd need a lot of similar functionality and that there
> isn't a really good reason to separate it. So let's prepare for non-anon
> tests by renaming to "cow".
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

