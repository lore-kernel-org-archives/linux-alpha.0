From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] alpha: Remove usage of the deprecated "pci-dma-compat.h" API
Date: Wed, 5 Jan 2022 17:01:47 -0500
Message-ID: <CAK8P3a1g1zQtY6o1hnXGxe5moZ5-z9vR4fuN8VPtSvKipALMcw@mail.gmail.com>
References: <0b8bacb36e111d2621c2c0459b20b1da9f4375c0.1641137463.git.christophe.jaillet@wanadoo.fr>
 <CAK8P3a2XwFveAd8nSCexZG3_UZga2PQ+EXHxQLGaWkLjCwrBxQ@mail.gmail.com> <bc95636a-8b67-b0cd-dc18-b21ac4b83962@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <bc95636a-8b67-b0cd-dc18-b21ac4b83962@wanadoo.fr>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Logan Gunthorpe <logang@deltatee.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>, martin.oliveira@eideticom.com, alpha <linux-alpha@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

On Wed, Jan 5, 2022 at 4:23 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> Le 03/01/2022 à 02:51, Arnd Bergmann a écrit :
> > On Sun, Jan 2, 2022 at 10:32 AM Christophe JAILLET
> > It looks like the number of remaining files that use the old
> > interfaces has gone down
> > a lot more since you last sent these patches. I would suggest you send them as a
> > series that includes the patch to remove the header as the last change, and
> > ask Andrew to pick up the ones that remain after this resend into the -mm tree,
> > possibly after the next -rc1. How many patches do you have left?
> >
>
> This would be ~ 10 patches.
> I sent recently some missing ones because I was not aware of
> --include-headers. So .h files were missing in my previous patches.
>
>
> The main remaining issue is linked to files in message/fusion.
> The patches are big.
> They have to be looked at carefully because it touches some GFP flags
> when s/pci_alloc_consistent/dma_alloc_coherent/.
>
> My last try did not get any attention.
> Even [1] which is purely mechanical
>
> I'll try another approach without trying to turn some (hidden)
> GFP_ATOMIC into GFP_KERNEL.
> 1st patch: only mechanical changes done with coccinelle, leaving GFP_ATOMIC
> 2nd patch: add some FIXME comments explaining why some could be turned
> into GFP_KERNEL
> 3rd patch: remove the comments and update the GFP flags accordingly.
>
> So, a maintainer could either apply 1 (no risk at all, should even
> generate the same .o file), or 1+2 (only FIXME comments for future
> analysis) or 1+2+3 for full clean-up (if he trusts me and/or has time to
> check my explanations).
>
> This way, I hope that some could at least apply the first one.

If it's down to 10 patches, just send them as a series with Andrew Morton,
Christoph Hellwig and me as recipients, in addition to the respective
subsystem maintainers. Christoph and I can make sure that every
patch is reviewed and then it's either the subsystem maintainers that pick
them up, and one of us that applies all the remaining ones in the mm,
dma-mapping, or asm-generic trees.

What I've seen from your patches all looks good, and I just want
them to be done, no need to wait forever for maintainers to reply
when they have had their chance several times before.

          Arnd
