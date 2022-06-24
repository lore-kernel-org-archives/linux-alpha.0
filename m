From: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 2/3] scsi: BusLogic remove bus_to_virt
Date: Fri, 24 Jun 2022 17:43:22 +0200
Message-ID: <CAK8P3a0onDqNtteOjGu7R8vUvy_ycYSYnxJURCcoyxtZDcji=g@mail.gmail.com>
References: <20220617125750.728590-1-arnd@kernel.org> <20220617125750.728590-3-arnd@kernel.org>
 <7a6df2da-95e8-b2fd-7565-e4b7a51c5b63@gonehiking.org> <CAK8P3a0t_0scofn_2N1Q8wgJ4panKCN58AgnsJSVEj28K614oQ@mail.gmail.com>
 <c955bf95-838f-cc0a-8496-322b831e5648@gonehiking.org>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656085420;
        bh=ZrmSkwlqS2brnFN5Iry4JvejPq5gajOP5sg4Z4I3Hws=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=i9DTlTGAF2BSmIOGQb/gQyl7aMHalsUj8NoMTbK5Fd4cCyIuwAgENb43b1h9IH48h
         qp06qkk0zTx1HwRItvR0GItuPv+lz/7ChUX2E9qCxtTjXMu4b192guwea5c4SjI521
         4+UtTh2cv+kB26alAMsm83DdMDj5HP1Dh3uN2MA4aDR81torLsE+iHB1xV9EKT5lIO
         YEBYFhN226Zo4lYaEZEdr9mkWZhgmYyh//FjHYkPt20RneGhxwqQqJoNaBsRywsipP
         0iHfl24ek2rhJLBp6JuP3w86bddR2dx3a1MCX9Er4aQzEcWmIImB57bGTJCYzWnVbz
         3KOVO6Rr8xY7w==
In-Reply-To: <c955bf95-838f-cc0a-8496-322b831e5648@gonehiking.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Khalid Aziz <khalid@gonehiking.org>
Cc: linux-scsi <linux-scsi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-parisc@vger.kernel.org>, Denis Efremov <efremov@linux.com>

On Fri, Jun 24, 2022 at 5:38 PM Khalid Aziz <khalid@gonehiking.org> wrote:
> On 6/23/22 08:47, Arnd Bergmann wrote:
>
> Driver works with this change. next_inbox is the correct pointer to pass.

Ok, great! I'll add a 'Tested-by' line then. I was already in the process of
preparing a v3 patch set, will send out the fixed patch in a bit.

         Arnd
