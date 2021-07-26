From: Matt Turner <mattst88@gmail.com>
Subject: Regression bisected to fa3354e4ea39 (mm: free_area_init: use maximal
 zone PFNs rather than zone sizes)
Date: Mon, 26 Jul 2021 12:27:50 -0700
Message-ID: <20210726192311.uffqnanxw3ac5wwi@ivybridge>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=1UdDzrra23dH9YokfKPvE1AeA2jAHVIroGq1SNBQhuw=;
        b=MXRrw0ZZsitiE9Skwj7bh0DNNijMrePYVHp7uEChWsp7D77WbfAThhYYBC2WO+q2wf
         NboTspa5DGdHXqIcnd8mFfLYOI+5FKdyVzKeHFEYpiZ0KpdsrD7qErPAsgJvkbZfdXpL
         la1FgQ12OZkU6yz5Tobg/8FZL5+0L+yUMurqUlJZCZEw+AzrF1oRA+NEu1U49iYb/cPZ
         3wbOSkSn4YCqbJf+Brle4G9lbtySBXa0iOpQIAUnf5qhL+VAFwQJhC3quNE2oRApgrxA
         61BPag9gmZc5yd6sUq1sefi4+KZP7K0OytFa6obcpZBOBS6SWBKbNGXnFxAdbI8UOF/J
         fAfw==
Content-Disposition: inline
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Michael Cree <mcree@orcon.net.nz>, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Reply-To:

Hi Mike!

Since commit fa3354e4ea39 (mm: free_area_init: use maximal zone PFNs rather
than zone sizes), I get the following BUG on Alpha (an AlphaServer ES47 Marvel)
and loading userspace leads to a segfault:

(I didn't notice this for a long time because of other unrelated regressions,
the pandemic, changing jobs, ...)

BUG: Bad page state in process swapper  pfn:2ffc53
page:fffffc000ecf14c0 refcount:0 mapcount:1 mapping:0000000000000000 index:0x0
flags: 0x0()
raw: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
raw: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
page dumped because: nonzero mapcount  
Modules linked in:
CPU: 0 PID: 0 Comm: swapper Not tainted 5.7.0-03841-gfa3354e4ea39-dirty #26
        fffffc0001b5bd68 fffffc0001b5be80 fffffc00011cd148 fffffc000ecf14c0
        fffffc00019803df fffffc0001b5be80 fffffc00011ce340 fffffc000ecf14c0
        0000000000000000 fffffc0001b5be80 fffffc0001b482c0 fffffc00027d6618
        fffffc00027da7d0 00000000002ff97a 0000000000000000 fffffc0001b5be80
        fffffc00011d1abc fffffc000ecf14c0 fffffc0002d00000 fffffc0001b5be80
        fffffc0001b2350c 0000000000300000 fffffc0001b48298 fffffc0001b482c0
Trace:
[<fffffc00011cd148>] bad_page+0x168/0x1b0
[<fffffc00011ce340>] free_pcp_prepare+0x1e0/0x290
[<fffffc00011d1abc>] free_unref_page+0x2c/0xa0
[<fffffc00014ee5f0>] cmp_ex_sort+0x0/0x30
[<fffffc00014ee5f0>] cmp_ex_sort+0x0/0x30
[<fffffc000101001c>] _stext+0x1c/0x20

I haven't tried reproducing this on other machines or QEMU, but I'd be glad to
if that helps.

Any ideas?

Thanks,
Matt
