From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: Regression bisected to fa3354e4ea39 (mm: free_area_init: use
 maximal zone PFNs rather than zone sizes)
Date: Mon, 26 Jul 2021 23:06:30 +0300
Message-ID: <YP8Vxt0xuV1m5EPS@linux.ibm.com>
References: <20210726192311.uffqnanxw3ac5wwi@ivybridge>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=hU37SZ69R0NzM9u0/Q/TcpUqbJmAa+F8/i/B0yPzv7w=;
 b=X8MF+hPh5Te1PfFvJ/6jKYDjQduc2nTKpvnWAyeHnYDvj3hBf3sdvo1q9dzH0lJqK4qx
 ceQ3lcuh/EqXfAsuhGUm4hyArz7EU9gpVvatLYX8gtKPWZelVL/BDPRGJTfmHi0Wp5XV
 WdVGay7Bb6+npRF69sEq++ZnjkcYOUbQr4SvMWhyAvGSuXJ/UvcVcC0p2YKwxHOMO7yo
 NzBuSNNhflkq1yNtRW2GxpGlU3WtHo/5uIX9C2n/g9D3Q/1N2XU9CDfqI44fG7tPCadb
 h3aF5PK+fnGxpxGtYmZgNEYfa8eImSwq9UFqIUiPMiJ9Kd83ga6s36kBNI3fHy/Avbt9 lA== 
Content-Disposition: inline
In-Reply-To: <20210726192311.uffqnanxw3ac5wwi@ivybridge>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Michael Cree <mcree@orcon.net.nz>, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Matt,

On Mon, Jul 26, 2021 at 12:27:50PM -0700, Matt Turner wrote:
> Reply-To:
> 
> Hi Mike!
> 
> Since commit fa3354e4ea39 (mm: free_area_init: use maximal zone PFNs rather
> than zone sizes), I get the following BUG on Alpha (an AlphaServer ES47 Marvel)
> and loading userspace leads to a segfault:
> 
> (I didn't notice this for a long time because of other unrelated regressions,
> the pandemic, changing jobs, ...)
 
I suspect there will be more surprises down the road :)

> BUG: Bad page state in process swapper  pfn:2ffc53
> page:fffffc000ecf14c0 refcount:0 mapcount:1 mapping:0000000000000000 index:0x0
> flags: 0x0()
> raw: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> raw: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> page dumped because: nonzero mapcount  Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Not tainted 5.7.0-03841-gfa3354e4ea39-dirty #26
>        fffffc0001b5bd68 fffffc0001b5be80 fffffc00011cd148 fffffc000ecf14c0
>        fffffc00019803df fffffc0001b5be80 fffffc00011ce340 fffffc000ecf14c0
>        0000000000000000 fffffc0001b5be80 fffffc0001b482c0 fffffc00027d6618
>        fffffc00027da7d0 00000000002ff97a 0000000000000000 fffffc0001b5be80
>        fffffc00011d1abc fffffc000ecf14c0 fffffc0002d00000 fffffc0001b5be80
>        fffffc0001b2350c 0000000000300000 fffffc0001b48298 fffffc0001b482c0
> Trace:
> [<fffffc00011cd148>] bad_page+0x168/0x1b0
> [<fffffc00011ce340>] free_pcp_prepare+0x1e0/0x290
> [<fffffc00011d1abc>] free_unref_page+0x2c/0xa0
> [<fffffc00014ee5f0>] cmp_ex_sort+0x0/0x30
> [<fffffc00014ee5f0>] cmp_ex_sort+0x0/0x30
> [<fffffc000101001c>] _stext+0x1c/0x20
> 
> I haven't tried reproducing this on other machines or QEMU, but I'd be glad to
> if that helps.

If it's reproducible on QEMU I can debug it locally.
 
> Any ideas?

It seems like memory map is not properly initialized. Can you enable
CONFIG_DEBUG_MEMORY_INIT and add mminit_debug=4 to the command line. The
interesting part of the log would be before "Memory: xK/yK available ..."
line.

Hopefully it'll give some clues.

-- 
Sincerely yours,
Mike.
