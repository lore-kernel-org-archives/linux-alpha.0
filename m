From: Richard Henderson <rth@twiddle.net>
Subject: Re: Problems with alpha/pci + radeon/ttm
Date: Mon, 28 Jun 2010 09:08:40 -0700
Message-ID: <4C28C908.8090808@twiddle.net>
References: <20100622145805R.fujita.tomonori@lab.ntt.co.jp>	<AANLkTilMfDfy7BPiuAh9u-tR3kw1Vt_SebMziLUtLM6S@mail.gmail.com>	<4C232AAC.2010200@orcon.net.nz>	<20100627131836T.fujita.tomonori@lab.ntt.co.jp>	<4C272C1C.9000802@orcon.net.nz> <AANLkTinrscp_Vqh69dbH5t5yqNiR4Mgl7T2JRrmWwI4a@mail.gmail.com> <4C286568.60901@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4C286568.60901@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>
Cc: Dave Airlie <airlied@gmail.com>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, mattst88@gmail.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, ink@jurassic.park.msu.ru, jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, alexdeucher@gmail.com, jglisse@redhat.com

On 06/28/2010 02:03 AM, Michael Cree wrote:
> On 28/06/10 11:14, Dave Airlie wrote:
>> The bus error is caused by the kernel, its something alpha specific
>> with how mmap works,
>> I'm not sure if alpha needs some special mmap flags or something,
> 
> Neither am I.  All I know is that Alpha reorders CPU instructions more
> aggressively than most other architectures, the page map size is 8kB,
> and memory accesses must be aligned to the datum size.

There are no special mmap flags on alpha.  The non-cacheable property
is a function of the physical address (e.g. bit 40 set for ev5), and
this has already been taken care of by the kernel.


r~
