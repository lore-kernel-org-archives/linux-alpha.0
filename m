From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Problems with alpha/pci + radeon/ttm
Date: Mon, 28 Jun 2010 21:03:36 +1200
Message-ID: <4C286568.60901@orcon.net.nz>
References: <20100622145805R.fujita.tomonori@lab.ntt.co.jp>	<AANLkTilMfDfy7BPiuAh9u-tR3kw1Vt_SebMziLUtLM6S@mail.gmail.com>	<4C232AAC.2010200@orcon.net.nz>	<20100627131836T.fujita.tomonori@lab.ntt.co.jp>	<4C272C1C.9000802@orcon.net.nz> <AANLkTinrscp_Vqh69dbH5t5yqNiR4Mgl7T2JRrmWwI4a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <AANLkTinrscp_Vqh69dbH5t5yqNiR4Mgl7T2JRrmWwI4a@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Airlie <airlied@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, mattst88@gmail.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, alexdeucher@gmail.com, jglisse@redhat.com

On 28/06/10 11:14, Dave Airlie wrote:
> The bus error is caused by the kernel, its something alpha specific
> with how mmap works,
> I'm not sure if alpha needs some special mmap flags or something,

Neither am I.  All I know is that Alpha reorders CPU instructions more 
aggressively than most other architectures, the page map size is 8kB, 
and memory accesses must be aligned to the datum size.

Maybe Ivan or Richard can comment on any relevant Alpha mmap specific 
issues.

BTW, I discovered a couple of weeks ago that DRI is broken under UMS. 
It was working a year or so ago so something has happened to it.  Am I 
correct in thinking that the DRM code has pretty much been shifted into 
the kernel even for UMS?

On the Alpha I have been testing on (PWS600au, EV56 cpu and a radeon 
RV710 graphics card) running glxgears under UMS displays artefacts in 
rendering the gears, that is, some facets are not clipped to the 
rotating gear but extend to the edge of the window.  On another Alpha 
(XP1000, EV67 cpu and a radeon RV610 card) it locked up completely 
(couldn't even ping it) when I ran glxgears.  They are both running 
Debian unstable.

Cheers
Michael.
